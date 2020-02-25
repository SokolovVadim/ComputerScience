
build/blank.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       000000c0  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             000008e0  080000c0  080000c0  000100c0  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           00000004  080009a0  080009a0  000109a0  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000008  080009a4  080009a4  000109a4  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  080009ac  080009ac  000109ac  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             00000434  20000000  080009b0  00020000  2**3  CONTENTS, ALLOC, LOAD, DATA
  6 .bss              00000044  20000434  08000de4  00020434  2**2  ALLOC
  7 ._user_heap_stack 00000600  20000478  08000de4  00020478  2**0  ALLOC
  8 .ARM.attributes   00000028  00000000  00000000  00020434  2**0  CONTENTS, READONLY
  9 .debug_info       00000ecd  00000000  00000000  0002045c  2**0  CONTENTS, READONLY, DEBUGGING
 10 .debug_abbrev     00000373  00000000  00000000  00021329  2**0  CONTENTS, READONLY, DEBUGGING
 11 .debug_loc        00000740  00000000  00000000  0002169c  2**0  CONTENTS, READONLY, DEBUGGING
 12 .debug_aranges    00000178  00000000  00000000  00021ddc  2**0  CONTENTS, READONLY, DEBUGGING
 13 .debug_ranges     00000148  00000000  00000000  00021f54  2**0  CONTENTS, READONLY, DEBUGGING
 14 .debug_line       000005ac  00000000  00000000  0002209c  2**0  CONTENTS, READONLY, DEBUGGING
 15 .debug_str        00000825  00000000  00000000  00022648  2**0  CONTENTS, READONLY, DEBUGGING
 16 .comment          0000007f  00000000  00000000  00022e6d  2**0  CONTENTS, READONLY
 17 .debug_frame      00000678  00000000  00000000  00022eec  2**2  CONTENTS, READONLY, DEBUGGING

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
 80000dc:	20000434 	.word	0x20000434
 80000e0:	00000000 	.word	0x00000000
 80000e4:	08000988 	.word	0x08000988

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
 8000100:	20000438 	.word	0x20000438
 8000104:	08000988 	.word	0x08000988

08000108 <__udivsi3>:
 8000108:	2200      	movs	r2, #0
 800010a:	0843      	lsrs	r3, r0, #1
 800010c:	428b      	cmp	r3, r1
 800010e:	d374      	bcc.n	80001fa <__udivsi3+0xf2>
 8000110:	0903      	lsrs	r3, r0, #4
 8000112:	428b      	cmp	r3, r1
 8000114:	d35f      	bcc.n	80001d6 <__udivsi3+0xce>
 8000116:	0a03      	lsrs	r3, r0, #8
 8000118:	428b      	cmp	r3, r1
 800011a:	d344      	bcc.n	80001a6 <__udivsi3+0x9e>
 800011c:	0b03      	lsrs	r3, r0, #12
 800011e:	428b      	cmp	r3, r1
 8000120:	d328      	bcc.n	8000174 <__udivsi3+0x6c>
 8000122:	0c03      	lsrs	r3, r0, #16
 8000124:	428b      	cmp	r3, r1
 8000126:	d30d      	bcc.n	8000144 <__udivsi3+0x3c>
 8000128:	22ff      	movs	r2, #255	; 0xff
 800012a:	0209      	lsls	r1, r1, #8
 800012c:	ba12      	rev	r2, r2
 800012e:	0c03      	lsrs	r3, r0, #16
 8000130:	428b      	cmp	r3, r1
 8000132:	d302      	bcc.n	800013a <__udivsi3+0x32>
 8000134:	1212      	asrs	r2, r2, #8
 8000136:	0209      	lsls	r1, r1, #8
 8000138:	d065      	beq.n	8000206 <__udivsi3+0xfe>
 800013a:	0b03      	lsrs	r3, r0, #12
 800013c:	428b      	cmp	r3, r1
 800013e:	d319      	bcc.n	8000174 <__udivsi3+0x6c>
 8000140:	e000      	b.n	8000144 <__udivsi3+0x3c>
 8000142:	0a09      	lsrs	r1, r1, #8
 8000144:	0bc3      	lsrs	r3, r0, #15
 8000146:	428b      	cmp	r3, r1
 8000148:	d301      	bcc.n	800014e <__udivsi3+0x46>
 800014a:	03cb      	lsls	r3, r1, #15
 800014c:	1ac0      	subs	r0, r0, r3
 800014e:	4152      	adcs	r2, r2
 8000150:	0b83      	lsrs	r3, r0, #14
 8000152:	428b      	cmp	r3, r1
 8000154:	d301      	bcc.n	800015a <__udivsi3+0x52>
 8000156:	038b      	lsls	r3, r1, #14
 8000158:	1ac0      	subs	r0, r0, r3
 800015a:	4152      	adcs	r2, r2
 800015c:	0b43      	lsrs	r3, r0, #13
 800015e:	428b      	cmp	r3, r1
 8000160:	d301      	bcc.n	8000166 <__udivsi3+0x5e>
 8000162:	034b      	lsls	r3, r1, #13
 8000164:	1ac0      	subs	r0, r0, r3
 8000166:	4152      	adcs	r2, r2
 8000168:	0b03      	lsrs	r3, r0, #12
 800016a:	428b      	cmp	r3, r1
 800016c:	d301      	bcc.n	8000172 <__udivsi3+0x6a>
 800016e:	030b      	lsls	r3, r1, #12
 8000170:	1ac0      	subs	r0, r0, r3
 8000172:	4152      	adcs	r2, r2
 8000174:	0ac3      	lsrs	r3, r0, #11
 8000176:	428b      	cmp	r3, r1
 8000178:	d301      	bcc.n	800017e <__udivsi3+0x76>
 800017a:	02cb      	lsls	r3, r1, #11
 800017c:	1ac0      	subs	r0, r0, r3
 800017e:	4152      	adcs	r2, r2
 8000180:	0a83      	lsrs	r3, r0, #10
 8000182:	428b      	cmp	r3, r1
 8000184:	d301      	bcc.n	800018a <__udivsi3+0x82>
 8000186:	028b      	lsls	r3, r1, #10
 8000188:	1ac0      	subs	r0, r0, r3
 800018a:	4152      	adcs	r2, r2
 800018c:	0a43      	lsrs	r3, r0, #9
 800018e:	428b      	cmp	r3, r1
 8000190:	d301      	bcc.n	8000196 <__udivsi3+0x8e>
 8000192:	024b      	lsls	r3, r1, #9
 8000194:	1ac0      	subs	r0, r0, r3
 8000196:	4152      	adcs	r2, r2
 8000198:	0a03      	lsrs	r3, r0, #8
 800019a:	428b      	cmp	r3, r1
 800019c:	d301      	bcc.n	80001a2 <__udivsi3+0x9a>
 800019e:	020b      	lsls	r3, r1, #8
 80001a0:	1ac0      	subs	r0, r0, r3
 80001a2:	4152      	adcs	r2, r2
 80001a4:	d2cd      	bcs.n	8000142 <__udivsi3+0x3a>
 80001a6:	09c3      	lsrs	r3, r0, #7
 80001a8:	428b      	cmp	r3, r1
 80001aa:	d301      	bcc.n	80001b0 <__udivsi3+0xa8>
 80001ac:	01cb      	lsls	r3, r1, #7
 80001ae:	1ac0      	subs	r0, r0, r3
 80001b0:	4152      	adcs	r2, r2
 80001b2:	0983      	lsrs	r3, r0, #6
 80001b4:	428b      	cmp	r3, r1
 80001b6:	d301      	bcc.n	80001bc <__udivsi3+0xb4>
 80001b8:	018b      	lsls	r3, r1, #6
 80001ba:	1ac0      	subs	r0, r0, r3
 80001bc:	4152      	adcs	r2, r2
 80001be:	0943      	lsrs	r3, r0, #5
 80001c0:	428b      	cmp	r3, r1
 80001c2:	d301      	bcc.n	80001c8 <__udivsi3+0xc0>
 80001c4:	014b      	lsls	r3, r1, #5
 80001c6:	1ac0      	subs	r0, r0, r3
 80001c8:	4152      	adcs	r2, r2
 80001ca:	0903      	lsrs	r3, r0, #4
 80001cc:	428b      	cmp	r3, r1
 80001ce:	d301      	bcc.n	80001d4 <__udivsi3+0xcc>
 80001d0:	010b      	lsls	r3, r1, #4
 80001d2:	1ac0      	subs	r0, r0, r3
 80001d4:	4152      	adcs	r2, r2
 80001d6:	08c3      	lsrs	r3, r0, #3
 80001d8:	428b      	cmp	r3, r1
 80001da:	d301      	bcc.n	80001e0 <__udivsi3+0xd8>
 80001dc:	00cb      	lsls	r3, r1, #3
 80001de:	1ac0      	subs	r0, r0, r3
 80001e0:	4152      	adcs	r2, r2
 80001e2:	0883      	lsrs	r3, r0, #2
 80001e4:	428b      	cmp	r3, r1
 80001e6:	d301      	bcc.n	80001ec <__udivsi3+0xe4>
 80001e8:	008b      	lsls	r3, r1, #2
 80001ea:	1ac0      	subs	r0, r0, r3
 80001ec:	4152      	adcs	r2, r2
 80001ee:	0843      	lsrs	r3, r0, #1
 80001f0:	428b      	cmp	r3, r1
 80001f2:	d301      	bcc.n	80001f8 <__udivsi3+0xf0>
 80001f4:	004b      	lsls	r3, r1, #1
 80001f6:	1ac0      	subs	r0, r0, r3
 80001f8:	4152      	adcs	r2, r2
 80001fa:	1a41      	subs	r1, r0, r1
 80001fc:	d200      	bcs.n	8000200 <__udivsi3+0xf8>
 80001fe:	4601      	mov	r1, r0
 8000200:	4152      	adcs	r2, r2
 8000202:	4610      	mov	r0, r2
 8000204:	4770      	bx	lr
 8000206:	e7ff      	b.n	8000208 <__udivsi3+0x100>
 8000208:	b501      	push	{r0, lr}
 800020a:	2000      	movs	r0, #0
 800020c:	f000 f806 	bl	800021c <__aeabi_idiv0>
 8000210:	bd02      	pop	{r1, pc}
 8000212:	46c0      	nop			; (mov r8, r8)

08000214 <__aeabi_uidivmod>:
 8000214:	2900      	cmp	r1, #0
 8000216:	d0f7      	beq.n	8000208 <__udivsi3+0x100>
 8000218:	e776      	b.n	8000108 <__udivsi3>
 800021a:	4770      	bx	lr

0800021c <__aeabi_idiv0>:
 800021c:	4770      	bx	lr
 800021e:	46c0      	nop			; (mov r8, r8)

08000220 <Reset_Handler>:
 8000220:	480d      	ldr	r0, [pc, #52]	; (8000258 <LoopForever+0x2>)
 8000222:	4685      	mov	sp, r0
 8000224:	480d      	ldr	r0, [pc, #52]	; (800025c <LoopForever+0x6>)
 8000226:	490e      	ldr	r1, [pc, #56]	; (8000260 <LoopForever+0xa>)
 8000228:	4a0e      	ldr	r2, [pc, #56]	; (8000264 <LoopForever+0xe>)
 800022a:	2300      	movs	r3, #0
 800022c:	e002      	b.n	8000234 <LoopCopyDataInit>

0800022e <CopyDataInit>:
 800022e:	58d4      	ldr	r4, [r2, r3]
 8000230:	50c4      	str	r4, [r0, r3]
 8000232:	3304      	adds	r3, #4

08000234 <LoopCopyDataInit>:
 8000234:	18c4      	adds	r4, r0, r3
 8000236:	428c      	cmp	r4, r1
 8000238:	d3f9      	bcc.n	800022e <CopyDataInit>
 800023a:	4a0b      	ldr	r2, [pc, #44]	; (8000268 <LoopForever+0x12>)
 800023c:	4c0b      	ldr	r4, [pc, #44]	; (800026c <LoopForever+0x16>)
 800023e:	2300      	movs	r3, #0
 8000240:	e001      	b.n	8000246 <LoopFillZerobss>

08000242 <FillZerobss>:
 8000242:	6013      	str	r3, [r2, #0]
 8000244:	3204      	adds	r2, #4

08000246 <LoopFillZerobss>:
 8000246:	42a2      	cmp	r2, r4
 8000248:	d3fb      	bcc.n	8000242 <FillZerobss>
 800024a:	f000 fa77 	bl	800073c <SystemInit>
 800024e:	f000 facb 	bl	80007e8 <__libc_init_array>
 8000252:	f000 fa67 	bl	8000724 <main>

08000256 <LoopForever>:
 8000256:	e7fe      	b.n	8000256 <LoopForever>
 8000258:	20002000 	.word	0x20002000
 800025c:	20000000 	.word	0x20000000
 8000260:	20000434 	.word	0x20000434
 8000264:	080009b0 	.word	0x080009b0
 8000268:	20000434 	.word	0x20000434
 800026c:	20000478 	.word	0x20000478

08000270 <ADC1_COMP_IRQHandler>:
 8000270:	e7fe      	b.n	8000270 <ADC1_COMP_IRQHandler>
	...

08000274 <NVIC_SetPriority>:
 8000274:	b590      	push	{r4, r7, lr}
 8000276:	b083      	sub	sp, #12
 8000278:	af00      	add	r7, sp, #0
 800027a:	0002      	movs	r2, r0
 800027c:	6039      	str	r1, [r7, #0]
 800027e:	1dfb      	adds	r3, r7, #7
 8000280:	701a      	strb	r2, [r3, #0]
 8000282:	1dfb      	adds	r3, r7, #7
 8000284:	781b      	ldrb	r3, [r3, #0]
 8000286:	2b7f      	cmp	r3, #127	; 0x7f
 8000288:	d932      	bls.n	80002f0 <NVIC_SetPriority+0x7c>
 800028a:	4a2f      	ldr	r2, [pc, #188]	; (8000348 <NVIC_SetPriority+0xd4>)
 800028c:	1dfb      	adds	r3, r7, #7
 800028e:	781b      	ldrb	r3, [r3, #0]
 8000290:	0019      	movs	r1, r3
 8000292:	230f      	movs	r3, #15
 8000294:	400b      	ands	r3, r1
 8000296:	3b08      	subs	r3, #8
 8000298:	089b      	lsrs	r3, r3, #2
 800029a:	3306      	adds	r3, #6
 800029c:	009b      	lsls	r3, r3, #2
 800029e:	18d3      	adds	r3, r2, r3
 80002a0:	3304      	adds	r3, #4
 80002a2:	681b      	ldr	r3, [r3, #0]
 80002a4:	1dfa      	adds	r2, r7, #7
 80002a6:	7812      	ldrb	r2, [r2, #0]
 80002a8:	0011      	movs	r1, r2
 80002aa:	2203      	movs	r2, #3
 80002ac:	400a      	ands	r2, r1
 80002ae:	00d2      	lsls	r2, r2, #3
 80002b0:	21ff      	movs	r1, #255	; 0xff
 80002b2:	4091      	lsls	r1, r2
 80002b4:	000a      	movs	r2, r1
 80002b6:	43d2      	mvns	r2, r2
 80002b8:	401a      	ands	r2, r3
 80002ba:	0011      	movs	r1, r2
 80002bc:	683b      	ldr	r3, [r7, #0]
 80002be:	019b      	lsls	r3, r3, #6
 80002c0:	22ff      	movs	r2, #255	; 0xff
 80002c2:	401a      	ands	r2, r3
 80002c4:	1dfb      	adds	r3, r7, #7
 80002c6:	781b      	ldrb	r3, [r3, #0]
 80002c8:	0018      	movs	r0, r3
 80002ca:	2303      	movs	r3, #3
 80002cc:	4003      	ands	r3, r0
 80002ce:	00db      	lsls	r3, r3, #3
 80002d0:	409a      	lsls	r2, r3
 80002d2:	481d      	ldr	r0, [pc, #116]	; (8000348 <NVIC_SetPriority+0xd4>)
 80002d4:	1dfb      	adds	r3, r7, #7
 80002d6:	781b      	ldrb	r3, [r3, #0]
 80002d8:	001c      	movs	r4, r3
 80002da:	230f      	movs	r3, #15
 80002dc:	4023      	ands	r3, r4
 80002de:	3b08      	subs	r3, #8
 80002e0:	089b      	lsrs	r3, r3, #2
 80002e2:	430a      	orrs	r2, r1
 80002e4:	3306      	adds	r3, #6
 80002e6:	009b      	lsls	r3, r3, #2
 80002e8:	18c3      	adds	r3, r0, r3
 80002ea:	3304      	adds	r3, #4
 80002ec:	601a      	str	r2, [r3, #0]
 80002ee:	e027      	b.n	8000340 <NVIC_SetPriority+0xcc>
 80002f0:	4a16      	ldr	r2, [pc, #88]	; (800034c <NVIC_SetPriority+0xd8>)
 80002f2:	1dfb      	adds	r3, r7, #7
 80002f4:	781b      	ldrb	r3, [r3, #0]
 80002f6:	b25b      	sxtb	r3, r3
 80002f8:	089b      	lsrs	r3, r3, #2
 80002fa:	33c0      	adds	r3, #192	; 0xc0
 80002fc:	009b      	lsls	r3, r3, #2
 80002fe:	589b      	ldr	r3, [r3, r2]
 8000300:	1dfa      	adds	r2, r7, #7
 8000302:	7812      	ldrb	r2, [r2, #0]
 8000304:	0011      	movs	r1, r2
 8000306:	2203      	movs	r2, #3
 8000308:	400a      	ands	r2, r1
 800030a:	00d2      	lsls	r2, r2, #3
 800030c:	21ff      	movs	r1, #255	; 0xff
 800030e:	4091      	lsls	r1, r2
 8000310:	000a      	movs	r2, r1
 8000312:	43d2      	mvns	r2, r2
 8000314:	401a      	ands	r2, r3
 8000316:	0011      	movs	r1, r2
 8000318:	683b      	ldr	r3, [r7, #0]
 800031a:	019b      	lsls	r3, r3, #6
 800031c:	22ff      	movs	r2, #255	; 0xff
 800031e:	401a      	ands	r2, r3
 8000320:	1dfb      	adds	r3, r7, #7
 8000322:	781b      	ldrb	r3, [r3, #0]
 8000324:	0018      	movs	r0, r3
 8000326:	2303      	movs	r3, #3
 8000328:	4003      	ands	r3, r0
 800032a:	00db      	lsls	r3, r3, #3
 800032c:	409a      	lsls	r2, r3
 800032e:	4807      	ldr	r0, [pc, #28]	; (800034c <NVIC_SetPriority+0xd8>)
 8000330:	1dfb      	adds	r3, r7, #7
 8000332:	781b      	ldrb	r3, [r3, #0]
 8000334:	b25b      	sxtb	r3, r3
 8000336:	089b      	lsrs	r3, r3, #2
 8000338:	430a      	orrs	r2, r1
 800033a:	33c0      	adds	r3, #192	; 0xc0
 800033c:	009b      	lsls	r3, r3, #2
 800033e:	501a      	str	r2, [r3, r0]
 8000340:	46c0      	nop			; (mov r8, r8)
 8000342:	46bd      	mov	sp, r7
 8000344:	b003      	add	sp, #12
 8000346:	bd90      	pop	{r4, r7, pc}
 8000348:	e000ed00 	.word	0xe000ed00
 800034c:	e000e100 	.word	0xe000e100

08000350 <LL_RCC_HSI_Enable>:
 8000350:	b580      	push	{r7, lr}
 8000352:	af00      	add	r7, sp, #0
 8000354:	4b04      	ldr	r3, [pc, #16]	; (8000368 <LL_RCC_HSI_Enable+0x18>)
 8000356:	681a      	ldr	r2, [r3, #0]
 8000358:	4b03      	ldr	r3, [pc, #12]	; (8000368 <LL_RCC_HSI_Enable+0x18>)
 800035a:	2101      	movs	r1, #1
 800035c:	430a      	orrs	r2, r1
 800035e:	601a      	str	r2, [r3, #0]
 8000360:	46c0      	nop			; (mov r8, r8)
 8000362:	46bd      	mov	sp, r7
 8000364:	bd80      	pop	{r7, pc}
 8000366:	46c0      	nop			; (mov r8, r8)
 8000368:	40021000 	.word	0x40021000

0800036c <LL_RCC_HSI_IsReady>:
 800036c:	b580      	push	{r7, lr}
 800036e:	af00      	add	r7, sp, #0
 8000370:	4b05      	ldr	r3, [pc, #20]	; (8000388 <LL_RCC_HSI_IsReady+0x1c>)
 8000372:	681b      	ldr	r3, [r3, #0]
 8000374:	2202      	movs	r2, #2
 8000376:	4013      	ands	r3, r2
 8000378:	3b02      	subs	r3, #2
 800037a:	425a      	negs	r2, r3
 800037c:	4153      	adcs	r3, r2
 800037e:	b2db      	uxtb	r3, r3
 8000380:	0018      	movs	r0, r3
 8000382:	46bd      	mov	sp, r7
 8000384:	bd80      	pop	{r7, pc}
 8000386:	46c0      	nop			; (mov r8, r8)
 8000388:	40021000 	.word	0x40021000

0800038c <LL_RCC_SetSysClkSource>:
 800038c:	b580      	push	{r7, lr}
 800038e:	b082      	sub	sp, #8
 8000390:	af00      	add	r7, sp, #0
 8000392:	6078      	str	r0, [r7, #4]
 8000394:	4b06      	ldr	r3, [pc, #24]	; (80003b0 <LL_RCC_SetSysClkSource+0x24>)
 8000396:	685b      	ldr	r3, [r3, #4]
 8000398:	2203      	movs	r2, #3
 800039a:	4393      	bics	r3, r2
 800039c:	0019      	movs	r1, r3
 800039e:	4b04      	ldr	r3, [pc, #16]	; (80003b0 <LL_RCC_SetSysClkSource+0x24>)
 80003a0:	687a      	ldr	r2, [r7, #4]
 80003a2:	430a      	orrs	r2, r1
 80003a4:	605a      	str	r2, [r3, #4]
 80003a6:	46c0      	nop			; (mov r8, r8)
 80003a8:	46bd      	mov	sp, r7
 80003aa:	b002      	add	sp, #8
 80003ac:	bd80      	pop	{r7, pc}
 80003ae:	46c0      	nop			; (mov r8, r8)
 80003b0:	40021000 	.word	0x40021000

080003b4 <LL_RCC_GetSysClkSource>:
 80003b4:	b580      	push	{r7, lr}
 80003b6:	af00      	add	r7, sp, #0
 80003b8:	4b03      	ldr	r3, [pc, #12]	; (80003c8 <LL_RCC_GetSysClkSource+0x14>)
 80003ba:	685b      	ldr	r3, [r3, #4]
 80003bc:	220c      	movs	r2, #12
 80003be:	4013      	ands	r3, r2
 80003c0:	0018      	movs	r0, r3
 80003c2:	46bd      	mov	sp, r7
 80003c4:	bd80      	pop	{r7, pc}
 80003c6:	46c0      	nop			; (mov r8, r8)
 80003c8:	40021000 	.word	0x40021000

080003cc <LL_RCC_SetAHBPrescaler>:
 80003cc:	b580      	push	{r7, lr}
 80003ce:	b082      	sub	sp, #8
 80003d0:	af00      	add	r7, sp, #0
 80003d2:	6078      	str	r0, [r7, #4]
 80003d4:	4b06      	ldr	r3, [pc, #24]	; (80003f0 <LL_RCC_SetAHBPrescaler+0x24>)
 80003d6:	685b      	ldr	r3, [r3, #4]
 80003d8:	22f0      	movs	r2, #240	; 0xf0
 80003da:	4393      	bics	r3, r2
 80003dc:	0019      	movs	r1, r3
 80003de:	4b04      	ldr	r3, [pc, #16]	; (80003f0 <LL_RCC_SetAHBPrescaler+0x24>)
 80003e0:	687a      	ldr	r2, [r7, #4]
 80003e2:	430a      	orrs	r2, r1
 80003e4:	605a      	str	r2, [r3, #4]
 80003e6:	46c0      	nop			; (mov r8, r8)
 80003e8:	46bd      	mov	sp, r7
 80003ea:	b002      	add	sp, #8
 80003ec:	bd80      	pop	{r7, pc}
 80003ee:	46c0      	nop			; (mov r8, r8)
 80003f0:	40021000 	.word	0x40021000

080003f4 <LL_RCC_SetAPB1Prescaler>:
 80003f4:	b580      	push	{r7, lr}
 80003f6:	b082      	sub	sp, #8
 80003f8:	af00      	add	r7, sp, #0
 80003fa:	6078      	str	r0, [r7, #4]
 80003fc:	4b06      	ldr	r3, [pc, #24]	; (8000418 <LL_RCC_SetAPB1Prescaler+0x24>)
 80003fe:	685b      	ldr	r3, [r3, #4]
 8000400:	4a06      	ldr	r2, [pc, #24]	; (800041c <LL_RCC_SetAPB1Prescaler+0x28>)
 8000402:	4013      	ands	r3, r2
 8000404:	0019      	movs	r1, r3
 8000406:	4b04      	ldr	r3, [pc, #16]	; (8000418 <LL_RCC_SetAPB1Prescaler+0x24>)
 8000408:	687a      	ldr	r2, [r7, #4]
 800040a:	430a      	orrs	r2, r1
 800040c:	605a      	str	r2, [r3, #4]
 800040e:	46c0      	nop			; (mov r8, r8)
 8000410:	46bd      	mov	sp, r7
 8000412:	b002      	add	sp, #8
 8000414:	bd80      	pop	{r7, pc}
 8000416:	46c0      	nop			; (mov r8, r8)
 8000418:	40021000 	.word	0x40021000
 800041c:	fffff8ff 	.word	0xfffff8ff

08000420 <LL_RCC_PLL_Enable>:
 8000420:	b580      	push	{r7, lr}
 8000422:	af00      	add	r7, sp, #0
 8000424:	4b04      	ldr	r3, [pc, #16]	; (8000438 <LL_RCC_PLL_Enable+0x18>)
 8000426:	681a      	ldr	r2, [r3, #0]
 8000428:	4b03      	ldr	r3, [pc, #12]	; (8000438 <LL_RCC_PLL_Enable+0x18>)
 800042a:	2180      	movs	r1, #128	; 0x80
 800042c:	0449      	lsls	r1, r1, #17
 800042e:	430a      	orrs	r2, r1
 8000430:	601a      	str	r2, [r3, #0]
 8000432:	46c0      	nop			; (mov r8, r8)
 8000434:	46bd      	mov	sp, r7
 8000436:	bd80      	pop	{r7, pc}
 8000438:	40021000 	.word	0x40021000

0800043c <LL_RCC_PLL_IsReady>:
 800043c:	b580      	push	{r7, lr}
 800043e:	af00      	add	r7, sp, #0
 8000440:	4b07      	ldr	r3, [pc, #28]	; (8000460 <LL_RCC_PLL_IsReady+0x24>)
 8000442:	681a      	ldr	r2, [r3, #0]
 8000444:	2380      	movs	r3, #128	; 0x80
 8000446:	049b      	lsls	r3, r3, #18
 8000448:	4013      	ands	r3, r2
 800044a:	22fe      	movs	r2, #254	; 0xfe
 800044c:	0612      	lsls	r2, r2, #24
 800044e:	4694      	mov	ip, r2
 8000450:	4463      	add	r3, ip
 8000452:	425a      	negs	r2, r3
 8000454:	4153      	adcs	r3, r2
 8000456:	b2db      	uxtb	r3, r3
 8000458:	0018      	movs	r0, r3
 800045a:	46bd      	mov	sp, r7
 800045c:	bd80      	pop	{r7, pc}
 800045e:	46c0      	nop			; (mov r8, r8)
 8000460:	40021000 	.word	0x40021000

08000464 <LL_RCC_PLL_ConfigDomain_SYS>:
 8000464:	b580      	push	{r7, lr}
 8000466:	b082      	sub	sp, #8
 8000468:	af00      	add	r7, sp, #0
 800046a:	6078      	str	r0, [r7, #4]
 800046c:	6039      	str	r1, [r7, #0]
 800046e:	4b0e      	ldr	r3, [pc, #56]	; (80004a8 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000470:	685b      	ldr	r3, [r3, #4]
 8000472:	4a0e      	ldr	r2, [pc, #56]	; (80004ac <LL_RCC_PLL_ConfigDomain_SYS+0x48>)
 8000474:	4013      	ands	r3, r2
 8000476:	0019      	movs	r1, r3
 8000478:	687a      	ldr	r2, [r7, #4]
 800047a:	2380      	movs	r3, #128	; 0x80
 800047c:	025b      	lsls	r3, r3, #9
 800047e:	401a      	ands	r2, r3
 8000480:	683b      	ldr	r3, [r7, #0]
 8000482:	431a      	orrs	r2, r3
 8000484:	4b08      	ldr	r3, [pc, #32]	; (80004a8 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000486:	430a      	orrs	r2, r1
 8000488:	605a      	str	r2, [r3, #4]
 800048a:	4b07      	ldr	r3, [pc, #28]	; (80004a8 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 800048c:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 800048e:	220f      	movs	r2, #15
 8000490:	4393      	bics	r3, r2
 8000492:	0019      	movs	r1, r3
 8000494:	687b      	ldr	r3, [r7, #4]
 8000496:	220f      	movs	r2, #15
 8000498:	401a      	ands	r2, r3
 800049a:	4b03      	ldr	r3, [pc, #12]	; (80004a8 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 800049c:	430a      	orrs	r2, r1
 800049e:	62da      	str	r2, [r3, #44]	; 0x2c
 80004a0:	46c0      	nop			; (mov r8, r8)
 80004a2:	46bd      	mov	sp, r7
 80004a4:	b002      	add	sp, #8
 80004a6:	bd80      	pop	{r7, pc}
 80004a8:	40021000 	.word	0x40021000
 80004ac:	ffc2ffff 	.word	0xffc2ffff

080004b0 <LL_FLASH_SetLatency>:
 80004b0:	b580      	push	{r7, lr}
 80004b2:	b082      	sub	sp, #8
 80004b4:	af00      	add	r7, sp, #0
 80004b6:	6078      	str	r0, [r7, #4]
 80004b8:	4b06      	ldr	r3, [pc, #24]	; (80004d4 <LL_FLASH_SetLatency+0x24>)
 80004ba:	681b      	ldr	r3, [r3, #0]
 80004bc:	2201      	movs	r2, #1
 80004be:	4393      	bics	r3, r2
 80004c0:	0019      	movs	r1, r3
 80004c2:	4b04      	ldr	r3, [pc, #16]	; (80004d4 <LL_FLASH_SetLatency+0x24>)
 80004c4:	687a      	ldr	r2, [r7, #4]
 80004c6:	430a      	orrs	r2, r1
 80004c8:	601a      	str	r2, [r3, #0]
 80004ca:	46c0      	nop			; (mov r8, r8)
 80004cc:	46bd      	mov	sp, r7
 80004ce:	b002      	add	sp, #8
 80004d0:	bd80      	pop	{r7, pc}
 80004d2:	46c0      	nop			; (mov r8, r8)
 80004d4:	40022000 	.word	0x40022000

080004d8 <LL_AHB1_GRP1_EnableClock>:
 80004d8:	b580      	push	{r7, lr}
 80004da:	b084      	sub	sp, #16
 80004dc:	af00      	add	r7, sp, #0
 80004de:	6078      	str	r0, [r7, #4]
 80004e0:	4b07      	ldr	r3, [pc, #28]	; (8000500 <LL_AHB1_GRP1_EnableClock+0x28>)
 80004e2:	6959      	ldr	r1, [r3, #20]
 80004e4:	4b06      	ldr	r3, [pc, #24]	; (8000500 <LL_AHB1_GRP1_EnableClock+0x28>)
 80004e6:	687a      	ldr	r2, [r7, #4]
 80004e8:	430a      	orrs	r2, r1
 80004ea:	615a      	str	r2, [r3, #20]
 80004ec:	4b04      	ldr	r3, [pc, #16]	; (8000500 <LL_AHB1_GRP1_EnableClock+0x28>)
 80004ee:	695b      	ldr	r3, [r3, #20]
 80004f0:	687a      	ldr	r2, [r7, #4]
 80004f2:	4013      	ands	r3, r2
 80004f4:	60fb      	str	r3, [r7, #12]
 80004f6:	68fb      	ldr	r3, [r7, #12]
 80004f8:	46c0      	nop			; (mov r8, r8)
 80004fa:	46bd      	mov	sp, r7
 80004fc:	b004      	add	sp, #16
 80004fe:	bd80      	pop	{r7, pc}
 8000500:	40021000 	.word	0x40021000

08000504 <LL_GPIO_SetPinMode>:
 8000504:	b580      	push	{r7, lr}
 8000506:	b084      	sub	sp, #16
 8000508:	af00      	add	r7, sp, #0
 800050a:	60f8      	str	r0, [r7, #12]
 800050c:	60b9      	str	r1, [r7, #8]
 800050e:	607a      	str	r2, [r7, #4]
 8000510:	68fb      	ldr	r3, [r7, #12]
 8000512:	6819      	ldr	r1, [r3, #0]
 8000514:	68bb      	ldr	r3, [r7, #8]
 8000516:	68ba      	ldr	r2, [r7, #8]
 8000518:	435a      	muls	r2, r3
 800051a:	0013      	movs	r3, r2
 800051c:	005b      	lsls	r3, r3, #1
 800051e:	189b      	adds	r3, r3, r2
 8000520:	43db      	mvns	r3, r3
 8000522:	400b      	ands	r3, r1
 8000524:	001a      	movs	r2, r3
 8000526:	68bb      	ldr	r3, [r7, #8]
 8000528:	68b9      	ldr	r1, [r7, #8]
 800052a:	434b      	muls	r3, r1
 800052c:	6879      	ldr	r1, [r7, #4]
 800052e:	434b      	muls	r3, r1
 8000530:	431a      	orrs	r2, r3
 8000532:	68fb      	ldr	r3, [r7, #12]
 8000534:	601a      	str	r2, [r3, #0]
 8000536:	46c0      	nop			; (mov r8, r8)
 8000538:	46bd      	mov	sp, r7
 800053a:	b004      	add	sp, #16
 800053c:	bd80      	pop	{r7, pc}

0800053e <LL_GPIO_SetOutputPin>:
 800053e:	b580      	push	{r7, lr}
 8000540:	b082      	sub	sp, #8
 8000542:	af00      	add	r7, sp, #0
 8000544:	6078      	str	r0, [r7, #4]
 8000546:	6039      	str	r1, [r7, #0]
 8000548:	687b      	ldr	r3, [r7, #4]
 800054a:	683a      	ldr	r2, [r7, #0]
 800054c:	619a      	str	r2, [r3, #24]
 800054e:	46c0      	nop			; (mov r8, r8)
 8000550:	46bd      	mov	sp, r7
 8000552:	b002      	add	sp, #8
 8000554:	bd80      	pop	{r7, pc}

08000556 <LL_GPIO_ResetOutputPin>:
 8000556:	b580      	push	{r7, lr}
 8000558:	b082      	sub	sp, #8
 800055a:	af00      	add	r7, sp, #0
 800055c:	6078      	str	r0, [r7, #4]
 800055e:	6039      	str	r1, [r7, #0]
 8000560:	687b      	ldr	r3, [r7, #4]
 8000562:	683a      	ldr	r2, [r7, #0]
 8000564:	629a      	str	r2, [r3, #40]	; 0x28
 8000566:	46c0      	nop			; (mov r8, r8)
 8000568:	46bd      	mov	sp, r7
 800056a:	b002      	add	sp, #8
 800056c:	bd80      	pop	{r7, pc}
	...

08000570 <LL_EXTI_ClearFlag_0_31>:
 8000570:	b580      	push	{r7, lr}
 8000572:	b082      	sub	sp, #8
 8000574:	af00      	add	r7, sp, #0
 8000576:	6078      	str	r0, [r7, #4]
 8000578:	4b03      	ldr	r3, [pc, #12]	; (8000588 <LL_EXTI_ClearFlag_0_31+0x18>)
 800057a:	687a      	ldr	r2, [r7, #4]
 800057c:	615a      	str	r2, [r3, #20]
 800057e:	46c0      	nop			; (mov r8, r8)
 8000580:	46bd      	mov	sp, r7
 8000582:	b002      	add	sp, #8
 8000584:	bd80      	pop	{r7, pc}
 8000586:	46c0      	nop			; (mov r8, r8)
 8000588:	40010400 	.word	0x40010400

0800058c <LL_InitTick>:
 800058c:	b580      	push	{r7, lr}
 800058e:	b082      	sub	sp, #8
 8000590:	af00      	add	r7, sp, #0
 8000592:	6078      	str	r0, [r7, #4]
 8000594:	6039      	str	r1, [r7, #0]
 8000596:	6839      	ldr	r1, [r7, #0]
 8000598:	6878      	ldr	r0, [r7, #4]
 800059a:	f7ff fdb5 	bl	8000108 <__udivsi3>
 800059e:	0003      	movs	r3, r0
 80005a0:	001a      	movs	r2, r3
 80005a2:	4b06      	ldr	r3, [pc, #24]	; (80005bc <LL_InitTick+0x30>)
 80005a4:	3a01      	subs	r2, #1
 80005a6:	605a      	str	r2, [r3, #4]
 80005a8:	4b04      	ldr	r3, [pc, #16]	; (80005bc <LL_InitTick+0x30>)
 80005aa:	2200      	movs	r2, #0
 80005ac:	609a      	str	r2, [r3, #8]
 80005ae:	4b03      	ldr	r3, [pc, #12]	; (80005bc <LL_InitTick+0x30>)
 80005b0:	2205      	movs	r2, #5
 80005b2:	601a      	str	r2, [r3, #0]
 80005b4:	46c0      	nop			; (mov r8, r8)
 80005b6:	46bd      	mov	sp, r7
 80005b8:	b002      	add	sp, #8
 80005ba:	bd80      	pop	{r7, pc}
 80005bc:	e000e010 	.word	0xe000e010

080005c0 <LL_SYSTICK_EnableIT>:
 80005c0:	b580      	push	{r7, lr}
 80005c2:	af00      	add	r7, sp, #0
 80005c4:	4b04      	ldr	r3, [pc, #16]	; (80005d8 <LL_SYSTICK_EnableIT+0x18>)
 80005c6:	681a      	ldr	r2, [r3, #0]
 80005c8:	4b03      	ldr	r3, [pc, #12]	; (80005d8 <LL_SYSTICK_EnableIT+0x18>)
 80005ca:	2102      	movs	r1, #2
 80005cc:	430a      	orrs	r2, r1
 80005ce:	601a      	str	r2, [r3, #0]
 80005d0:	46c0      	nop			; (mov r8, r8)
 80005d2:	46bd      	mov	sp, r7
 80005d4:	bd80      	pop	{r7, pc}
 80005d6:	46c0      	nop			; (mov r8, r8)
 80005d8:	e000e010 	.word	0xe000e010

080005dc <rcc_config>:
 80005dc:	b580      	push	{r7, lr}
 80005de:	af00      	add	r7, sp, #0
 80005e0:	2001      	movs	r0, #1
 80005e2:	f7ff ff65 	bl	80004b0 <LL_FLASH_SetLatency>
 80005e6:	f7ff feb3 	bl	8000350 <LL_RCC_HSI_Enable>
 80005ea:	46c0      	nop			; (mov r8, r8)
 80005ec:	f7ff febe 	bl	800036c <LL_RCC_HSI_IsReady>
 80005f0:	0003      	movs	r3, r0
 80005f2:	2b01      	cmp	r3, #1
 80005f4:	d1fa      	bne.n	80005ec <rcc_config+0x10>
 80005f6:	23a0      	movs	r3, #160	; 0xa0
 80005f8:	039b      	lsls	r3, r3, #14
 80005fa:	0019      	movs	r1, r3
 80005fc:	2000      	movs	r0, #0
 80005fe:	f7ff ff31 	bl	8000464 <LL_RCC_PLL_ConfigDomain_SYS>
 8000602:	f7ff ff0d 	bl	8000420 <LL_RCC_PLL_Enable>
 8000606:	46c0      	nop			; (mov r8, r8)
 8000608:	f7ff ff18 	bl	800043c <LL_RCC_PLL_IsReady>
 800060c:	0003      	movs	r3, r0
 800060e:	2b01      	cmp	r3, #1
 8000610:	d1fa      	bne.n	8000608 <rcc_config+0x2c>
 8000612:	2000      	movs	r0, #0
 8000614:	f7ff feda 	bl	80003cc <LL_RCC_SetAHBPrescaler>
 8000618:	2002      	movs	r0, #2
 800061a:	f7ff feb7 	bl	800038c <LL_RCC_SetSysClkSource>
 800061e:	46c0      	nop			; (mov r8, r8)
 8000620:	f7ff fec8 	bl	80003b4 <LL_RCC_GetSysClkSource>
 8000624:	0003      	movs	r3, r0
 8000626:	2b08      	cmp	r3, #8
 8000628:	d1fa      	bne.n	8000620 <rcc_config+0x44>
 800062a:	2000      	movs	r0, #0
 800062c:	f7ff fee2 	bl	80003f4 <LL_RCC_SetAPB1Prescaler>
 8000630:	4b02      	ldr	r3, [pc, #8]	; (800063c <rcc_config+0x60>)
 8000632:	4a03      	ldr	r2, [pc, #12]	; (8000640 <rcc_config+0x64>)
 8000634:	601a      	str	r2, [r3, #0]
 8000636:	46c0      	nop			; (mov r8, r8)
 8000638:	46bd      	mov	sp, r7
 800063a:	bd80      	pop	{r7, pc}
 800063c:	20000000 	.word	0x20000000
 8000640:	02dc6c00 	.word	0x02dc6c00

08000644 <gpio_config>:
 8000644:	b580      	push	{r7, lr}
 8000646:	b082      	sub	sp, #8
 8000648:	af00      	add	r7, sp, #0
 800064a:	6078      	str	r0, [r7, #4]
 800064c:	2380      	movs	r3, #128	; 0x80
 800064e:	029b      	lsls	r3, r3, #10
 8000650:	0018      	movs	r0, r3
 8000652:	f7ff ff41 	bl	80004d8 <LL_AHB1_GRP1_EnableClock>
 8000656:	2380      	movs	r3, #128	; 0x80
 8000658:	031b      	lsls	r3, r3, #12
 800065a:	0018      	movs	r0, r3
 800065c:	f7ff ff3c 	bl	80004d8 <LL_AHB1_GRP1_EnableClock>
 8000660:	687b      	ldr	r3, [r7, #4]
 8000662:	4804      	ldr	r0, [pc, #16]	; (8000674 <gpio_config+0x30>)
 8000664:	2201      	movs	r2, #1
 8000666:	0019      	movs	r1, r3
 8000668:	f7ff ff4c 	bl	8000504 <LL_GPIO_SetPinMode>
 800066c:	46c0      	nop			; (mov r8, r8)
 800066e:	46bd      	mov	sp, r7
 8000670:	b002      	add	sp, #8
 8000672:	bd80      	pop	{r7, pc}
 8000674:	48000800 	.word	0x48000800

08000678 <delay>:
 8000678:	0003      	movs	r3, r0
 800067a:	b580      	push	{r7, lr}
 800067c:	1c1e      	adds	r6, r3, #0

0800067e <loop>:
 800067e:	3e01      	subs	r6, #1
 8000680:	2e00      	cmp	r6, #0
 8000682:	d1fc      	bne.n	800067e <loop>
 8000684:	bd80      	pop	{r7, pc}
 8000686:	46c0      	nop			; (mov r8, r8)

08000688 <SysTick_Handler>:
 8000688:	b580      	push	{r7, lr}
 800068a:	af00      	add	r7, sp, #0
 800068c:	4b0b      	ldr	r3, [pc, #44]	; (80006bc <SysTick_Handler+0x34>)
 800068e:	681b      	ldr	r3, [r3, #0]
 8000690:	1c5a      	adds	r2, r3, #1
 8000692:	4b0a      	ldr	r3, [pc, #40]	; (80006bc <SysTick_Handler+0x34>)
 8000694:	601a      	str	r2, [r3, #0]
 8000696:	4b09      	ldr	r3, [pc, #36]	; (80006bc <SysTick_Handler+0x34>)
 8000698:	681b      	ldr	r3, [r3, #0]
 800069a:	4a09      	ldr	r2, [pc, #36]	; (80006c0 <SysTick_Handler+0x38>)
 800069c:	4293      	cmp	r3, r2
 800069e:	dd09      	ble.n	80006b4 <SysTick_Handler+0x2c>
 80006a0:	2380      	movs	r3, #128	; 0x80
 80006a2:	009b      	lsls	r3, r3, #2
 80006a4:	4a07      	ldr	r2, [pc, #28]	; (80006c4 <SysTick_Handler+0x3c>)
 80006a6:	0019      	movs	r1, r3
 80006a8:	0010      	movs	r0, r2
 80006aa:	f7ff ff48 	bl	800053e <LL_GPIO_SetOutputPin>
 80006ae:	4b03      	ldr	r3, [pc, #12]	; (80006bc <SysTick_Handler+0x34>)
 80006b0:	2200      	movs	r2, #0
 80006b2:	601a      	str	r2, [r3, #0]
 80006b4:	46c0      	nop			; (mov r8, r8)
 80006b6:	46bd      	mov	sp, r7
 80006b8:	bd80      	pop	{r7, pc}
 80006ba:	46c0      	nop			; (mov r8, r8)
 80006bc:	20000450 	.word	0x20000450
 80006c0:	000007cf 	.word	0x000007cf
 80006c4:	48000800 	.word	0x48000800

080006c8 <systic_config>:
 80006c8:	b580      	push	{r7, lr}
 80006ca:	af00      	add	r7, sp, #0
 80006cc:	23fa      	movs	r3, #250	; 0xfa
 80006ce:	009b      	lsls	r3, r3, #2
 80006d0:	4a07      	ldr	r2, [pc, #28]	; (80006f0 <systic_config+0x28>)
 80006d2:	0019      	movs	r1, r3
 80006d4:	0010      	movs	r0, r2
 80006d6:	f7ff ff59 	bl	800058c <LL_InitTick>
 80006da:	f7ff ff71 	bl	80005c0 <LL_SYSTICK_EnableIT>
 80006de:	2301      	movs	r3, #1
 80006e0:	425b      	negs	r3, r3
 80006e2:	2100      	movs	r1, #0
 80006e4:	0018      	movs	r0, r3
 80006e6:	f7ff fdc5 	bl	8000274 <NVIC_SetPriority>
 80006ea:	46c0      	nop			; (mov r8, r8)
 80006ec:	46bd      	mov	sp, r7
 80006ee:	bd80      	pop	{r7, pc}
 80006f0:	02dc6c00 	.word	0x02dc6c00

080006f4 <EXTI0_1_IRQHandler>:
 80006f4:	b580      	push	{r7, lr}
 80006f6:	af00      	add	r7, sp, #0
 80006f8:	2380      	movs	r3, #128	; 0x80
 80006fa:	009b      	lsls	r3, r3, #2
 80006fc:	4a07      	ldr	r2, [pc, #28]	; (800071c <EXTI0_1_IRQHandler+0x28>)
 80006fe:	0019      	movs	r1, r3
 8000700:	0010      	movs	r0, r2
 8000702:	f7ff ff28 	bl	8000556 <LL_GPIO_ResetOutputPin>
 8000706:	4b06      	ldr	r3, [pc, #24]	; (8000720 <EXTI0_1_IRQHandler+0x2c>)
 8000708:	0018      	movs	r0, r3
 800070a:	f7ff ffb5 	bl	8000678 <delay>
 800070e:	2001      	movs	r0, #1
 8000710:	f7ff ff2e 	bl	8000570 <LL_EXTI_ClearFlag_0_31>
 8000714:	46c0      	nop			; (mov r8, r8)
 8000716:	46bd      	mov	sp, r7
 8000718:	bd80      	pop	{r7, pc}
 800071a:	46c0      	nop			; (mov r8, r8)
 800071c:	48000800 	.word	0x48000800
 8000720:	00327c00 	.word	0x00327c00

08000724 <main>:
 8000724:	b580      	push	{r7, lr}
 8000726:	af00      	add	r7, sp, #0
 8000728:	f7ff ff58 	bl	80005dc <rcc_config>
 800072c:	2380      	movs	r3, #128	; 0x80
 800072e:	009b      	lsls	r3, r3, #2
 8000730:	0018      	movs	r0, r3
 8000732:	f7ff ff87 	bl	8000644 <gpio_config>
 8000736:	f7ff ffc7 	bl	80006c8 <systic_config>
 800073a:	e7fe      	b.n	800073a <main+0x16>

0800073c <SystemInit>:
 800073c:	b580      	push	{r7, lr}
 800073e:	af00      	add	r7, sp, #0
 8000740:	4b1a      	ldr	r3, [pc, #104]	; (80007ac <SystemInit+0x70>)
 8000742:	681a      	ldr	r2, [r3, #0]
 8000744:	4b19      	ldr	r3, [pc, #100]	; (80007ac <SystemInit+0x70>)
 8000746:	2101      	movs	r1, #1
 8000748:	430a      	orrs	r2, r1
 800074a:	601a      	str	r2, [r3, #0]
 800074c:	4b17      	ldr	r3, [pc, #92]	; (80007ac <SystemInit+0x70>)
 800074e:	685a      	ldr	r2, [r3, #4]
 8000750:	4b16      	ldr	r3, [pc, #88]	; (80007ac <SystemInit+0x70>)
 8000752:	4917      	ldr	r1, [pc, #92]	; (80007b0 <SystemInit+0x74>)
 8000754:	400a      	ands	r2, r1
 8000756:	605a      	str	r2, [r3, #4]
 8000758:	4b14      	ldr	r3, [pc, #80]	; (80007ac <SystemInit+0x70>)
 800075a:	681a      	ldr	r2, [r3, #0]
 800075c:	4b13      	ldr	r3, [pc, #76]	; (80007ac <SystemInit+0x70>)
 800075e:	4915      	ldr	r1, [pc, #84]	; (80007b4 <SystemInit+0x78>)
 8000760:	400a      	ands	r2, r1
 8000762:	601a      	str	r2, [r3, #0]
 8000764:	4b11      	ldr	r3, [pc, #68]	; (80007ac <SystemInit+0x70>)
 8000766:	681a      	ldr	r2, [r3, #0]
 8000768:	4b10      	ldr	r3, [pc, #64]	; (80007ac <SystemInit+0x70>)
 800076a:	4913      	ldr	r1, [pc, #76]	; (80007b8 <SystemInit+0x7c>)
 800076c:	400a      	ands	r2, r1
 800076e:	601a      	str	r2, [r3, #0]
 8000770:	4b0e      	ldr	r3, [pc, #56]	; (80007ac <SystemInit+0x70>)
 8000772:	685a      	ldr	r2, [r3, #4]
 8000774:	4b0d      	ldr	r3, [pc, #52]	; (80007ac <SystemInit+0x70>)
 8000776:	4911      	ldr	r1, [pc, #68]	; (80007bc <SystemInit+0x80>)
 8000778:	400a      	ands	r2, r1
 800077a:	605a      	str	r2, [r3, #4]
 800077c:	4b0b      	ldr	r3, [pc, #44]	; (80007ac <SystemInit+0x70>)
 800077e:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8000780:	4b0a      	ldr	r3, [pc, #40]	; (80007ac <SystemInit+0x70>)
 8000782:	210f      	movs	r1, #15
 8000784:	438a      	bics	r2, r1
 8000786:	62da      	str	r2, [r3, #44]	; 0x2c
 8000788:	4b08      	ldr	r3, [pc, #32]	; (80007ac <SystemInit+0x70>)
 800078a:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 800078c:	4b07      	ldr	r3, [pc, #28]	; (80007ac <SystemInit+0x70>)
 800078e:	490c      	ldr	r1, [pc, #48]	; (80007c0 <SystemInit+0x84>)
 8000790:	400a      	ands	r2, r1
 8000792:	631a      	str	r2, [r3, #48]	; 0x30
 8000794:	4b05      	ldr	r3, [pc, #20]	; (80007ac <SystemInit+0x70>)
 8000796:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8000798:	4b04      	ldr	r3, [pc, #16]	; (80007ac <SystemInit+0x70>)
 800079a:	2101      	movs	r1, #1
 800079c:	438a      	bics	r2, r1
 800079e:	635a      	str	r2, [r3, #52]	; 0x34
 80007a0:	4b02      	ldr	r3, [pc, #8]	; (80007ac <SystemInit+0x70>)
 80007a2:	2200      	movs	r2, #0
 80007a4:	609a      	str	r2, [r3, #8]
 80007a6:	46c0      	nop			; (mov r8, r8)
 80007a8:	46bd      	mov	sp, r7
 80007aa:	bd80      	pop	{r7, pc}
 80007ac:	40021000 	.word	0x40021000
 80007b0:	f8ffb80c 	.word	0xf8ffb80c
 80007b4:	fef6ffff 	.word	0xfef6ffff
 80007b8:	fffbffff 	.word	0xfffbffff
 80007bc:	ffc0ffff 	.word	0xffc0ffff
 80007c0:	fffffeac 	.word	0xfffffeac

080007c4 <NMI_Handler>:
 80007c4:	b580      	push	{r7, lr}
 80007c6:	af00      	add	r7, sp, #0
 80007c8:	46c0      	nop			; (mov r8, r8)
 80007ca:	46bd      	mov	sp, r7
 80007cc:	bd80      	pop	{r7, pc}

080007ce <HardFault_Handler>:
 80007ce:	b580      	push	{r7, lr}
 80007d0:	af00      	add	r7, sp, #0
 80007d2:	e7fe      	b.n	80007d2 <HardFault_Handler+0x4>

080007d4 <SVC_Handler>:
 80007d4:	b580      	push	{r7, lr}
 80007d6:	af00      	add	r7, sp, #0
 80007d8:	46c0      	nop			; (mov r8, r8)
 80007da:	46bd      	mov	sp, r7
 80007dc:	bd80      	pop	{r7, pc}

080007de <PendSV_Handler>:
 80007de:	b580      	push	{r7, lr}
 80007e0:	af00      	add	r7, sp, #0
 80007e2:	46c0      	nop			; (mov r8, r8)
 80007e4:	46bd      	mov	sp, r7
 80007e6:	bd80      	pop	{r7, pc}

080007e8 <__libc_init_array>:
 80007e8:	b570      	push	{r4, r5, r6, lr}
 80007ea:	4e0d      	ldr	r6, [pc, #52]	; (8000820 <__libc_init_array+0x38>)
 80007ec:	4d0d      	ldr	r5, [pc, #52]	; (8000824 <__libc_init_array+0x3c>)
 80007ee:	1bad      	subs	r5, r5, r6
 80007f0:	10ad      	asrs	r5, r5, #2
 80007f2:	d006      	beq.n	8000802 <__libc_init_array+0x1a>
 80007f4:	2400      	movs	r4, #0
 80007f6:	00a3      	lsls	r3, r4, #2
 80007f8:	58f3      	ldr	r3, [r6, r3]
 80007fa:	3401      	adds	r4, #1
 80007fc:	4798      	blx	r3
 80007fe:	42a5      	cmp	r5, r4
 8000800:	d1f9      	bne.n	80007f6 <__libc_init_array+0xe>
 8000802:	f000 f8c1 	bl	8000988 <_init>
 8000806:	4e08      	ldr	r6, [pc, #32]	; (8000828 <__libc_init_array+0x40>)
 8000808:	4d08      	ldr	r5, [pc, #32]	; (800082c <__libc_init_array+0x44>)
 800080a:	1bad      	subs	r5, r5, r6
 800080c:	10ad      	asrs	r5, r5, #2
 800080e:	d006      	beq.n	800081e <__libc_init_array+0x36>
 8000810:	2400      	movs	r4, #0
 8000812:	00a3      	lsls	r3, r4, #2
 8000814:	58f3      	ldr	r3, [r6, r3]
 8000816:	3401      	adds	r4, #1
 8000818:	4798      	blx	r3
 800081a:	42a5      	cmp	r5, r4
 800081c:	d1f9      	bne.n	8000812 <__libc_init_array+0x2a>
 800081e:	bd70      	pop	{r4, r5, r6, pc}
 8000820:	080009a4 	.word	0x080009a4
 8000824:	080009a4 	.word	0x080009a4
 8000828:	080009a4 	.word	0x080009a4
 800082c:	080009ac 	.word	0x080009ac

08000830 <register_fini>:
 8000830:	4b03      	ldr	r3, [pc, #12]	; (8000840 <register_fini+0x10>)
 8000832:	b510      	push	{r4, lr}
 8000834:	2b00      	cmp	r3, #0
 8000836:	d002      	beq.n	800083e <register_fini+0xe>
 8000838:	4802      	ldr	r0, [pc, #8]	; (8000844 <register_fini+0x14>)
 800083a:	f000 f805 	bl	8000848 <atexit>
 800083e:	bd10      	pop	{r4, pc}
 8000840:	00000000 	.word	0x00000000
 8000844:	08000859 	.word	0x08000859

08000848 <atexit>:
 8000848:	b510      	push	{r4, lr}
 800084a:	0001      	movs	r1, r0
 800084c:	2300      	movs	r3, #0
 800084e:	2200      	movs	r2, #0
 8000850:	2000      	movs	r0, #0
 8000852:	f000 f81f 	bl	8000894 <__register_exitproc>
 8000856:	bd10      	pop	{r4, pc}

08000858 <__libc_fini_array>:
 8000858:	b570      	push	{r4, r5, r6, lr}
 800085a:	4b09      	ldr	r3, [pc, #36]	; (8000880 <__libc_fini_array+0x28>)
 800085c:	4c09      	ldr	r4, [pc, #36]	; (8000884 <__libc_fini_array+0x2c>)
 800085e:	1ae4      	subs	r4, r4, r3
 8000860:	10a4      	asrs	r4, r4, #2
 8000862:	d009      	beq.n	8000878 <__libc_fini_array+0x20>
 8000864:	4a08      	ldr	r2, [pc, #32]	; (8000888 <__libc_fini_array+0x30>)
 8000866:	18a5      	adds	r5, r4, r2
 8000868:	00ad      	lsls	r5, r5, #2
 800086a:	18ed      	adds	r5, r5, r3
 800086c:	682b      	ldr	r3, [r5, #0]
 800086e:	3c01      	subs	r4, #1
 8000870:	4798      	blx	r3
 8000872:	3d04      	subs	r5, #4
 8000874:	2c00      	cmp	r4, #0
 8000876:	d1f9      	bne.n	800086c <__libc_fini_array+0x14>
 8000878:	f000 f88c 	bl	8000994 <_fini>
 800087c:	bd70      	pop	{r4, r5, r6, pc}
 800087e:	46c0      	nop			; (mov r8, r8)
 8000880:	080009ac 	.word	0x080009ac
 8000884:	080009b0 	.word	0x080009b0
 8000888:	3fffffff 	.word	0x3fffffff

0800088c <__retarget_lock_acquire_recursive>:
 800088c:	4770      	bx	lr
 800088e:	46c0      	nop			; (mov r8, r8)

08000890 <__retarget_lock_release_recursive>:
 8000890:	4770      	bx	lr
 8000892:	46c0      	nop			; (mov r8, r8)

08000894 <__register_exitproc>:
 8000894:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000896:	464e      	mov	r6, r9
 8000898:	4645      	mov	r5, r8
 800089a:	46de      	mov	lr, fp
 800089c:	4657      	mov	r7, sl
 800089e:	b5e0      	push	{r5, r6, r7, lr}
 80008a0:	4d36      	ldr	r5, [pc, #216]	; (800097c <__register_exitproc+0xe8>)
 80008a2:	b083      	sub	sp, #12
 80008a4:	0006      	movs	r6, r0
 80008a6:	6828      	ldr	r0, [r5, #0]
 80008a8:	4698      	mov	r8, r3
 80008aa:	000f      	movs	r7, r1
 80008ac:	4691      	mov	r9, r2
 80008ae:	f7ff ffed 	bl	800088c <__retarget_lock_acquire_recursive>
 80008b2:	4b33      	ldr	r3, [pc, #204]	; (8000980 <__register_exitproc+0xec>)
 80008b4:	681c      	ldr	r4, [r3, #0]
 80008b6:	23a4      	movs	r3, #164	; 0xa4
 80008b8:	005b      	lsls	r3, r3, #1
 80008ba:	58e0      	ldr	r0, [r4, r3]
 80008bc:	2800      	cmp	r0, #0
 80008be:	d052      	beq.n	8000966 <__register_exitproc+0xd2>
 80008c0:	6843      	ldr	r3, [r0, #4]
 80008c2:	2b1f      	cmp	r3, #31
 80008c4:	dc13      	bgt.n	80008ee <__register_exitproc+0x5a>
 80008c6:	1c5a      	adds	r2, r3, #1
 80008c8:	9201      	str	r2, [sp, #4]
 80008ca:	2e00      	cmp	r6, #0
 80008cc:	d128      	bne.n	8000920 <__register_exitproc+0x8c>
 80008ce:	9a01      	ldr	r2, [sp, #4]
 80008d0:	3302      	adds	r3, #2
 80008d2:	009b      	lsls	r3, r3, #2
 80008d4:	6042      	str	r2, [r0, #4]
 80008d6:	501f      	str	r7, [r3, r0]
 80008d8:	6828      	ldr	r0, [r5, #0]
 80008da:	f7ff ffd9 	bl	8000890 <__retarget_lock_release_recursive>
 80008de:	2000      	movs	r0, #0
 80008e0:	b003      	add	sp, #12
 80008e2:	bc3c      	pop	{r2, r3, r4, r5}
 80008e4:	4690      	mov	r8, r2
 80008e6:	4699      	mov	r9, r3
 80008e8:	46a2      	mov	sl, r4
 80008ea:	46ab      	mov	fp, r5
 80008ec:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80008ee:	4b25      	ldr	r3, [pc, #148]	; (8000984 <__register_exitproc+0xf0>)
 80008f0:	2b00      	cmp	r3, #0
 80008f2:	d03d      	beq.n	8000970 <__register_exitproc+0xdc>
 80008f4:	20c8      	movs	r0, #200	; 0xc8
 80008f6:	0040      	lsls	r0, r0, #1
 80008f8:	e000      	b.n	80008fc <__register_exitproc+0x68>
 80008fa:	bf00      	nop
 80008fc:	2800      	cmp	r0, #0
 80008fe:	d037      	beq.n	8000970 <__register_exitproc+0xdc>
 8000900:	22a4      	movs	r2, #164	; 0xa4
 8000902:	2300      	movs	r3, #0
 8000904:	0052      	lsls	r2, r2, #1
 8000906:	58a1      	ldr	r1, [r4, r2]
 8000908:	6043      	str	r3, [r0, #4]
 800090a:	6001      	str	r1, [r0, #0]
 800090c:	50a0      	str	r0, [r4, r2]
 800090e:	3240      	adds	r2, #64	; 0x40
 8000910:	5083      	str	r3, [r0, r2]
 8000912:	3204      	adds	r2, #4
 8000914:	5083      	str	r3, [r0, r2]
 8000916:	3301      	adds	r3, #1
 8000918:	9301      	str	r3, [sp, #4]
 800091a:	2300      	movs	r3, #0
 800091c:	2e00      	cmp	r6, #0
 800091e:	d0d6      	beq.n	80008ce <__register_exitproc+0x3a>
 8000920:	009a      	lsls	r2, r3, #2
 8000922:	4692      	mov	sl, r2
 8000924:	4482      	add	sl, r0
 8000926:	464a      	mov	r2, r9
 8000928:	2188      	movs	r1, #136	; 0x88
 800092a:	4654      	mov	r4, sl
 800092c:	5062      	str	r2, [r4, r1]
 800092e:	22c4      	movs	r2, #196	; 0xc4
 8000930:	0052      	lsls	r2, r2, #1
 8000932:	4691      	mov	r9, r2
 8000934:	4481      	add	r9, r0
 8000936:	464a      	mov	r2, r9
 8000938:	3987      	subs	r1, #135	; 0x87
 800093a:	4099      	lsls	r1, r3
 800093c:	6812      	ldr	r2, [r2, #0]
 800093e:	468b      	mov	fp, r1
 8000940:	430a      	orrs	r2, r1
 8000942:	4694      	mov	ip, r2
 8000944:	464a      	mov	r2, r9
 8000946:	4661      	mov	r1, ip
 8000948:	6011      	str	r1, [r2, #0]
 800094a:	2284      	movs	r2, #132	; 0x84
 800094c:	4641      	mov	r1, r8
 800094e:	0052      	lsls	r2, r2, #1
 8000950:	50a1      	str	r1, [r4, r2]
 8000952:	2e02      	cmp	r6, #2
 8000954:	d1bb      	bne.n	80008ce <__register_exitproc+0x3a>
 8000956:	0002      	movs	r2, r0
 8000958:	465c      	mov	r4, fp
 800095a:	328d      	adds	r2, #141	; 0x8d
 800095c:	32ff      	adds	r2, #255	; 0xff
 800095e:	6811      	ldr	r1, [r2, #0]
 8000960:	430c      	orrs	r4, r1
 8000962:	6014      	str	r4, [r2, #0]
 8000964:	e7b3      	b.n	80008ce <__register_exitproc+0x3a>
 8000966:	0020      	movs	r0, r4
 8000968:	304d      	adds	r0, #77	; 0x4d
 800096a:	30ff      	adds	r0, #255	; 0xff
 800096c:	50e0      	str	r0, [r4, r3]
 800096e:	e7a7      	b.n	80008c0 <__register_exitproc+0x2c>
 8000970:	6828      	ldr	r0, [r5, #0]
 8000972:	f7ff ff8d 	bl	8000890 <__retarget_lock_release_recursive>
 8000976:	2001      	movs	r0, #1
 8000978:	4240      	negs	r0, r0
 800097a:	e7b1      	b.n	80008e0 <__register_exitproc+0x4c>
 800097c:	20000430 	.word	0x20000430
 8000980:	080009a0 	.word	0x080009a0
 8000984:	00000000 	.word	0x00000000

08000988 <_init>:
 8000988:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800098a:	46c0      	nop			; (mov r8, r8)
 800098c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800098e:	bc08      	pop	{r3}
 8000990:	469e      	mov	lr, r3
 8000992:	4770      	bx	lr

08000994 <_fini>:
 8000994:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000996:	46c0      	nop			; (mov r8, r8)
 8000998:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800099a:	bc08      	pop	{r3}
 800099c:	469e      	mov	lr, r3
 800099e:	4770      	bx	lr
