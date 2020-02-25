
build/clock_control.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       000000c0  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             00001160  080000c0  080000c0  000100c0  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           0000022c  08001220  08001220  00011220  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000004  0800144c  0800144c  0001144c  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  08001450  08001450  00011450  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             00000068  20000000  08001454  00020000  2**2  CONTENTS, ALLOC, LOAD, DATA
  6 .bss              0000002c  20000068  080014bc  00020068  2**2  ALLOC
  7 ._user_heap_stack 00000604  20000094  080014bc  00020094  2**0  ALLOC
  8 .ARM.attributes   00000028  00000000  00000000  00020068  2**0  CONTENTS, READONLY
  9 .debug_info       0000139f  00000000  00000000  00020090  2**0  CONTENTS, READONLY, DEBUGGING
 10 .debug_abbrev     0000042b  00000000  00000000  0002142f  2**0  CONTENTS, READONLY, DEBUGGING
 11 .debug_loc        0000052e  00000000  00000000  0002185a  2**0  CONTENTS, READONLY, DEBUGGING
 12 .debug_aranges    00000120  00000000  00000000  00021d88  2**0  CONTENTS, READONLY, DEBUGGING
 13 .debug_ranges     000000f0  00000000  00000000  00021ea8  2**0  CONTENTS, READONLY, DEBUGGING
 14 .debug_line       000006f0  00000000  00000000  00021f98  2**0  CONTENTS, READONLY, DEBUGGING
 15 .debug_str        000008e8  00000000  00000000  00022688  2**0  CONTENTS, READONLY, DEBUGGING
 16 .comment          0000007f  00000000  00000000  00022f70  2**0  CONTENTS, READONLY
 17 .debug_frame      00000578  00000000  00000000  00022ff0  2**2  CONTENTS, READONLY, DEBUGGING

Disassembly of section .text:

080000c0 <__do_global_dtors_aux>:
 80000c0:	b510      	push	{r4, lr}
 80000c2:	4c06      	ldr	r4, [pc, #24]	; (80000dc <__do_global_dtors_aux+0x1c>)
 80000c4:	7823      	ldrb	r3, [r4, #0]
 80000c6:	2b00      	cmp	r3, #0
 80000c8:	d107      	bne.n	80000da <__do_global_dtors_aux+0x1a>
 80000ca:	4b05      	ldr	r3, [pc, #20]	; (80000e0 <__do_global_dtors_aux+0x20>)
 80000cc:	2b00      	cmp	r3, #0
 80000ce:	d002      	beq.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d0:	4804      	ldr	r0, [pc, #16]	; (80000e4 <__do_global_dtors_aux+0x24>)
 80000d2:	e000      	b.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d4:	bf00      	nop
 80000d6:	2301      	movs	r3, #1
 80000d8:	7023      	strb	r3, [r4, #0]
 80000da:	bd10      	pop	{r4, pc}
 80000dc:	20000068 	.word	0x20000068
 80000e0:	00000000 	.word	0x00000000
 80000e4:	08001208 	.word	0x08001208

080000e8 <frame_dummy>:
 80000e8:	4b04      	ldr	r3, [pc, #16]	; (80000fc <frame_dummy+0x14>)
 80000ea:	b510      	push	{r4, lr}
 80000ec:	2b00      	cmp	r3, #0
 80000ee:	d003      	beq.n	80000f8 <frame_dummy+0x10>
 80000f0:	4903      	ldr	r1, [pc, #12]	; (8000100 <frame_dummy+0x18>)
 80000f2:	4804      	ldr	r0, [pc, #16]	; (8000104 <frame_dummy+0x1c>)
 80000f4:	e000      	b.n	80000f8 <frame_dummy+0x10>
 80000f6:	bf00      	nop
 80000f8:	bd10      	pop	{r4, pc}
 80000fa:	46c0      	nop			; (mov r8, r8)
 80000fc:	00000000 	.word	0x00000000
 8000100:	2000006c 	.word	0x2000006c
 8000104:	08001208 	.word	0x08001208

08000108 <strlen>:
 8000108:	2300      	movs	r3, #0
 800010a:	5cc2      	ldrb	r2, [r0, r3]
 800010c:	3301      	adds	r3, #1
 800010e:	2a00      	cmp	r2, #0
 8000110:	d1fb      	bne.n	800010a <strlen+0x2>
 8000112:	1e58      	subs	r0, r3, #1
 8000114:	4770      	bx	lr
	...

08000118 <Reset_Handler>:
 8000118:	480d      	ldr	r0, [pc, #52]	; (8000150 <LoopForever+0x2>)
 800011a:	4685      	mov	sp, r0
 800011c:	480d      	ldr	r0, [pc, #52]	; (8000154 <LoopForever+0x6>)
 800011e:	490e      	ldr	r1, [pc, #56]	; (8000158 <LoopForever+0xa>)
 8000120:	4a0e      	ldr	r2, [pc, #56]	; (800015c <LoopForever+0xe>)
 8000122:	2300      	movs	r3, #0
 8000124:	e002      	b.n	800012c <LoopCopyDataInit>

08000126 <CopyDataInit>:
 8000126:	58d4      	ldr	r4, [r2, r3]
 8000128:	50c4      	str	r4, [r0, r3]
 800012a:	3304      	adds	r3, #4

0800012c <LoopCopyDataInit>:
 800012c:	18c4      	adds	r4, r0, r3
 800012e:	428c      	cmp	r4, r1
 8000130:	d3f9      	bcc.n	8000126 <CopyDataInit>
 8000132:	4a0b      	ldr	r2, [pc, #44]	; (8000160 <LoopForever+0x12>)
 8000134:	4c0b      	ldr	r4, [pc, #44]	; (8000164 <LoopForever+0x16>)
 8000136:	2300      	movs	r3, #0
 8000138:	e001      	b.n	800013e <LoopFillZerobss>

0800013a <FillZerobss>:
 800013a:	6013      	str	r3, [r2, #0]
 800013c:	3204      	adds	r2, #4

0800013e <LoopFillZerobss>:
 800013e:	42a2      	cmp	r2, r4
 8000140:	d3fb      	bcc.n	800013a <FillZerobss>
 8000142:	f000 fee9 	bl	8000f18 <SystemInit>
 8000146:	f000 ff47 	bl	8000fd8 <__libc_init_array>
 800014a:	f000 fe7f 	bl	8000e4c <main>

0800014e <LoopForever>:
 800014e:	e7fe      	b.n	800014e <LoopForever>
 8000150:	20002000 	.word	0x20002000
 8000154:	20000000 	.word	0x20000000
 8000158:	20000068 	.word	0x20000068
 800015c:	08001454 	.word	0x08001454
 8000160:	20000068 	.word	0x20000068
 8000164:	20000094 	.word	0x20000094

08000168 <ADC1_COMP_IRQHandler>:
 8000168:	e7fe      	b.n	8000168 <ADC1_COMP_IRQHandler>
	...

0800016c <LL_RCC_HSI_Enable>:
 800016c:	b580      	push	{r7, lr}
 800016e:	af00      	add	r7, sp, #0
 8000170:	4b04      	ldr	r3, [pc, #16]	; (8000184 <LL_RCC_HSI_Enable+0x18>)
 8000172:	681a      	ldr	r2, [r3, #0]
 8000174:	4b03      	ldr	r3, [pc, #12]	; (8000184 <LL_RCC_HSI_Enable+0x18>)
 8000176:	2101      	movs	r1, #1
 8000178:	430a      	orrs	r2, r1
 800017a:	601a      	str	r2, [r3, #0]
 800017c:	46c0      	nop			; (mov r8, r8)
 800017e:	46bd      	mov	sp, r7
 8000180:	bd80      	pop	{r7, pc}
 8000182:	46c0      	nop			; (mov r8, r8)
 8000184:	40021000 	.word	0x40021000

08000188 <LL_RCC_HSI_IsReady>:
 8000188:	b580      	push	{r7, lr}
 800018a:	af00      	add	r7, sp, #0
 800018c:	4b05      	ldr	r3, [pc, #20]	; (80001a4 <LL_RCC_HSI_IsReady+0x1c>)
 800018e:	681b      	ldr	r3, [r3, #0]
 8000190:	2202      	movs	r2, #2
 8000192:	4013      	ands	r3, r2
 8000194:	3b02      	subs	r3, #2
 8000196:	425a      	negs	r2, r3
 8000198:	4153      	adcs	r3, r2
 800019a:	b2db      	uxtb	r3, r3
 800019c:	0018      	movs	r0, r3
 800019e:	46bd      	mov	sp, r7
 80001a0:	bd80      	pop	{r7, pc}
 80001a2:	46c0      	nop			; (mov r8, r8)
 80001a4:	40021000 	.word	0x40021000

080001a8 <LL_RCC_SetSysClkSource>:
 80001a8:	b580      	push	{r7, lr}
 80001aa:	b082      	sub	sp, #8
 80001ac:	af00      	add	r7, sp, #0
 80001ae:	6078      	str	r0, [r7, #4]
 80001b0:	4b06      	ldr	r3, [pc, #24]	; (80001cc <LL_RCC_SetSysClkSource+0x24>)
 80001b2:	685b      	ldr	r3, [r3, #4]
 80001b4:	2203      	movs	r2, #3
 80001b6:	4393      	bics	r3, r2
 80001b8:	0019      	movs	r1, r3
 80001ba:	4b04      	ldr	r3, [pc, #16]	; (80001cc <LL_RCC_SetSysClkSource+0x24>)
 80001bc:	687a      	ldr	r2, [r7, #4]
 80001be:	430a      	orrs	r2, r1
 80001c0:	605a      	str	r2, [r3, #4]
 80001c2:	46c0      	nop			; (mov r8, r8)
 80001c4:	46bd      	mov	sp, r7
 80001c6:	b002      	add	sp, #8
 80001c8:	bd80      	pop	{r7, pc}
 80001ca:	46c0      	nop			; (mov r8, r8)
 80001cc:	40021000 	.word	0x40021000

080001d0 <LL_RCC_GetSysClkSource>:
 80001d0:	b580      	push	{r7, lr}
 80001d2:	af00      	add	r7, sp, #0
 80001d4:	4b03      	ldr	r3, [pc, #12]	; (80001e4 <LL_RCC_GetSysClkSource+0x14>)
 80001d6:	685b      	ldr	r3, [r3, #4]
 80001d8:	220c      	movs	r2, #12
 80001da:	4013      	ands	r3, r2
 80001dc:	0018      	movs	r0, r3
 80001de:	46bd      	mov	sp, r7
 80001e0:	bd80      	pop	{r7, pc}
 80001e2:	46c0      	nop			; (mov r8, r8)
 80001e4:	40021000 	.word	0x40021000

080001e8 <LL_RCC_SetAHBPrescaler>:
 80001e8:	b580      	push	{r7, lr}
 80001ea:	b082      	sub	sp, #8
 80001ec:	af00      	add	r7, sp, #0
 80001ee:	6078      	str	r0, [r7, #4]
 80001f0:	4b06      	ldr	r3, [pc, #24]	; (800020c <LL_RCC_SetAHBPrescaler+0x24>)
 80001f2:	685b      	ldr	r3, [r3, #4]
 80001f4:	22f0      	movs	r2, #240	; 0xf0
 80001f6:	4393      	bics	r3, r2
 80001f8:	0019      	movs	r1, r3
 80001fa:	4b04      	ldr	r3, [pc, #16]	; (800020c <LL_RCC_SetAHBPrescaler+0x24>)
 80001fc:	687a      	ldr	r2, [r7, #4]
 80001fe:	430a      	orrs	r2, r1
 8000200:	605a      	str	r2, [r3, #4]
 8000202:	46c0      	nop			; (mov r8, r8)
 8000204:	46bd      	mov	sp, r7
 8000206:	b002      	add	sp, #8
 8000208:	bd80      	pop	{r7, pc}
 800020a:	46c0      	nop			; (mov r8, r8)
 800020c:	40021000 	.word	0x40021000

08000210 <LL_RCC_SetAPB1Prescaler>:
 8000210:	b580      	push	{r7, lr}
 8000212:	b082      	sub	sp, #8
 8000214:	af00      	add	r7, sp, #0
 8000216:	6078      	str	r0, [r7, #4]
 8000218:	4b06      	ldr	r3, [pc, #24]	; (8000234 <LL_RCC_SetAPB1Prescaler+0x24>)
 800021a:	685b      	ldr	r3, [r3, #4]
 800021c:	4a06      	ldr	r2, [pc, #24]	; (8000238 <LL_RCC_SetAPB1Prescaler+0x28>)
 800021e:	4013      	ands	r3, r2
 8000220:	0019      	movs	r1, r3
 8000222:	4b04      	ldr	r3, [pc, #16]	; (8000234 <LL_RCC_SetAPB1Prescaler+0x24>)
 8000224:	687a      	ldr	r2, [r7, #4]
 8000226:	430a      	orrs	r2, r1
 8000228:	605a      	str	r2, [r3, #4]
 800022a:	46c0      	nop			; (mov r8, r8)
 800022c:	46bd      	mov	sp, r7
 800022e:	b002      	add	sp, #8
 8000230:	bd80      	pop	{r7, pc}
 8000232:	46c0      	nop			; (mov r8, r8)
 8000234:	40021000 	.word	0x40021000
 8000238:	fffff8ff 	.word	0xfffff8ff

0800023c <LL_RCC_PLL_Enable>:
 800023c:	b580      	push	{r7, lr}
 800023e:	af00      	add	r7, sp, #0
 8000240:	4b04      	ldr	r3, [pc, #16]	; (8000254 <LL_RCC_PLL_Enable+0x18>)
 8000242:	681a      	ldr	r2, [r3, #0]
 8000244:	4b03      	ldr	r3, [pc, #12]	; (8000254 <LL_RCC_PLL_Enable+0x18>)
 8000246:	2180      	movs	r1, #128	; 0x80
 8000248:	0449      	lsls	r1, r1, #17
 800024a:	430a      	orrs	r2, r1
 800024c:	601a      	str	r2, [r3, #0]
 800024e:	46c0      	nop			; (mov r8, r8)
 8000250:	46bd      	mov	sp, r7
 8000252:	bd80      	pop	{r7, pc}
 8000254:	40021000 	.word	0x40021000

08000258 <LL_RCC_PLL_IsReady>:
 8000258:	b580      	push	{r7, lr}
 800025a:	af00      	add	r7, sp, #0
 800025c:	4b07      	ldr	r3, [pc, #28]	; (800027c <LL_RCC_PLL_IsReady+0x24>)
 800025e:	681a      	ldr	r2, [r3, #0]
 8000260:	2380      	movs	r3, #128	; 0x80
 8000262:	049b      	lsls	r3, r3, #18
 8000264:	4013      	ands	r3, r2
 8000266:	22fe      	movs	r2, #254	; 0xfe
 8000268:	0612      	lsls	r2, r2, #24
 800026a:	4694      	mov	ip, r2
 800026c:	4463      	add	r3, ip
 800026e:	425a      	negs	r2, r3
 8000270:	4153      	adcs	r3, r2
 8000272:	b2db      	uxtb	r3, r3
 8000274:	0018      	movs	r0, r3
 8000276:	46bd      	mov	sp, r7
 8000278:	bd80      	pop	{r7, pc}
 800027a:	46c0      	nop			; (mov r8, r8)
 800027c:	40021000 	.word	0x40021000

08000280 <LL_RCC_PLL_ConfigDomain_SYS>:
 8000280:	b580      	push	{r7, lr}
 8000282:	b082      	sub	sp, #8
 8000284:	af00      	add	r7, sp, #0
 8000286:	6078      	str	r0, [r7, #4]
 8000288:	6039      	str	r1, [r7, #0]
 800028a:	4b0e      	ldr	r3, [pc, #56]	; (80002c4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 800028c:	685b      	ldr	r3, [r3, #4]
 800028e:	4a0e      	ldr	r2, [pc, #56]	; (80002c8 <LL_RCC_PLL_ConfigDomain_SYS+0x48>)
 8000290:	4013      	ands	r3, r2
 8000292:	0019      	movs	r1, r3
 8000294:	687a      	ldr	r2, [r7, #4]
 8000296:	2380      	movs	r3, #128	; 0x80
 8000298:	025b      	lsls	r3, r3, #9
 800029a:	401a      	ands	r2, r3
 800029c:	683b      	ldr	r3, [r7, #0]
 800029e:	431a      	orrs	r2, r3
 80002a0:	4b08      	ldr	r3, [pc, #32]	; (80002c4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80002a2:	430a      	orrs	r2, r1
 80002a4:	605a      	str	r2, [r3, #4]
 80002a6:	4b07      	ldr	r3, [pc, #28]	; (80002c4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80002a8:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80002aa:	220f      	movs	r2, #15
 80002ac:	4393      	bics	r3, r2
 80002ae:	0019      	movs	r1, r3
 80002b0:	687b      	ldr	r3, [r7, #4]
 80002b2:	220f      	movs	r2, #15
 80002b4:	401a      	ands	r2, r3
 80002b6:	4b03      	ldr	r3, [pc, #12]	; (80002c4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80002b8:	430a      	orrs	r2, r1
 80002ba:	62da      	str	r2, [r3, #44]	; 0x2c
 80002bc:	46c0      	nop			; (mov r8, r8)
 80002be:	46bd      	mov	sp, r7
 80002c0:	b002      	add	sp, #8
 80002c2:	bd80      	pop	{r7, pc}
 80002c4:	40021000 	.word	0x40021000
 80002c8:	ffc2ffff 	.word	0xffc2ffff

080002cc <LL_FLASH_SetLatency>:
 80002cc:	b580      	push	{r7, lr}
 80002ce:	b082      	sub	sp, #8
 80002d0:	af00      	add	r7, sp, #0
 80002d2:	6078      	str	r0, [r7, #4]
 80002d4:	4b06      	ldr	r3, [pc, #24]	; (80002f0 <LL_FLASH_SetLatency+0x24>)
 80002d6:	681b      	ldr	r3, [r3, #0]
 80002d8:	2201      	movs	r2, #1
 80002da:	4393      	bics	r3, r2
 80002dc:	0019      	movs	r1, r3
 80002de:	4b04      	ldr	r3, [pc, #16]	; (80002f0 <LL_FLASH_SetLatency+0x24>)
 80002e0:	687a      	ldr	r2, [r7, #4]
 80002e2:	430a      	orrs	r2, r1
 80002e4:	601a      	str	r2, [r3, #0]
 80002e6:	46c0      	nop			; (mov r8, r8)
 80002e8:	46bd      	mov	sp, r7
 80002ea:	b002      	add	sp, #8
 80002ec:	bd80      	pop	{r7, pc}
 80002ee:	46c0      	nop			; (mov r8, r8)
 80002f0:	40022000 	.word	0x40022000

080002f4 <LL_AHB1_GRP1_EnableClock>:
 80002f4:	b580      	push	{r7, lr}
 80002f6:	b084      	sub	sp, #16
 80002f8:	af00      	add	r7, sp, #0
 80002fa:	6078      	str	r0, [r7, #4]
 80002fc:	4b07      	ldr	r3, [pc, #28]	; (800031c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002fe:	6959      	ldr	r1, [r3, #20]
 8000300:	4b06      	ldr	r3, [pc, #24]	; (800031c <LL_AHB1_GRP1_EnableClock+0x28>)
 8000302:	687a      	ldr	r2, [r7, #4]
 8000304:	430a      	orrs	r2, r1
 8000306:	615a      	str	r2, [r3, #20]
 8000308:	4b04      	ldr	r3, [pc, #16]	; (800031c <LL_AHB1_GRP1_EnableClock+0x28>)
 800030a:	695b      	ldr	r3, [r3, #20]
 800030c:	687a      	ldr	r2, [r7, #4]
 800030e:	4013      	ands	r3, r2
 8000310:	60fb      	str	r3, [r7, #12]
 8000312:	68fb      	ldr	r3, [r7, #12]
 8000314:	46c0      	nop			; (mov r8, r8)
 8000316:	46bd      	mov	sp, r7
 8000318:	b004      	add	sp, #16
 800031a:	bd80      	pop	{r7, pc}
 800031c:	40021000 	.word	0x40021000

08000320 <LL_GPIO_SetPinMode>:
 8000320:	b580      	push	{r7, lr}
 8000322:	b084      	sub	sp, #16
 8000324:	af00      	add	r7, sp, #0
 8000326:	60f8      	str	r0, [r7, #12]
 8000328:	60b9      	str	r1, [r7, #8]
 800032a:	607a      	str	r2, [r7, #4]
 800032c:	68fb      	ldr	r3, [r7, #12]
 800032e:	6819      	ldr	r1, [r3, #0]
 8000330:	68bb      	ldr	r3, [r7, #8]
 8000332:	68ba      	ldr	r2, [r7, #8]
 8000334:	435a      	muls	r2, r3
 8000336:	0013      	movs	r3, r2
 8000338:	005b      	lsls	r3, r3, #1
 800033a:	189b      	adds	r3, r3, r2
 800033c:	43db      	mvns	r3, r3
 800033e:	400b      	ands	r3, r1
 8000340:	001a      	movs	r2, r3
 8000342:	68bb      	ldr	r3, [r7, #8]
 8000344:	68b9      	ldr	r1, [r7, #8]
 8000346:	434b      	muls	r3, r1
 8000348:	6879      	ldr	r1, [r7, #4]
 800034a:	434b      	muls	r3, r1
 800034c:	431a      	orrs	r2, r3
 800034e:	68fb      	ldr	r3, [r7, #12]
 8000350:	601a      	str	r2, [r3, #0]
 8000352:	46c0      	nop			; (mov r8, r8)
 8000354:	46bd      	mov	sp, r7
 8000356:	b004      	add	sp, #16
 8000358:	bd80      	pop	{r7, pc}

0800035a <LL_GPIO_SetOutputPin>:
 800035a:	b580      	push	{r7, lr}
 800035c:	b082      	sub	sp, #8
 800035e:	af00      	add	r7, sp, #0
 8000360:	6078      	str	r0, [r7, #4]
 8000362:	6039      	str	r1, [r7, #0]
 8000364:	687b      	ldr	r3, [r7, #4]
 8000366:	683a      	ldr	r2, [r7, #0]
 8000368:	619a      	str	r2, [r3, #24]
 800036a:	46c0      	nop			; (mov r8, r8)
 800036c:	46bd      	mov	sp, r7
 800036e:	b002      	add	sp, #8
 8000370:	bd80      	pop	{r7, pc}

08000372 <LL_GPIO_ResetOutputPin>:
 8000372:	b580      	push	{r7, lr}
 8000374:	b082      	sub	sp, #8
 8000376:	af00      	add	r7, sp, #0
 8000378:	6078      	str	r0, [r7, #4]
 800037a:	6039      	str	r1, [r7, #0]
 800037c:	687b      	ldr	r3, [r7, #4]
 800037e:	683a      	ldr	r2, [r7, #0]
 8000380:	629a      	str	r2, [r3, #40]	; 0x28
 8000382:	46c0      	nop			; (mov r8, r8)
 8000384:	46bd      	mov	sp, r7
 8000386:	b002      	add	sp, #8
 8000388:	bd80      	pop	{r7, pc}
	...

0800038c <rcc_config>:
 800038c:	b580      	push	{r7, lr}
 800038e:	af00      	add	r7, sp, #0
 8000390:	2000      	movs	r0, #0
 8000392:	f7ff ff9b 	bl	80002cc <LL_FLASH_SetLatency>
 8000396:	f7ff fee9 	bl	800016c <LL_RCC_HSI_Enable>
 800039a:	46c0      	nop			; (mov r8, r8)
 800039c:	f7ff fef4 	bl	8000188 <LL_RCC_HSI_IsReady>
 80003a0:	0003      	movs	r3, r0
 80003a2:	2b01      	cmp	r3, #1
 80003a4:	d1fa      	bne.n	800039c <rcc_config+0x10>
 80003a6:	23a0      	movs	r3, #160	; 0xa0
 80003a8:	039b      	lsls	r3, r3, #14
 80003aa:	0019      	movs	r1, r3
 80003ac:	2000      	movs	r0, #0
 80003ae:	f7ff ff67 	bl	8000280 <LL_RCC_PLL_ConfigDomain_SYS>
 80003b2:	f7ff ff43 	bl	800023c <LL_RCC_PLL_Enable>
 80003b6:	46c0      	nop			; (mov r8, r8)
 80003b8:	f7ff ff4e 	bl	8000258 <LL_RCC_PLL_IsReady>
 80003bc:	0003      	movs	r3, r0
 80003be:	2b01      	cmp	r3, #1
 80003c0:	d1fa      	bne.n	80003b8 <rcc_config+0x2c>
 80003c2:	2000      	movs	r0, #0
 80003c4:	f7ff ff10 	bl	80001e8 <LL_RCC_SetAHBPrescaler>
 80003c8:	2002      	movs	r0, #2
 80003ca:	f7ff feed 	bl	80001a8 <LL_RCC_SetSysClkSource>
 80003ce:	46c0      	nop			; (mov r8, r8)
 80003d0:	f7ff fefe 	bl	80001d0 <LL_RCC_GetSysClkSource>
 80003d4:	0003      	movs	r3, r0
 80003d6:	2b08      	cmp	r3, #8
 80003d8:	d1fa      	bne.n	80003d0 <rcc_config+0x44>
 80003da:	2000      	movs	r0, #0
 80003dc:	f7ff ff18 	bl	8000210 <LL_RCC_SetAPB1Prescaler>
 80003e0:	4b02      	ldr	r3, [pc, #8]	; (80003ec <rcc_config+0x60>)
 80003e2:	4a03      	ldr	r2, [pc, #12]	; (80003f0 <rcc_config+0x64>)
 80003e4:	601a      	str	r2, [r3, #0]
 80003e6:	46c0      	nop			; (mov r8, r8)
 80003e8:	46bd      	mov	sp, r7
 80003ea:	bd80      	pop	{r7, pc}
 80003ec:	20000000 	.word	0x20000000
 80003f0:	02dc6c00 	.word	0x02dc6c00

080003f4 <gpio_config>:
 80003f4:	b580      	push	{r7, lr}
 80003f6:	b082      	sub	sp, #8
 80003f8:	af00      	add	r7, sp, #0
 80003fa:	6078      	str	r0, [r7, #4]
 80003fc:	2380      	movs	r3, #128	; 0x80
 80003fe:	031b      	lsls	r3, r3, #12
 8000400:	0018      	movs	r0, r3
 8000402:	f7ff ff77 	bl	80002f4 <LL_AHB1_GRP1_EnableClock>
 8000406:	687b      	ldr	r3, [r7, #4]
 8000408:	4804      	ldr	r0, [pc, #16]	; (800041c <gpio_config+0x28>)
 800040a:	2201      	movs	r2, #1
 800040c:	0019      	movs	r1, r3
 800040e:	f7ff ff87 	bl	8000320 <LL_GPIO_SetPinMode>
 8000412:	46c0      	nop			; (mov r8, r8)
 8000414:	46bd      	mov	sp, r7
 8000416:	b002      	add	sp, #8
 8000418:	bd80      	pop	{r7, pc}
 800041a:	46c0      	nop			; (mov r8, r8)
 800041c:	48000800 	.word	0x48000800

08000420 <delay>:
 8000420:	0003      	movs	r3, r0
 8000422:	b580      	push	{r7, lr}
 8000424:	1c1e      	adds	r6, r3, #0

08000426 <loop>:
 8000426:	3e01      	subs	r6, #1
 8000428:	2e00      	cmp	r6, #0
 800042a:	d1fc      	bne.n	8000426 <loop>
 800042c:	bd80      	pop	{r7, pc}
 800042e:	46c0      	nop			; (mov r8, r8)

08000430 <main_loop>:
 8000430:	b580      	push	{r7, lr}
 8000432:	b084      	sub	sp, #16
 8000434:	af00      	add	r7, sp, #0
 8000436:	6078      	str	r0, [r7, #4]
 8000438:	2300      	movs	r3, #0
 800043a:	60fb      	str	r3, [r7, #12]
 800043c:	e024      	b.n	8000488 <main_loop+0x58>
 800043e:	687a      	ldr	r2, [r7, #4]
 8000440:	68fb      	ldr	r3, [r7, #12]
 8000442:	18d3      	adds	r3, r2, r3
 8000444:	781b      	ldrb	r3, [r3, #0]
 8000446:	2b30      	cmp	r3, #48	; 0x30
 8000448:	d00d      	beq.n	8000466 <main_loop+0x36>
 800044a:	2b31      	cmp	r3, #49	; 0x31
 800044c:	d117      	bne.n	800047e <main_loop+0x4e>
 800044e:	2380      	movs	r3, #128	; 0x80
 8000450:	005b      	lsls	r3, r3, #1
 8000452:	4a16      	ldr	r2, [pc, #88]	; (80004ac <main_loop+0x7c>)
 8000454:	0019      	movs	r1, r3
 8000456:	0010      	movs	r0, r2
 8000458:	f7ff ff7f 	bl	800035a <LL_GPIO_SetOutputPin>
 800045c:	4b14      	ldr	r3, [pc, #80]	; (80004b0 <main_loop+0x80>)
 800045e:	0018      	movs	r0, r3
 8000460:	f7ff ffde 	bl	8000420 <delay>
 8000464:	e00d      	b.n	8000482 <main_loop+0x52>
 8000466:	2380      	movs	r3, #128	; 0x80
 8000468:	005b      	lsls	r3, r3, #1
 800046a:	4a10      	ldr	r2, [pc, #64]	; (80004ac <main_loop+0x7c>)
 800046c:	0019      	movs	r1, r3
 800046e:	0010      	movs	r0, r2
 8000470:	f7ff ff7f 	bl	8000372 <LL_GPIO_ResetOutputPin>
 8000474:	4b0f      	ldr	r3, [pc, #60]	; (80004b4 <main_loop+0x84>)
 8000476:	0018      	movs	r0, r3
 8000478:	f7ff ffd2 	bl	8000420 <delay>
 800047c:	e001      	b.n	8000482 <main_loop+0x52>
 800047e:	2308      	movs	r3, #8
 8000480:	e010      	b.n	80004a4 <main_loop+0x74>
 8000482:	68fb      	ldr	r3, [r7, #12]
 8000484:	3301      	adds	r3, #1
 8000486:	60fb      	str	r3, [r7, #12]
 8000488:	687a      	ldr	r2, [r7, #4]
 800048a:	68fb      	ldr	r3, [r7, #12]
 800048c:	18d3      	adds	r3, r2, r3
 800048e:	781b      	ldrb	r3, [r3, #0]
 8000490:	2b00      	cmp	r3, #0
 8000492:	d1d4      	bne.n	800043e <main_loop+0xe>
 8000494:	2380      	movs	r3, #128	; 0x80
 8000496:	005b      	lsls	r3, r3, #1
 8000498:	4a04      	ldr	r2, [pc, #16]	; (80004ac <main_loop+0x7c>)
 800049a:	0019      	movs	r1, r3
 800049c:	0010      	movs	r0, r2
 800049e:	f7ff ff68 	bl	8000372 <LL_GPIO_ResetOutputPin>
 80004a2:	2300      	movs	r3, #0
 80004a4:	0018      	movs	r0, r3
 80004a6:	46bd      	mov	sp, r7
 80004a8:	b004      	add	sp, #16
 80004aa:	bd80      	pop	{r7, pc}
 80004ac:	48000800 	.word	0x48000800
 80004b0:	00127c00 	.word	0x00127c00
 80004b4:	001b8d80 	.word	0x001b8d80

080004b8 <parse_str>:
 80004b8:	b580      	push	{r7, lr}
 80004ba:	b086      	sub	sp, #24
 80004bc:	af00      	add	r7, sp, #0
 80004be:	60f8      	str	r0, [r7, #12]
 80004c0:	60b9      	str	r1, [r7, #8]
 80004c2:	607a      	str	r2, [r7, #4]
 80004c4:	2300      	movs	r3, #0
 80004c6:	617b      	str	r3, [r7, #20]
 80004c8:	68fb      	ldr	r3, [r7, #12]
 80004ca:	2b00      	cmp	r3, #0
 80004cc:	d102      	bne.n	80004d4 <parse_str+0x1c>
 80004ce:	2310      	movs	r3, #16
 80004d0:	f000 fc25 	bl	8000d1e <parse_str+0x866>
 80004d4:	2300      	movs	r3, #0
 80004d6:	613b      	str	r3, [r7, #16]
 80004d8:	f000 fc18 	bl	8000d0c <parse_str+0x854>
 80004dc:	68fa      	ldr	r2, [r7, #12]
 80004de:	693b      	ldr	r3, [r7, #16]
 80004e0:	18d3      	adds	r3, r2, r3
 80004e2:	781b      	ldrb	r3, [r3, #0]
 80004e4:	3b20      	subs	r3, #32
 80004e6:	2b3a      	cmp	r3, #58	; 0x3a
 80004e8:	d900      	bls.n	80004ec <parse_str+0x34>
 80004ea:	e375      	b.n	8000bd8 <parse_str+0x720>
 80004ec:	009a      	lsls	r2, r3, #2
 80004ee:	4be9      	ldr	r3, [pc, #932]	; (8000894 <parse_str+0x3dc>)
 80004f0:	18d3      	adds	r3, r2, r3
 80004f2:	681b      	ldr	r3, [r3, #0]
 80004f4:	469f      	mov	pc, r3
 80004f6:	68bb      	ldr	r3, [r7, #8]
 80004f8:	0018      	movs	r0, r3
 80004fa:	f7ff fe05 	bl	8000108 <strlen>
 80004fe:	0003      	movs	r3, r0
 8000500:	001a      	movs	r2, r3
 8000502:	68bb      	ldr	r3, [r7, #8]
 8000504:	189a      	adds	r2, r3, r2
 8000506:	4be4      	ldr	r3, [pc, #912]	; (8000898 <parse_str+0x3e0>)
 8000508:	0010      	movs	r0, r2
 800050a:	0019      	movs	r1, r3
 800050c:	2303      	movs	r3, #3
 800050e:	001a      	movs	r2, r3
 8000510:	f000 fd90 	bl	8001034 <memcpy>
 8000514:	68bb      	ldr	r3, [r7, #8]
 8000516:	2b00      	cmp	r3, #0
 8000518:	d000      	beq.n	800051c <parse_str+0x64>
 800051a:	e360      	b.n	8000bde <parse_str+0x726>
 800051c:	2301      	movs	r3, #1
 800051e:	617b      	str	r3, [r7, #20]
 8000520:	e35d      	b.n	8000bde <parse_str+0x726>
 8000522:	68bb      	ldr	r3, [r7, #8]
 8000524:	0018      	movs	r0, r3
 8000526:	f7ff fdef 	bl	8000108 <strlen>
 800052a:	0003      	movs	r3, r0
 800052c:	001a      	movs	r2, r3
 800052e:	68bb      	ldr	r3, [r7, #8]
 8000530:	189a      	adds	r2, r3, r2
 8000532:	4bda      	ldr	r3, [pc, #872]	; (800089c <parse_str+0x3e4>)
 8000534:	0010      	movs	r0, r2
 8000536:	0019      	movs	r1, r3
 8000538:	2305      	movs	r3, #5
 800053a:	001a      	movs	r2, r3
 800053c:	f000 fd7a 	bl	8001034 <memcpy>
 8000540:	68bb      	ldr	r3, [r7, #8]
 8000542:	2b00      	cmp	r3, #0
 8000544:	d000      	beq.n	8000548 <parse_str+0x90>
 8000546:	e34c      	b.n	8000be2 <parse_str+0x72a>
 8000548:	2301      	movs	r3, #1
 800054a:	617b      	str	r3, [r7, #20]
 800054c:	e349      	b.n	8000be2 <parse_str+0x72a>
 800054e:	68bb      	ldr	r3, [r7, #8]
 8000550:	0018      	movs	r0, r3
 8000552:	f7ff fdd9 	bl	8000108 <strlen>
 8000556:	0003      	movs	r3, r0
 8000558:	001a      	movs	r2, r3
 800055a:	68bb      	ldr	r3, [r7, #8]
 800055c:	189a      	adds	r2, r3, r2
 800055e:	4bd0      	ldr	r3, [pc, #832]	; (80008a0 <parse_str+0x3e8>)
 8000560:	0010      	movs	r0, r2
 8000562:	0019      	movs	r1, r3
 8000564:	2305      	movs	r3, #5
 8000566:	001a      	movs	r2, r3
 8000568:	f000 fd64 	bl	8001034 <memcpy>
 800056c:	68bb      	ldr	r3, [r7, #8]
 800056e:	2b00      	cmp	r3, #0
 8000570:	d000      	beq.n	8000574 <parse_str+0xbc>
 8000572:	e338      	b.n	8000be6 <parse_str+0x72e>
 8000574:	2301      	movs	r3, #1
 8000576:	617b      	str	r3, [r7, #20]
 8000578:	e335      	b.n	8000be6 <parse_str+0x72e>
 800057a:	68bb      	ldr	r3, [r7, #8]
 800057c:	0018      	movs	r0, r3
 800057e:	f7ff fdc3 	bl	8000108 <strlen>
 8000582:	0003      	movs	r3, r0
 8000584:	001a      	movs	r2, r3
 8000586:	68bb      	ldr	r3, [r7, #8]
 8000588:	189a      	adds	r2, r3, r2
 800058a:	4bc6      	ldr	r3, [pc, #792]	; (80008a4 <parse_str+0x3ec>)
 800058c:	0010      	movs	r0, r2
 800058e:	0019      	movs	r1, r3
 8000590:	2304      	movs	r3, #4
 8000592:	001a      	movs	r2, r3
 8000594:	f000 fd4e 	bl	8001034 <memcpy>
 8000598:	68bb      	ldr	r3, [r7, #8]
 800059a:	2b00      	cmp	r3, #0
 800059c:	d000      	beq.n	80005a0 <parse_str+0xe8>
 800059e:	e324      	b.n	8000bea <parse_str+0x732>
 80005a0:	2301      	movs	r3, #1
 80005a2:	617b      	str	r3, [r7, #20]
 80005a4:	e321      	b.n	8000bea <parse_str+0x732>
 80005a6:	68bb      	ldr	r3, [r7, #8]
 80005a8:	0018      	movs	r0, r3
 80005aa:	f7ff fdad 	bl	8000108 <strlen>
 80005ae:	0003      	movs	r3, r0
 80005b0:	001a      	movs	r2, r3
 80005b2:	68bb      	ldr	r3, [r7, #8]
 80005b4:	189a      	adds	r2, r3, r2
 80005b6:	4bbc      	ldr	r3, [pc, #752]	; (80008a8 <parse_str+0x3f0>)
 80005b8:	0010      	movs	r0, r2
 80005ba:	0019      	movs	r1, r3
 80005bc:	2302      	movs	r3, #2
 80005be:	001a      	movs	r2, r3
 80005c0:	f000 fd38 	bl	8001034 <memcpy>
 80005c4:	68bb      	ldr	r3, [r7, #8]
 80005c6:	2b00      	cmp	r3, #0
 80005c8:	d000      	beq.n	80005cc <parse_str+0x114>
 80005ca:	e310      	b.n	8000bee <parse_str+0x736>
 80005cc:	2301      	movs	r3, #1
 80005ce:	617b      	str	r3, [r7, #20]
 80005d0:	e30d      	b.n	8000bee <parse_str+0x736>
 80005d2:	68bb      	ldr	r3, [r7, #8]
 80005d4:	0018      	movs	r0, r3
 80005d6:	f7ff fd97 	bl	8000108 <strlen>
 80005da:	0003      	movs	r3, r0
 80005dc:	001a      	movs	r2, r3
 80005de:	68bb      	ldr	r3, [r7, #8]
 80005e0:	189a      	adds	r2, r3, r2
 80005e2:	4bb2      	ldr	r3, [pc, #712]	; (80008ac <parse_str+0x3f4>)
 80005e4:	0010      	movs	r0, r2
 80005e6:	0019      	movs	r1, r3
 80005e8:	2305      	movs	r3, #5
 80005ea:	001a      	movs	r2, r3
 80005ec:	f000 fd22 	bl	8001034 <memcpy>
 80005f0:	68bb      	ldr	r3, [r7, #8]
 80005f2:	2b00      	cmp	r3, #0
 80005f4:	d000      	beq.n	80005f8 <parse_str+0x140>
 80005f6:	e2fc      	b.n	8000bf2 <parse_str+0x73a>
 80005f8:	2301      	movs	r3, #1
 80005fa:	617b      	str	r3, [r7, #20]
 80005fc:	e2f9      	b.n	8000bf2 <parse_str+0x73a>
 80005fe:	68bb      	ldr	r3, [r7, #8]
 8000600:	0018      	movs	r0, r3
 8000602:	f7ff fd81 	bl	8000108 <strlen>
 8000606:	0003      	movs	r3, r0
 8000608:	001a      	movs	r2, r3
 800060a:	68bb      	ldr	r3, [r7, #8]
 800060c:	189a      	adds	r2, r3, r2
 800060e:	4ba8      	ldr	r3, [pc, #672]	; (80008b0 <parse_str+0x3f8>)
 8000610:	0010      	movs	r0, r2
 8000612:	0019      	movs	r1, r3
 8000614:	2304      	movs	r3, #4
 8000616:	001a      	movs	r2, r3
 8000618:	f000 fd0c 	bl	8001034 <memcpy>
 800061c:	68bb      	ldr	r3, [r7, #8]
 800061e:	2b00      	cmp	r3, #0
 8000620:	d000      	beq.n	8000624 <parse_str+0x16c>
 8000622:	e2e8      	b.n	8000bf6 <parse_str+0x73e>
 8000624:	2301      	movs	r3, #1
 8000626:	617b      	str	r3, [r7, #20]
 8000628:	e2e5      	b.n	8000bf6 <parse_str+0x73e>
 800062a:	68bb      	ldr	r3, [r7, #8]
 800062c:	0018      	movs	r0, r3
 800062e:	f7ff fd6b 	bl	8000108 <strlen>
 8000632:	0003      	movs	r3, r0
 8000634:	001a      	movs	r2, r3
 8000636:	68bb      	ldr	r3, [r7, #8]
 8000638:	189a      	adds	r2, r3, r2
 800063a:	4b9e      	ldr	r3, [pc, #632]	; (80008b4 <parse_str+0x3fc>)
 800063c:	0010      	movs	r0, r2
 800063e:	0019      	movs	r1, r3
 8000640:	2305      	movs	r3, #5
 8000642:	001a      	movs	r2, r3
 8000644:	f000 fcf6 	bl	8001034 <memcpy>
 8000648:	68bb      	ldr	r3, [r7, #8]
 800064a:	2b00      	cmp	r3, #0
 800064c:	d000      	beq.n	8000650 <parse_str+0x198>
 800064e:	e2d4      	b.n	8000bfa <parse_str+0x742>
 8000650:	2301      	movs	r3, #1
 8000652:	617b      	str	r3, [r7, #20]
 8000654:	e2d1      	b.n	8000bfa <parse_str+0x742>
 8000656:	68bb      	ldr	r3, [r7, #8]
 8000658:	0018      	movs	r0, r3
 800065a:	f7ff fd55 	bl	8000108 <strlen>
 800065e:	0003      	movs	r3, r0
 8000660:	001a      	movs	r2, r3
 8000662:	68bb      	ldr	r3, [r7, #8]
 8000664:	189a      	adds	r2, r3, r2
 8000666:	4b94      	ldr	r3, [pc, #592]	; (80008b8 <parse_str+0x400>)
 8000668:	0010      	movs	r0, r2
 800066a:	0019      	movs	r1, r3
 800066c:	2303      	movs	r3, #3
 800066e:	001a      	movs	r2, r3
 8000670:	f000 fce0 	bl	8001034 <memcpy>
 8000674:	68bb      	ldr	r3, [r7, #8]
 8000676:	2b00      	cmp	r3, #0
 8000678:	d000      	beq.n	800067c <parse_str+0x1c4>
 800067a:	e2c0      	b.n	8000bfe <parse_str+0x746>
 800067c:	2301      	movs	r3, #1
 800067e:	617b      	str	r3, [r7, #20]
 8000680:	e2bd      	b.n	8000bfe <parse_str+0x746>
 8000682:	68bb      	ldr	r3, [r7, #8]
 8000684:	0018      	movs	r0, r3
 8000686:	f7ff fd3f 	bl	8000108 <strlen>
 800068a:	0003      	movs	r3, r0
 800068c:	001a      	movs	r2, r3
 800068e:	68bb      	ldr	r3, [r7, #8]
 8000690:	189a      	adds	r2, r3, r2
 8000692:	4b8a      	ldr	r3, [pc, #552]	; (80008bc <parse_str+0x404>)
 8000694:	0010      	movs	r0, r2
 8000696:	0019      	movs	r1, r3
 8000698:	2305      	movs	r3, #5
 800069a:	001a      	movs	r2, r3
 800069c:	f000 fcca 	bl	8001034 <memcpy>
 80006a0:	68bb      	ldr	r3, [r7, #8]
 80006a2:	2b00      	cmp	r3, #0
 80006a4:	d000      	beq.n	80006a8 <parse_str+0x1f0>
 80006a6:	e2ac      	b.n	8000c02 <parse_str+0x74a>
 80006a8:	2301      	movs	r3, #1
 80006aa:	617b      	str	r3, [r7, #20]
 80006ac:	e2a9      	b.n	8000c02 <parse_str+0x74a>
 80006ae:	68bb      	ldr	r3, [r7, #8]
 80006b0:	0018      	movs	r0, r3
 80006b2:	f7ff fd29 	bl	8000108 <strlen>
 80006b6:	0003      	movs	r3, r0
 80006b8:	001a      	movs	r2, r3
 80006ba:	68bb      	ldr	r3, [r7, #8]
 80006bc:	189a      	adds	r2, r3, r2
 80006be:	4b80      	ldr	r3, [pc, #512]	; (80008c0 <parse_str+0x408>)
 80006c0:	0010      	movs	r0, r2
 80006c2:	0019      	movs	r1, r3
 80006c4:	2304      	movs	r3, #4
 80006c6:	001a      	movs	r2, r3
 80006c8:	f000 fcb4 	bl	8001034 <memcpy>
 80006cc:	68bb      	ldr	r3, [r7, #8]
 80006ce:	2b00      	cmp	r3, #0
 80006d0:	d000      	beq.n	80006d4 <parse_str+0x21c>
 80006d2:	e298      	b.n	8000c06 <parse_str+0x74e>
 80006d4:	2301      	movs	r3, #1
 80006d6:	617b      	str	r3, [r7, #20]
 80006d8:	e295      	b.n	8000c06 <parse_str+0x74e>
 80006da:	68bb      	ldr	r3, [r7, #8]
 80006dc:	0018      	movs	r0, r3
 80006de:	f7ff fd13 	bl	8000108 <strlen>
 80006e2:	0003      	movs	r3, r0
 80006e4:	001a      	movs	r2, r3
 80006e6:	68bb      	ldr	r3, [r7, #8]
 80006e8:	189a      	adds	r2, r3, r2
 80006ea:	4b76      	ldr	r3, [pc, #472]	; (80008c4 <parse_str+0x40c>)
 80006ec:	0010      	movs	r0, r2
 80006ee:	0019      	movs	r1, r3
 80006f0:	2305      	movs	r3, #5
 80006f2:	001a      	movs	r2, r3
 80006f4:	f000 fc9e 	bl	8001034 <memcpy>
 80006f8:	68bb      	ldr	r3, [r7, #8]
 80006fa:	2b00      	cmp	r3, #0
 80006fc:	d000      	beq.n	8000700 <parse_str+0x248>
 80006fe:	e284      	b.n	8000c0a <parse_str+0x752>
 8000700:	2301      	movs	r3, #1
 8000702:	617b      	str	r3, [r7, #20]
 8000704:	e281      	b.n	8000c0a <parse_str+0x752>
 8000706:	68bb      	ldr	r3, [r7, #8]
 8000708:	0018      	movs	r0, r3
 800070a:	f7ff fcfd 	bl	8000108 <strlen>
 800070e:	0003      	movs	r3, r0
 8000710:	001a      	movs	r2, r3
 8000712:	68bb      	ldr	r3, [r7, #8]
 8000714:	189a      	adds	r2, r3, r2
 8000716:	4b6c      	ldr	r3, [pc, #432]	; (80008c8 <parse_str+0x410>)
 8000718:	0010      	movs	r0, r2
 800071a:	0019      	movs	r1, r3
 800071c:	2303      	movs	r3, #3
 800071e:	001a      	movs	r2, r3
 8000720:	f000 fc88 	bl	8001034 <memcpy>
 8000724:	68bb      	ldr	r3, [r7, #8]
 8000726:	2b00      	cmp	r3, #0
 8000728:	d000      	beq.n	800072c <parse_str+0x274>
 800072a:	e270      	b.n	8000c0e <parse_str+0x756>
 800072c:	2301      	movs	r3, #1
 800072e:	617b      	str	r3, [r7, #20]
 8000730:	e26d      	b.n	8000c0e <parse_str+0x756>
 8000732:	68bb      	ldr	r3, [r7, #8]
 8000734:	0018      	movs	r0, r3
 8000736:	f7ff fce7 	bl	8000108 <strlen>
 800073a:	0003      	movs	r3, r0
 800073c:	001a      	movs	r2, r3
 800073e:	68bb      	ldr	r3, [r7, #8]
 8000740:	189a      	adds	r2, r3, r2
 8000742:	4b62      	ldr	r3, [pc, #392]	; (80008cc <parse_str+0x414>)
 8000744:	0010      	movs	r0, r2
 8000746:	0019      	movs	r1, r3
 8000748:	2303      	movs	r3, #3
 800074a:	001a      	movs	r2, r3
 800074c:	f000 fc72 	bl	8001034 <memcpy>
 8000750:	68bb      	ldr	r3, [r7, #8]
 8000752:	2b00      	cmp	r3, #0
 8000754:	d000      	beq.n	8000758 <parse_str+0x2a0>
 8000756:	e25c      	b.n	8000c12 <parse_str+0x75a>
 8000758:	2301      	movs	r3, #1
 800075a:	617b      	str	r3, [r7, #20]
 800075c:	e259      	b.n	8000c12 <parse_str+0x75a>
 800075e:	68bb      	ldr	r3, [r7, #8]
 8000760:	0018      	movs	r0, r3
 8000762:	f7ff fcd1 	bl	8000108 <strlen>
 8000766:	0003      	movs	r3, r0
 8000768:	001a      	movs	r2, r3
 800076a:	68bb      	ldr	r3, [r7, #8]
 800076c:	189a      	adds	r2, r3, r2
 800076e:	4b58      	ldr	r3, [pc, #352]	; (80008d0 <parse_str+0x418>)
 8000770:	0010      	movs	r0, r2
 8000772:	0019      	movs	r1, r3
 8000774:	2304      	movs	r3, #4
 8000776:	001a      	movs	r2, r3
 8000778:	f000 fc5c 	bl	8001034 <memcpy>
 800077c:	68bb      	ldr	r3, [r7, #8]
 800077e:	2b00      	cmp	r3, #0
 8000780:	d000      	beq.n	8000784 <parse_str+0x2cc>
 8000782:	e248      	b.n	8000c16 <parse_str+0x75e>
 8000784:	2301      	movs	r3, #1
 8000786:	617b      	str	r3, [r7, #20]
 8000788:	e245      	b.n	8000c16 <parse_str+0x75e>
 800078a:	68bb      	ldr	r3, [r7, #8]
 800078c:	0018      	movs	r0, r3
 800078e:	f7ff fcbb 	bl	8000108 <strlen>
 8000792:	0003      	movs	r3, r0
 8000794:	001a      	movs	r2, r3
 8000796:	68bb      	ldr	r3, [r7, #8]
 8000798:	189a      	adds	r2, r3, r2
 800079a:	4b4e      	ldr	r3, [pc, #312]	; (80008d4 <parse_str+0x41c>)
 800079c:	0010      	movs	r0, r2
 800079e:	0019      	movs	r1, r3
 80007a0:	2305      	movs	r3, #5
 80007a2:	001a      	movs	r2, r3
 80007a4:	f000 fc46 	bl	8001034 <memcpy>
 80007a8:	68bb      	ldr	r3, [r7, #8]
 80007aa:	2b00      	cmp	r3, #0
 80007ac:	d000      	beq.n	80007b0 <parse_str+0x2f8>
 80007ae:	e234      	b.n	8000c1a <parse_str+0x762>
 80007b0:	2301      	movs	r3, #1
 80007b2:	617b      	str	r3, [r7, #20]
 80007b4:	e231      	b.n	8000c1a <parse_str+0x762>
 80007b6:	68bb      	ldr	r3, [r7, #8]
 80007b8:	0018      	movs	r0, r3
 80007ba:	f7ff fca5 	bl	8000108 <strlen>
 80007be:	0003      	movs	r3, r0
 80007c0:	001a      	movs	r2, r3
 80007c2:	68bb      	ldr	r3, [r7, #8]
 80007c4:	189a      	adds	r2, r3, r2
 80007c6:	4b44      	ldr	r3, [pc, #272]	; (80008d8 <parse_str+0x420>)
 80007c8:	0010      	movs	r0, r2
 80007ca:	0019      	movs	r1, r3
 80007cc:	2305      	movs	r3, #5
 80007ce:	001a      	movs	r2, r3
 80007d0:	f000 fc30 	bl	8001034 <memcpy>
 80007d4:	68bb      	ldr	r3, [r7, #8]
 80007d6:	2b00      	cmp	r3, #0
 80007d8:	d000      	beq.n	80007dc <parse_str+0x324>
 80007da:	e220      	b.n	8000c1e <parse_str+0x766>
 80007dc:	2301      	movs	r3, #1
 80007de:	617b      	str	r3, [r7, #20]
 80007e0:	e21d      	b.n	8000c1e <parse_str+0x766>
 80007e2:	68bb      	ldr	r3, [r7, #8]
 80007e4:	0018      	movs	r0, r3
 80007e6:	f7ff fc8f 	bl	8000108 <strlen>
 80007ea:	0003      	movs	r3, r0
 80007ec:	001a      	movs	r2, r3
 80007ee:	68bb      	ldr	r3, [r7, #8]
 80007f0:	189a      	adds	r2, r3, r2
 80007f2:	4b3a      	ldr	r3, [pc, #232]	; (80008dc <parse_str+0x424>)
 80007f4:	0010      	movs	r0, r2
 80007f6:	0019      	movs	r1, r3
 80007f8:	2304      	movs	r3, #4
 80007fa:	001a      	movs	r2, r3
 80007fc:	f000 fc1a 	bl	8001034 <memcpy>
 8000800:	68bb      	ldr	r3, [r7, #8]
 8000802:	2b00      	cmp	r3, #0
 8000804:	d000      	beq.n	8000808 <parse_str+0x350>
 8000806:	e20c      	b.n	8000c22 <parse_str+0x76a>
 8000808:	2301      	movs	r3, #1
 800080a:	617b      	str	r3, [r7, #20]
 800080c:	e209      	b.n	8000c22 <parse_str+0x76a>
 800080e:	68bb      	ldr	r3, [r7, #8]
 8000810:	0018      	movs	r0, r3
 8000812:	f7ff fc79 	bl	8000108 <strlen>
 8000816:	0003      	movs	r3, r0
 8000818:	001a      	movs	r2, r3
 800081a:	68bb      	ldr	r3, [r7, #8]
 800081c:	189a      	adds	r2, r3, r2
 800081e:	4b30      	ldr	r3, [pc, #192]	; (80008e0 <parse_str+0x428>)
 8000820:	0010      	movs	r0, r2
 8000822:	0019      	movs	r1, r3
 8000824:	2304      	movs	r3, #4
 8000826:	001a      	movs	r2, r3
 8000828:	f000 fc04 	bl	8001034 <memcpy>
 800082c:	68bb      	ldr	r3, [r7, #8]
 800082e:	2b00      	cmp	r3, #0
 8000830:	d000      	beq.n	8000834 <parse_str+0x37c>
 8000832:	e1f8      	b.n	8000c26 <parse_str+0x76e>
 8000834:	2301      	movs	r3, #1
 8000836:	617b      	str	r3, [r7, #20]
 8000838:	e1f5      	b.n	8000c26 <parse_str+0x76e>
 800083a:	68bb      	ldr	r3, [r7, #8]
 800083c:	0018      	movs	r0, r3
 800083e:	f7ff fc63 	bl	8000108 <strlen>
 8000842:	0003      	movs	r3, r0
 8000844:	001a      	movs	r2, r3
 8000846:	68bb      	ldr	r3, [r7, #8]
 8000848:	189a      	adds	r2, r3, r2
 800084a:	4b26      	ldr	r3, [pc, #152]	; (80008e4 <parse_str+0x42c>)
 800084c:	0010      	movs	r0, r2
 800084e:	0019      	movs	r1, r3
 8000850:	2302      	movs	r3, #2
 8000852:	001a      	movs	r2, r3
 8000854:	f000 fbee 	bl	8001034 <memcpy>
 8000858:	68bb      	ldr	r3, [r7, #8]
 800085a:	2b00      	cmp	r3, #0
 800085c:	d000      	beq.n	8000860 <parse_str+0x3a8>
 800085e:	e1e4      	b.n	8000c2a <parse_str+0x772>
 8000860:	2301      	movs	r3, #1
 8000862:	617b      	str	r3, [r7, #20]
 8000864:	e1e1      	b.n	8000c2a <parse_str+0x772>
 8000866:	68bb      	ldr	r3, [r7, #8]
 8000868:	0018      	movs	r0, r3
 800086a:	f7ff fc4d 	bl	8000108 <strlen>
 800086e:	0003      	movs	r3, r0
 8000870:	001a      	movs	r2, r3
 8000872:	68bb      	ldr	r3, [r7, #8]
 8000874:	189a      	adds	r2, r3, r2
 8000876:	4b1c      	ldr	r3, [pc, #112]	; (80008e8 <parse_str+0x430>)
 8000878:	0010      	movs	r0, r2
 800087a:	0019      	movs	r1, r3
 800087c:	2304      	movs	r3, #4
 800087e:	001a      	movs	r2, r3
 8000880:	f000 fbd8 	bl	8001034 <memcpy>
 8000884:	68bb      	ldr	r3, [r7, #8]
 8000886:	2b00      	cmp	r3, #0
 8000888:	d000      	beq.n	800088c <parse_str+0x3d4>
 800088a:	e1d0      	b.n	8000c2e <parse_str+0x776>
 800088c:	2301      	movs	r3, #1
 800088e:	617b      	str	r3, [r7, #20]
 8000890:	e1cd      	b.n	8000c2e <parse_str+0x776>
 8000892:	46c0      	nop			; (mov r8, r8)
 8000894:	08001360 	.word	0x08001360
 8000898:	08001220 	.word	0x08001220
 800089c:	08001224 	.word	0x08001224
 80008a0:	0800122c 	.word	0x0800122c
 80008a4:	08001234 	.word	0x08001234
 80008a8:	08001238 	.word	0x08001238
 80008ac:	0800123c 	.word	0x0800123c
 80008b0:	08001244 	.word	0x08001244
 80008b4:	08001248 	.word	0x08001248
 80008b8:	08001250 	.word	0x08001250
 80008bc:	08001254 	.word	0x08001254
 80008c0:	0800125c 	.word	0x0800125c
 80008c4:	08001260 	.word	0x08001260
 80008c8:	08001268 	.word	0x08001268
 80008cc:	0800126c 	.word	0x0800126c
 80008d0:	08001270 	.word	0x08001270
 80008d4:	08001274 	.word	0x08001274
 80008d8:	0800127c 	.word	0x0800127c
 80008dc:	08001284 	.word	0x08001284
 80008e0:	08001288 	.word	0x08001288
 80008e4:	0800128c 	.word	0x0800128c
 80008e8:	08001290 	.word	0x08001290
 80008ec:	68bb      	ldr	r3, [r7, #8]
 80008ee:	0018      	movs	r0, r3
 80008f0:	f7ff fc0a 	bl	8000108 <strlen>
 80008f4:	0003      	movs	r3, r0
 80008f6:	001a      	movs	r2, r3
 80008f8:	68bb      	ldr	r3, [r7, #8]
 80008fa:	189a      	adds	r2, r3, r2
 80008fc:	4bda      	ldr	r3, [pc, #872]	; (8000c68 <parse_str+0x7b0>)
 80008fe:	0010      	movs	r0, r2
 8000900:	0019      	movs	r1, r3
 8000902:	2305      	movs	r3, #5
 8000904:	001a      	movs	r2, r3
 8000906:	f000 fb95 	bl	8001034 <memcpy>
 800090a:	68bb      	ldr	r3, [r7, #8]
 800090c:	2b00      	cmp	r3, #0
 800090e:	d000      	beq.n	8000912 <parse_str+0x45a>
 8000910:	e18f      	b.n	8000c32 <parse_str+0x77a>
 8000912:	2301      	movs	r3, #1
 8000914:	617b      	str	r3, [r7, #20]
 8000916:	e18c      	b.n	8000c32 <parse_str+0x77a>
 8000918:	68bb      	ldr	r3, [r7, #8]
 800091a:	0018      	movs	r0, r3
 800091c:	f7ff fbf4 	bl	8000108 <strlen>
 8000920:	0003      	movs	r3, r0
 8000922:	001a      	movs	r2, r3
 8000924:	68bb      	ldr	r3, [r7, #8]
 8000926:	189a      	adds	r2, r3, r2
 8000928:	4bd0      	ldr	r3, [pc, #832]	; (8000c6c <parse_str+0x7b4>)
 800092a:	0010      	movs	r0, r2
 800092c:	0019      	movs	r1, r3
 800092e:	2304      	movs	r3, #4
 8000930:	001a      	movs	r2, r3
 8000932:	f000 fb7f 	bl	8001034 <memcpy>
 8000936:	68bb      	ldr	r3, [r7, #8]
 8000938:	2b00      	cmp	r3, #0
 800093a:	d000      	beq.n	800093e <parse_str+0x486>
 800093c:	e17b      	b.n	8000c36 <parse_str+0x77e>
 800093e:	2301      	movs	r3, #1
 8000940:	617b      	str	r3, [r7, #20]
 8000942:	e178      	b.n	8000c36 <parse_str+0x77e>
 8000944:	68bb      	ldr	r3, [r7, #8]
 8000946:	0018      	movs	r0, r3
 8000948:	f7ff fbde 	bl	8000108 <strlen>
 800094c:	0003      	movs	r3, r0
 800094e:	001a      	movs	r2, r3
 8000950:	68bb      	ldr	r3, [r7, #8]
 8000952:	189a      	adds	r2, r3, r2
 8000954:	4bc6      	ldr	r3, [pc, #792]	; (8000c70 <parse_str+0x7b8>)
 8000956:	0010      	movs	r0, r2
 8000958:	0019      	movs	r1, r3
 800095a:	2305      	movs	r3, #5
 800095c:	001a      	movs	r2, r3
 800095e:	f000 fb69 	bl	8001034 <memcpy>
 8000962:	68bb      	ldr	r3, [r7, #8]
 8000964:	2b00      	cmp	r3, #0
 8000966:	d000      	beq.n	800096a <parse_str+0x4b2>
 8000968:	e167      	b.n	8000c3a <parse_str+0x782>
 800096a:	2301      	movs	r3, #1
 800096c:	617b      	str	r3, [r7, #20]
 800096e:	e164      	b.n	8000c3a <parse_str+0x782>
 8000970:	68bb      	ldr	r3, [r7, #8]
 8000972:	0018      	movs	r0, r3
 8000974:	f7ff fbc8 	bl	8000108 <strlen>
 8000978:	0003      	movs	r3, r0
 800097a:	001a      	movs	r2, r3
 800097c:	68bb      	ldr	r3, [r7, #8]
 800097e:	189a      	adds	r2, r3, r2
 8000980:	4bbc      	ldr	r3, [pc, #752]	; (8000c74 <parse_str+0x7bc>)
 8000982:	0010      	movs	r0, r2
 8000984:	0019      	movs	r1, r3
 8000986:	2305      	movs	r3, #5
 8000988:	001a      	movs	r2, r3
 800098a:	f000 fb53 	bl	8001034 <memcpy>
 800098e:	68bb      	ldr	r3, [r7, #8]
 8000990:	2b00      	cmp	r3, #0
 8000992:	d000      	beq.n	8000996 <parse_str+0x4de>
 8000994:	e153      	b.n	8000c3e <parse_str+0x786>
 8000996:	2301      	movs	r3, #1
 8000998:	617b      	str	r3, [r7, #20]
 800099a:	e150      	b.n	8000c3e <parse_str+0x786>
 800099c:	68bb      	ldr	r3, [r7, #8]
 800099e:	0018      	movs	r0, r3
 80009a0:	f7ff fbb2 	bl	8000108 <strlen>
 80009a4:	0003      	movs	r3, r0
 80009a6:	001a      	movs	r2, r3
 80009a8:	68bb      	ldr	r3, [r7, #8]
 80009aa:	189a      	adds	r2, r3, r2
 80009ac:	4bb2      	ldr	r3, [pc, #712]	; (8000c78 <parse_str+0x7c0>)
 80009ae:	0010      	movs	r0, r2
 80009b0:	0019      	movs	r1, r3
 80009b2:	2305      	movs	r3, #5
 80009b4:	001a      	movs	r2, r3
 80009b6:	f000 fb3d 	bl	8001034 <memcpy>
 80009ba:	68bb      	ldr	r3, [r7, #8]
 80009bc:	2b00      	cmp	r3, #0
 80009be:	d000      	beq.n	80009c2 <parse_str+0x50a>
 80009c0:	e13f      	b.n	8000c42 <parse_str+0x78a>
 80009c2:	2301      	movs	r3, #1
 80009c4:	617b      	str	r3, [r7, #20]
 80009c6:	e13c      	b.n	8000c42 <parse_str+0x78a>
 80009c8:	68bb      	ldr	r3, [r7, #8]
 80009ca:	0018      	movs	r0, r3
 80009cc:	f7ff fb9c 	bl	8000108 <strlen>
 80009d0:	0003      	movs	r3, r0
 80009d2:	001a      	movs	r2, r3
 80009d4:	68bb      	ldr	r3, [r7, #8]
 80009d6:	189a      	adds	r2, r3, r2
 80009d8:	4ba8      	ldr	r3, [pc, #672]	; (8000c7c <parse_str+0x7c4>)
 80009da:	0010      	movs	r0, r2
 80009dc:	0019      	movs	r1, r3
 80009de:	2307      	movs	r3, #7
 80009e0:	001a      	movs	r2, r3
 80009e2:	f000 fb27 	bl	8001034 <memcpy>
 80009e6:	68bb      	ldr	r3, [r7, #8]
 80009e8:	2b00      	cmp	r3, #0
 80009ea:	d000      	beq.n	80009ee <parse_str+0x536>
 80009ec:	e12b      	b.n	8000c46 <parse_str+0x78e>
 80009ee:	2301      	movs	r3, #1
 80009f0:	617b      	str	r3, [r7, #20]
 80009f2:	e128      	b.n	8000c46 <parse_str+0x78e>
 80009f4:	68bb      	ldr	r3, [r7, #8]
 80009f6:	0018      	movs	r0, r3
 80009f8:	f7ff fb86 	bl	8000108 <strlen>
 80009fc:	0003      	movs	r3, r0
 80009fe:	001a      	movs	r2, r3
 8000a00:	68bb      	ldr	r3, [r7, #8]
 8000a02:	189a      	adds	r2, r3, r2
 8000a04:	4b9e      	ldr	r3, [pc, #632]	; (8000c80 <parse_str+0x7c8>)
 8000a06:	0010      	movs	r0, r2
 8000a08:	0019      	movs	r1, r3
 8000a0a:	2307      	movs	r3, #7
 8000a0c:	001a      	movs	r2, r3
 8000a0e:	f000 fb11 	bl	8001034 <memcpy>
 8000a12:	68bb      	ldr	r3, [r7, #8]
 8000a14:	2b00      	cmp	r3, #0
 8000a16:	d000      	beq.n	8000a1a <parse_str+0x562>
 8000a18:	e117      	b.n	8000c4a <parse_str+0x792>
 8000a1a:	2301      	movs	r3, #1
 8000a1c:	617b      	str	r3, [r7, #20]
 8000a1e:	e114      	b.n	8000c4a <parse_str+0x792>
 8000a20:	68bb      	ldr	r3, [r7, #8]
 8000a22:	0018      	movs	r0, r3
 8000a24:	f7ff fb70 	bl	8000108 <strlen>
 8000a28:	0003      	movs	r3, r0
 8000a2a:	001a      	movs	r2, r3
 8000a2c:	68bb      	ldr	r3, [r7, #8]
 8000a2e:	189a      	adds	r2, r3, r2
 8000a30:	4b94      	ldr	r3, [pc, #592]	; (8000c84 <parse_str+0x7cc>)
 8000a32:	0010      	movs	r0, r2
 8000a34:	0019      	movs	r1, r3
 8000a36:	2307      	movs	r3, #7
 8000a38:	001a      	movs	r2, r3
 8000a3a:	f000 fafb 	bl	8001034 <memcpy>
 8000a3e:	68bb      	ldr	r3, [r7, #8]
 8000a40:	2b00      	cmp	r3, #0
 8000a42:	d000      	beq.n	8000a46 <parse_str+0x58e>
 8000a44:	e103      	b.n	8000c4e <parse_str+0x796>
 8000a46:	2301      	movs	r3, #1
 8000a48:	617b      	str	r3, [r7, #20]
 8000a4a:	e100      	b.n	8000c4e <parse_str+0x796>
 8000a4c:	68bb      	ldr	r3, [r7, #8]
 8000a4e:	0018      	movs	r0, r3
 8000a50:	f7ff fb5a 	bl	8000108 <strlen>
 8000a54:	0003      	movs	r3, r0
 8000a56:	001a      	movs	r2, r3
 8000a58:	68bb      	ldr	r3, [r7, #8]
 8000a5a:	189a      	adds	r2, r3, r2
 8000a5c:	4b8a      	ldr	r3, [pc, #552]	; (8000c88 <parse_str+0x7d0>)
 8000a5e:	0010      	movs	r0, r2
 8000a60:	0019      	movs	r1, r3
 8000a62:	2307      	movs	r3, #7
 8000a64:	001a      	movs	r2, r3
 8000a66:	f000 fae5 	bl	8001034 <memcpy>
 8000a6a:	68bb      	ldr	r3, [r7, #8]
 8000a6c:	2b00      	cmp	r3, #0
 8000a6e:	d000      	beq.n	8000a72 <parse_str+0x5ba>
 8000a70:	e0ef      	b.n	8000c52 <parse_str+0x79a>
 8000a72:	2301      	movs	r3, #1
 8000a74:	617b      	str	r3, [r7, #20]
 8000a76:	e0ec      	b.n	8000c52 <parse_str+0x79a>
 8000a78:	68bb      	ldr	r3, [r7, #8]
 8000a7a:	0018      	movs	r0, r3
 8000a7c:	f7ff fb44 	bl	8000108 <strlen>
 8000a80:	0003      	movs	r3, r0
 8000a82:	001a      	movs	r2, r3
 8000a84:	68bb      	ldr	r3, [r7, #8]
 8000a86:	189a      	adds	r2, r3, r2
 8000a88:	4b80      	ldr	r3, [pc, #512]	; (8000c8c <parse_str+0x7d4>)
 8000a8a:	0010      	movs	r0, r2
 8000a8c:	0019      	movs	r1, r3
 8000a8e:	2307      	movs	r3, #7
 8000a90:	001a      	movs	r2, r3
 8000a92:	f000 facf 	bl	8001034 <memcpy>
 8000a96:	68bb      	ldr	r3, [r7, #8]
 8000a98:	2b00      	cmp	r3, #0
 8000a9a:	d000      	beq.n	8000a9e <parse_str+0x5e6>
 8000a9c:	e0db      	b.n	8000c56 <parse_str+0x79e>
 8000a9e:	2301      	movs	r3, #1
 8000aa0:	617b      	str	r3, [r7, #20]
 8000aa2:	e0d8      	b.n	8000c56 <parse_str+0x79e>
 8000aa4:	68bb      	ldr	r3, [r7, #8]
 8000aa6:	0018      	movs	r0, r3
 8000aa8:	f7ff fb2e 	bl	8000108 <strlen>
 8000aac:	0003      	movs	r3, r0
 8000aae:	001a      	movs	r2, r3
 8000ab0:	68bb      	ldr	r3, [r7, #8]
 8000ab2:	189a      	adds	r2, r3, r2
 8000ab4:	4b76      	ldr	r3, [pc, #472]	; (8000c90 <parse_str+0x7d8>)
 8000ab6:	0010      	movs	r0, r2
 8000ab8:	0019      	movs	r1, r3
 8000aba:	2306      	movs	r3, #6
 8000abc:	001a      	movs	r2, r3
 8000abe:	f000 fab9 	bl	8001034 <memcpy>
 8000ac2:	68bb      	ldr	r3, [r7, #8]
 8000ac4:	2b00      	cmp	r3, #0
 8000ac6:	d000      	beq.n	8000aca <parse_str+0x612>
 8000ac8:	e0c7      	b.n	8000c5a <parse_str+0x7a2>
 8000aca:	2301      	movs	r3, #1
 8000acc:	617b      	str	r3, [r7, #20]
 8000ace:	e0c4      	b.n	8000c5a <parse_str+0x7a2>
 8000ad0:	68bb      	ldr	r3, [r7, #8]
 8000ad2:	0018      	movs	r0, r3
 8000ad4:	f7ff fb18 	bl	8000108 <strlen>
 8000ad8:	0003      	movs	r3, r0
 8000ada:	001a      	movs	r2, r3
 8000adc:	68bb      	ldr	r3, [r7, #8]
 8000ade:	189a      	adds	r2, r3, r2
 8000ae0:	4b6c      	ldr	r3, [pc, #432]	; (8000c94 <parse_str+0x7dc>)
 8000ae2:	0010      	movs	r0, r2
 8000ae4:	0019      	movs	r1, r3
 8000ae6:	2306      	movs	r3, #6
 8000ae8:	001a      	movs	r2, r3
 8000aea:	f000 faa3 	bl	8001034 <memcpy>
 8000aee:	68bb      	ldr	r3, [r7, #8]
 8000af0:	2b00      	cmp	r3, #0
 8000af2:	d000      	beq.n	8000af6 <parse_str+0x63e>
 8000af4:	e0b3      	b.n	8000c5e <parse_str+0x7a6>
 8000af6:	2301      	movs	r3, #1
 8000af8:	617b      	str	r3, [r7, #20]
 8000afa:	e0b0      	b.n	8000c5e <parse_str+0x7a6>
 8000afc:	68bb      	ldr	r3, [r7, #8]
 8000afe:	0018      	movs	r0, r3
 8000b00:	f7ff fb02 	bl	8000108 <strlen>
 8000b04:	0003      	movs	r3, r0
 8000b06:	001a      	movs	r2, r3
 8000b08:	68bb      	ldr	r3, [r7, #8]
 8000b0a:	189a      	adds	r2, r3, r2
 8000b0c:	4b62      	ldr	r3, [pc, #392]	; (8000c98 <parse_str+0x7e0>)
 8000b0e:	0010      	movs	r0, r2
 8000b10:	0019      	movs	r1, r3
 8000b12:	2307      	movs	r3, #7
 8000b14:	001a      	movs	r2, r3
 8000b16:	f000 fa8d 	bl	8001034 <memcpy>
 8000b1a:	68bb      	ldr	r3, [r7, #8]
 8000b1c:	2b00      	cmp	r3, #0
 8000b1e:	d000      	beq.n	8000b22 <parse_str+0x66a>
 8000b20:	e09f      	b.n	8000c62 <parse_str+0x7aa>
 8000b22:	2301      	movs	r3, #1
 8000b24:	617b      	str	r3, [r7, #20]
 8000b26:	e09c      	b.n	8000c62 <parse_str+0x7aa>
 8000b28:	68bb      	ldr	r3, [r7, #8]
 8000b2a:	0018      	movs	r0, r3
 8000b2c:	f7ff faec 	bl	8000108 <strlen>
 8000b30:	0003      	movs	r3, r0
 8000b32:	001a      	movs	r2, r3
 8000b34:	68bb      	ldr	r3, [r7, #8]
 8000b36:	189a      	adds	r2, r3, r2
 8000b38:	4b58      	ldr	r3, [pc, #352]	; (8000c9c <parse_str+0x7e4>)
 8000b3a:	0010      	movs	r0, r2
 8000b3c:	0019      	movs	r1, r3
 8000b3e:	2306      	movs	r3, #6
 8000b40:	001a      	movs	r2, r3
 8000b42:	f000 fa77 	bl	8001034 <memcpy>
 8000b46:	68bb      	ldr	r3, [r7, #8]
 8000b48:	2b00      	cmp	r3, #0
 8000b4a:	d000      	beq.n	8000b4e <parse_str+0x696>
 8000b4c:	e0ae      	b.n	8000cac <parse_str+0x7f4>
 8000b4e:	2301      	movs	r3, #1
 8000b50:	617b      	str	r3, [r7, #20]
 8000b52:	e0ab      	b.n	8000cac <parse_str+0x7f4>
 8000b54:	68bb      	ldr	r3, [r7, #8]
 8000b56:	0018      	movs	r0, r3
 8000b58:	f7ff fad6 	bl	8000108 <strlen>
 8000b5c:	0003      	movs	r3, r0
 8000b5e:	001a      	movs	r2, r3
 8000b60:	68bb      	ldr	r3, [r7, #8]
 8000b62:	189a      	adds	r2, r3, r2
 8000b64:	4b4e      	ldr	r3, [pc, #312]	; (8000ca0 <parse_str+0x7e8>)
 8000b66:	0010      	movs	r0, r2
 8000b68:	0019      	movs	r1, r3
 8000b6a:	2307      	movs	r3, #7
 8000b6c:	001a      	movs	r2, r3
 8000b6e:	f000 fa61 	bl	8001034 <memcpy>
 8000b72:	68bb      	ldr	r3, [r7, #8]
 8000b74:	2b00      	cmp	r3, #0
 8000b76:	d000      	beq.n	8000b7a <parse_str+0x6c2>
 8000b78:	e09a      	b.n	8000cb0 <parse_str+0x7f8>
 8000b7a:	2301      	movs	r3, #1
 8000b7c:	617b      	str	r3, [r7, #20]
 8000b7e:	e097      	b.n	8000cb0 <parse_str+0x7f8>
 8000b80:	68bb      	ldr	r3, [r7, #8]
 8000b82:	0018      	movs	r0, r3
 8000b84:	f7ff fac0 	bl	8000108 <strlen>
 8000b88:	0003      	movs	r3, r0
 8000b8a:	001a      	movs	r2, r3
 8000b8c:	68bb      	ldr	r3, [r7, #8]
 8000b8e:	189a      	adds	r2, r3, r2
 8000b90:	4b44      	ldr	r3, [pc, #272]	; (8000ca4 <parse_str+0x7ec>)
 8000b92:	0010      	movs	r0, r2
 8000b94:	0019      	movs	r1, r3
 8000b96:	2307      	movs	r3, #7
 8000b98:	001a      	movs	r2, r3
 8000b9a:	f000 fa4b 	bl	8001034 <memcpy>
 8000b9e:	68bb      	ldr	r3, [r7, #8]
 8000ba0:	2b00      	cmp	r3, #0
 8000ba2:	d000      	beq.n	8000ba6 <parse_str+0x6ee>
 8000ba4:	e086      	b.n	8000cb4 <parse_str+0x7fc>
 8000ba6:	2301      	movs	r3, #1
 8000ba8:	617b      	str	r3, [r7, #20]
 8000baa:	e083      	b.n	8000cb4 <parse_str+0x7fc>
 8000bac:	68bb      	ldr	r3, [r7, #8]
 8000bae:	0018      	movs	r0, r3
 8000bb0:	f7ff faaa 	bl	8000108 <strlen>
 8000bb4:	0003      	movs	r3, r0
 8000bb6:	001a      	movs	r2, r3
 8000bb8:	68bb      	ldr	r3, [r7, #8]
 8000bba:	189a      	adds	r2, r3, r2
 8000bbc:	4b3a      	ldr	r3, [pc, #232]	; (8000ca8 <parse_str+0x7f0>)
 8000bbe:	0010      	movs	r0, r2
 8000bc0:	0019      	movs	r1, r3
 8000bc2:	2302      	movs	r3, #2
 8000bc4:	001a      	movs	r2, r3
 8000bc6:	f000 fa35 	bl	8001034 <memcpy>
 8000bca:	68bb      	ldr	r3, [r7, #8]
 8000bcc:	2b00      	cmp	r3, #0
 8000bce:	d000      	beq.n	8000bd2 <parse_str+0x71a>
 8000bd0:	e072      	b.n	8000cb8 <parse_str+0x800>
 8000bd2:	2301      	movs	r3, #1
 8000bd4:	617b      	str	r3, [r7, #20]
 8000bd6:	e06f      	b.n	8000cb8 <parse_str+0x800>
 8000bd8:	2308      	movs	r3, #8
 8000bda:	617b      	str	r3, [r7, #20]
 8000bdc:	e06d      	b.n	8000cba <parse_str+0x802>
 8000bde:	46c0      	nop			; (mov r8, r8)
 8000be0:	e06b      	b.n	8000cba <parse_str+0x802>
 8000be2:	46c0      	nop			; (mov r8, r8)
 8000be4:	e069      	b.n	8000cba <parse_str+0x802>
 8000be6:	46c0      	nop			; (mov r8, r8)
 8000be8:	e067      	b.n	8000cba <parse_str+0x802>
 8000bea:	46c0      	nop			; (mov r8, r8)
 8000bec:	e065      	b.n	8000cba <parse_str+0x802>
 8000bee:	46c0      	nop			; (mov r8, r8)
 8000bf0:	e063      	b.n	8000cba <parse_str+0x802>
 8000bf2:	46c0      	nop			; (mov r8, r8)
 8000bf4:	e061      	b.n	8000cba <parse_str+0x802>
 8000bf6:	46c0      	nop			; (mov r8, r8)
 8000bf8:	e05f      	b.n	8000cba <parse_str+0x802>
 8000bfa:	46c0      	nop			; (mov r8, r8)
 8000bfc:	e05d      	b.n	8000cba <parse_str+0x802>
 8000bfe:	46c0      	nop			; (mov r8, r8)
 8000c00:	e05b      	b.n	8000cba <parse_str+0x802>
 8000c02:	46c0      	nop			; (mov r8, r8)
 8000c04:	e059      	b.n	8000cba <parse_str+0x802>
 8000c06:	46c0      	nop			; (mov r8, r8)
 8000c08:	e057      	b.n	8000cba <parse_str+0x802>
 8000c0a:	46c0      	nop			; (mov r8, r8)
 8000c0c:	e055      	b.n	8000cba <parse_str+0x802>
 8000c0e:	46c0      	nop			; (mov r8, r8)
 8000c10:	e053      	b.n	8000cba <parse_str+0x802>
 8000c12:	46c0      	nop			; (mov r8, r8)
 8000c14:	e051      	b.n	8000cba <parse_str+0x802>
 8000c16:	46c0      	nop			; (mov r8, r8)
 8000c18:	e04f      	b.n	8000cba <parse_str+0x802>
 8000c1a:	46c0      	nop			; (mov r8, r8)
 8000c1c:	e04d      	b.n	8000cba <parse_str+0x802>
 8000c1e:	46c0      	nop			; (mov r8, r8)
 8000c20:	e04b      	b.n	8000cba <parse_str+0x802>
 8000c22:	46c0      	nop			; (mov r8, r8)
 8000c24:	e049      	b.n	8000cba <parse_str+0x802>
 8000c26:	46c0      	nop			; (mov r8, r8)
 8000c28:	e047      	b.n	8000cba <parse_str+0x802>
 8000c2a:	46c0      	nop			; (mov r8, r8)
 8000c2c:	e045      	b.n	8000cba <parse_str+0x802>
 8000c2e:	46c0      	nop			; (mov r8, r8)
 8000c30:	e043      	b.n	8000cba <parse_str+0x802>
 8000c32:	46c0      	nop			; (mov r8, r8)
 8000c34:	e041      	b.n	8000cba <parse_str+0x802>
 8000c36:	46c0      	nop			; (mov r8, r8)
 8000c38:	e03f      	b.n	8000cba <parse_str+0x802>
 8000c3a:	46c0      	nop			; (mov r8, r8)
 8000c3c:	e03d      	b.n	8000cba <parse_str+0x802>
 8000c3e:	46c0      	nop			; (mov r8, r8)
 8000c40:	e03b      	b.n	8000cba <parse_str+0x802>
 8000c42:	46c0      	nop			; (mov r8, r8)
 8000c44:	e039      	b.n	8000cba <parse_str+0x802>
 8000c46:	46c0      	nop			; (mov r8, r8)
 8000c48:	e037      	b.n	8000cba <parse_str+0x802>
 8000c4a:	46c0      	nop			; (mov r8, r8)
 8000c4c:	e035      	b.n	8000cba <parse_str+0x802>
 8000c4e:	46c0      	nop			; (mov r8, r8)
 8000c50:	e033      	b.n	8000cba <parse_str+0x802>
 8000c52:	46c0      	nop			; (mov r8, r8)
 8000c54:	e031      	b.n	8000cba <parse_str+0x802>
 8000c56:	46c0      	nop			; (mov r8, r8)
 8000c58:	e02f      	b.n	8000cba <parse_str+0x802>
 8000c5a:	46c0      	nop			; (mov r8, r8)
 8000c5c:	e02d      	b.n	8000cba <parse_str+0x802>
 8000c5e:	46c0      	nop			; (mov r8, r8)
 8000c60:	e02b      	b.n	8000cba <parse_str+0x802>
 8000c62:	46c0      	nop			; (mov r8, r8)
 8000c64:	e029      	b.n	8000cba <parse_str+0x802>
 8000c66:	46c0      	nop			; (mov r8, r8)
 8000c68:	08001294 	.word	0x08001294
 8000c6c:	0800129c 	.word	0x0800129c
 8000c70:	080012a0 	.word	0x080012a0
 8000c74:	080012a8 	.word	0x080012a8
 8000c78:	080012b0 	.word	0x080012b0
 8000c7c:	080012b8 	.word	0x080012b8
 8000c80:	080012c0 	.word	0x080012c0
 8000c84:	080012c8 	.word	0x080012c8
 8000c88:	080012d0 	.word	0x080012d0
 8000c8c:	080012d8 	.word	0x080012d8
 8000c90:	080012e0 	.word	0x080012e0
 8000c94:	080012e8 	.word	0x080012e8
 8000c98:	080012f0 	.word	0x080012f0
 8000c9c:	080012f8 	.word	0x080012f8
 8000ca0:	08001300 	.word	0x08001300
 8000ca4:	08001308 	.word	0x08001308
 8000ca8:	08001310 	.word	0x08001310
 8000cac:	46c0      	nop			; (mov r8, r8)
 8000cae:	e004      	b.n	8000cba <parse_str+0x802>
 8000cb0:	46c0      	nop			; (mov r8, r8)
 8000cb2:	e002      	b.n	8000cba <parse_str+0x802>
 8000cb4:	46c0      	nop			; (mov r8, r8)
 8000cb6:	e000      	b.n	8000cba <parse_str+0x802>
 8000cb8:	46c0      	nop			; (mov r8, r8)
 8000cba:	687b      	ldr	r3, [r7, #4]
 8000cbc:	3b01      	subs	r3, #1
 8000cbe:	693a      	ldr	r2, [r7, #16]
 8000cc0:	429a      	cmp	r2, r3
 8000cc2:	d220      	bcs.n	8000d06 <parse_str+0x84e>
 8000cc4:	693b      	ldr	r3, [r7, #16]
 8000cc6:	3301      	adds	r3, #1
 8000cc8:	68fa      	ldr	r2, [r7, #12]
 8000cca:	18d3      	adds	r3, r2, r3
 8000ccc:	781b      	ldrb	r3, [r3, #0]
 8000cce:	2b20      	cmp	r3, #32
 8000cd0:	d019      	beq.n	8000d06 <parse_str+0x84e>
 8000cd2:	68fa      	ldr	r2, [r7, #12]
 8000cd4:	693b      	ldr	r3, [r7, #16]
 8000cd6:	18d3      	adds	r3, r2, r3
 8000cd8:	781b      	ldrb	r3, [r3, #0]
 8000cda:	2b20      	cmp	r3, #32
 8000cdc:	d013      	beq.n	8000d06 <parse_str+0x84e>
 8000cde:	68bb      	ldr	r3, [r7, #8]
 8000ce0:	0018      	movs	r0, r3
 8000ce2:	f7ff fa11 	bl	8000108 <strlen>
 8000ce6:	0003      	movs	r3, r0
 8000ce8:	001a      	movs	r2, r3
 8000cea:	68bb      	ldr	r3, [r7, #8]
 8000cec:	189a      	adds	r2, r3, r2
 8000cee:	4b0e      	ldr	r3, [pc, #56]	; (8000d28 <parse_str+0x870>)
 8000cf0:	0010      	movs	r0, r2
 8000cf2:	0019      	movs	r1, r3
 8000cf4:	2302      	movs	r3, #2
 8000cf6:	001a      	movs	r2, r3
 8000cf8:	f000 f99c 	bl	8001034 <memcpy>
 8000cfc:	68bb      	ldr	r3, [r7, #8]
 8000cfe:	2b00      	cmp	r3, #0
 8000d00:	d101      	bne.n	8000d06 <parse_str+0x84e>
 8000d02:	2301      	movs	r3, #1
 8000d04:	e00b      	b.n	8000d1e <parse_str+0x866>
 8000d06:	693b      	ldr	r3, [r7, #16]
 8000d08:	3301      	adds	r3, #1
 8000d0a:	613b      	str	r3, [r7, #16]
 8000d0c:	68fa      	ldr	r2, [r7, #12]
 8000d0e:	693b      	ldr	r3, [r7, #16]
 8000d10:	18d3      	adds	r3, r2, r3
 8000d12:	781b      	ldrb	r3, [r3, #0]
 8000d14:	2b00      	cmp	r3, #0
 8000d16:	d001      	beq.n	8000d1c <parse_str+0x864>
 8000d18:	f7ff fbe0 	bl	80004dc <parse_str+0x24>
 8000d1c:	697b      	ldr	r3, [r7, #20]
 8000d1e:	0018      	movs	r0, r3
 8000d20:	46bd      	mov	sp, r7
 8000d22:	b006      	add	sp, #24
 8000d24:	bd80      	pop	{r7, pc}
 8000d26:	46c0      	nop			; (mov r8, r8)
 8000d28:	08001314 	.word	0x08001314

08000d2c <parse_binary>:
 8000d2c:	b580      	push	{r7, lr}
 8000d2e:	b084      	sub	sp, #16
 8000d30:	af00      	add	r7, sp, #0
 8000d32:	6078      	str	r0, [r7, #4]
 8000d34:	6039      	str	r1, [r7, #0]
 8000d36:	687b      	ldr	r3, [r7, #4]
 8000d38:	2b00      	cmp	r3, #0
 8000d3a:	d101      	bne.n	8000d40 <parse_binary+0x14>
 8000d3c:	2310      	movs	r3, #16
 8000d3e:	e079      	b.n	8000e34 <parse_binary+0x108>
 8000d40:	2300      	movs	r3, #0
 8000d42:	60fb      	str	r3, [r7, #12]
 8000d44:	2300      	movs	r3, #0
 8000d46:	60bb      	str	r3, [r7, #8]
 8000d48:	e06d      	b.n	8000e26 <parse_binary+0xfa>
 8000d4a:	687a      	ldr	r2, [r7, #4]
 8000d4c:	68bb      	ldr	r3, [r7, #8]
 8000d4e:	18d3      	adds	r3, r2, r3
 8000d50:	781b      	ldrb	r3, [r3, #0]
 8000d52:	2b2a      	cmp	r3, #42	; 0x2a
 8000d54:	d046      	beq.n	8000de4 <parse_binary+0xb8>
 8000d56:	dc02      	bgt.n	8000d5e <parse_binary+0x32>
 8000d58:	2b20      	cmp	r3, #32
 8000d5a:	d02e      	beq.n	8000dba <parse_binary+0x8e>
 8000d5c:	e057      	b.n	8000e0e <parse_binary+0xe2>
 8000d5e:	2b2d      	cmp	r3, #45	; 0x2d
 8000d60:	d016      	beq.n	8000d90 <parse_binary+0x64>
 8000d62:	2b2e      	cmp	r3, #46	; 0x2e
 8000d64:	d153      	bne.n	8000e0e <parse_binary+0xe2>
 8000d66:	683b      	ldr	r3, [r7, #0]
 8000d68:	0018      	movs	r0, r3
 8000d6a:	f7ff f9cd 	bl	8000108 <strlen>
 8000d6e:	0003      	movs	r3, r0
 8000d70:	001a      	movs	r2, r3
 8000d72:	683b      	ldr	r3, [r7, #0]
 8000d74:	189a      	adds	r2, r3, r2
 8000d76:	4b31      	ldr	r3, [pc, #196]	; (8000e3c <parse_binary+0x110>)
 8000d78:	0010      	movs	r0, r2
 8000d7a:	0019      	movs	r1, r3
 8000d7c:	2303      	movs	r3, #3
 8000d7e:	001a      	movs	r2, r3
 8000d80:	f000 f958 	bl	8001034 <memcpy>
 8000d84:	683b      	ldr	r3, [r7, #0]
 8000d86:	2b00      	cmp	r3, #0
 8000d88:	d143      	bne.n	8000e12 <parse_binary+0xe6>
 8000d8a:	2301      	movs	r3, #1
 8000d8c:	60fb      	str	r3, [r7, #12]
 8000d8e:	e040      	b.n	8000e12 <parse_binary+0xe6>
 8000d90:	683b      	ldr	r3, [r7, #0]
 8000d92:	0018      	movs	r0, r3
 8000d94:	f7ff f9b8 	bl	8000108 <strlen>
 8000d98:	0003      	movs	r3, r0
 8000d9a:	001a      	movs	r2, r3
 8000d9c:	683b      	ldr	r3, [r7, #0]
 8000d9e:	189a      	adds	r2, r3, r2
 8000da0:	4b27      	ldr	r3, [pc, #156]	; (8000e40 <parse_binary+0x114>)
 8000da2:	0010      	movs	r0, r2
 8000da4:	0019      	movs	r1, r3
 8000da6:	2305      	movs	r3, #5
 8000da8:	001a      	movs	r2, r3
 8000daa:	f000 f943 	bl	8001034 <memcpy>
 8000dae:	683b      	ldr	r3, [r7, #0]
 8000db0:	2b00      	cmp	r3, #0
 8000db2:	d130      	bne.n	8000e16 <parse_binary+0xea>
 8000db4:	2301      	movs	r3, #1
 8000db6:	60fb      	str	r3, [r7, #12]
 8000db8:	e02d      	b.n	8000e16 <parse_binary+0xea>
 8000dba:	683b      	ldr	r3, [r7, #0]
 8000dbc:	0018      	movs	r0, r3
 8000dbe:	f7ff f9a3 	bl	8000108 <strlen>
 8000dc2:	0003      	movs	r3, r0
 8000dc4:	001a      	movs	r2, r3
 8000dc6:	683b      	ldr	r3, [r7, #0]
 8000dc8:	189a      	adds	r2, r3, r2
 8000dca:	4b1e      	ldr	r3, [pc, #120]	; (8000e44 <parse_binary+0x118>)
 8000dcc:	0010      	movs	r0, r2
 8000dce:	0019      	movs	r1, r3
 8000dd0:	2307      	movs	r3, #7
 8000dd2:	001a      	movs	r2, r3
 8000dd4:	f000 f92e 	bl	8001034 <memcpy>
 8000dd8:	683b      	ldr	r3, [r7, #0]
 8000dda:	2b00      	cmp	r3, #0
 8000ddc:	d11d      	bne.n	8000e1a <parse_binary+0xee>
 8000dde:	2301      	movs	r3, #1
 8000de0:	60fb      	str	r3, [r7, #12]
 8000de2:	e01a      	b.n	8000e1a <parse_binary+0xee>
 8000de4:	683b      	ldr	r3, [r7, #0]
 8000de6:	0018      	movs	r0, r3
 8000de8:	f7ff f98e 	bl	8000108 <strlen>
 8000dec:	0003      	movs	r3, r0
 8000dee:	001a      	movs	r2, r3
 8000df0:	683b      	ldr	r3, [r7, #0]
 8000df2:	189a      	adds	r2, r3, r2
 8000df4:	4b14      	ldr	r3, [pc, #80]	; (8000e48 <parse_binary+0x11c>)
 8000df6:	0010      	movs	r0, r2
 8000df8:	0019      	movs	r1, r3
 8000dfa:	2303      	movs	r3, #3
 8000dfc:	001a      	movs	r2, r3
 8000dfe:	f000 f919 	bl	8001034 <memcpy>
 8000e02:	683b      	ldr	r3, [r7, #0]
 8000e04:	2b00      	cmp	r3, #0
 8000e06:	d10a      	bne.n	8000e1e <parse_binary+0xf2>
 8000e08:	2301      	movs	r3, #1
 8000e0a:	60fb      	str	r3, [r7, #12]
 8000e0c:	e007      	b.n	8000e1e <parse_binary+0xf2>
 8000e0e:	2308      	movs	r3, #8
 8000e10:	e010      	b.n	8000e34 <parse_binary+0x108>
 8000e12:	46c0      	nop			; (mov r8, r8)
 8000e14:	e004      	b.n	8000e20 <parse_binary+0xf4>
 8000e16:	46c0      	nop			; (mov r8, r8)
 8000e18:	e002      	b.n	8000e20 <parse_binary+0xf4>
 8000e1a:	46c0      	nop			; (mov r8, r8)
 8000e1c:	e000      	b.n	8000e20 <parse_binary+0xf4>
 8000e1e:	46c0      	nop			; (mov r8, r8)
 8000e20:	68bb      	ldr	r3, [r7, #8]
 8000e22:	3301      	adds	r3, #1
 8000e24:	60bb      	str	r3, [r7, #8]
 8000e26:	687a      	ldr	r2, [r7, #4]
 8000e28:	68bb      	ldr	r3, [r7, #8]
 8000e2a:	18d3      	adds	r3, r2, r3
 8000e2c:	781b      	ldrb	r3, [r3, #0]
 8000e2e:	2b00      	cmp	r3, #0
 8000e30:	d18b      	bne.n	8000d4a <parse_binary+0x1e>
 8000e32:	68fb      	ldr	r3, [r7, #12]
 8000e34:	0018      	movs	r0, r3
 8000e36:	46bd      	mov	sp, r7
 8000e38:	b004      	add	sp, #16
 8000e3a:	bd80      	pop	{r7, pc}
 8000e3c:	08001318 	.word	0x08001318
 8000e40:	0800131c 	.word	0x0800131c
 8000e44:	08001324 	.word	0x08001324
 8000e48:	0800132c 	.word	0x0800132c

08000e4c <main>:
 8000e4c:	b590      	push	{r4, r7, lr}
 8000e4e:	b08f      	sub	sp, #60	; 0x3c
 8000e50:	af00      	add	r7, sp, #0
 8000e52:	003b      	movs	r3, r7
 8000e54:	4a2c      	ldr	r2, [pc, #176]	; (8000f08 <main+0xbc>)
 8000e56:	ca13      	ldmia	r2!, {r0, r1, r4}
 8000e58:	c313      	stmia	r3!, {r0, r1, r4}
 8000e5a:	ca13      	ldmia	r2!, {r0, r1, r4}
 8000e5c:	c313      	stmia	r3!, {r0, r1, r4}
 8000e5e:	ca13      	ldmia	r2!, {r0, r1, r4}
 8000e60:	c313      	stmia	r3!, {r0, r1, r4}
 8000e62:	ca03      	ldmia	r2!, {r0, r1}
 8000e64:	c303      	stmia	r3!, {r0, r1}
 8000e66:	8812      	ldrh	r2, [r2, #0]
 8000e68:	801a      	strh	r2, [r3, #0]
 8000e6a:	2101      	movs	r1, #1
 8000e6c:	20ff      	movs	r0, #255	; 0xff
 8000e6e:	f000 f8a9 	bl	8000fc4 <calloc>
 8000e72:	0003      	movs	r3, r0
 8000e74:	637b      	str	r3, [r7, #52]	; 0x34
 8000e76:	4b25      	ldr	r3, [pc, #148]	; (8000f0c <main+0xc0>)
 8000e78:	2101      	movs	r1, #1
 8000e7a:	0018      	movs	r0, r3
 8000e7c:	f000 f8a2 	bl	8000fc4 <calloc>
 8000e80:	0003      	movs	r3, r0
 8000e82:	633b      	str	r3, [r7, #48]	; 0x30
 8000e84:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8000e86:	2b00      	cmp	r3, #0
 8000e88:	d101      	bne.n	8000e8e <main+0x42>
 8000e8a:	2304      	movs	r3, #4
 8000e8c:	e037      	b.n	8000efe <main+0xb2>
 8000e8e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8000e90:	2b00      	cmp	r3, #0
 8000e92:	d101      	bne.n	8000e98 <main+0x4c>
 8000e94:	2304      	movs	r3, #4
 8000e96:	e032      	b.n	8000efe <main+0xb2>
 8000e98:	6b79      	ldr	r1, [r7, #52]	; 0x34
 8000e9a:	003b      	movs	r3, r7
 8000e9c:	22ff      	movs	r2, #255	; 0xff
 8000e9e:	0018      	movs	r0, r3
 8000ea0:	f7ff fb0a 	bl	80004b8 <parse_str>
 8000ea4:	1e03      	subs	r3, r0, #0
 8000ea6:	d001      	beq.n	8000eac <main+0x60>
 8000ea8:	2320      	movs	r3, #32
 8000eaa:	e028      	b.n	8000efe <main+0xb2>
 8000eac:	6b3a      	ldr	r2, [r7, #48]	; 0x30
 8000eae:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8000eb0:	0011      	movs	r1, r2
 8000eb2:	0018      	movs	r0, r3
 8000eb4:	f7ff ff3a 	bl	8000d2c <parse_binary>
 8000eb8:	1e03      	subs	r3, r0, #0
 8000eba:	d001      	beq.n	8000ec0 <main+0x74>
 8000ebc:	2320      	movs	r3, #32
 8000ebe:	e01e      	b.n	8000efe <main+0xb2>
 8000ec0:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8000ec2:	0018      	movs	r0, r3
 8000ec4:	f000 f8ac 	bl	8001020 <free>
 8000ec8:	f7ff fa60 	bl	800038c <rcc_config>
 8000ecc:	2380      	movs	r3, #128	; 0x80
 8000ece:	005b      	lsls	r3, r3, #1
 8000ed0:	0018      	movs	r0, r3
 8000ed2:	f7ff fa8f 	bl	80003f4 <gpio_config>
 8000ed6:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8000ed8:	0018      	movs	r0, r3
 8000eda:	f7ff faa9 	bl	8000430 <main_loop>
 8000ede:	1e03      	subs	r3, r0, #0
 8000ee0:	d001      	beq.n	8000ee6 <main+0x9a>
 8000ee2:	2320      	movs	r3, #32
 8000ee4:	e00b      	b.n	8000efe <main+0xb2>
 8000ee6:	2380      	movs	r3, #128	; 0x80
 8000ee8:	005b      	lsls	r3, r3, #1
 8000eea:	4a09      	ldr	r2, [pc, #36]	; (8000f10 <main+0xc4>)
 8000eec:	0019      	movs	r1, r3
 8000eee:	0010      	movs	r0, r2
 8000ef0:	f7ff fa3f 	bl	8000372 <LL_GPIO_ResetOutputPin>
 8000ef4:	4b07      	ldr	r3, [pc, #28]	; (8000f14 <main+0xc8>)
 8000ef6:	0018      	movs	r0, r3
 8000ef8:	f7ff fa92 	bl	8000420 <delay>
 8000efc:	e7eb      	b.n	8000ed6 <main+0x8a>
 8000efe:	0018      	movs	r0, r3
 8000f00:	46bd      	mov	sp, r7
 8000f02:	b00f      	add	sp, #60	; 0x3c
 8000f04:	bd90      	pop	{r4, r7, pc}
 8000f06:	46c0      	nop			; (mov r8, r8)
 8000f08:	08001330 	.word	0x08001330
 8000f0c:	00000ef1 	.word	0x00000ef1
 8000f10:	48000800 	.word	0x48000800
 8000f14:	03fb8d80 	.word	0x03fb8d80

08000f18 <SystemInit>:
 8000f18:	b580      	push	{r7, lr}
 8000f1a:	af00      	add	r7, sp, #0
 8000f1c:	4b1a      	ldr	r3, [pc, #104]	; (8000f88 <SystemInit+0x70>)
 8000f1e:	681a      	ldr	r2, [r3, #0]
 8000f20:	4b19      	ldr	r3, [pc, #100]	; (8000f88 <SystemInit+0x70>)
 8000f22:	2101      	movs	r1, #1
 8000f24:	430a      	orrs	r2, r1
 8000f26:	601a      	str	r2, [r3, #0]
 8000f28:	4b17      	ldr	r3, [pc, #92]	; (8000f88 <SystemInit+0x70>)
 8000f2a:	685a      	ldr	r2, [r3, #4]
 8000f2c:	4b16      	ldr	r3, [pc, #88]	; (8000f88 <SystemInit+0x70>)
 8000f2e:	4917      	ldr	r1, [pc, #92]	; (8000f8c <SystemInit+0x74>)
 8000f30:	400a      	ands	r2, r1
 8000f32:	605a      	str	r2, [r3, #4]
 8000f34:	4b14      	ldr	r3, [pc, #80]	; (8000f88 <SystemInit+0x70>)
 8000f36:	681a      	ldr	r2, [r3, #0]
 8000f38:	4b13      	ldr	r3, [pc, #76]	; (8000f88 <SystemInit+0x70>)
 8000f3a:	4915      	ldr	r1, [pc, #84]	; (8000f90 <SystemInit+0x78>)
 8000f3c:	400a      	ands	r2, r1
 8000f3e:	601a      	str	r2, [r3, #0]
 8000f40:	4b11      	ldr	r3, [pc, #68]	; (8000f88 <SystemInit+0x70>)
 8000f42:	681a      	ldr	r2, [r3, #0]
 8000f44:	4b10      	ldr	r3, [pc, #64]	; (8000f88 <SystemInit+0x70>)
 8000f46:	4913      	ldr	r1, [pc, #76]	; (8000f94 <SystemInit+0x7c>)
 8000f48:	400a      	ands	r2, r1
 8000f4a:	601a      	str	r2, [r3, #0]
 8000f4c:	4b0e      	ldr	r3, [pc, #56]	; (8000f88 <SystemInit+0x70>)
 8000f4e:	685a      	ldr	r2, [r3, #4]
 8000f50:	4b0d      	ldr	r3, [pc, #52]	; (8000f88 <SystemInit+0x70>)
 8000f52:	4911      	ldr	r1, [pc, #68]	; (8000f98 <SystemInit+0x80>)
 8000f54:	400a      	ands	r2, r1
 8000f56:	605a      	str	r2, [r3, #4]
 8000f58:	4b0b      	ldr	r3, [pc, #44]	; (8000f88 <SystemInit+0x70>)
 8000f5a:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8000f5c:	4b0a      	ldr	r3, [pc, #40]	; (8000f88 <SystemInit+0x70>)
 8000f5e:	210f      	movs	r1, #15
 8000f60:	438a      	bics	r2, r1
 8000f62:	62da      	str	r2, [r3, #44]	; 0x2c
 8000f64:	4b08      	ldr	r3, [pc, #32]	; (8000f88 <SystemInit+0x70>)
 8000f66:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000f68:	4b07      	ldr	r3, [pc, #28]	; (8000f88 <SystemInit+0x70>)
 8000f6a:	490c      	ldr	r1, [pc, #48]	; (8000f9c <SystemInit+0x84>)
 8000f6c:	400a      	ands	r2, r1
 8000f6e:	631a      	str	r2, [r3, #48]	; 0x30
 8000f70:	4b05      	ldr	r3, [pc, #20]	; (8000f88 <SystemInit+0x70>)
 8000f72:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8000f74:	4b04      	ldr	r3, [pc, #16]	; (8000f88 <SystemInit+0x70>)
 8000f76:	2101      	movs	r1, #1
 8000f78:	438a      	bics	r2, r1
 8000f7a:	635a      	str	r2, [r3, #52]	; 0x34
 8000f7c:	4b02      	ldr	r3, [pc, #8]	; (8000f88 <SystemInit+0x70>)
 8000f7e:	2200      	movs	r2, #0
 8000f80:	609a      	str	r2, [r3, #8]
 8000f82:	46c0      	nop			; (mov r8, r8)
 8000f84:	46bd      	mov	sp, r7
 8000f86:	bd80      	pop	{r7, pc}
 8000f88:	40021000 	.word	0x40021000
 8000f8c:	f8ffb80c 	.word	0xf8ffb80c
 8000f90:	fef6ffff 	.word	0xfef6ffff
 8000f94:	fffbffff 	.word	0xfffbffff
 8000f98:	ffc0ffff 	.word	0xffc0ffff
 8000f9c:	fffffeac 	.word	0xfffffeac

08000fa0 <NMI_Handler>:
 8000fa0:	b580      	push	{r7, lr}
 8000fa2:	af00      	add	r7, sp, #0
 8000fa4:	46c0      	nop			; (mov r8, r8)
 8000fa6:	46bd      	mov	sp, r7
 8000fa8:	bd80      	pop	{r7, pc}

08000faa <HardFault_Handler>:
 8000faa:	b580      	push	{r7, lr}
 8000fac:	af00      	add	r7, sp, #0
 8000fae:	e7fe      	b.n	8000fae <HardFault_Handler+0x4>

08000fb0 <SVC_Handler>:
 8000fb0:	b580      	push	{r7, lr}
 8000fb2:	af00      	add	r7, sp, #0
 8000fb4:	46c0      	nop			; (mov r8, r8)
 8000fb6:	46bd      	mov	sp, r7
 8000fb8:	bd80      	pop	{r7, pc}

08000fba <PendSV_Handler>:
 8000fba:	b580      	push	{r7, lr}
 8000fbc:	af00      	add	r7, sp, #0
 8000fbe:	46c0      	nop			; (mov r8, r8)
 8000fc0:	46bd      	mov	sp, r7
 8000fc2:	bd80      	pop	{r7, pc}

08000fc4 <calloc>:
 8000fc4:	b510      	push	{r4, lr}
 8000fc6:	4b03      	ldr	r3, [pc, #12]	; (8000fd4 <calloc+0x10>)
 8000fc8:	000a      	movs	r2, r1
 8000fca:	0001      	movs	r1, r0
 8000fcc:	6818      	ldr	r0, [r3, #0]
 8000fce:	f000 f842 	bl	8001056 <_calloc_r>
 8000fd2:	bd10      	pop	{r4, pc}
 8000fd4:	20000004 	.word	0x20000004

08000fd8 <__libc_init_array>:
 8000fd8:	b570      	push	{r4, r5, r6, lr}
 8000fda:	2600      	movs	r6, #0
 8000fdc:	4d0c      	ldr	r5, [pc, #48]	; (8001010 <__libc_init_array+0x38>)
 8000fde:	4c0d      	ldr	r4, [pc, #52]	; (8001014 <__libc_init_array+0x3c>)
 8000fe0:	1b64      	subs	r4, r4, r5
 8000fe2:	10a4      	asrs	r4, r4, #2
 8000fe4:	42a6      	cmp	r6, r4
 8000fe6:	d109      	bne.n	8000ffc <__libc_init_array+0x24>
 8000fe8:	2600      	movs	r6, #0
 8000fea:	f000 f90d 	bl	8001208 <_init>
 8000fee:	4d0a      	ldr	r5, [pc, #40]	; (8001018 <__libc_init_array+0x40>)
 8000ff0:	4c0a      	ldr	r4, [pc, #40]	; (800101c <__libc_init_array+0x44>)
 8000ff2:	1b64      	subs	r4, r4, r5
 8000ff4:	10a4      	asrs	r4, r4, #2
 8000ff6:	42a6      	cmp	r6, r4
 8000ff8:	d105      	bne.n	8001006 <__libc_init_array+0x2e>
 8000ffa:	bd70      	pop	{r4, r5, r6, pc}
 8000ffc:	00b3      	lsls	r3, r6, #2
 8000ffe:	58eb      	ldr	r3, [r5, r3]
 8001000:	4798      	blx	r3
 8001002:	3601      	adds	r6, #1
 8001004:	e7ee      	b.n	8000fe4 <__libc_init_array+0xc>
 8001006:	00b3      	lsls	r3, r6, #2
 8001008:	58eb      	ldr	r3, [r5, r3]
 800100a:	4798      	blx	r3
 800100c:	3601      	adds	r6, #1
 800100e:	e7f2      	b.n	8000ff6 <__libc_init_array+0x1e>
 8001010:	0800144c 	.word	0x0800144c
 8001014:	0800144c 	.word	0x0800144c
 8001018:	0800144c 	.word	0x0800144c
 800101c:	08001450 	.word	0x08001450

08001020 <free>:
 8001020:	b510      	push	{r4, lr}
 8001022:	4b03      	ldr	r3, [pc, #12]	; (8001030 <free+0x10>)
 8001024:	0001      	movs	r1, r0
 8001026:	6818      	ldr	r0, [r3, #0]
 8001028:	f000 f824 	bl	8001074 <_free_r>
 800102c:	bd10      	pop	{r4, pc}
 800102e:	46c0      	nop			; (mov r8, r8)
 8001030:	20000004 	.word	0x20000004

08001034 <memcpy>:
 8001034:	2300      	movs	r3, #0
 8001036:	b510      	push	{r4, lr}
 8001038:	429a      	cmp	r2, r3
 800103a:	d100      	bne.n	800103e <memcpy+0xa>
 800103c:	bd10      	pop	{r4, pc}
 800103e:	5ccc      	ldrb	r4, [r1, r3]
 8001040:	54c4      	strb	r4, [r0, r3]
 8001042:	3301      	adds	r3, #1
 8001044:	e7f8      	b.n	8001038 <memcpy+0x4>

08001046 <memset>:
 8001046:	0003      	movs	r3, r0
 8001048:	1812      	adds	r2, r2, r0
 800104a:	4293      	cmp	r3, r2
 800104c:	d100      	bne.n	8001050 <memset+0xa>
 800104e:	4770      	bx	lr
 8001050:	7019      	strb	r1, [r3, #0]
 8001052:	3301      	adds	r3, #1
 8001054:	e7f9      	b.n	800104a <memset+0x4>

08001056 <_calloc_r>:
 8001056:	434a      	muls	r2, r1
 8001058:	b570      	push	{r4, r5, r6, lr}
 800105a:	0011      	movs	r1, r2
 800105c:	0014      	movs	r4, r2
 800105e:	f000 f853 	bl	8001108 <_malloc_r>
 8001062:	1e05      	subs	r5, r0, #0
 8001064:	d003      	beq.n	800106e <_calloc_r+0x18>
 8001066:	0022      	movs	r2, r4
 8001068:	2100      	movs	r1, #0
 800106a:	f7ff ffec 	bl	8001046 <memset>
 800106e:	0028      	movs	r0, r5
 8001070:	bd70      	pop	{r4, r5, r6, pc}
	...

08001074 <_free_r>:
 8001074:	b570      	push	{r4, r5, r6, lr}
 8001076:	0005      	movs	r5, r0
 8001078:	2900      	cmp	r1, #0
 800107a:	d010      	beq.n	800109e <_free_r+0x2a>
 800107c:	1f0c      	subs	r4, r1, #4
 800107e:	6823      	ldr	r3, [r4, #0]
 8001080:	2b00      	cmp	r3, #0
 8001082:	da00      	bge.n	8001086 <_free_r+0x12>
 8001084:	18e4      	adds	r4, r4, r3
 8001086:	0028      	movs	r0, r5
 8001088:	f000 f8ae 	bl	80011e8 <__malloc_lock>
 800108c:	4a1d      	ldr	r2, [pc, #116]	; (8001104 <_free_r+0x90>)
 800108e:	6813      	ldr	r3, [r2, #0]
 8001090:	2b00      	cmp	r3, #0
 8001092:	d105      	bne.n	80010a0 <_free_r+0x2c>
 8001094:	6063      	str	r3, [r4, #4]
 8001096:	6014      	str	r4, [r2, #0]
 8001098:	0028      	movs	r0, r5
 800109a:	f000 f8a6 	bl	80011ea <__malloc_unlock>
 800109e:	bd70      	pop	{r4, r5, r6, pc}
 80010a0:	42a3      	cmp	r3, r4
 80010a2:	d909      	bls.n	80010b8 <_free_r+0x44>
 80010a4:	6821      	ldr	r1, [r4, #0]
 80010a6:	1860      	adds	r0, r4, r1
 80010a8:	4283      	cmp	r3, r0
 80010aa:	d1f3      	bne.n	8001094 <_free_r+0x20>
 80010ac:	6818      	ldr	r0, [r3, #0]
 80010ae:	685b      	ldr	r3, [r3, #4]
 80010b0:	1841      	adds	r1, r0, r1
 80010b2:	6021      	str	r1, [r4, #0]
 80010b4:	e7ee      	b.n	8001094 <_free_r+0x20>
 80010b6:	0013      	movs	r3, r2
 80010b8:	685a      	ldr	r2, [r3, #4]
 80010ba:	2a00      	cmp	r2, #0
 80010bc:	d001      	beq.n	80010c2 <_free_r+0x4e>
 80010be:	42a2      	cmp	r2, r4
 80010c0:	d9f9      	bls.n	80010b6 <_free_r+0x42>
 80010c2:	6819      	ldr	r1, [r3, #0]
 80010c4:	1858      	adds	r0, r3, r1
 80010c6:	42a0      	cmp	r0, r4
 80010c8:	d10b      	bne.n	80010e2 <_free_r+0x6e>
 80010ca:	6820      	ldr	r0, [r4, #0]
 80010cc:	1809      	adds	r1, r1, r0
 80010ce:	1858      	adds	r0, r3, r1
 80010d0:	6019      	str	r1, [r3, #0]
 80010d2:	4282      	cmp	r2, r0
 80010d4:	d1e0      	bne.n	8001098 <_free_r+0x24>
 80010d6:	6810      	ldr	r0, [r2, #0]
 80010d8:	6852      	ldr	r2, [r2, #4]
 80010da:	1841      	adds	r1, r0, r1
 80010dc:	6019      	str	r1, [r3, #0]
 80010de:	605a      	str	r2, [r3, #4]
 80010e0:	e7da      	b.n	8001098 <_free_r+0x24>
 80010e2:	42a0      	cmp	r0, r4
 80010e4:	d902      	bls.n	80010ec <_free_r+0x78>
 80010e6:	230c      	movs	r3, #12
 80010e8:	602b      	str	r3, [r5, #0]
 80010ea:	e7d5      	b.n	8001098 <_free_r+0x24>
 80010ec:	6821      	ldr	r1, [r4, #0]
 80010ee:	1860      	adds	r0, r4, r1
 80010f0:	4282      	cmp	r2, r0
 80010f2:	d103      	bne.n	80010fc <_free_r+0x88>
 80010f4:	6810      	ldr	r0, [r2, #0]
 80010f6:	6852      	ldr	r2, [r2, #4]
 80010f8:	1841      	adds	r1, r0, r1
 80010fa:	6021      	str	r1, [r4, #0]
 80010fc:	6062      	str	r2, [r4, #4]
 80010fe:	605c      	str	r4, [r3, #4]
 8001100:	e7ca      	b.n	8001098 <_free_r+0x24>
 8001102:	46c0      	nop			; (mov r8, r8)
 8001104:	20000084 	.word	0x20000084

08001108 <_malloc_r>:
 8001108:	2303      	movs	r3, #3
 800110a:	b570      	push	{r4, r5, r6, lr}
 800110c:	1ccd      	adds	r5, r1, #3
 800110e:	439d      	bics	r5, r3
 8001110:	3508      	adds	r5, #8
 8001112:	0006      	movs	r6, r0
 8001114:	2d0c      	cmp	r5, #12
 8001116:	d21e      	bcs.n	8001156 <_malloc_r+0x4e>
 8001118:	250c      	movs	r5, #12
 800111a:	42a9      	cmp	r1, r5
 800111c:	d81d      	bhi.n	800115a <_malloc_r+0x52>
 800111e:	0030      	movs	r0, r6
 8001120:	f000 f862 	bl	80011e8 <__malloc_lock>
 8001124:	4a25      	ldr	r2, [pc, #148]	; (80011bc <_malloc_r+0xb4>)
 8001126:	6814      	ldr	r4, [r2, #0]
 8001128:	0021      	movs	r1, r4
 800112a:	2900      	cmp	r1, #0
 800112c:	d119      	bne.n	8001162 <_malloc_r+0x5a>
 800112e:	4c24      	ldr	r4, [pc, #144]	; (80011c0 <_malloc_r+0xb8>)
 8001130:	6823      	ldr	r3, [r4, #0]
 8001132:	2b00      	cmp	r3, #0
 8001134:	d103      	bne.n	800113e <_malloc_r+0x36>
 8001136:	0030      	movs	r0, r6
 8001138:	f000 f844 	bl	80011c4 <_sbrk_r>
 800113c:	6020      	str	r0, [r4, #0]
 800113e:	0029      	movs	r1, r5
 8001140:	0030      	movs	r0, r6
 8001142:	f000 f83f 	bl	80011c4 <_sbrk_r>
 8001146:	1c43      	adds	r3, r0, #1
 8001148:	d12b      	bne.n	80011a2 <_malloc_r+0x9a>
 800114a:	230c      	movs	r3, #12
 800114c:	0030      	movs	r0, r6
 800114e:	6033      	str	r3, [r6, #0]
 8001150:	f000 f84b 	bl	80011ea <__malloc_unlock>
 8001154:	e003      	b.n	800115e <_malloc_r+0x56>
 8001156:	2d00      	cmp	r5, #0
 8001158:	dadf      	bge.n	800111a <_malloc_r+0x12>
 800115a:	230c      	movs	r3, #12
 800115c:	6033      	str	r3, [r6, #0]
 800115e:	2000      	movs	r0, #0
 8001160:	bd70      	pop	{r4, r5, r6, pc}
 8001162:	680b      	ldr	r3, [r1, #0]
 8001164:	1b5b      	subs	r3, r3, r5
 8001166:	d419      	bmi.n	800119c <_malloc_r+0x94>
 8001168:	2b0b      	cmp	r3, #11
 800116a:	d903      	bls.n	8001174 <_malloc_r+0x6c>
 800116c:	600b      	str	r3, [r1, #0]
 800116e:	18cc      	adds	r4, r1, r3
 8001170:	6025      	str	r5, [r4, #0]
 8001172:	e003      	b.n	800117c <_malloc_r+0x74>
 8001174:	684b      	ldr	r3, [r1, #4]
 8001176:	428c      	cmp	r4, r1
 8001178:	d10d      	bne.n	8001196 <_malloc_r+0x8e>
 800117a:	6013      	str	r3, [r2, #0]
 800117c:	0030      	movs	r0, r6
 800117e:	f000 f834 	bl	80011ea <__malloc_unlock>
 8001182:	0020      	movs	r0, r4
 8001184:	2207      	movs	r2, #7
 8001186:	300b      	adds	r0, #11
 8001188:	1d23      	adds	r3, r4, #4
 800118a:	4390      	bics	r0, r2
 800118c:	1ac3      	subs	r3, r0, r3
 800118e:	d0e7      	beq.n	8001160 <_malloc_r+0x58>
 8001190:	425a      	negs	r2, r3
 8001192:	50e2      	str	r2, [r4, r3]
 8001194:	e7e4      	b.n	8001160 <_malloc_r+0x58>
 8001196:	6063      	str	r3, [r4, #4]
 8001198:	000c      	movs	r4, r1
 800119a:	e7ef      	b.n	800117c <_malloc_r+0x74>
 800119c:	000c      	movs	r4, r1
 800119e:	6849      	ldr	r1, [r1, #4]
 80011a0:	e7c3      	b.n	800112a <_malloc_r+0x22>
 80011a2:	2303      	movs	r3, #3
 80011a4:	1cc4      	adds	r4, r0, #3
 80011a6:	439c      	bics	r4, r3
 80011a8:	42a0      	cmp	r0, r4
 80011aa:	d0e1      	beq.n	8001170 <_malloc_r+0x68>
 80011ac:	1a21      	subs	r1, r4, r0
 80011ae:	0030      	movs	r0, r6
 80011b0:	f000 f808 	bl	80011c4 <_sbrk_r>
 80011b4:	1c43      	adds	r3, r0, #1
 80011b6:	d1db      	bne.n	8001170 <_malloc_r+0x68>
 80011b8:	e7c7      	b.n	800114a <_malloc_r+0x42>
 80011ba:	46c0      	nop			; (mov r8, r8)
 80011bc:	20000084 	.word	0x20000084
 80011c0:	20000088 	.word	0x20000088

080011c4 <_sbrk_r>:
 80011c4:	2300      	movs	r3, #0
 80011c6:	b570      	push	{r4, r5, r6, lr}
 80011c8:	4c06      	ldr	r4, [pc, #24]	; (80011e4 <_sbrk_r+0x20>)
 80011ca:	0005      	movs	r5, r0
 80011cc:	0008      	movs	r0, r1
 80011ce:	6023      	str	r3, [r4, #0]
 80011d0:	f000 f80c 	bl	80011ec <_sbrk>
 80011d4:	1c43      	adds	r3, r0, #1
 80011d6:	d103      	bne.n	80011e0 <_sbrk_r+0x1c>
 80011d8:	6823      	ldr	r3, [r4, #0]
 80011da:	2b00      	cmp	r3, #0
 80011dc:	d000      	beq.n	80011e0 <_sbrk_r+0x1c>
 80011de:	602b      	str	r3, [r5, #0]
 80011e0:	bd70      	pop	{r4, r5, r6, pc}
 80011e2:	46c0      	nop			; (mov r8, r8)
 80011e4:	20000090 	.word	0x20000090

080011e8 <__malloc_lock>:
 80011e8:	4770      	bx	lr

080011ea <__malloc_unlock>:
 80011ea:	4770      	bx	lr

080011ec <_sbrk>:
 80011ec:	4a04      	ldr	r2, [pc, #16]	; (8001200 <_sbrk+0x14>)
 80011ee:	6813      	ldr	r3, [r2, #0]
 80011f0:	2b00      	cmp	r3, #0
 80011f2:	d100      	bne.n	80011f6 <_sbrk+0xa>
 80011f4:	4b03      	ldr	r3, [pc, #12]	; (8001204 <_sbrk+0x18>)
 80011f6:	1818      	adds	r0, r3, r0
 80011f8:	6010      	str	r0, [r2, #0]
 80011fa:	0018      	movs	r0, r3
 80011fc:	4770      	bx	lr
 80011fe:	46c0      	nop			; (mov r8, r8)
 8001200:	2000008c 	.word	0x2000008c
 8001204:	20000098 	.word	0x20000098

08001208 <_init>:
 8001208:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800120a:	46c0      	nop			; (mov r8, r8)
 800120c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800120e:	bc08      	pop	{r3}
 8001210:	469e      	mov	lr, r3
 8001212:	4770      	bx	lr

08001214 <_fini>:
 8001214:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001216:	46c0      	nop			; (mov r8, r8)
 8001218:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800121a:	bc08      	pop	{r3}
 800121c:	469e      	mov	lr, r3
 800121e:	4770      	bx	lr
