
build/oled_display.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       000000c0  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             00000f4c  080000c0  080000c0  000100c0  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           00000500  0800100c  0800100c  0001100c  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000008  0800150c  0800150c  0001150c  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  08001514  08001514  00011514  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             0000043c  20000000  08001518  00020000  2**3  CONTENTS, ALLOC, LOAD, DATA
  6 .bss              0000044c  2000043c  08001954  0002043c  2**2  ALLOC
  7 ._user_heap_stack 00000600  20000888  08001954  00020888  2**0  ALLOC
  8 .ARM.attributes   00000028  00000000  00000000  0002043c  2**0  CONTENTS, READONLY
  9 .debug_info       00002559  00000000  00000000  00020464  2**0  CONTENTS, READONLY, DEBUGGING
 10 .debug_abbrev     000008eb  00000000  00000000  000229bd  2**0  CONTENTS, READONLY, DEBUGGING
 11 .debug_loc        00000e26  00000000  00000000  000232a8  2**0  CONTENTS, READONLY, DEBUGGING
 12 .debug_aranges    000002a8  00000000  00000000  000240ce  2**0  CONTENTS, READONLY, DEBUGGING
 13 .debug_ranges     00000248  00000000  00000000  00024376  2**0  CONTENTS, READONLY, DEBUGGING
 14 .debug_line       00000e2a  00000000  00000000  000245be  2**0  CONTENTS, READONLY, DEBUGGING
 15 .debug_str        00000c51  00000000  00000000  000253e8  2**0  CONTENTS, READONLY, DEBUGGING
 16 .comment          0000007f  00000000  00000000  00026039  2**0  CONTENTS, READONLY
 17 .debug_frame      00000a84  00000000  00000000  000260b8  2**2  CONTENTS, READONLY, DEBUGGING

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
 80000dc:	2000043c 	.word	0x2000043c
 80000e0:	00000000 	.word	0x00000000
 80000e4:	08000ff4 	.word	0x08000ff4

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
 8000100:	20000440 	.word	0x20000440
 8000104:	08000ff4 	.word	0x08000ff4

08000108 <Reset_Handler>:
 8000108:	480d      	ldr	r0, [pc, #52]	; (8000140 <LoopForever+0x2>)
 800010a:	4685      	mov	sp, r0
 800010c:	480d      	ldr	r0, [pc, #52]	; (8000144 <LoopForever+0x6>)
 800010e:	490e      	ldr	r1, [pc, #56]	; (8000148 <LoopForever+0xa>)
 8000110:	4a0e      	ldr	r2, [pc, #56]	; (800014c <LoopForever+0xe>)
 8000112:	2300      	movs	r3, #0
 8000114:	e002      	b.n	800011c <LoopCopyDataInit>

08000116 <CopyDataInit>:
 8000116:	58d4      	ldr	r4, [r2, r3]
 8000118:	50c4      	str	r4, [r0, r3]
 800011a:	3304      	adds	r3, #4

0800011c <LoopCopyDataInit>:
 800011c:	18c4      	adds	r4, r0, r3
 800011e:	428c      	cmp	r4, r1
 8000120:	d3f9      	bcc.n	8000116 <CopyDataInit>
 8000122:	4a0b      	ldr	r2, [pc, #44]	; (8000150 <LoopForever+0x12>)
 8000124:	4c0b      	ldr	r4, [pc, #44]	; (8000154 <LoopForever+0x16>)
 8000126:	2300      	movs	r3, #0
 8000128:	e001      	b.n	800012e <LoopFillZerobss>

0800012a <FillZerobss>:
 800012a:	6013      	str	r3, [r2, #0]
 800012c:	3204      	adds	r2, #4

0800012e <LoopFillZerobss>:
 800012e:	42a2      	cmp	r2, r4
 8000130:	d3fb      	bcc.n	800012a <FillZerobss>
 8000132:	f000 f9c7 	bl	80004c4 <SystemInit>
 8000136:	f000 fe3f 	bl	8000db8 <__libc_init_array>
 800013a:	f000 f998 	bl	800046e <main>

0800013e <LoopForever>:
 800013e:	e7fe      	b.n	800013e <LoopForever>
 8000140:	20002000 	.word	0x20002000
 8000144:	20000000 	.word	0x20000000
 8000148:	2000043c 	.word	0x2000043c
 800014c:	08001518 	.word	0x08001518
 8000150:	2000043c 	.word	0x2000043c
 8000154:	20000888 	.word	0x20000888

08000158 <ADC1_COMP_IRQHandler>:
 8000158:	e7fe      	b.n	8000158 <ADC1_COMP_IRQHandler>
	...

0800015c <LL_RCC_HSI_Enable>:
 800015c:	b580      	push	{r7, lr}
 800015e:	af00      	add	r7, sp, #0
 8000160:	4b04      	ldr	r3, [pc, #16]	; (8000174 <LL_RCC_HSI_Enable+0x18>)
 8000162:	681a      	ldr	r2, [r3, #0]
 8000164:	4b03      	ldr	r3, [pc, #12]	; (8000174 <LL_RCC_HSI_Enable+0x18>)
 8000166:	2101      	movs	r1, #1
 8000168:	430a      	orrs	r2, r1
 800016a:	601a      	str	r2, [r3, #0]
 800016c:	46c0      	nop			; (mov r8, r8)
 800016e:	46bd      	mov	sp, r7
 8000170:	bd80      	pop	{r7, pc}
 8000172:	46c0      	nop			; (mov r8, r8)
 8000174:	40021000 	.word	0x40021000

08000178 <LL_RCC_HSI_IsReady>:
 8000178:	b580      	push	{r7, lr}
 800017a:	af00      	add	r7, sp, #0
 800017c:	4b05      	ldr	r3, [pc, #20]	; (8000194 <LL_RCC_HSI_IsReady+0x1c>)
 800017e:	681b      	ldr	r3, [r3, #0]
 8000180:	2202      	movs	r2, #2
 8000182:	4013      	ands	r3, r2
 8000184:	3b02      	subs	r3, #2
 8000186:	425a      	negs	r2, r3
 8000188:	4153      	adcs	r3, r2
 800018a:	b2db      	uxtb	r3, r3
 800018c:	0018      	movs	r0, r3
 800018e:	46bd      	mov	sp, r7
 8000190:	bd80      	pop	{r7, pc}
 8000192:	46c0      	nop			; (mov r8, r8)
 8000194:	40021000 	.word	0x40021000

08000198 <LL_RCC_SetSysClkSource>:
 8000198:	b580      	push	{r7, lr}
 800019a:	b082      	sub	sp, #8
 800019c:	af00      	add	r7, sp, #0
 800019e:	6078      	str	r0, [r7, #4]
 80001a0:	4b06      	ldr	r3, [pc, #24]	; (80001bc <LL_RCC_SetSysClkSource+0x24>)
 80001a2:	685b      	ldr	r3, [r3, #4]
 80001a4:	2203      	movs	r2, #3
 80001a6:	4393      	bics	r3, r2
 80001a8:	0019      	movs	r1, r3
 80001aa:	4b04      	ldr	r3, [pc, #16]	; (80001bc <LL_RCC_SetSysClkSource+0x24>)
 80001ac:	687a      	ldr	r2, [r7, #4]
 80001ae:	430a      	orrs	r2, r1
 80001b0:	605a      	str	r2, [r3, #4]
 80001b2:	46c0      	nop			; (mov r8, r8)
 80001b4:	46bd      	mov	sp, r7
 80001b6:	b002      	add	sp, #8
 80001b8:	bd80      	pop	{r7, pc}
 80001ba:	46c0      	nop			; (mov r8, r8)
 80001bc:	40021000 	.word	0x40021000

080001c0 <LL_RCC_GetSysClkSource>:
 80001c0:	b580      	push	{r7, lr}
 80001c2:	af00      	add	r7, sp, #0
 80001c4:	4b03      	ldr	r3, [pc, #12]	; (80001d4 <LL_RCC_GetSysClkSource+0x14>)
 80001c6:	685b      	ldr	r3, [r3, #4]
 80001c8:	220c      	movs	r2, #12
 80001ca:	4013      	ands	r3, r2
 80001cc:	0018      	movs	r0, r3
 80001ce:	46bd      	mov	sp, r7
 80001d0:	bd80      	pop	{r7, pc}
 80001d2:	46c0      	nop			; (mov r8, r8)
 80001d4:	40021000 	.word	0x40021000

080001d8 <LL_RCC_SetAHBPrescaler>:
 80001d8:	b580      	push	{r7, lr}
 80001da:	b082      	sub	sp, #8
 80001dc:	af00      	add	r7, sp, #0
 80001de:	6078      	str	r0, [r7, #4]
 80001e0:	4b06      	ldr	r3, [pc, #24]	; (80001fc <LL_RCC_SetAHBPrescaler+0x24>)
 80001e2:	685b      	ldr	r3, [r3, #4]
 80001e4:	22f0      	movs	r2, #240	; 0xf0
 80001e6:	4393      	bics	r3, r2
 80001e8:	0019      	movs	r1, r3
 80001ea:	4b04      	ldr	r3, [pc, #16]	; (80001fc <LL_RCC_SetAHBPrescaler+0x24>)
 80001ec:	687a      	ldr	r2, [r7, #4]
 80001ee:	430a      	orrs	r2, r1
 80001f0:	605a      	str	r2, [r3, #4]
 80001f2:	46c0      	nop			; (mov r8, r8)
 80001f4:	46bd      	mov	sp, r7
 80001f6:	b002      	add	sp, #8
 80001f8:	bd80      	pop	{r7, pc}
 80001fa:	46c0      	nop			; (mov r8, r8)
 80001fc:	40021000 	.word	0x40021000

08000200 <LL_RCC_SetAPB1Prescaler>:
 8000200:	b580      	push	{r7, lr}
 8000202:	b082      	sub	sp, #8
 8000204:	af00      	add	r7, sp, #0
 8000206:	6078      	str	r0, [r7, #4]
 8000208:	4b06      	ldr	r3, [pc, #24]	; (8000224 <LL_RCC_SetAPB1Prescaler+0x24>)
 800020a:	685b      	ldr	r3, [r3, #4]
 800020c:	4a06      	ldr	r2, [pc, #24]	; (8000228 <LL_RCC_SetAPB1Prescaler+0x28>)
 800020e:	4013      	ands	r3, r2
 8000210:	0019      	movs	r1, r3
 8000212:	4b04      	ldr	r3, [pc, #16]	; (8000224 <LL_RCC_SetAPB1Prescaler+0x24>)
 8000214:	687a      	ldr	r2, [r7, #4]
 8000216:	430a      	orrs	r2, r1
 8000218:	605a      	str	r2, [r3, #4]
 800021a:	46c0      	nop			; (mov r8, r8)
 800021c:	46bd      	mov	sp, r7
 800021e:	b002      	add	sp, #8
 8000220:	bd80      	pop	{r7, pc}
 8000222:	46c0      	nop			; (mov r8, r8)
 8000224:	40021000 	.word	0x40021000
 8000228:	fffff8ff 	.word	0xfffff8ff

0800022c <LL_RCC_PLL_Enable>:
 800022c:	b580      	push	{r7, lr}
 800022e:	af00      	add	r7, sp, #0
 8000230:	4b04      	ldr	r3, [pc, #16]	; (8000244 <LL_RCC_PLL_Enable+0x18>)
 8000232:	681a      	ldr	r2, [r3, #0]
 8000234:	4b03      	ldr	r3, [pc, #12]	; (8000244 <LL_RCC_PLL_Enable+0x18>)
 8000236:	2180      	movs	r1, #128	; 0x80
 8000238:	0449      	lsls	r1, r1, #17
 800023a:	430a      	orrs	r2, r1
 800023c:	601a      	str	r2, [r3, #0]
 800023e:	46c0      	nop			; (mov r8, r8)
 8000240:	46bd      	mov	sp, r7
 8000242:	bd80      	pop	{r7, pc}
 8000244:	40021000 	.word	0x40021000

08000248 <LL_RCC_PLL_IsReady>:
 8000248:	b580      	push	{r7, lr}
 800024a:	af00      	add	r7, sp, #0
 800024c:	4b07      	ldr	r3, [pc, #28]	; (800026c <LL_RCC_PLL_IsReady+0x24>)
 800024e:	681a      	ldr	r2, [r3, #0]
 8000250:	2380      	movs	r3, #128	; 0x80
 8000252:	049b      	lsls	r3, r3, #18
 8000254:	4013      	ands	r3, r2
 8000256:	22fe      	movs	r2, #254	; 0xfe
 8000258:	0612      	lsls	r2, r2, #24
 800025a:	4694      	mov	ip, r2
 800025c:	4463      	add	r3, ip
 800025e:	425a      	negs	r2, r3
 8000260:	4153      	adcs	r3, r2
 8000262:	b2db      	uxtb	r3, r3
 8000264:	0018      	movs	r0, r3
 8000266:	46bd      	mov	sp, r7
 8000268:	bd80      	pop	{r7, pc}
 800026a:	46c0      	nop			; (mov r8, r8)
 800026c:	40021000 	.word	0x40021000

08000270 <LL_RCC_PLL_ConfigDomain_SYS>:
 8000270:	b580      	push	{r7, lr}
 8000272:	b082      	sub	sp, #8
 8000274:	af00      	add	r7, sp, #0
 8000276:	6078      	str	r0, [r7, #4]
 8000278:	6039      	str	r1, [r7, #0]
 800027a:	4b0e      	ldr	r3, [pc, #56]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 800027c:	685b      	ldr	r3, [r3, #4]
 800027e:	4a0e      	ldr	r2, [pc, #56]	; (80002b8 <LL_RCC_PLL_ConfigDomain_SYS+0x48>)
 8000280:	4013      	ands	r3, r2
 8000282:	0019      	movs	r1, r3
 8000284:	687a      	ldr	r2, [r7, #4]
 8000286:	2380      	movs	r3, #128	; 0x80
 8000288:	025b      	lsls	r3, r3, #9
 800028a:	401a      	ands	r2, r3
 800028c:	683b      	ldr	r3, [r7, #0]
 800028e:	431a      	orrs	r2, r3
 8000290:	4b08      	ldr	r3, [pc, #32]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000292:	430a      	orrs	r2, r1
 8000294:	605a      	str	r2, [r3, #4]
 8000296:	4b07      	ldr	r3, [pc, #28]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000298:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 800029a:	220f      	movs	r2, #15
 800029c:	4393      	bics	r3, r2
 800029e:	0019      	movs	r1, r3
 80002a0:	687b      	ldr	r3, [r7, #4]
 80002a2:	220f      	movs	r2, #15
 80002a4:	401a      	ands	r2, r3
 80002a6:	4b03      	ldr	r3, [pc, #12]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80002a8:	430a      	orrs	r2, r1
 80002aa:	62da      	str	r2, [r3, #44]	; 0x2c
 80002ac:	46c0      	nop			; (mov r8, r8)
 80002ae:	46bd      	mov	sp, r7
 80002b0:	b002      	add	sp, #8
 80002b2:	bd80      	pop	{r7, pc}
 80002b4:	40021000 	.word	0x40021000
 80002b8:	ffc2ffff 	.word	0xffc2ffff

080002bc <LL_FLASH_SetLatency>:
 80002bc:	b580      	push	{r7, lr}
 80002be:	b082      	sub	sp, #8
 80002c0:	af00      	add	r7, sp, #0
 80002c2:	6078      	str	r0, [r7, #4]
 80002c4:	4b06      	ldr	r3, [pc, #24]	; (80002e0 <LL_FLASH_SetLatency+0x24>)
 80002c6:	681b      	ldr	r3, [r3, #0]
 80002c8:	2201      	movs	r2, #1
 80002ca:	4393      	bics	r3, r2
 80002cc:	0019      	movs	r1, r3
 80002ce:	4b04      	ldr	r3, [pc, #16]	; (80002e0 <LL_FLASH_SetLatency+0x24>)
 80002d0:	687a      	ldr	r2, [r7, #4]
 80002d2:	430a      	orrs	r2, r1
 80002d4:	601a      	str	r2, [r3, #0]
 80002d6:	46c0      	nop			; (mov r8, r8)
 80002d8:	46bd      	mov	sp, r7
 80002da:	b002      	add	sp, #8
 80002dc:	bd80      	pop	{r7, pc}
 80002de:	46c0      	nop			; (mov r8, r8)
 80002e0:	40022000 	.word	0x40022000

080002e4 <LL_AHB1_GRP1_EnableClock>:
 80002e4:	b580      	push	{r7, lr}
 80002e6:	b084      	sub	sp, #16
 80002e8:	af00      	add	r7, sp, #0
 80002ea:	6078      	str	r0, [r7, #4]
 80002ec:	4b07      	ldr	r3, [pc, #28]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002ee:	6959      	ldr	r1, [r3, #20]
 80002f0:	4b06      	ldr	r3, [pc, #24]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002f2:	687a      	ldr	r2, [r7, #4]
 80002f4:	430a      	orrs	r2, r1
 80002f6:	615a      	str	r2, [r3, #20]
 80002f8:	4b04      	ldr	r3, [pc, #16]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002fa:	695b      	ldr	r3, [r3, #20]
 80002fc:	687a      	ldr	r2, [r7, #4]
 80002fe:	4013      	ands	r3, r2
 8000300:	60fb      	str	r3, [r7, #12]
 8000302:	68fb      	ldr	r3, [r7, #12]
 8000304:	46c0      	nop			; (mov r8, r8)
 8000306:	46bd      	mov	sp, r7
 8000308:	b004      	add	sp, #16
 800030a:	bd80      	pop	{r7, pc}
 800030c:	40021000 	.word	0x40021000

08000310 <LL_GPIO_SetPinMode>:
 8000310:	b580      	push	{r7, lr}
 8000312:	b084      	sub	sp, #16
 8000314:	af00      	add	r7, sp, #0
 8000316:	60f8      	str	r0, [r7, #12]
 8000318:	60b9      	str	r1, [r7, #8]
 800031a:	607a      	str	r2, [r7, #4]
 800031c:	68fb      	ldr	r3, [r7, #12]
 800031e:	6819      	ldr	r1, [r3, #0]
 8000320:	68bb      	ldr	r3, [r7, #8]
 8000322:	68ba      	ldr	r2, [r7, #8]
 8000324:	435a      	muls	r2, r3
 8000326:	0013      	movs	r3, r2
 8000328:	005b      	lsls	r3, r3, #1
 800032a:	189b      	adds	r3, r3, r2
 800032c:	43db      	mvns	r3, r3
 800032e:	400b      	ands	r3, r1
 8000330:	001a      	movs	r2, r3
 8000332:	68bb      	ldr	r3, [r7, #8]
 8000334:	68b9      	ldr	r1, [r7, #8]
 8000336:	434b      	muls	r3, r1
 8000338:	6879      	ldr	r1, [r7, #4]
 800033a:	434b      	muls	r3, r1
 800033c:	431a      	orrs	r2, r3
 800033e:	68fb      	ldr	r3, [r7, #12]
 8000340:	601a      	str	r2, [r3, #0]
 8000342:	46c0      	nop			; (mov r8, r8)
 8000344:	46bd      	mov	sp, r7
 8000346:	b004      	add	sp, #16
 8000348:	bd80      	pop	{r7, pc}
	...

0800034c <rcc_config>:
 800034c:	b580      	push	{r7, lr}
 800034e:	af00      	add	r7, sp, #0
 8000350:	2001      	movs	r0, #1
 8000352:	f7ff ffb3 	bl	80002bc <LL_FLASH_SetLatency>
 8000356:	f7ff ff01 	bl	800015c <LL_RCC_HSI_Enable>
 800035a:	46c0      	nop			; (mov r8, r8)
 800035c:	f7ff ff0c 	bl	8000178 <LL_RCC_HSI_IsReady>
 8000360:	0003      	movs	r3, r0
 8000362:	2b01      	cmp	r3, #1
 8000364:	d1fa      	bne.n	800035c <rcc_config+0x10>
 8000366:	23a0      	movs	r3, #160	; 0xa0
 8000368:	039b      	lsls	r3, r3, #14
 800036a:	0019      	movs	r1, r3
 800036c:	2000      	movs	r0, #0
 800036e:	f7ff ff7f 	bl	8000270 <LL_RCC_PLL_ConfigDomain_SYS>
 8000372:	f7ff ff5b 	bl	800022c <LL_RCC_PLL_Enable>
 8000376:	46c0      	nop			; (mov r8, r8)
 8000378:	f7ff ff66 	bl	8000248 <LL_RCC_PLL_IsReady>
 800037c:	0003      	movs	r3, r0
 800037e:	2b01      	cmp	r3, #1
 8000380:	d1fa      	bne.n	8000378 <rcc_config+0x2c>
 8000382:	2000      	movs	r0, #0
 8000384:	f7ff ff28 	bl	80001d8 <LL_RCC_SetAHBPrescaler>
 8000388:	2002      	movs	r0, #2
 800038a:	f7ff ff05 	bl	8000198 <LL_RCC_SetSysClkSource>
 800038e:	46c0      	nop			; (mov r8, r8)
 8000390:	f7ff ff16 	bl	80001c0 <LL_RCC_GetSysClkSource>
 8000394:	0003      	movs	r3, r0
 8000396:	2b08      	cmp	r3, #8
 8000398:	d1fa      	bne.n	8000390 <rcc_config+0x44>
 800039a:	2000      	movs	r0, #0
 800039c:	f7ff ff30 	bl	8000200 <LL_RCC_SetAPB1Prescaler>
 80003a0:	4b02      	ldr	r3, [pc, #8]	; (80003ac <rcc_config+0x60>)
 80003a2:	4a03      	ldr	r2, [pc, #12]	; (80003b0 <rcc_config+0x64>)
 80003a4:	601a      	str	r2, [r3, #0]
 80003a6:	46c0      	nop			; (mov r8, r8)
 80003a8:	46bd      	mov	sp, r7
 80003aa:	bd80      	pop	{r7, pc}
 80003ac:	20000000 	.word	0x20000000
 80003b0:	02dc6c00 	.word	0x02dc6c00

080003b4 <gpio_config>:
 80003b4:	b580      	push	{r7, lr}
 80003b6:	af00      	add	r7, sp, #0
 80003b8:	2380      	movs	r3, #128	; 0x80
 80003ba:	031b      	lsls	r3, r3, #12
 80003bc:	0018      	movs	r0, r3
 80003be:	f7ff ff91 	bl	80002e4 <LL_AHB1_GRP1_EnableClock>
 80003c2:	2380      	movs	r3, #128	; 0x80
 80003c4:	005b      	lsls	r3, r3, #1
 80003c6:	4807      	ldr	r0, [pc, #28]	; (80003e4 <gpio_config+0x30>)
 80003c8:	2201      	movs	r2, #1
 80003ca:	0019      	movs	r1, r3
 80003cc:	f7ff ffa0 	bl	8000310 <LL_GPIO_SetPinMode>
 80003d0:	2380      	movs	r3, #128	; 0x80
 80003d2:	009b      	lsls	r3, r3, #2
 80003d4:	4803      	ldr	r0, [pc, #12]	; (80003e4 <gpio_config+0x30>)
 80003d6:	2201      	movs	r2, #1
 80003d8:	0019      	movs	r1, r3
 80003da:	f7ff ff99 	bl	8000310 <LL_GPIO_SetPinMode>
 80003de:	46c0      	nop			; (mov r8, r8)
 80003e0:	46bd      	mov	sp, r7
 80003e2:	bd80      	pop	{r7, pc}
 80003e4:	48000800 	.word	0x48000800

080003e8 <printf_config>:
 80003e8:	b580      	push	{r7, lr}
 80003ea:	af00      	add	r7, sp, #0
 80003ec:	4b02      	ldr	r3, [pc, #8]	; (80003f8 <printf_config+0x10>)
 80003ee:	4a03      	ldr	r2, [pc, #12]	; (80003fc <printf_config+0x14>)
 80003f0:	601a      	str	r2, [r3, #0]
 80003f2:	46c0      	nop			; (mov r8, r8)
 80003f4:	46bd      	mov	sp, r7
 80003f6:	bd80      	pop	{r7, pc}
 80003f8:	20000860 	.word	0x20000860
 80003fc:	08000c49 	.word	0x08000c49

08000400 <drawRect>:
 8000400:	b580      	push	{r7, lr}
 8000402:	b084      	sub	sp, #16
 8000404:	af00      	add	r7, sp, #0
 8000406:	6078      	str	r0, [r7, #4]
 8000408:	2300      	movs	r3, #0
 800040a:	60fb      	str	r3, [r7, #12]
 800040c:	e021      	b.n	8000452 <drawRect+0x52>
 800040e:	2300      	movs	r3, #0
 8000410:	60bb      	str	r3, [r7, #8]
 8000412:	e012      	b.n	800043a <drawRect+0x3a>
 8000414:	687b      	ldr	r3, [r7, #4]
 8000416:	781a      	ldrb	r2, [r3, #0]
 8000418:	68fb      	ldr	r3, [r7, #12]
 800041a:	b2db      	uxtb	r3, r3
 800041c:	18d3      	adds	r3, r2, r3
 800041e:	b2d8      	uxtb	r0, r3
 8000420:	687b      	ldr	r3, [r7, #4]
 8000422:	785a      	ldrb	r2, [r3, #1]
 8000424:	68bb      	ldr	r3, [r7, #8]
 8000426:	b2db      	uxtb	r3, r3
 8000428:	18d3      	adds	r3, r2, r3
 800042a:	b2db      	uxtb	r3, r3
 800042c:	22ff      	movs	r2, #255	; 0xff
 800042e:	0019      	movs	r1, r3
 8000430:	f000 fba6 	bl	8000b80 <oled_set_pix>
 8000434:	68bb      	ldr	r3, [r7, #8]
 8000436:	3301      	adds	r3, #1
 8000438:	60bb      	str	r3, [r7, #8]
 800043a:	687b      	ldr	r3, [r7, #4]
 800043c:	78db      	ldrb	r3, [r3, #3]
 800043e:	001a      	movs	r2, r3
 8000440:	687b      	ldr	r3, [r7, #4]
 8000442:	785b      	ldrb	r3, [r3, #1]
 8000444:	1ad3      	subs	r3, r2, r3
 8000446:	68ba      	ldr	r2, [r7, #8]
 8000448:	429a      	cmp	r2, r3
 800044a:	dbe3      	blt.n	8000414 <drawRect+0x14>
 800044c:	68fb      	ldr	r3, [r7, #12]
 800044e:	3301      	adds	r3, #1
 8000450:	60fb      	str	r3, [r7, #12]
 8000452:	687b      	ldr	r3, [r7, #4]
 8000454:	789b      	ldrb	r3, [r3, #2]
 8000456:	001a      	movs	r2, r3
 8000458:	687b      	ldr	r3, [r7, #4]
 800045a:	781b      	ldrb	r3, [r3, #0]
 800045c:	1ad3      	subs	r3, r2, r3
 800045e:	68fa      	ldr	r2, [r7, #12]
 8000460:	429a      	cmp	r2, r3
 8000462:	dbd4      	blt.n	800040e <drawRect+0xe>
 8000464:	2300      	movs	r3, #0
 8000466:	0018      	movs	r0, r3
 8000468:	46bd      	mov	sp, r7
 800046a:	b004      	add	sp, #16
 800046c:	bd80      	pop	{r7, pc}

0800046e <main>:
 800046e:	b580      	push	{r7, lr}
 8000470:	b082      	sub	sp, #8
 8000472:	af00      	add	r7, sp, #0
 8000474:	f7ff ff6a 	bl	800034c <rcc_config>
 8000478:	f7ff ff9c 	bl	80003b4 <gpio_config>
 800047c:	f000 fb28 	bl	8000ad0 <oled_config>
 8000480:	f7ff ffb2 	bl	80003e8 <printf_config>
 8000484:	1d3b      	adds	r3, r7, #4
 8000486:	2200      	movs	r2, #0
 8000488:	601a      	str	r2, [r3, #0]
 800048a:	1d3b      	adds	r3, r7, #4
 800048c:	220a      	movs	r2, #10
 800048e:	701a      	strb	r2, [r3, #0]
 8000490:	1d3b      	adds	r3, r7, #4
 8000492:	220a      	movs	r2, #10
 8000494:	705a      	strb	r2, [r3, #1]
 8000496:	1d3b      	adds	r3, r7, #4
 8000498:	2214      	movs	r2, #20
 800049a:	709a      	strb	r2, [r3, #2]
 800049c:	1d3b      	adds	r3, r7, #4
 800049e:	2214      	movs	r2, #20
 80004a0:	70da      	strb	r2, [r3, #3]
 80004a2:	1d3b      	adds	r3, r7, #4
 80004a4:	0018      	movs	r0, r3
 80004a6:	f7ff ffab 	bl	8000400 <drawRect>
 80004aa:	1d3b      	adds	r3, r7, #4
 80004ac:	2264      	movs	r2, #100	; 0x64
 80004ae:	709a      	strb	r2, [r3, #2]
 80004b0:	1d3b      	adds	r3, r7, #4
 80004b2:	221e      	movs	r2, #30
 80004b4:	70da      	strb	r2, [r3, #3]
 80004b6:	1d3b      	adds	r3, r7, #4
 80004b8:	0018      	movs	r0, r3
 80004ba:	f7ff ffa1 	bl	8000400 <drawRect>
 80004be:	f000 fadb 	bl	8000a78 <oled_update>
 80004c2:	e7fe      	b.n	80004c2 <main+0x54>

080004c4 <SystemInit>:
 80004c4:	b580      	push	{r7, lr}
 80004c6:	af00      	add	r7, sp, #0
 80004c8:	4b1a      	ldr	r3, [pc, #104]	; (8000534 <SystemInit+0x70>)
 80004ca:	681a      	ldr	r2, [r3, #0]
 80004cc:	4b19      	ldr	r3, [pc, #100]	; (8000534 <SystemInit+0x70>)
 80004ce:	2101      	movs	r1, #1
 80004d0:	430a      	orrs	r2, r1
 80004d2:	601a      	str	r2, [r3, #0]
 80004d4:	4b17      	ldr	r3, [pc, #92]	; (8000534 <SystemInit+0x70>)
 80004d6:	685a      	ldr	r2, [r3, #4]
 80004d8:	4b16      	ldr	r3, [pc, #88]	; (8000534 <SystemInit+0x70>)
 80004da:	4917      	ldr	r1, [pc, #92]	; (8000538 <SystemInit+0x74>)
 80004dc:	400a      	ands	r2, r1
 80004de:	605a      	str	r2, [r3, #4]
 80004e0:	4b14      	ldr	r3, [pc, #80]	; (8000534 <SystemInit+0x70>)
 80004e2:	681a      	ldr	r2, [r3, #0]
 80004e4:	4b13      	ldr	r3, [pc, #76]	; (8000534 <SystemInit+0x70>)
 80004e6:	4915      	ldr	r1, [pc, #84]	; (800053c <SystemInit+0x78>)
 80004e8:	400a      	ands	r2, r1
 80004ea:	601a      	str	r2, [r3, #0]
 80004ec:	4b11      	ldr	r3, [pc, #68]	; (8000534 <SystemInit+0x70>)
 80004ee:	681a      	ldr	r2, [r3, #0]
 80004f0:	4b10      	ldr	r3, [pc, #64]	; (8000534 <SystemInit+0x70>)
 80004f2:	4913      	ldr	r1, [pc, #76]	; (8000540 <SystemInit+0x7c>)
 80004f4:	400a      	ands	r2, r1
 80004f6:	601a      	str	r2, [r3, #0]
 80004f8:	4b0e      	ldr	r3, [pc, #56]	; (8000534 <SystemInit+0x70>)
 80004fa:	685a      	ldr	r2, [r3, #4]
 80004fc:	4b0d      	ldr	r3, [pc, #52]	; (8000534 <SystemInit+0x70>)
 80004fe:	4911      	ldr	r1, [pc, #68]	; (8000544 <SystemInit+0x80>)
 8000500:	400a      	ands	r2, r1
 8000502:	605a      	str	r2, [r3, #4]
 8000504:	4b0b      	ldr	r3, [pc, #44]	; (8000534 <SystemInit+0x70>)
 8000506:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8000508:	4b0a      	ldr	r3, [pc, #40]	; (8000534 <SystemInit+0x70>)
 800050a:	210f      	movs	r1, #15
 800050c:	438a      	bics	r2, r1
 800050e:	62da      	str	r2, [r3, #44]	; 0x2c
 8000510:	4b08      	ldr	r3, [pc, #32]	; (8000534 <SystemInit+0x70>)
 8000512:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000514:	4b07      	ldr	r3, [pc, #28]	; (8000534 <SystemInit+0x70>)
 8000516:	490c      	ldr	r1, [pc, #48]	; (8000548 <SystemInit+0x84>)
 8000518:	400a      	ands	r2, r1
 800051a:	631a      	str	r2, [r3, #48]	; 0x30
 800051c:	4b05      	ldr	r3, [pc, #20]	; (8000534 <SystemInit+0x70>)
 800051e:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8000520:	4b04      	ldr	r3, [pc, #16]	; (8000534 <SystemInit+0x70>)
 8000522:	2101      	movs	r1, #1
 8000524:	438a      	bics	r2, r1
 8000526:	635a      	str	r2, [r3, #52]	; 0x34
 8000528:	4b02      	ldr	r3, [pc, #8]	; (8000534 <SystemInit+0x70>)
 800052a:	2200      	movs	r2, #0
 800052c:	609a      	str	r2, [r3, #8]
 800052e:	46c0      	nop			; (mov r8, r8)
 8000530:	46bd      	mov	sp, r7
 8000532:	bd80      	pop	{r7, pc}
 8000534:	40021000 	.word	0x40021000
 8000538:	f8ffb80c 	.word	0xf8ffb80c
 800053c:	fef6ffff 	.word	0xfef6ffff
 8000540:	fffbffff 	.word	0xfffbffff
 8000544:	ffc0ffff 	.word	0xffc0ffff
 8000548:	fffffeac 	.word	0xfffffeac

0800054c <LL_AHB1_GRP1_EnableClock>:
 800054c:	b580      	push	{r7, lr}
 800054e:	b084      	sub	sp, #16
 8000550:	af00      	add	r7, sp, #0
 8000552:	6078      	str	r0, [r7, #4]
 8000554:	4b07      	ldr	r3, [pc, #28]	; (8000574 <LL_AHB1_GRP1_EnableClock+0x28>)
 8000556:	6959      	ldr	r1, [r3, #20]
 8000558:	4b06      	ldr	r3, [pc, #24]	; (8000574 <LL_AHB1_GRP1_EnableClock+0x28>)
 800055a:	687a      	ldr	r2, [r7, #4]
 800055c:	430a      	orrs	r2, r1
 800055e:	615a      	str	r2, [r3, #20]
 8000560:	4b04      	ldr	r3, [pc, #16]	; (8000574 <LL_AHB1_GRP1_EnableClock+0x28>)
 8000562:	695b      	ldr	r3, [r3, #20]
 8000564:	687a      	ldr	r2, [r7, #4]
 8000566:	4013      	ands	r3, r2
 8000568:	60fb      	str	r3, [r7, #12]
 800056a:	68fb      	ldr	r3, [r7, #12]
 800056c:	46c0      	nop			; (mov r8, r8)
 800056e:	46bd      	mov	sp, r7
 8000570:	b004      	add	sp, #16
 8000572:	bd80      	pop	{r7, pc}
 8000574:	40021000 	.word	0x40021000

08000578 <LL_APB1_GRP1_EnableClock>:
 8000578:	b580      	push	{r7, lr}
 800057a:	b084      	sub	sp, #16
 800057c:	af00      	add	r7, sp, #0
 800057e:	6078      	str	r0, [r7, #4]
 8000580:	4b07      	ldr	r3, [pc, #28]	; (80005a0 <LL_APB1_GRP1_EnableClock+0x28>)
 8000582:	69d9      	ldr	r1, [r3, #28]
 8000584:	4b06      	ldr	r3, [pc, #24]	; (80005a0 <LL_APB1_GRP1_EnableClock+0x28>)
 8000586:	687a      	ldr	r2, [r7, #4]
 8000588:	430a      	orrs	r2, r1
 800058a:	61da      	str	r2, [r3, #28]
 800058c:	4b04      	ldr	r3, [pc, #16]	; (80005a0 <LL_APB1_GRP1_EnableClock+0x28>)
 800058e:	69db      	ldr	r3, [r3, #28]
 8000590:	687a      	ldr	r2, [r7, #4]
 8000592:	4013      	ands	r3, r2
 8000594:	60fb      	str	r3, [r7, #12]
 8000596:	68fb      	ldr	r3, [r7, #12]
 8000598:	46c0      	nop			; (mov r8, r8)
 800059a:	46bd      	mov	sp, r7
 800059c:	b004      	add	sp, #16
 800059e:	bd80      	pop	{r7, pc}
 80005a0:	40021000 	.word	0x40021000

080005a4 <LL_GPIO_SetPinMode>:
 80005a4:	b580      	push	{r7, lr}
 80005a6:	b084      	sub	sp, #16
 80005a8:	af00      	add	r7, sp, #0
 80005aa:	60f8      	str	r0, [r7, #12]
 80005ac:	60b9      	str	r1, [r7, #8]
 80005ae:	607a      	str	r2, [r7, #4]
 80005b0:	68fb      	ldr	r3, [r7, #12]
 80005b2:	6819      	ldr	r1, [r3, #0]
 80005b4:	68bb      	ldr	r3, [r7, #8]
 80005b6:	68ba      	ldr	r2, [r7, #8]
 80005b8:	435a      	muls	r2, r3
 80005ba:	0013      	movs	r3, r2
 80005bc:	005b      	lsls	r3, r3, #1
 80005be:	189b      	adds	r3, r3, r2
 80005c0:	43db      	mvns	r3, r3
 80005c2:	400b      	ands	r3, r1
 80005c4:	001a      	movs	r2, r3
 80005c6:	68bb      	ldr	r3, [r7, #8]
 80005c8:	68b9      	ldr	r1, [r7, #8]
 80005ca:	434b      	muls	r3, r1
 80005cc:	6879      	ldr	r1, [r7, #4]
 80005ce:	434b      	muls	r3, r1
 80005d0:	431a      	orrs	r2, r3
 80005d2:	68fb      	ldr	r3, [r7, #12]
 80005d4:	601a      	str	r2, [r3, #0]
 80005d6:	46c0      	nop			; (mov r8, r8)
 80005d8:	46bd      	mov	sp, r7
 80005da:	b004      	add	sp, #16
 80005dc:	bd80      	pop	{r7, pc}

080005de <LL_GPIO_SetPinOutputType>:
 80005de:	b580      	push	{r7, lr}
 80005e0:	b084      	sub	sp, #16
 80005e2:	af00      	add	r7, sp, #0
 80005e4:	60f8      	str	r0, [r7, #12]
 80005e6:	60b9      	str	r1, [r7, #8]
 80005e8:	607a      	str	r2, [r7, #4]
 80005ea:	68fb      	ldr	r3, [r7, #12]
 80005ec:	685b      	ldr	r3, [r3, #4]
 80005ee:	68ba      	ldr	r2, [r7, #8]
 80005f0:	43d2      	mvns	r2, r2
 80005f2:	401a      	ands	r2, r3
 80005f4:	68bb      	ldr	r3, [r7, #8]
 80005f6:	6879      	ldr	r1, [r7, #4]
 80005f8:	434b      	muls	r3, r1
 80005fa:	431a      	orrs	r2, r3
 80005fc:	68fb      	ldr	r3, [r7, #12]
 80005fe:	605a      	str	r2, [r3, #4]
 8000600:	46c0      	nop			; (mov r8, r8)
 8000602:	46bd      	mov	sp, r7
 8000604:	b004      	add	sp, #16
 8000606:	bd80      	pop	{r7, pc}

08000608 <LL_GPIO_SetPinSpeed>:
 8000608:	b580      	push	{r7, lr}
 800060a:	b084      	sub	sp, #16
 800060c:	af00      	add	r7, sp, #0
 800060e:	60f8      	str	r0, [r7, #12]
 8000610:	60b9      	str	r1, [r7, #8]
 8000612:	607a      	str	r2, [r7, #4]
 8000614:	68fb      	ldr	r3, [r7, #12]
 8000616:	6899      	ldr	r1, [r3, #8]
 8000618:	68bb      	ldr	r3, [r7, #8]
 800061a:	68ba      	ldr	r2, [r7, #8]
 800061c:	435a      	muls	r2, r3
 800061e:	0013      	movs	r3, r2
 8000620:	005b      	lsls	r3, r3, #1
 8000622:	189b      	adds	r3, r3, r2
 8000624:	43db      	mvns	r3, r3
 8000626:	400b      	ands	r3, r1
 8000628:	001a      	movs	r2, r3
 800062a:	68bb      	ldr	r3, [r7, #8]
 800062c:	68b9      	ldr	r1, [r7, #8]
 800062e:	434b      	muls	r3, r1
 8000630:	6879      	ldr	r1, [r7, #4]
 8000632:	434b      	muls	r3, r1
 8000634:	431a      	orrs	r2, r3
 8000636:	68fb      	ldr	r3, [r7, #12]
 8000638:	609a      	str	r2, [r3, #8]
 800063a:	46c0      	nop			; (mov r8, r8)
 800063c:	46bd      	mov	sp, r7
 800063e:	b004      	add	sp, #16
 8000640:	bd80      	pop	{r7, pc}

08000642 <LL_GPIO_SetAFPin_0_7>:
 8000642:	b580      	push	{r7, lr}
 8000644:	b084      	sub	sp, #16
 8000646:	af00      	add	r7, sp, #0
 8000648:	60f8      	str	r0, [r7, #12]
 800064a:	60b9      	str	r1, [r7, #8]
 800064c:	607a      	str	r2, [r7, #4]
 800064e:	68fb      	ldr	r3, [r7, #12]
 8000650:	6a19      	ldr	r1, [r3, #32]
 8000652:	68bb      	ldr	r3, [r7, #8]
 8000654:	68ba      	ldr	r2, [r7, #8]
 8000656:	4353      	muls	r3, r2
 8000658:	68ba      	ldr	r2, [r7, #8]
 800065a:	4353      	muls	r3, r2
 800065c:	68ba      	ldr	r2, [r7, #8]
 800065e:	435a      	muls	r2, r3
 8000660:	0013      	movs	r3, r2
 8000662:	011b      	lsls	r3, r3, #4
 8000664:	1a9b      	subs	r3, r3, r2
 8000666:	43db      	mvns	r3, r3
 8000668:	400b      	ands	r3, r1
 800066a:	001a      	movs	r2, r3
 800066c:	68bb      	ldr	r3, [r7, #8]
 800066e:	68b9      	ldr	r1, [r7, #8]
 8000670:	434b      	muls	r3, r1
 8000672:	68b9      	ldr	r1, [r7, #8]
 8000674:	434b      	muls	r3, r1
 8000676:	68b9      	ldr	r1, [r7, #8]
 8000678:	434b      	muls	r3, r1
 800067a:	6879      	ldr	r1, [r7, #4]
 800067c:	434b      	muls	r3, r1
 800067e:	431a      	orrs	r2, r3
 8000680:	68fb      	ldr	r3, [r7, #12]
 8000682:	621a      	str	r2, [r3, #32]
 8000684:	46c0      	nop			; (mov r8, r8)
 8000686:	46bd      	mov	sp, r7
 8000688:	b004      	add	sp, #16
 800068a:	bd80      	pop	{r7, pc}

0800068c <LL_RCC_SetI2CClockSource>:
 800068c:	b580      	push	{r7, lr}
 800068e:	b082      	sub	sp, #8
 8000690:	af00      	add	r7, sp, #0
 8000692:	6078      	str	r0, [r7, #4]
 8000694:	4b06      	ldr	r3, [pc, #24]	; (80006b0 <LL_RCC_SetI2CClockSource+0x24>)
 8000696:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8000698:	2210      	movs	r2, #16
 800069a:	4393      	bics	r3, r2
 800069c:	0019      	movs	r1, r3
 800069e:	4b04      	ldr	r3, [pc, #16]	; (80006b0 <LL_RCC_SetI2CClockSource+0x24>)
 80006a0:	687a      	ldr	r2, [r7, #4]
 80006a2:	430a      	orrs	r2, r1
 80006a4:	631a      	str	r2, [r3, #48]	; 0x30
 80006a6:	46c0      	nop			; (mov r8, r8)
 80006a8:	46bd      	mov	sp, r7
 80006aa:	b002      	add	sp, #8
 80006ac:	bd80      	pop	{r7, pc}
 80006ae:	46c0      	nop			; (mov r8, r8)
 80006b0:	40021000 	.word	0x40021000

080006b4 <LL_I2C_Enable>:
 80006b4:	b580      	push	{r7, lr}
 80006b6:	b082      	sub	sp, #8
 80006b8:	af00      	add	r7, sp, #0
 80006ba:	6078      	str	r0, [r7, #4]
 80006bc:	687b      	ldr	r3, [r7, #4]
 80006be:	681b      	ldr	r3, [r3, #0]
 80006c0:	2201      	movs	r2, #1
 80006c2:	431a      	orrs	r2, r3
 80006c4:	687b      	ldr	r3, [r7, #4]
 80006c6:	601a      	str	r2, [r3, #0]
 80006c8:	46c0      	nop			; (mov r8, r8)
 80006ca:	46bd      	mov	sp, r7
 80006cc:	b002      	add	sp, #8
 80006ce:	bd80      	pop	{r7, pc}

080006d0 <LL_I2C_Disable>:
 80006d0:	b580      	push	{r7, lr}
 80006d2:	b082      	sub	sp, #8
 80006d4:	af00      	add	r7, sp, #0
 80006d6:	6078      	str	r0, [r7, #4]
 80006d8:	687b      	ldr	r3, [r7, #4]
 80006da:	681b      	ldr	r3, [r3, #0]
 80006dc:	2201      	movs	r2, #1
 80006de:	4393      	bics	r3, r2
 80006e0:	001a      	movs	r2, r3
 80006e2:	687b      	ldr	r3, [r7, #4]
 80006e4:	601a      	str	r2, [r3, #0]
 80006e6:	46c0      	nop			; (mov r8, r8)
 80006e8:	46bd      	mov	sp, r7
 80006ea:	b002      	add	sp, #8
 80006ec:	bd80      	pop	{r7, pc}
	...

080006f0 <LL_I2C_SetDigitalFilter>:
 80006f0:	b580      	push	{r7, lr}
 80006f2:	b082      	sub	sp, #8
 80006f4:	af00      	add	r7, sp, #0
 80006f6:	6078      	str	r0, [r7, #4]
 80006f8:	6039      	str	r1, [r7, #0]
 80006fa:	687b      	ldr	r3, [r7, #4]
 80006fc:	681b      	ldr	r3, [r3, #0]
 80006fe:	4a05      	ldr	r2, [pc, #20]	; (8000714 <LL_I2C_SetDigitalFilter+0x24>)
 8000700:	401a      	ands	r2, r3
 8000702:	683b      	ldr	r3, [r7, #0]
 8000704:	021b      	lsls	r3, r3, #8
 8000706:	431a      	orrs	r2, r3
 8000708:	687b      	ldr	r3, [r7, #4]
 800070a:	601a      	str	r2, [r3, #0]
 800070c:	46c0      	nop			; (mov r8, r8)
 800070e:	46bd      	mov	sp, r7
 8000710:	b002      	add	sp, #8
 8000712:	bd80      	pop	{r7, pc}
 8000714:	fffff0ff 	.word	0xfffff0ff

08000718 <LL_I2C_DisableAnalogFilter>:
 8000718:	b580      	push	{r7, lr}
 800071a:	b082      	sub	sp, #8
 800071c:	af00      	add	r7, sp, #0
 800071e:	6078      	str	r0, [r7, #4]
 8000720:	687b      	ldr	r3, [r7, #4]
 8000722:	681b      	ldr	r3, [r3, #0]
 8000724:	2280      	movs	r2, #128	; 0x80
 8000726:	0152      	lsls	r2, r2, #5
 8000728:	431a      	orrs	r2, r3
 800072a:	687b      	ldr	r3, [r7, #4]
 800072c:	601a      	str	r2, [r3, #0]
 800072e:	46c0      	nop			; (mov r8, r8)
 8000730:	46bd      	mov	sp, r7
 8000732:	b002      	add	sp, #8
 8000734:	bd80      	pop	{r7, pc}

08000736 <LL_I2C_DisableClockStretching>:
 8000736:	b580      	push	{r7, lr}
 8000738:	b082      	sub	sp, #8
 800073a:	af00      	add	r7, sp, #0
 800073c:	6078      	str	r0, [r7, #4]
 800073e:	687b      	ldr	r3, [r7, #4]
 8000740:	681b      	ldr	r3, [r3, #0]
 8000742:	2280      	movs	r2, #128	; 0x80
 8000744:	0292      	lsls	r2, r2, #10
 8000746:	431a      	orrs	r2, r3
 8000748:	687b      	ldr	r3, [r7, #4]
 800074a:	601a      	str	r2, [r3, #0]
 800074c:	46c0      	nop			; (mov r8, r8)
 800074e:	46bd      	mov	sp, r7
 8000750:	b002      	add	sp, #8
 8000752:	bd80      	pop	{r7, pc}

08000754 <LL_I2C_SetMasterAddressingMode>:
 8000754:	b580      	push	{r7, lr}
 8000756:	b082      	sub	sp, #8
 8000758:	af00      	add	r7, sp, #0
 800075a:	6078      	str	r0, [r7, #4]
 800075c:	6039      	str	r1, [r7, #0]
 800075e:	687b      	ldr	r3, [r7, #4]
 8000760:	685b      	ldr	r3, [r3, #4]
 8000762:	4a05      	ldr	r2, [pc, #20]	; (8000778 <LL_I2C_SetMasterAddressingMode+0x24>)
 8000764:	401a      	ands	r2, r3
 8000766:	683b      	ldr	r3, [r7, #0]
 8000768:	431a      	orrs	r2, r3
 800076a:	687b      	ldr	r3, [r7, #4]
 800076c:	605a      	str	r2, [r3, #4]
 800076e:	46c0      	nop			; (mov r8, r8)
 8000770:	46bd      	mov	sp, r7
 8000772:	b002      	add	sp, #8
 8000774:	bd80      	pop	{r7, pc}
 8000776:	46c0      	nop			; (mov r8, r8)
 8000778:	fffff7ff 	.word	0xfffff7ff

0800077c <LL_I2C_SetTiming>:
 800077c:	b580      	push	{r7, lr}
 800077e:	b082      	sub	sp, #8
 8000780:	af00      	add	r7, sp, #0
 8000782:	6078      	str	r0, [r7, #4]
 8000784:	6039      	str	r1, [r7, #0]
 8000786:	687b      	ldr	r3, [r7, #4]
 8000788:	683a      	ldr	r2, [r7, #0]
 800078a:	611a      	str	r2, [r3, #16]
 800078c:	46c0      	nop			; (mov r8, r8)
 800078e:	46bd      	mov	sp, r7
 8000790:	b002      	add	sp, #8
 8000792:	bd80      	pop	{r7, pc}

08000794 <LL_I2C_SetMode>:
 8000794:	b580      	push	{r7, lr}
 8000796:	b082      	sub	sp, #8
 8000798:	af00      	add	r7, sp, #0
 800079a:	6078      	str	r0, [r7, #4]
 800079c:	6039      	str	r1, [r7, #0]
 800079e:	687b      	ldr	r3, [r7, #4]
 80007a0:	681b      	ldr	r3, [r3, #0]
 80007a2:	4a05      	ldr	r2, [pc, #20]	; (80007b8 <LL_I2C_SetMode+0x24>)
 80007a4:	401a      	ands	r2, r3
 80007a6:	683b      	ldr	r3, [r7, #0]
 80007a8:	431a      	orrs	r2, r3
 80007aa:	687b      	ldr	r3, [r7, #4]
 80007ac:	601a      	str	r2, [r3, #0]
 80007ae:	46c0      	nop			; (mov r8, r8)
 80007b0:	46bd      	mov	sp, r7
 80007b2:	b002      	add	sp, #8
 80007b4:	bd80      	pop	{r7, pc}
 80007b6:	46c0      	nop			; (mov r8, r8)
 80007b8:	ffcfffff 	.word	0xffcfffff

080007bc <LL_I2C_IsActiveFlag_TXIS>:
 80007bc:	b580      	push	{r7, lr}
 80007be:	b082      	sub	sp, #8
 80007c0:	af00      	add	r7, sp, #0
 80007c2:	6078      	str	r0, [r7, #4]
 80007c4:	687b      	ldr	r3, [r7, #4]
 80007c6:	699b      	ldr	r3, [r3, #24]
 80007c8:	2202      	movs	r2, #2
 80007ca:	4013      	ands	r3, r2
 80007cc:	3b02      	subs	r3, #2
 80007ce:	425a      	negs	r2, r3
 80007d0:	4153      	adcs	r3, r2
 80007d2:	b2db      	uxtb	r3, r3
 80007d4:	0018      	movs	r0, r3
 80007d6:	46bd      	mov	sp, r7
 80007d8:	b002      	add	sp, #8
 80007da:	bd80      	pop	{r7, pc}

080007dc <LL_I2C_IsActiveFlag_TC>:
 80007dc:	b580      	push	{r7, lr}
 80007de:	b082      	sub	sp, #8
 80007e0:	af00      	add	r7, sp, #0
 80007e2:	6078      	str	r0, [r7, #4]
 80007e4:	687b      	ldr	r3, [r7, #4]
 80007e6:	699b      	ldr	r3, [r3, #24]
 80007e8:	2240      	movs	r2, #64	; 0x40
 80007ea:	4013      	ands	r3, r2
 80007ec:	3b40      	subs	r3, #64	; 0x40
 80007ee:	425a      	negs	r2, r3
 80007f0:	4153      	adcs	r3, r2
 80007f2:	b2db      	uxtb	r3, r3
 80007f4:	0018      	movs	r0, r3
 80007f6:	46bd      	mov	sp, r7
 80007f8:	b002      	add	sp, #8
 80007fa:	bd80      	pop	{r7, pc}

080007fc <LL_I2C_HandleTransfer>:
 80007fc:	b580      	push	{r7, lr}
 80007fe:	b084      	sub	sp, #16
 8000800:	af00      	add	r7, sp, #0
 8000802:	60f8      	str	r0, [r7, #12]
 8000804:	60b9      	str	r1, [r7, #8]
 8000806:	607a      	str	r2, [r7, #4]
 8000808:	603b      	str	r3, [r7, #0]
 800080a:	68fb      	ldr	r3, [r7, #12]
 800080c:	685b      	ldr	r3, [r3, #4]
 800080e:	4a09      	ldr	r2, [pc, #36]	; (8000834 <LL_I2C_HandleTransfer+0x38>)
 8000810:	401a      	ands	r2, r3
 8000812:	68b9      	ldr	r1, [r7, #8]
 8000814:	687b      	ldr	r3, [r7, #4]
 8000816:	4319      	orrs	r1, r3
 8000818:	683b      	ldr	r3, [r7, #0]
 800081a:	041b      	lsls	r3, r3, #16
 800081c:	4319      	orrs	r1, r3
 800081e:	69bb      	ldr	r3, [r7, #24]
 8000820:	4319      	orrs	r1, r3
 8000822:	69fb      	ldr	r3, [r7, #28]
 8000824:	430b      	orrs	r3, r1
 8000826:	431a      	orrs	r2, r3
 8000828:	68fb      	ldr	r3, [r7, #12]
 800082a:	605a      	str	r2, [r3, #4]
 800082c:	46c0      	nop			; (mov r8, r8)
 800082e:	46bd      	mov	sp, r7
 8000830:	b004      	add	sp, #16
 8000832:	bd80      	pop	{r7, pc}
 8000834:	fc008000 	.word	0xfc008000

08000838 <LL_I2C_TransmitData8>:
 8000838:	b580      	push	{r7, lr}
 800083a:	b082      	sub	sp, #8
 800083c:	af00      	add	r7, sp, #0
 800083e:	6078      	str	r0, [r7, #4]
 8000840:	000a      	movs	r2, r1
 8000842:	1cfb      	adds	r3, r7, #3
 8000844:	701a      	strb	r2, [r3, #0]
 8000846:	1cfb      	adds	r3, r7, #3
 8000848:	781a      	ldrb	r2, [r3, #0]
 800084a:	687b      	ldr	r3, [r7, #4]
 800084c:	629a      	str	r2, [r3, #40]	; 0x28
 800084e:	46c0      	nop			; (mov r8, r8)
 8000850:	46bd      	mov	sp, r7
 8000852:	b002      	add	sp, #8
 8000854:	bd80      	pop	{r7, pc}
	...

08000858 <oled_hw_config>:
 8000858:	b580      	push	{r7, lr}
 800085a:	af00      	add	r7, sp, #0
 800085c:	2380      	movs	r3, #128	; 0x80
 800085e:	02db      	lsls	r3, r3, #11
 8000860:	0018      	movs	r0, r3
 8000862:	f7ff fe73 	bl	800054c <LL_AHB1_GRP1_EnableClock>
 8000866:	4b30      	ldr	r3, [pc, #192]	; (8000928 <oled_hw_config+0xd0>)
 8000868:	2202      	movs	r2, #2
 800086a:	2140      	movs	r1, #64	; 0x40
 800086c:	0018      	movs	r0, r3
 800086e:	f7ff fe99 	bl	80005a4 <LL_GPIO_SetPinMode>
 8000872:	4b2d      	ldr	r3, [pc, #180]	; (8000928 <oled_hw_config+0xd0>)
 8000874:	2201      	movs	r2, #1
 8000876:	2140      	movs	r1, #64	; 0x40
 8000878:	0018      	movs	r0, r3
 800087a:	f7ff feb0 	bl	80005de <LL_GPIO_SetPinOutputType>
 800087e:	4b2a      	ldr	r3, [pc, #168]	; (8000928 <oled_hw_config+0xd0>)
 8000880:	2201      	movs	r2, #1
 8000882:	2140      	movs	r1, #64	; 0x40
 8000884:	0018      	movs	r0, r3
 8000886:	f7ff fedc 	bl	8000642 <LL_GPIO_SetAFPin_0_7>
 800088a:	4b27      	ldr	r3, [pc, #156]	; (8000928 <oled_hw_config+0xd0>)
 800088c:	2203      	movs	r2, #3
 800088e:	2140      	movs	r1, #64	; 0x40
 8000890:	0018      	movs	r0, r3
 8000892:	f7ff feb9 	bl	8000608 <LL_GPIO_SetPinSpeed>
 8000896:	4b24      	ldr	r3, [pc, #144]	; (8000928 <oled_hw_config+0xd0>)
 8000898:	2202      	movs	r2, #2
 800089a:	2180      	movs	r1, #128	; 0x80
 800089c:	0018      	movs	r0, r3
 800089e:	f7ff fe81 	bl	80005a4 <LL_GPIO_SetPinMode>
 80008a2:	4b21      	ldr	r3, [pc, #132]	; (8000928 <oled_hw_config+0xd0>)
 80008a4:	2201      	movs	r2, #1
 80008a6:	2180      	movs	r1, #128	; 0x80
 80008a8:	0018      	movs	r0, r3
 80008aa:	f7ff fe98 	bl	80005de <LL_GPIO_SetPinOutputType>
 80008ae:	4b1e      	ldr	r3, [pc, #120]	; (8000928 <oled_hw_config+0xd0>)
 80008b0:	2201      	movs	r2, #1
 80008b2:	2180      	movs	r1, #128	; 0x80
 80008b4:	0018      	movs	r0, r3
 80008b6:	f7ff fec4 	bl	8000642 <LL_GPIO_SetAFPin_0_7>
 80008ba:	4b1b      	ldr	r3, [pc, #108]	; (8000928 <oled_hw_config+0xd0>)
 80008bc:	2203      	movs	r2, #3
 80008be:	2180      	movs	r1, #128	; 0x80
 80008c0:	0018      	movs	r0, r3
 80008c2:	f7ff fea1 	bl	8000608 <LL_GPIO_SetPinSpeed>
 80008c6:	2010      	movs	r0, #16
 80008c8:	f7ff fee0 	bl	800068c <LL_RCC_SetI2CClockSource>
 80008cc:	4b17      	ldr	r3, [pc, #92]	; (800092c <oled_hw_config+0xd4>)
 80008ce:	0018      	movs	r0, r3
 80008d0:	f7ff fefe 	bl	80006d0 <LL_I2C_Disable>
 80008d4:	2380      	movs	r3, #128	; 0x80
 80008d6:	039b      	lsls	r3, r3, #14
 80008d8:	0018      	movs	r0, r3
 80008da:	f7ff fe4d 	bl	8000578 <LL_APB1_GRP1_EnableClock>
 80008de:	4b13      	ldr	r3, [pc, #76]	; (800092c <oled_hw_config+0xd4>)
 80008e0:	0018      	movs	r0, r3
 80008e2:	f7ff ff19 	bl	8000718 <LL_I2C_DisableAnalogFilter>
 80008e6:	4b11      	ldr	r3, [pc, #68]	; (800092c <oled_hw_config+0xd4>)
 80008e8:	2101      	movs	r1, #1
 80008ea:	0018      	movs	r0, r3
 80008ec:	f7ff ff00 	bl	80006f0 <LL_I2C_SetDigitalFilter>
 80008f0:	4a0f      	ldr	r2, [pc, #60]	; (8000930 <oled_hw_config+0xd8>)
 80008f2:	4b0e      	ldr	r3, [pc, #56]	; (800092c <oled_hw_config+0xd4>)
 80008f4:	0011      	movs	r1, r2
 80008f6:	0018      	movs	r0, r3
 80008f8:	f7ff ff40 	bl	800077c <LL_I2C_SetTiming>
 80008fc:	4b0b      	ldr	r3, [pc, #44]	; (800092c <oled_hw_config+0xd4>)
 80008fe:	0018      	movs	r0, r3
 8000900:	f7ff ff19 	bl	8000736 <LL_I2C_DisableClockStretching>
 8000904:	4b09      	ldr	r3, [pc, #36]	; (800092c <oled_hw_config+0xd4>)
 8000906:	2100      	movs	r1, #0
 8000908:	0018      	movs	r0, r3
 800090a:	f7ff ff23 	bl	8000754 <LL_I2C_SetMasterAddressingMode>
 800090e:	4b07      	ldr	r3, [pc, #28]	; (800092c <oled_hw_config+0xd4>)
 8000910:	2100      	movs	r1, #0
 8000912:	0018      	movs	r0, r3
 8000914:	f7ff ff3e 	bl	8000794 <LL_I2C_SetMode>
 8000918:	4b04      	ldr	r3, [pc, #16]	; (800092c <oled_hw_config+0xd4>)
 800091a:	0018      	movs	r0, r3
 800091c:	f7ff feca 	bl	80006b4 <LL_I2C_Enable>
 8000920:	46c0      	nop			; (mov r8, r8)
 8000922:	46bd      	mov	sp, r7
 8000924:	bd80      	pop	{r7, pc}
 8000926:	46c0      	nop			; (mov r8, r8)
 8000928:	48000400 	.word	0x48000400
 800092c:	40005400 	.word	0x40005400
 8000930:	50330309 	.word	0x50330309

08000934 <oled_cmd_send>:
 8000934:	b580      	push	{r7, lr}
 8000936:	b084      	sub	sp, #16
 8000938:	af02      	add	r7, sp, #8
 800093a:	0002      	movs	r2, r0
 800093c:	1dfb      	adds	r3, r7, #7
 800093e:	701a      	strb	r2, [r3, #0]
 8000940:	4818      	ldr	r0, [pc, #96]	; (80009a4 <oled_cmd_send+0x70>)
 8000942:	2380      	movs	r3, #128	; 0x80
 8000944:	019b      	lsls	r3, r3, #6
 8000946:	9301      	str	r3, [sp, #4]
 8000948:	2380      	movs	r3, #128	; 0x80
 800094a:	049b      	lsls	r3, r3, #18
 800094c:	9300      	str	r3, [sp, #0]
 800094e:	2302      	movs	r3, #2
 8000950:	2200      	movs	r2, #0
 8000952:	2178      	movs	r1, #120	; 0x78
 8000954:	f7ff ff52 	bl	80007fc <LL_I2C_HandleTransfer>
 8000958:	46c0      	nop			; (mov r8, r8)
 800095a:	4b12      	ldr	r3, [pc, #72]	; (80009a4 <oled_cmd_send+0x70>)
 800095c:	0018      	movs	r0, r3
 800095e:	f7ff ff2d 	bl	80007bc <LL_I2C_IsActiveFlag_TXIS>
 8000962:	1e03      	subs	r3, r0, #0
 8000964:	d0f9      	beq.n	800095a <oled_cmd_send+0x26>
 8000966:	4b0f      	ldr	r3, [pc, #60]	; (80009a4 <oled_cmd_send+0x70>)
 8000968:	2100      	movs	r1, #0
 800096a:	0018      	movs	r0, r3
 800096c:	f7ff ff64 	bl	8000838 <LL_I2C_TransmitData8>
 8000970:	46c0      	nop			; (mov r8, r8)
 8000972:	4b0c      	ldr	r3, [pc, #48]	; (80009a4 <oled_cmd_send+0x70>)
 8000974:	0018      	movs	r0, r3
 8000976:	f7ff ff21 	bl	80007bc <LL_I2C_IsActiveFlag_TXIS>
 800097a:	1e03      	subs	r3, r0, #0
 800097c:	d0f9      	beq.n	8000972 <oled_cmd_send+0x3e>
 800097e:	1dfb      	adds	r3, r7, #7
 8000980:	781b      	ldrb	r3, [r3, #0]
 8000982:	4a08      	ldr	r2, [pc, #32]	; (80009a4 <oled_cmd_send+0x70>)
 8000984:	0019      	movs	r1, r3
 8000986:	0010      	movs	r0, r2
 8000988:	f7ff ff56 	bl	8000838 <LL_I2C_TransmitData8>
 800098c:	46c0      	nop			; (mov r8, r8)
 800098e:	4b05      	ldr	r3, [pc, #20]	; (80009a4 <oled_cmd_send+0x70>)
 8000990:	0018      	movs	r0, r3
 8000992:	f7ff ff23 	bl	80007dc <LL_I2C_IsActiveFlag_TC>
 8000996:	1e03      	subs	r3, r0, #0
 8000998:	d1f9      	bne.n	800098e <oled_cmd_send+0x5a>
 800099a:	2300      	movs	r3, #0
 800099c:	0018      	movs	r0, r3
 800099e:	46bd      	mov	sp, r7
 80009a0:	b002      	add	sp, #8
 80009a2:	bd80      	pop	{r7, pc}
 80009a4:	40005400 	.word	0x40005400

080009a8 <oled_data_send>:
 80009a8:	b590      	push	{r4, r7, lr}
 80009aa:	b087      	sub	sp, #28
 80009ac:	af02      	add	r7, sp, #8
 80009ae:	6078      	str	r0, [r7, #4]
 80009b0:	000a      	movs	r2, r1
 80009b2:	1cfb      	adds	r3, r7, #3
 80009b4:	701a      	strb	r2, [r3, #0]
 80009b6:	1cfb      	adds	r3, r7, #3
 80009b8:	781b      	ldrb	r3, [r3, #0]
 80009ba:	3301      	adds	r3, #1
 80009bc:	001a      	movs	r2, r3
 80009be:	4823      	ldr	r0, [pc, #140]	; (8000a4c <oled_data_send+0xa4>)
 80009c0:	2380      	movs	r3, #128	; 0x80
 80009c2:	019b      	lsls	r3, r3, #6
 80009c4:	9301      	str	r3, [sp, #4]
 80009c6:	2380      	movs	r3, #128	; 0x80
 80009c8:	049b      	lsls	r3, r3, #18
 80009ca:	9300      	str	r3, [sp, #0]
 80009cc:	0013      	movs	r3, r2
 80009ce:	2200      	movs	r2, #0
 80009d0:	2178      	movs	r1, #120	; 0x78
 80009d2:	f7ff ff13 	bl	80007fc <LL_I2C_HandleTransfer>
 80009d6:	46c0      	nop			; (mov r8, r8)
 80009d8:	4b1c      	ldr	r3, [pc, #112]	; (8000a4c <oled_data_send+0xa4>)
 80009da:	0018      	movs	r0, r3
 80009dc:	f7ff feee 	bl	80007bc <LL_I2C_IsActiveFlag_TXIS>
 80009e0:	1e03      	subs	r3, r0, #0
 80009e2:	d0f9      	beq.n	80009d8 <oled_data_send+0x30>
 80009e4:	4b19      	ldr	r3, [pc, #100]	; (8000a4c <oled_data_send+0xa4>)
 80009e6:	2140      	movs	r1, #64	; 0x40
 80009e8:	0018      	movs	r0, r3
 80009ea:	f7ff ff25 	bl	8000838 <LL_I2C_TransmitData8>
 80009ee:	230f      	movs	r3, #15
 80009f0:	18fb      	adds	r3, r7, r3
 80009f2:	2200      	movs	r2, #0
 80009f4:	701a      	strb	r2, [r3, #0]
 80009f6:	e016      	b.n	8000a26 <oled_data_send+0x7e>
 80009f8:	46c0      	nop			; (mov r8, r8)
 80009fa:	4b14      	ldr	r3, [pc, #80]	; (8000a4c <oled_data_send+0xa4>)
 80009fc:	0018      	movs	r0, r3
 80009fe:	f7ff fedd 	bl	80007bc <LL_I2C_IsActiveFlag_TXIS>
 8000a02:	1e03      	subs	r3, r0, #0
 8000a04:	d0f9      	beq.n	80009fa <oled_data_send+0x52>
 8000a06:	240f      	movs	r4, #15
 8000a08:	193b      	adds	r3, r7, r4
 8000a0a:	781b      	ldrb	r3, [r3, #0]
 8000a0c:	687a      	ldr	r2, [r7, #4]
 8000a0e:	18d3      	adds	r3, r2, r3
 8000a10:	781b      	ldrb	r3, [r3, #0]
 8000a12:	4a0e      	ldr	r2, [pc, #56]	; (8000a4c <oled_data_send+0xa4>)
 8000a14:	0019      	movs	r1, r3
 8000a16:	0010      	movs	r0, r2
 8000a18:	f7ff ff0e 	bl	8000838 <LL_I2C_TransmitData8>
 8000a1c:	193b      	adds	r3, r7, r4
 8000a1e:	781a      	ldrb	r2, [r3, #0]
 8000a20:	193b      	adds	r3, r7, r4
 8000a22:	3201      	adds	r2, #1
 8000a24:	701a      	strb	r2, [r3, #0]
 8000a26:	230f      	movs	r3, #15
 8000a28:	18fa      	adds	r2, r7, r3
 8000a2a:	1cfb      	adds	r3, r7, #3
 8000a2c:	7812      	ldrb	r2, [r2, #0]
 8000a2e:	781b      	ldrb	r3, [r3, #0]
 8000a30:	429a      	cmp	r2, r3
 8000a32:	d3e1      	bcc.n	80009f8 <oled_data_send+0x50>
 8000a34:	46c0      	nop			; (mov r8, r8)
 8000a36:	4b05      	ldr	r3, [pc, #20]	; (8000a4c <oled_data_send+0xa4>)
 8000a38:	0018      	movs	r0, r3
 8000a3a:	f7ff fecf 	bl	80007dc <LL_I2C_IsActiveFlag_TC>
 8000a3e:	1e03      	subs	r3, r0, #0
 8000a40:	d1f9      	bne.n	8000a36 <oled_data_send+0x8e>
 8000a42:	2300      	movs	r3, #0
 8000a44:	0018      	movs	r0, r3
 8000a46:	46bd      	mov	sp, r7
 8000a48:	b005      	add	sp, #20
 8000a4a:	bd90      	pop	{r4, r7, pc}
 8000a4c:	40005400 	.word	0x40005400

08000a50 <oled_clr>:
 8000a50:	b580      	push	{r7, lr}
 8000a52:	b082      	sub	sp, #8
 8000a54:	af00      	add	r7, sp, #0
 8000a56:	0002      	movs	r2, r0
 8000a58:	1dfb      	adds	r3, r7, #7
 8000a5a:	701a      	strb	r2, [r3, #0]
 8000a5c:	1dfb      	adds	r3, r7, #7
 8000a5e:	7819      	ldrb	r1, [r3, #0]
 8000a60:	2380      	movs	r3, #128	; 0x80
 8000a62:	00da      	lsls	r2, r3, #3
 8000a64:	4b03      	ldr	r3, [pc, #12]	; (8000a74 <oled_clr+0x24>)
 8000a66:	0018      	movs	r0, r3
 8000a68:	f000 f9ca 	bl	8000e00 <memset>
 8000a6c:	46c0      	nop			; (mov r8, r8)
 8000a6e:	46bd      	mov	sp, r7
 8000a70:	b002      	add	sp, #8
 8000a72:	bd80      	pop	{r7, pc}
 8000a74:	20000458 	.word	0x20000458

08000a78 <oled_update>:
 8000a78:	b580      	push	{r7, lr}
 8000a7a:	b082      	sub	sp, #8
 8000a7c:	af00      	add	r7, sp, #0
 8000a7e:	1dfb      	adds	r3, r7, #7
 8000a80:	2200      	movs	r2, #0
 8000a82:	701a      	strb	r2, [r3, #0]
 8000a84:	e01a      	b.n	8000abc <oled_update+0x44>
 8000a86:	1dfb      	adds	r3, r7, #7
 8000a88:	781b      	ldrb	r3, [r3, #0]
 8000a8a:	3b50      	subs	r3, #80	; 0x50
 8000a8c:	b2db      	uxtb	r3, r3
 8000a8e:	0018      	movs	r0, r3
 8000a90:	f7ff ff50 	bl	8000934 <oled_cmd_send>
 8000a94:	2000      	movs	r0, #0
 8000a96:	f7ff ff4d 	bl	8000934 <oled_cmd_send>
 8000a9a:	2010      	movs	r0, #16
 8000a9c:	f7ff ff4a 	bl	8000934 <oled_cmd_send>
 8000aa0:	1dfb      	adds	r3, r7, #7
 8000aa2:	781b      	ldrb	r3, [r3, #0]
 8000aa4:	01da      	lsls	r2, r3, #7
 8000aa6:	4b09      	ldr	r3, [pc, #36]	; (8000acc <oled_update+0x54>)
 8000aa8:	18d3      	adds	r3, r2, r3
 8000aaa:	2180      	movs	r1, #128	; 0x80
 8000aac:	0018      	movs	r0, r3
 8000aae:	f7ff ff7b 	bl	80009a8 <oled_data_send>
 8000ab2:	1dfb      	adds	r3, r7, #7
 8000ab4:	781a      	ldrb	r2, [r3, #0]
 8000ab6:	1dfb      	adds	r3, r7, #7
 8000ab8:	3201      	adds	r2, #1
 8000aba:	701a      	strb	r2, [r3, #0]
 8000abc:	1dfb      	adds	r3, r7, #7
 8000abe:	781b      	ldrb	r3, [r3, #0]
 8000ac0:	2b07      	cmp	r3, #7
 8000ac2:	d9e0      	bls.n	8000a86 <oled_update+0xe>
 8000ac4:	46c0      	nop			; (mov r8, r8)
 8000ac6:	46bd      	mov	sp, r7
 8000ac8:	b002      	add	sp, #8
 8000aca:	bd80      	pop	{r7, pc}
 8000acc:	20000458 	.word	0x20000458

08000ad0 <oled_config>:
 8000ad0:	b580      	push	{r7, lr}
 8000ad2:	b082      	sub	sp, #8
 8000ad4:	af00      	add	r7, sp, #0
 8000ad6:	4b29      	ldr	r3, [pc, #164]	; (8000b7c <oled_config+0xac>)
 8000ad8:	607b      	str	r3, [r7, #4]
 8000ada:	f7ff febd 	bl	8000858 <oled_hw_config>
 8000ade:	46c0      	nop			; (mov r8, r8)
 8000ae0:	687b      	ldr	r3, [r7, #4]
 8000ae2:	1e5a      	subs	r2, r3, #1
 8000ae4:	607a      	str	r2, [r7, #4]
 8000ae6:	2b00      	cmp	r3, #0
 8000ae8:	d1fa      	bne.n	8000ae0 <oled_config+0x10>
 8000aea:	20ae      	movs	r0, #174	; 0xae
 8000aec:	f7ff ff22 	bl	8000934 <oled_cmd_send>
 8000af0:	2020      	movs	r0, #32
 8000af2:	f7ff ff1f 	bl	8000934 <oled_cmd_send>
 8000af6:	2010      	movs	r0, #16
 8000af8:	f7ff ff1c 	bl	8000934 <oled_cmd_send>
 8000afc:	20c8      	movs	r0, #200	; 0xc8
 8000afe:	f7ff ff19 	bl	8000934 <oled_cmd_send>
 8000b02:	2040      	movs	r0, #64	; 0x40
 8000b04:	f7ff ff16 	bl	8000934 <oled_cmd_send>
 8000b08:	2081      	movs	r0, #129	; 0x81
 8000b0a:	f7ff ff13 	bl	8000934 <oled_cmd_send>
 8000b0e:	20ff      	movs	r0, #255	; 0xff
 8000b10:	f7ff ff10 	bl	8000934 <oled_cmd_send>
 8000b14:	20a1      	movs	r0, #161	; 0xa1
 8000b16:	f7ff ff0d 	bl	8000934 <oled_cmd_send>
 8000b1a:	20a6      	movs	r0, #166	; 0xa6
 8000b1c:	f7ff ff0a 	bl	8000934 <oled_cmd_send>
 8000b20:	20a8      	movs	r0, #168	; 0xa8
 8000b22:	f7ff ff07 	bl	8000934 <oled_cmd_send>
 8000b26:	203f      	movs	r0, #63	; 0x3f
 8000b28:	f7ff ff04 	bl	8000934 <oled_cmd_send>
 8000b2c:	20a4      	movs	r0, #164	; 0xa4
 8000b2e:	f7ff ff01 	bl	8000934 <oled_cmd_send>
 8000b32:	20d3      	movs	r0, #211	; 0xd3
 8000b34:	f7ff fefe 	bl	8000934 <oled_cmd_send>
 8000b38:	2000      	movs	r0, #0
 8000b3a:	f7ff fefb 	bl	8000934 <oled_cmd_send>
 8000b3e:	20d5      	movs	r0, #213	; 0xd5
 8000b40:	f7ff fef8 	bl	8000934 <oled_cmd_send>
 8000b44:	20f0      	movs	r0, #240	; 0xf0
 8000b46:	f7ff fef5 	bl	8000934 <oled_cmd_send>
 8000b4a:	20da      	movs	r0, #218	; 0xda
 8000b4c:	f7ff fef2 	bl	8000934 <oled_cmd_send>
 8000b50:	2012      	movs	r0, #18
 8000b52:	f7ff feef 	bl	8000934 <oled_cmd_send>
 8000b56:	208d      	movs	r0, #141	; 0x8d
 8000b58:	f7ff feec 	bl	8000934 <oled_cmd_send>
 8000b5c:	2014      	movs	r0, #20
 8000b5e:	f7ff fee9 	bl	8000934 <oled_cmd_send>
 8000b62:	20af      	movs	r0, #175	; 0xaf
 8000b64:	f7ff fee6 	bl	8000934 <oled_cmd_send>
 8000b68:	2000      	movs	r0, #0
 8000b6a:	f7ff ff71 	bl	8000a50 <oled_clr>
 8000b6e:	f7ff ff83 	bl	8000a78 <oled_update>
 8000b72:	46c0      	nop			; (mov r8, r8)
 8000b74:	46bd      	mov	sp, r7
 8000b76:	b002      	add	sp, #8
 8000b78:	bd80      	pop	{r7, pc}
 8000b7a:	46c0      	nop			; (mov r8, r8)
 8000b7c:	001e8480 	.word	0x001e8480

08000b80 <oled_set_pix>:
 8000b80:	b590      	push	{r4, r7, lr}
 8000b82:	b083      	sub	sp, #12
 8000b84:	af00      	add	r7, sp, #0
 8000b86:	0004      	movs	r4, r0
 8000b88:	0008      	movs	r0, r1
 8000b8a:	0011      	movs	r1, r2
 8000b8c:	1dfb      	adds	r3, r7, #7
 8000b8e:	1c22      	adds	r2, r4, #0
 8000b90:	701a      	strb	r2, [r3, #0]
 8000b92:	1dbb      	adds	r3, r7, #6
 8000b94:	1c02      	adds	r2, r0, #0
 8000b96:	701a      	strb	r2, [r3, #0]
 8000b98:	1d7b      	adds	r3, r7, #5
 8000b9a:	1c0a      	adds	r2, r1, #0
 8000b9c:	701a      	strb	r2, [r3, #0]
 8000b9e:	1dfb      	adds	r3, r7, #7
 8000ba0:	781b      	ldrb	r3, [r3, #0]
 8000ba2:	b25b      	sxtb	r3, r3
 8000ba4:	2b00      	cmp	r3, #0
 8000ba6:	db48      	blt.n	8000c3a <oled_set_pix+0xba>
 8000ba8:	1dbb      	adds	r3, r7, #6
 8000baa:	781b      	ldrb	r3, [r3, #0]
 8000bac:	2b3f      	cmp	r3, #63	; 0x3f
 8000bae:	d844      	bhi.n	8000c3a <oled_set_pix+0xba>
 8000bb0:	1d7b      	adds	r3, r7, #5
 8000bb2:	781b      	ldrb	r3, [r3, #0]
 8000bb4:	2b00      	cmp	r3, #0
 8000bb6:	d01e      	beq.n	8000bf6 <oled_set_pix+0x76>
 8000bb8:	1dbb      	adds	r3, r7, #6
 8000bba:	781b      	ldrb	r3, [r3, #0]
 8000bbc:	08db      	lsrs	r3, r3, #3
 8000bbe:	b2d8      	uxtb	r0, r3
 8000bc0:	0003      	movs	r3, r0
 8000bc2:	01da      	lsls	r2, r3, #7
 8000bc4:	1dfb      	adds	r3, r7, #7
 8000bc6:	781b      	ldrb	r3, [r3, #0]
 8000bc8:	18d3      	adds	r3, r2, r3
 8000bca:	4a1e      	ldr	r2, [pc, #120]	; (8000c44 <oled_set_pix+0xc4>)
 8000bcc:	5cd3      	ldrb	r3, [r2, r3]
 8000bce:	b25a      	sxtb	r2, r3
 8000bd0:	1dbb      	adds	r3, r7, #6
 8000bd2:	781b      	ldrb	r3, [r3, #0]
 8000bd4:	2107      	movs	r1, #7
 8000bd6:	400b      	ands	r3, r1
 8000bd8:	2101      	movs	r1, #1
 8000bda:	4099      	lsls	r1, r3
 8000bdc:	000b      	movs	r3, r1
 8000bde:	b25b      	sxtb	r3, r3
 8000be0:	4313      	orrs	r3, r2
 8000be2:	b259      	sxtb	r1, r3
 8000be4:	0003      	movs	r3, r0
 8000be6:	01da      	lsls	r2, r3, #7
 8000be8:	1dfb      	adds	r3, r7, #7
 8000bea:	781b      	ldrb	r3, [r3, #0]
 8000bec:	18d3      	adds	r3, r2, r3
 8000bee:	b2c9      	uxtb	r1, r1
 8000bf0:	4a14      	ldr	r2, [pc, #80]	; (8000c44 <oled_set_pix+0xc4>)
 8000bf2:	54d1      	strb	r1, [r2, r3]
 8000bf4:	e022      	b.n	8000c3c <oled_set_pix+0xbc>
 8000bf6:	1dbb      	adds	r3, r7, #6
 8000bf8:	781b      	ldrb	r3, [r3, #0]
 8000bfa:	08db      	lsrs	r3, r3, #3
 8000bfc:	b2d8      	uxtb	r0, r3
 8000bfe:	0003      	movs	r3, r0
 8000c00:	01da      	lsls	r2, r3, #7
 8000c02:	1dfb      	adds	r3, r7, #7
 8000c04:	781b      	ldrb	r3, [r3, #0]
 8000c06:	18d3      	adds	r3, r2, r3
 8000c08:	4a0e      	ldr	r2, [pc, #56]	; (8000c44 <oled_set_pix+0xc4>)
 8000c0a:	5cd3      	ldrb	r3, [r2, r3]
 8000c0c:	b25b      	sxtb	r3, r3
 8000c0e:	1dba      	adds	r2, r7, #6
 8000c10:	7812      	ldrb	r2, [r2, #0]
 8000c12:	2107      	movs	r1, #7
 8000c14:	400a      	ands	r2, r1
 8000c16:	2101      	movs	r1, #1
 8000c18:	4091      	lsls	r1, r2
 8000c1a:	000a      	movs	r2, r1
 8000c1c:	b252      	sxtb	r2, r2
 8000c1e:	43d2      	mvns	r2, r2
 8000c20:	b252      	sxtb	r2, r2
 8000c22:	4013      	ands	r3, r2
 8000c24:	b259      	sxtb	r1, r3
 8000c26:	0003      	movs	r3, r0
 8000c28:	01da      	lsls	r2, r3, #7
 8000c2a:	1dfb      	adds	r3, r7, #7
 8000c2c:	781b      	ldrb	r3, [r3, #0]
 8000c2e:	18d3      	adds	r3, r2, r3
 8000c30:	b2c9      	uxtb	r1, r1
 8000c32:	4a04      	ldr	r2, [pc, #16]	; (8000c44 <oled_set_pix+0xc4>)
 8000c34:	54d1      	strb	r1, [r2, r3]
 8000c36:	46c0      	nop			; (mov r8, r8)
 8000c38:	e000      	b.n	8000c3c <oled_set_pix+0xbc>
 8000c3a:	46c0      	nop			; (mov r8, r8)
 8000c3c:	46bd      	mov	sp, r7
 8000c3e:	b003      	add	sp, #12
 8000c40:	bd90      	pop	{r4, r7, pc}
 8000c42:	46c0      	nop			; (mov r8, r8)
 8000c44:	20000458 	.word	0x20000458

08000c48 <oled_putc>:
 8000c48:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000c4a:	b085      	sub	sp, #20
 8000c4c:	af00      	add	r7, sp, #0
 8000c4e:	0002      	movs	r2, r0
 8000c50:	1dfb      	adds	r3, r7, #7
 8000c52:	701a      	strb	r2, [r3, #0]
 8000c54:	1dfb      	adds	r3, r7, #7
 8000c56:	781b      	ldrb	r3, [r3, #0]
 8000c58:	2b0a      	cmp	r3, #10
 8000c5a:	d106      	bne.n	8000c6a <oled_putc+0x22>
 8000c5c:	4b35      	ldr	r3, [pc, #212]	; (8000d34 <oled_putc+0xec>)
 8000c5e:	781b      	ldrb	r3, [r3, #0]
 8000c60:	3301      	adds	r3, #1
 8000c62:	b2da      	uxtb	r2, r3
 8000c64:	4b33      	ldr	r3, [pc, #204]	; (8000d34 <oled_putc+0xec>)
 8000c66:	701a      	strb	r2, [r3, #0]
 8000c68:	e061      	b.n	8000d2e <oled_putc+0xe6>
 8000c6a:	1dfb      	adds	r3, r7, #7
 8000c6c:	781b      	ldrb	r3, [r3, #0]
 8000c6e:	2b0d      	cmp	r3, #13
 8000c70:	d103      	bne.n	8000c7a <oled_putc+0x32>
 8000c72:	4b31      	ldr	r3, [pc, #196]	; (8000d38 <oled_putc+0xf0>)
 8000c74:	2200      	movs	r2, #0
 8000c76:	701a      	strb	r2, [r3, #0]
 8000c78:	e059      	b.n	8000d2e <oled_putc+0xe6>
 8000c7a:	230e      	movs	r3, #14
 8000c7c:	18fb      	adds	r3, r7, r3
 8000c7e:	2200      	movs	r2, #0
 8000c80:	701a      	strb	r2, [r3, #0]
 8000c82:	e046      	b.n	8000d12 <oled_putc+0xca>
 8000c84:	230f      	movs	r3, #15
 8000c86:	18fb      	adds	r3, r7, r3
 8000c88:	2200      	movs	r2, #0
 8000c8a:	701a      	strb	r2, [r3, #0]
 8000c8c:	e034      	b.n	8000cf8 <oled_putc+0xb0>
 8000c8e:	4b2b      	ldr	r3, [pc, #172]	; (8000d3c <oled_putc+0xf4>)
 8000c90:	689b      	ldr	r3, [r3, #8]
 8000c92:	220d      	movs	r2, #13
 8000c94:	18bc      	adds	r4, r7, r2
 8000c96:	210e      	movs	r1, #14
 8000c98:	187a      	adds	r2, r7, r1
 8000c9a:	7815      	ldrb	r5, [r2, #0]
 8000c9c:	260f      	movs	r6, #15
 8000c9e:	19ba      	adds	r2, r7, r6
 8000ca0:	7811      	ldrb	r1, [r2, #0]
 8000ca2:	1dfa      	adds	r2, r7, #7
 8000ca4:	7810      	ldrb	r0, [r2, #0]
 8000ca6:	002a      	movs	r2, r5
 8000ca8:	4798      	blx	r3
 8000caa:	0003      	movs	r3, r0
 8000cac:	7023      	strb	r3, [r4, #0]
 8000cae:	4b23      	ldr	r3, [pc, #140]	; (8000d3c <oled_putc+0xf4>)
 8000cb0:	791b      	ldrb	r3, [r3, #4]
 8000cb2:	3301      	adds	r3, #1
 8000cb4:	b2db      	uxtb	r3, r3
 8000cb6:	4a20      	ldr	r2, [pc, #128]	; (8000d38 <oled_putc+0xf0>)
 8000cb8:	7812      	ldrb	r2, [r2, #0]
 8000cba:	4353      	muls	r3, r2
 8000cbc:	b2da      	uxtb	r2, r3
 8000cbe:	0034      	movs	r4, r6
 8000cc0:	193b      	adds	r3, r7, r4
 8000cc2:	781b      	ldrb	r3, [r3, #0]
 8000cc4:	18d3      	adds	r3, r2, r3
 8000cc6:	b2d8      	uxtb	r0, r3
 8000cc8:	4b1c      	ldr	r3, [pc, #112]	; (8000d3c <oled_putc+0xf4>)
 8000cca:	795b      	ldrb	r3, [r3, #5]
 8000ccc:	3302      	adds	r3, #2
 8000cce:	b2db      	uxtb	r3, r3
 8000cd0:	4a18      	ldr	r2, [pc, #96]	; (8000d34 <oled_putc+0xec>)
 8000cd2:	7812      	ldrb	r2, [r2, #0]
 8000cd4:	4353      	muls	r3, r2
 8000cd6:	b2da      	uxtb	r2, r3
 8000cd8:	210e      	movs	r1, #14
 8000cda:	187b      	adds	r3, r7, r1
 8000cdc:	781b      	ldrb	r3, [r3, #0]
 8000cde:	18d3      	adds	r3, r2, r3
 8000ce0:	b2d9      	uxtb	r1, r3
 8000ce2:	220d      	movs	r2, #13
 8000ce4:	18bb      	adds	r3, r7, r2
 8000ce6:	781b      	ldrb	r3, [r3, #0]
 8000ce8:	001a      	movs	r2, r3
 8000cea:	f7ff ff49 	bl	8000b80 <oled_set_pix>
 8000cee:	193b      	adds	r3, r7, r4
 8000cf0:	781a      	ldrb	r2, [r3, #0]
 8000cf2:	193b      	adds	r3, r7, r4
 8000cf4:	3201      	adds	r2, #1
 8000cf6:	701a      	strb	r2, [r3, #0]
 8000cf8:	4b10      	ldr	r3, [pc, #64]	; (8000d3c <oled_putc+0xf4>)
 8000cfa:	791b      	ldrb	r3, [r3, #4]
 8000cfc:	220f      	movs	r2, #15
 8000cfe:	18ba      	adds	r2, r7, r2
 8000d00:	7812      	ldrb	r2, [r2, #0]
 8000d02:	429a      	cmp	r2, r3
 8000d04:	d3c3      	bcc.n	8000c8e <oled_putc+0x46>
 8000d06:	210e      	movs	r1, #14
 8000d08:	187b      	adds	r3, r7, r1
 8000d0a:	781a      	ldrb	r2, [r3, #0]
 8000d0c:	187b      	adds	r3, r7, r1
 8000d0e:	3201      	adds	r2, #1
 8000d10:	701a      	strb	r2, [r3, #0]
 8000d12:	4b0a      	ldr	r3, [pc, #40]	; (8000d3c <oled_putc+0xf4>)
 8000d14:	795b      	ldrb	r3, [r3, #5]
 8000d16:	220e      	movs	r2, #14
 8000d18:	18ba      	adds	r2, r7, r2
 8000d1a:	7812      	ldrb	r2, [r2, #0]
 8000d1c:	429a      	cmp	r2, r3
 8000d1e:	d3b1      	bcc.n	8000c84 <oled_putc+0x3c>
 8000d20:	4b05      	ldr	r3, [pc, #20]	; (8000d38 <oled_putc+0xf0>)
 8000d22:	781b      	ldrb	r3, [r3, #0]
 8000d24:	3301      	adds	r3, #1
 8000d26:	b2da      	uxtb	r2, r3
 8000d28:	4b03      	ldr	r3, [pc, #12]	; (8000d38 <oled_putc+0xf0>)
 8000d2a:	701a      	strb	r2, [r3, #0]
 8000d2c:	46c0      	nop			; (mov r8, r8)
 8000d2e:	46bd      	mov	sp, r7
 8000d30:	b005      	add	sp, #20
 8000d32:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000d34:	20000859 	.word	0x20000859
 8000d38:	20000858 	.word	0x20000858
 8000d3c:	20000004 	.word	0x20000004

08000d40 <get_pix>:
 8000d40:	b590      	push	{r4, r7, lr}
 8000d42:	b083      	sub	sp, #12
 8000d44:	af00      	add	r7, sp, #0
 8000d46:	0004      	movs	r4, r0
 8000d48:	0008      	movs	r0, r1
 8000d4a:	0011      	movs	r1, r2
 8000d4c:	1dfb      	adds	r3, r7, #7
 8000d4e:	1c22      	adds	r2, r4, #0
 8000d50:	701a      	strb	r2, [r3, #0]
 8000d52:	1dbb      	adds	r3, r7, #6
 8000d54:	1c02      	adds	r2, r0, #0
 8000d56:	701a      	strb	r2, [r3, #0]
 8000d58:	1d7b      	adds	r3, r7, #5
 8000d5a:	1c0a      	adds	r2, r1, #0
 8000d5c:	701a      	strb	r2, [r3, #0]
 8000d5e:	1dfb      	adds	r3, r7, #7
 8000d60:	781a      	ldrb	r2, [r3, #0]
 8000d62:	0013      	movs	r3, r2
 8000d64:	009b      	lsls	r3, r3, #2
 8000d66:	189a      	adds	r2, r3, r2
 8000d68:	1dbb      	adds	r3, r7, #6
 8000d6a:	781b      	ldrb	r3, [r3, #0]
 8000d6c:	18d3      	adds	r3, r2, r3
 8000d6e:	4a08      	ldr	r2, [pc, #32]	; (8000d90 <get_pix+0x50>)
 8000d70:	5cd3      	ldrb	r3, [r2, r3]
 8000d72:	001a      	movs	r2, r3
 8000d74:	1d7b      	adds	r3, r7, #5
 8000d76:	781b      	ldrb	r3, [r3, #0]
 8000d78:	411a      	asrs	r2, r3
 8000d7a:	0013      	movs	r3, r2
 8000d7c:	2201      	movs	r2, #1
 8000d7e:	4013      	ands	r3, r2
 8000d80:	1e5a      	subs	r2, r3, #1
 8000d82:	4193      	sbcs	r3, r2
 8000d84:	b2db      	uxtb	r3, r3
 8000d86:	0018      	movs	r0, r3
 8000d88:	46bd      	mov	sp, r7
 8000d8a:	b003      	add	sp, #12
 8000d8c:	bd90      	pop	{r4, r7, pc}
 8000d8e:	46c0      	nop			; (mov r8, r8)
 8000d90:	0800100c 	.word	0x0800100c

08000d94 <NMI_Handler>:
 8000d94:	b580      	push	{r7, lr}
 8000d96:	af00      	add	r7, sp, #0
 8000d98:	46c0      	nop			; (mov r8, r8)
 8000d9a:	46bd      	mov	sp, r7
 8000d9c:	bd80      	pop	{r7, pc}

08000d9e <HardFault_Handler>:
 8000d9e:	b580      	push	{r7, lr}
 8000da0:	af00      	add	r7, sp, #0
 8000da2:	e7fe      	b.n	8000da2 <HardFault_Handler+0x4>

08000da4 <SVC_Handler>:
 8000da4:	b580      	push	{r7, lr}
 8000da6:	af00      	add	r7, sp, #0
 8000da8:	46c0      	nop			; (mov r8, r8)
 8000daa:	46bd      	mov	sp, r7
 8000dac:	bd80      	pop	{r7, pc}

08000dae <PendSV_Handler>:
 8000dae:	b580      	push	{r7, lr}
 8000db0:	af00      	add	r7, sp, #0
 8000db2:	46c0      	nop			; (mov r8, r8)
 8000db4:	46bd      	mov	sp, r7
 8000db6:	bd80      	pop	{r7, pc}

08000db8 <__libc_init_array>:
 8000db8:	b570      	push	{r4, r5, r6, lr}
 8000dba:	4e0d      	ldr	r6, [pc, #52]	; (8000df0 <__libc_init_array+0x38>)
 8000dbc:	4d0d      	ldr	r5, [pc, #52]	; (8000df4 <__libc_init_array+0x3c>)
 8000dbe:	1bad      	subs	r5, r5, r6
 8000dc0:	10ad      	asrs	r5, r5, #2
 8000dc2:	d006      	beq.n	8000dd2 <__libc_init_array+0x1a>
 8000dc4:	2400      	movs	r4, #0
 8000dc6:	00a3      	lsls	r3, r4, #2
 8000dc8:	58f3      	ldr	r3, [r6, r3]
 8000dca:	3401      	adds	r4, #1
 8000dcc:	4798      	blx	r3
 8000dce:	42a5      	cmp	r5, r4
 8000dd0:	d1f9      	bne.n	8000dc6 <__libc_init_array+0xe>
 8000dd2:	f000 f90f 	bl	8000ff4 <_init>
 8000dd6:	4e08      	ldr	r6, [pc, #32]	; (8000df8 <__libc_init_array+0x40>)
 8000dd8:	4d08      	ldr	r5, [pc, #32]	; (8000dfc <__libc_init_array+0x44>)
 8000dda:	1bad      	subs	r5, r5, r6
 8000ddc:	10ad      	asrs	r5, r5, #2
 8000dde:	d006      	beq.n	8000dee <__libc_init_array+0x36>
 8000de0:	2400      	movs	r4, #0
 8000de2:	00a3      	lsls	r3, r4, #2
 8000de4:	58f3      	ldr	r3, [r6, r3]
 8000de6:	3401      	adds	r4, #1
 8000de8:	4798      	blx	r3
 8000dea:	42a5      	cmp	r5, r4
 8000dec:	d1f9      	bne.n	8000de2 <__libc_init_array+0x2a>
 8000dee:	bd70      	pop	{r4, r5, r6, pc}
 8000df0:	0800150c 	.word	0x0800150c
 8000df4:	0800150c 	.word	0x0800150c
 8000df8:	0800150c 	.word	0x0800150c
 8000dfc:	08001514 	.word	0x08001514

08000e00 <memset>:
 8000e00:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000e02:	0783      	lsls	r3, r0, #30
 8000e04:	d046      	beq.n	8000e94 <memset+0x94>
 8000e06:	1e54      	subs	r4, r2, #1
 8000e08:	2a00      	cmp	r2, #0
 8000e0a:	d042      	beq.n	8000e92 <memset+0x92>
 8000e0c:	b2ce      	uxtb	r6, r1
 8000e0e:	0002      	movs	r2, r0
 8000e10:	2503      	movs	r5, #3
 8000e12:	e002      	b.n	8000e1a <memset+0x1a>
 8000e14:	001a      	movs	r2, r3
 8000e16:	3c01      	subs	r4, #1
 8000e18:	d33b      	bcc.n	8000e92 <memset+0x92>
 8000e1a:	1c53      	adds	r3, r2, #1
 8000e1c:	7016      	strb	r6, [r2, #0]
 8000e1e:	422b      	tst	r3, r5
 8000e20:	d1f8      	bne.n	8000e14 <memset+0x14>
 8000e22:	2c03      	cmp	r4, #3
 8000e24:	d92d      	bls.n	8000e82 <memset+0x82>
 8000e26:	22ff      	movs	r2, #255	; 0xff
 8000e28:	400a      	ands	r2, r1
 8000e2a:	0215      	lsls	r5, r2, #8
 8000e2c:	4315      	orrs	r5, r2
 8000e2e:	042a      	lsls	r2, r5, #16
 8000e30:	4315      	orrs	r5, r2
 8000e32:	2c0f      	cmp	r4, #15
 8000e34:	d916      	bls.n	8000e64 <memset+0x64>
 8000e36:	0027      	movs	r7, r4
 8000e38:	3f10      	subs	r7, #16
 8000e3a:	093f      	lsrs	r7, r7, #4
 8000e3c:	013e      	lsls	r6, r7, #4
 8000e3e:	46b4      	mov	ip, r6
 8000e40:	001e      	movs	r6, r3
 8000e42:	001a      	movs	r2, r3
 8000e44:	3610      	adds	r6, #16
 8000e46:	4466      	add	r6, ip
 8000e48:	6015      	str	r5, [r2, #0]
 8000e4a:	6055      	str	r5, [r2, #4]
 8000e4c:	6095      	str	r5, [r2, #8]
 8000e4e:	60d5      	str	r5, [r2, #12]
 8000e50:	3210      	adds	r2, #16
 8000e52:	42b2      	cmp	r2, r6
 8000e54:	d1f8      	bne.n	8000e48 <memset+0x48>
 8000e56:	220f      	movs	r2, #15
 8000e58:	3701      	adds	r7, #1
 8000e5a:	013f      	lsls	r7, r7, #4
 8000e5c:	19db      	adds	r3, r3, r7
 8000e5e:	4014      	ands	r4, r2
 8000e60:	2c03      	cmp	r4, #3
 8000e62:	d90e      	bls.n	8000e82 <memset+0x82>
 8000e64:	1f26      	subs	r6, r4, #4
 8000e66:	08b6      	lsrs	r6, r6, #2
 8000e68:	00b7      	lsls	r7, r6, #2
 8000e6a:	46bc      	mov	ip, r7
 8000e6c:	001a      	movs	r2, r3
 8000e6e:	1d1f      	adds	r7, r3, #4
 8000e70:	4467      	add	r7, ip
 8000e72:	c220      	stmia	r2!, {r5}
 8000e74:	42ba      	cmp	r2, r7
 8000e76:	d1fc      	bne.n	8000e72 <memset+0x72>
 8000e78:	2203      	movs	r2, #3
 8000e7a:	3601      	adds	r6, #1
 8000e7c:	00b6      	lsls	r6, r6, #2
 8000e7e:	199b      	adds	r3, r3, r6
 8000e80:	4014      	ands	r4, r2
 8000e82:	2c00      	cmp	r4, #0
 8000e84:	d005      	beq.n	8000e92 <memset+0x92>
 8000e86:	b2c9      	uxtb	r1, r1
 8000e88:	191c      	adds	r4, r3, r4
 8000e8a:	7019      	strb	r1, [r3, #0]
 8000e8c:	3301      	adds	r3, #1
 8000e8e:	429c      	cmp	r4, r3
 8000e90:	d1fb      	bne.n	8000e8a <memset+0x8a>
 8000e92:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000e94:	0014      	movs	r4, r2
 8000e96:	0003      	movs	r3, r0
 8000e98:	e7c3      	b.n	8000e22 <memset+0x22>
 8000e9a:	46c0      	nop			; (mov r8, r8)

08000e9c <register_fini>:
 8000e9c:	4b03      	ldr	r3, [pc, #12]	; (8000eac <register_fini+0x10>)
 8000e9e:	b510      	push	{r4, lr}
 8000ea0:	2b00      	cmp	r3, #0
 8000ea2:	d002      	beq.n	8000eaa <register_fini+0xe>
 8000ea4:	4802      	ldr	r0, [pc, #8]	; (8000eb0 <register_fini+0x14>)
 8000ea6:	f000 f805 	bl	8000eb4 <atexit>
 8000eaa:	bd10      	pop	{r4, pc}
 8000eac:	00000000 	.word	0x00000000
 8000eb0:	08000ec5 	.word	0x08000ec5

08000eb4 <atexit>:
 8000eb4:	b510      	push	{r4, lr}
 8000eb6:	0001      	movs	r1, r0
 8000eb8:	2300      	movs	r3, #0
 8000eba:	2200      	movs	r2, #0
 8000ebc:	2000      	movs	r0, #0
 8000ebe:	f000 f81f 	bl	8000f00 <__register_exitproc>
 8000ec2:	bd10      	pop	{r4, pc}

08000ec4 <__libc_fini_array>:
 8000ec4:	b570      	push	{r4, r5, r6, lr}
 8000ec6:	4b09      	ldr	r3, [pc, #36]	; (8000eec <__libc_fini_array+0x28>)
 8000ec8:	4c09      	ldr	r4, [pc, #36]	; (8000ef0 <__libc_fini_array+0x2c>)
 8000eca:	1ae4      	subs	r4, r4, r3
 8000ecc:	10a4      	asrs	r4, r4, #2
 8000ece:	d009      	beq.n	8000ee4 <__libc_fini_array+0x20>
 8000ed0:	4a08      	ldr	r2, [pc, #32]	; (8000ef4 <__libc_fini_array+0x30>)
 8000ed2:	18a5      	adds	r5, r4, r2
 8000ed4:	00ad      	lsls	r5, r5, #2
 8000ed6:	18ed      	adds	r5, r5, r3
 8000ed8:	682b      	ldr	r3, [r5, #0]
 8000eda:	3c01      	subs	r4, #1
 8000edc:	4798      	blx	r3
 8000ede:	3d04      	subs	r5, #4
 8000ee0:	2c00      	cmp	r4, #0
 8000ee2:	d1f9      	bne.n	8000ed8 <__libc_fini_array+0x14>
 8000ee4:	f000 f88c 	bl	8001000 <_fini>
 8000ee8:	bd70      	pop	{r4, r5, r6, pc}
 8000eea:	46c0      	nop			; (mov r8, r8)
 8000eec:	08001514 	.word	0x08001514
 8000ef0:	08001518 	.word	0x08001518
 8000ef4:	3fffffff 	.word	0x3fffffff

08000ef8 <__retarget_lock_acquire_recursive>:
 8000ef8:	4770      	bx	lr
 8000efa:	46c0      	nop			; (mov r8, r8)

08000efc <__retarget_lock_release_recursive>:
 8000efc:	4770      	bx	lr
 8000efe:	46c0      	nop			; (mov r8, r8)

08000f00 <__register_exitproc>:
 8000f00:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000f02:	464e      	mov	r6, r9
 8000f04:	4645      	mov	r5, r8
 8000f06:	46de      	mov	lr, fp
 8000f08:	4657      	mov	r7, sl
 8000f0a:	b5e0      	push	{r5, r6, r7, lr}
 8000f0c:	4d36      	ldr	r5, [pc, #216]	; (8000fe8 <__register_exitproc+0xe8>)
 8000f0e:	b083      	sub	sp, #12
 8000f10:	0006      	movs	r6, r0
 8000f12:	6828      	ldr	r0, [r5, #0]
 8000f14:	4698      	mov	r8, r3
 8000f16:	000f      	movs	r7, r1
 8000f18:	4691      	mov	r9, r2
 8000f1a:	f7ff ffed 	bl	8000ef8 <__retarget_lock_acquire_recursive>
 8000f1e:	4b33      	ldr	r3, [pc, #204]	; (8000fec <__register_exitproc+0xec>)
 8000f20:	681c      	ldr	r4, [r3, #0]
 8000f22:	23a4      	movs	r3, #164	; 0xa4
 8000f24:	005b      	lsls	r3, r3, #1
 8000f26:	58e0      	ldr	r0, [r4, r3]
 8000f28:	2800      	cmp	r0, #0
 8000f2a:	d052      	beq.n	8000fd2 <__register_exitproc+0xd2>
 8000f2c:	6843      	ldr	r3, [r0, #4]
 8000f2e:	2b1f      	cmp	r3, #31
 8000f30:	dc13      	bgt.n	8000f5a <__register_exitproc+0x5a>
 8000f32:	1c5a      	adds	r2, r3, #1
 8000f34:	9201      	str	r2, [sp, #4]
 8000f36:	2e00      	cmp	r6, #0
 8000f38:	d128      	bne.n	8000f8c <__register_exitproc+0x8c>
 8000f3a:	9a01      	ldr	r2, [sp, #4]
 8000f3c:	3302      	adds	r3, #2
 8000f3e:	009b      	lsls	r3, r3, #2
 8000f40:	6042      	str	r2, [r0, #4]
 8000f42:	501f      	str	r7, [r3, r0]
 8000f44:	6828      	ldr	r0, [r5, #0]
 8000f46:	f7ff ffd9 	bl	8000efc <__retarget_lock_release_recursive>
 8000f4a:	2000      	movs	r0, #0
 8000f4c:	b003      	add	sp, #12
 8000f4e:	bc3c      	pop	{r2, r3, r4, r5}
 8000f50:	4690      	mov	r8, r2
 8000f52:	4699      	mov	r9, r3
 8000f54:	46a2      	mov	sl, r4
 8000f56:	46ab      	mov	fp, r5
 8000f58:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000f5a:	4b25      	ldr	r3, [pc, #148]	; (8000ff0 <__register_exitproc+0xf0>)
 8000f5c:	2b00      	cmp	r3, #0
 8000f5e:	d03d      	beq.n	8000fdc <__register_exitproc+0xdc>
 8000f60:	20c8      	movs	r0, #200	; 0xc8
 8000f62:	0040      	lsls	r0, r0, #1
 8000f64:	e000      	b.n	8000f68 <__register_exitproc+0x68>
 8000f66:	bf00      	nop
 8000f68:	2800      	cmp	r0, #0
 8000f6a:	d037      	beq.n	8000fdc <__register_exitproc+0xdc>
 8000f6c:	22a4      	movs	r2, #164	; 0xa4
 8000f6e:	2300      	movs	r3, #0
 8000f70:	0052      	lsls	r2, r2, #1
 8000f72:	58a1      	ldr	r1, [r4, r2]
 8000f74:	6043      	str	r3, [r0, #4]
 8000f76:	6001      	str	r1, [r0, #0]
 8000f78:	50a0      	str	r0, [r4, r2]
 8000f7a:	3240      	adds	r2, #64	; 0x40
 8000f7c:	5083      	str	r3, [r0, r2]
 8000f7e:	3204      	adds	r2, #4
 8000f80:	5083      	str	r3, [r0, r2]
 8000f82:	3301      	adds	r3, #1
 8000f84:	9301      	str	r3, [sp, #4]
 8000f86:	2300      	movs	r3, #0
 8000f88:	2e00      	cmp	r6, #0
 8000f8a:	d0d6      	beq.n	8000f3a <__register_exitproc+0x3a>
 8000f8c:	009a      	lsls	r2, r3, #2
 8000f8e:	4692      	mov	sl, r2
 8000f90:	4482      	add	sl, r0
 8000f92:	464a      	mov	r2, r9
 8000f94:	2188      	movs	r1, #136	; 0x88
 8000f96:	4654      	mov	r4, sl
 8000f98:	5062      	str	r2, [r4, r1]
 8000f9a:	22c4      	movs	r2, #196	; 0xc4
 8000f9c:	0052      	lsls	r2, r2, #1
 8000f9e:	4691      	mov	r9, r2
 8000fa0:	4481      	add	r9, r0
 8000fa2:	464a      	mov	r2, r9
 8000fa4:	3987      	subs	r1, #135	; 0x87
 8000fa6:	4099      	lsls	r1, r3
 8000fa8:	6812      	ldr	r2, [r2, #0]
 8000faa:	468b      	mov	fp, r1
 8000fac:	430a      	orrs	r2, r1
 8000fae:	4694      	mov	ip, r2
 8000fb0:	464a      	mov	r2, r9
 8000fb2:	4661      	mov	r1, ip
 8000fb4:	6011      	str	r1, [r2, #0]
 8000fb6:	2284      	movs	r2, #132	; 0x84
 8000fb8:	4641      	mov	r1, r8
 8000fba:	0052      	lsls	r2, r2, #1
 8000fbc:	50a1      	str	r1, [r4, r2]
 8000fbe:	2e02      	cmp	r6, #2
 8000fc0:	d1bb      	bne.n	8000f3a <__register_exitproc+0x3a>
 8000fc2:	0002      	movs	r2, r0
 8000fc4:	465c      	mov	r4, fp
 8000fc6:	328d      	adds	r2, #141	; 0x8d
 8000fc8:	32ff      	adds	r2, #255	; 0xff
 8000fca:	6811      	ldr	r1, [r2, #0]
 8000fcc:	430c      	orrs	r4, r1
 8000fce:	6014      	str	r4, [r2, #0]
 8000fd0:	e7b3      	b.n	8000f3a <__register_exitproc+0x3a>
 8000fd2:	0020      	movs	r0, r4
 8000fd4:	304d      	adds	r0, #77	; 0x4d
 8000fd6:	30ff      	adds	r0, #255	; 0xff
 8000fd8:	50e0      	str	r0, [r4, r3]
 8000fda:	e7a7      	b.n	8000f2c <__register_exitproc+0x2c>
 8000fdc:	6828      	ldr	r0, [r5, #0]
 8000fde:	f7ff ff8d 	bl	8000efc <__retarget_lock_release_recursive>
 8000fe2:	2001      	movs	r0, #1
 8000fe4:	4240      	negs	r0, r0
 8000fe6:	e7b1      	b.n	8000f4c <__register_exitproc+0x4c>
 8000fe8:	20000438 	.word	0x20000438
 8000fec:	08001508 	.word	0x08001508
 8000ff0:	00000000 	.word	0x00000000

08000ff4 <_init>:
 8000ff4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000ff6:	46c0      	nop			; (mov r8, r8)
 8000ff8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8000ffa:	bc08      	pop	{r3}
 8000ffc:	469e      	mov	lr, r3
 8000ffe:	4770      	bx	lr

08001000 <_fini>:
 8001000:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001002:	46c0      	nop			; (mov r8, r8)
 8001004:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001006:	bc08      	pop	{r3}
 8001008:	469e      	mov	lr, r3
 800100a:	4770      	bx	lr
