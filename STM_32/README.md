# STM 32
STM 32 programming course in DREC MIPT  
# First seminar  
The first problem we faced was the asm inline function.  
[Big Telescope](https://github.com/bigtelescope) suggested to pass a frequency of diode blinking  
as a parameter into delay function. We had to deal with initialisation  
the registers with variable. So I with Ilya tried to solve this problem this way  

    __attribute__((naked)) static void delay(int time)  
    {
    asm (push {r7, lr});  
    asm (R:"(ldr r6, %0)");  
    asm ("sub r6, #1");  
    asm ("cmp r6, #0");  
    asm ("bne delay + 0x4");  
    asm ("pop {r7, pc}");  
But It didn't work. We used GDB and found out that It was only a miscounting  
of code offset. Though, It didn't work properly after refactoring. Next step was  
to hardcode the r0 register into ldr procedure, because of fastcall parameters passing 

    asm ("ldr r6, r0");  
    asm ("sub r6, #1");  
    asm ("cmp r6, #0");  
    asm ("bne delay+0x3");  
    asm ("pop {r7, pc}");
The best way is to write the variable 'time' into register like this:  

    asm(
    "mov r6, %0"
    :           ; output
    : "r"(time) ; input
    : "r6"      ; destroyed
    );
Now this code have tested on MC  


// -----------------------------------------------------------------------------------------------------------------------------------------------------------------  

# Morse_alphabet blinking

Mini task on C language practice and work with MC  

# The task is
+ In main function write an English line
+ Write parsing function to translate the line into switching on/off sequence
+ Switch on/off diode

# The solution consists of  
+ parsing data into string with spaces between the letters and words determined by the Morse alphabet syntax  
+ parsing processed line into  binary sequence  
+ loop with switching on/off diode  
# Dynamic memory allocation  
There was a problem with dynamic memory allocation on STM32 MC  
To solve this we used these linker scripts:

    -specs=nano.specs -specs=nosys.specs  
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Second seminar
There is an issue based on learning the reset and reset handler.  
In the main function:  

    if (LL_RCC_IsActiveFlag_SFTRST()) {
        LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_9);
        LL_RCC_ClearResetFlags();
    }
We can find the description of LL_RCC_IsActiveFlag_SFTRST() function in stm32f0xx_ll_rcc.h header file.  
We see here:  

    /**
    * @brief  Check if RCC flag Software reset is set or not.
    * @rmtoll CSR          SFTRSTF       LL_RCC_IsActiveFlag_SFTRST
    * @retval State of bit (1 or 0).
    */
    __STATIC_INLINE uint32_t LL_RCC_IsActiveFlag_SFTRST(void)
    {
    return (READ_BIT(RCC->CSR, RCC_CSR_SFTRSTF) == (RCC_CSR_SFTRSTF));
    }  
    /**
    * @brief  Check if RCC flag Pin reset is set or not.
    * @rmtoll CSR          PINRSTF       LL_RCC_IsActiveFlag_PINRST
    * @retval State of bit (1 or 0).
    */
    __STATIC_INLINE uint32_t LL_RCC_IsActiveFlag_PINRST(void)
    {
        return (READ_BIT(RCC->CSR, RCC_CSR_PINRSTF) == (RCC_CSR_PINRSTF));
    }

The task is to understand the comparing in the function above. There are standart macro-definitions:

    #define SET_BIT(REG, BIT) ((REG) |= (BIT))
    #define CLEAR_BIT(REG, BIT) ((REG) &= ~(BIT))
    #define READ_BIT(REG, BIT) ((REG) & (BIT))
    #define LL_RCC_CSR_PINRSTF                RCC_CSR_PINRSTF         /*!< PIN reset flag */

# Seminar 20.03
GPIO
   
