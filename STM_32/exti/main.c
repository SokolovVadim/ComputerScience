/*
 * It is just simple and pure template project
 * It does absolutely nothing and indicates that toolchain
 * is installed correctly.
 */

#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "stm32f0xx_ll_exti.h"

#include "stm32f0xx_ll_utils.h"
#include "stm32f0xx_ll_cortex.h"

static void rcc_config()
{
    /* Set FLASH latency */
#if defined(FLASH_0LAT_DELAY0LAT) || defined(FLASH_0LAT_DELAY1LAT)
    LL_FLASH_SetLatency(LL_FLASH_LATENCY_0);
#else
    LL_FLASH_SetLatency(LL_FLASH_LATENCY_1);
#endif

    /* Enable HSI and wait for activation*/
    LL_RCC_HSI_Enable();
    while (LL_RCC_HSI_IsReady() != 1);

    /* Main PLL configuration and activation */
    LL_RCC_PLL_ConfigDomain_SYS(LL_RCC_PLLSOURCE_HSI_DIV_2,
                                LL_RCC_PLL_MUL_12);

    LL_RCC_PLL_Enable();
    while (LL_RCC_PLL_IsReady() != 1);

    /* Sysclk activation on the main PLL */
    LL_RCC_SetAHBPrescaler(LL_RCC_SYSCLK_DIV_1);
    LL_RCC_SetSysClkSource(LL_RCC_SYS_CLKSOURCE_PLL);
    while (LL_RCC_GetSysClkSource() != LL_RCC_SYS_CLKSOURCE_STATUS_PLL);

    /* Set APB1 prescaler */
    LL_RCC_SetAPB1Prescaler(LL_RCC_APB1_DIV_1);

    /* Update CMSIS variable (which can be updated also
     * through SystemCoreClockUpdate function) */
    SystemCoreClock = 48000000;
}

static void exti_config()
{
	// tacts
	//
	
	LL_APB1_GRP2_EnableClock(LL_APB1_GRP2_PERIPH_SYSCFG);
	LL_SYSCFG_SetEXTISource(LL_SYSCFG_EXTI_PORTA, LL_SYSCFG_EXTI_LINE0);

	LL_EXTI_EnableIT_0_31(LL_EXTI_LINE_0);

	LL_EXTI_EnableRisingTrig_0_31(LL_EXTI_LINE_0);
	NVIC_EnableIRQ(EXTI0_1_IRQn);
	NVIC_SetPriority(EXTI0_1_IRQn, 0);
	
}

static void gpio_config(int pin)
{
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
    LL_GPIO_SetPinMode(GPIOC, pin, LL_GPIO_MODE_OUTPUT);
    // LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_0, LL_GPIO_MODE_INPUT);
    return;
}

__attribute__((naked)) static void delay(int time)
{
    asm ("push {r7, lr}\n\t"
         "mov r6, %0\n"
         "loop: sub r6, #1\n\t"
         "cmp r6, #0\n\t"
	     "bne loop\n\t"
         "pop {r7, pc}\n\t"
         : 
         : "r" (time)
         : "r6"
         );
}

int COUNTER = 0;


void SysTick_Handler(void)
{
    // LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_9);
    COUNTER++;
    if(COUNTER >= 2000)
    {
	    LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_9);
	    COUNTER = 0;
    }
    
    
    //delay(0x327c00);
    //LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_9);
    
    // LL_EXTI_ClearFlag_0_31(LL_EXTI_LINE_0);
}

static void systic_config()
{
	LL_InitTick(48000000, 1000);
	LL_SYSTICK_EnableIT();
	NVIC_SetPriority(SysTick_IRQn, 0);

}

void EXTI0_1_IRQHandler(void)
{

    LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_9);
    delay(0x327c00);
    //LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_9);




    LL_EXTI_ClearFlag_0_31(LL_EXTI_LINE_0);

    // int ms = milliseconds;
    // static ms_old = 0;

    /*
     * Если разница больше чем 50 между ms_old и ms, то выполнить действие
     */

    /*
     * Обновить значение old_ms и сбросить флаг нулевой линии прерывания
     */
    return;
}

static void button_config()
{
	LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
	LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_0, LL_GPIO_MODE_INPUT);
}

int main(void)
{
    rcc_config();
    gpio_config(LL_GPIO_PIN_9);
    // exti_config();
    // button_config();
    systic_config();
    while (1)
    {
	/*
	int status = LL_GPIO_IsInputPinSet(GPIOA, LL_GPIO_PIN_0);
	if(status == 1)
	{
		LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_9);
	        delay(0x327c00);

	}
	*/
	// LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_9);
        // delay(0x327c00);
	//LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_9);
        // delay(0x327c00);
    }
    return 0;
}
