#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "string.h"
#include <stdlib.h>

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
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
    LL_GPIO_SetPinMode(GPIOC, pin, LL_GPIO_MODE_OUTPUT);
    return;
}

/*
 * Just set of commands to waste CPU power for a second
 * (basically it is a simple cycle with a predefined number
 * of loops)
 */
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


/*
 * Each dot or dash within a character is followed by
 * period of signal absence, called a space,
 * equal to the dot duration. 
 * The letters of a word are separated by a space
 * of duration equal to three dots, and the words
 * are separated by a space equal to seven dots.
*/
enum DELAY_PERIODS
{
	DOT = 0x127c00,
	SPACE_SIGN   = 1,
	SPACE_LETTER = 3,
	SPACE_WORD   = 7
};

enum CODE_SIZE
{
	DOT_SIZE = 1,
	DASH_SIZE = 3
};

// #define NULL 0x00

enum BUF_SIZES
{
	MAX_BUFF_SIZE = 0xFF,
	MAX_SPACE_SIZE = 0xF,
	MAX_SPACE_BUF_SIZE = MAX_BUFF_SIZE * MAX_SPACE_SIZE
};


enum ERRORS
{
	BAD_CAT   = 0x1,
	ENOMEM    = 0x1 << 0x2,
	BAD_SIGN  = 0x1 << 0x3,
	BAD_PTR   = 0x1 << 0x4,
	ECANCELED = 0x1 << 0x5
};



int main_loop(char* str)
{
    size_t i = 0;
    while (str[i] != '\0') 
    {
    	switch(str[i])
    	{
    		case '1':
    		{
    			LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_8);
        		delay(0x127c00);
        		break;
    		}
    		case '0':
    		{
    			LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_8);
        		delay(0x1b8d80);
        		break;
    		}
    		default:
    		{
    			return BAD_SIGN;
    		}
    	}
    	i++;
        
    }



    LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_8);  // reset diode after blinking

    return 0;
}




#define LETTER_CASE(LETTER, STR)							\
case LETTER:												\
{															\
	if(strncat(edited_buf, STR, sizeof(STR) - 1) == NULL)	\
		err = BAD_CAT;										\
	break;													\
}

int parse_str(char* str, char* edited_buf, size_t size)
{
	int err = 0;
	if( str == NULL )
		return BAD_PTR;
	
	size_t  i = 0;
	while(str[i] != '\0')
	{
		switch(str[i])
		{
			#include "morse_codes.h"

			default:
			{
				// printf("\n%c\n", str[i]);
				err =  BAD_SIGN;
			}
		}

		/*
		No triple space on 'space' & before the 'space'
		*/

		if((i < size - 1) && (str[i + 1] != ' ') && (str[i] != ' ') && (strncat(edited_buf, "*", 1)  == NULL ))
				return BAD_CAT;
		i++;
	}
	// printf("parsed data:\n%s\n", edited_buf);

	return err;
}

#undef LETTER_CASE


#define CODE_CASE(LETTER, STR)								\
case LETTER:												\
{															\
	if(strncat(edited_buf, STR, sizeof(STR) - 1) == NULL)	\
		err = BAD_CAT;										\
	break;													\
}


int parse_binary(char* str, char* edited_buf)
{
	if(str == NULL)
		return BAD_PTR;

	int err  = 0;
	size_t i = 0;

	while(str[i] != '\0')
	{
		switch(str[i])
		{
			CODE_CASE('.', "10");
			CODE_CASE('-', "1110");
			CODE_CASE(' ', "000000");
			CODE_CASE('*', "00");
			default:
			{
				// printf("%c\n", str[i]);
				return BAD_SIGN;
			}
		}

		i++;
	}


	return err;
}



int main()
{
	char str[] = "HIS DAUGHTER, AND THE HEIR OF'S KINGDOM, WHOM";

	char* edited_buf        = (char*)calloc(MAX_BUFF_SIZE, sizeof(char));
	char* edited_binary_buf = (char*)calloc(MAX_SPACE_BUF_SIZE, sizeof(char));

	
	if(edited_buf == NULL)
		return ENOMEM;
	if(edited_binary_buf == NULL)
		return ENOMEM;

	if( parse_str(str, edited_buf, MAX_BUFF_SIZE) != 0)
		return ECANCELED;
	if( parse_binary(edited_buf, edited_binary_buf) != 0)
		return ECANCELED;

	free(edited_buf);

	rcc_config();
	gpio_config(LL_GPIO_PIN_8);


	while(1)
	{
		if( main_loop(edited_binary_buf) != 0 )
			return ECANCELED;
		LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_8);
		delay(0x3Fb8d80); // 7-th second delay
	}


	
	free(edited_binary_buf);
	return 0;
}


