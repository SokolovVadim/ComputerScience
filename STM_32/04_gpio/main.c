/*
 * This example demonstrates how to configure control clock
 * and shows how much FLASH might deteriorate execution speed
 */

#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"

#define FLASH_0LAT_DELAY0LAT
//#define FLASH_0LAT_DELAY1LAT
//#define FLASH_1LAT_DELAY0LAT
//#define FLASH_1LAT_DELAY1LAT

/**
  * System Clock Configuration
  * The system Clock is configured as follow :
  *    System Clock source            = PLL (HSI/2)
  *    SYSCLK(Hz)                     = 48000000
  *    HCLK(Hz)                       = 48000000
  *    AHB Prescaler                  = 1
  *    APB1 Prescaler                 = 1
  *    HSI Frequency(Hz)              = 8000000
  *    PLLMUL                         = 12
  *    Flash Latency(WS)              = 1
  */
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

/*
 * Clock on GPIOC and set pin with Blue led connected
 */
static void gpio_config(int pin)
{
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);
    
    LL_GPIO_SetPinMode(GPIOB, pin, LL_GPIO_MODE_OUTPUT);
    return;
}

/*
 * Just set of commands to waste CPU power for a second
 * (basically it is a simple cycle with a predefined number
 * of loops)
 */
__attribute__((naked)) static void delay()
{
    asm ("push {r7, lr}\n\t"
         "ldr r6, [pc, #8]\n"
         "loop: sub r6, #1\n\t"
         "cmp r6, #0\n\t"
	       "bne loop\n\t"
         "pop {r7, pc}\n\t");
#if defined(FLASH_0LAT_DELAY0LAT) || defined(FLASH_1LAT_DELAY0LAT)
    asm (".word 0x927c00"); //9600000
#else
    asm (".word 0x5b8d80"); //6000000
#endif
}



/*
 * My own function
 * Make the diode from 8th port to blink
 */

__attribute__((naked)) static void delay_pin_9()
{
    asm ("push {r7, lr}\n\t"
         "ldr r6, [pc, #8]\n"
         "sub r6, #1\n\t"
         "cmp r6, #0\n\t"
         "bne delay+0x4\n\t"
         "pop {r7, pc}\n\t");
#if defined(FLASH_0LAT_DELAY0LAT) || defined(FLASH_1LAT_DELAY0LAT)
    asm (".word 0x927c0"); //9600000
#else
    asm (".word 0x5b8d8"); //6000000
#endif
}




/*
 * Here we call configure all peripherals we need and
 * start blinking upon current mode
 */
int main(void)
{
    rcc_config();
   
    gpio_config(LL_GPIO_PIN_0);
    gpio_config(LL_GPIO_PIN_7);
    gpio_config(LL_GPIO_PIN_6);

    while (1) {
        
        LL_GPIO_SetOutputPin(GPIOB, LL_GPIO_PIN_0);
        
	//LL_GPIO_SetOutputPin(GPIOB, LL_GPIO_PIN_1);
        //delay();

        LL_GPIO_ResetOutputPin(GPIOB, LL_GPIO_PIN_7);
        LL_GPIO_ResetOutputPin(GPIOB, LL_GPIO_PIN_6);
	
	//LL_GPIO_ResetOutputPin(GPIOB, LL_GPIO_PIN_1);
	//delay();
    }
    return 0;
}
