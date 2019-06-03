.globl app
// GPIO
.equ GPIO_BASE      ,      0x3F200000 // GPIO Base Address
.equ GPIO_GPFSEL0   ,      0x0 // GPIO Function Select 0
.equ GPIO_GPFSEL1   ,      0x4 // GPIO Function Select 1
.equ GPIO_GPFSEL2   ,      0x8 // GPIO Function Select 2
.equ GPIO_GPFSEL3   ,      0xC // GPIO Function Select 3
.equ GPIO_GPFSEL4   ,     0x10 // GPIO Function Select 4
.equ GPIO_GPFSEL5   ,     0x14 // GPIO Function Select 5
.equ GPIO_GPSET0    ,     0x1C // GPIO Pin Output Set 0
.equ GPIO_GPSET1    ,     0x20 // GPIO Pin Output Set 1
.equ GPIO_GPCLR0    ,     0x28 // GPIO Pin Output Clear 0
.equ GPIO_GPCLR1    ,     0x2C // GPIO Pin Output Clear 1
.equ GPIO_GPLEV0    ,     0x34 // GPIO Pin Level 0
.equ GPIO_GPLEV1    ,     0x38 // GPIO Pin Level 1
.equ GPIO_GPEDS0    ,     0x40 // GPIO Pin Event Detect Status 0
.equ GPIO_GPEDS1    ,     0x44 // GPIO Pin Event Detect Status 1
.equ GPIO_GPREN0    ,     0x4C // GPIO Pin Rising Edge Detect Enable 0
.equ GPIO_GPREN1    ,     0x50 // GPIO Pin Rising Edge Detect Enable 1
.equ GPIO_GPFEN0    ,     0x58 // GPIO Pin Falling Edge Detect Enable 0
.equ GPIO_GPFEN1    ,     0x5C // GPIO Pin Falling Edge Detect Enable 1
.equ GPIO_GPHEN0    ,     0x64 // GPIO Pin High Detect Enable 0
.equ GPIO_GPHEN1    ,     0x68 // GPIO Pin High Detect Enable 1
.equ GPIO_GPLEN0    ,     0x70 // GPIO Pin Low Detect Enable 0
.equ GPIO_GPLEN1    ,     0x74 // GPIO Pin Low Detect Enable 1
.equ GPIO_GPAREN0   ,     0x7C // GPIO Pin Async. Rising Edge Detect 0
.equ GPIO_GPAREN1   ,     0x80 // GPIO Pin Async. Rising Edge Detect 1
.equ GPIO_GPAFEN0   ,     0x88 // GPIO Pin Async. Falling Edge Detect 0
.equ GPIO_GPAFEN1   ,     0x8C // GPIO Pin Async. Falling Edge Detect 1
.equ GPIO_GPPUD     ,     0x94 // GPIO Pin Pull-up/down Enable
.equ GPIO_GPPUDCLK0 ,     0x98 // GPIO Pin Pull-up/down Enable Clock 0
.equ GPIO_GPPUDCLK1 ,     0x9C // GPIO Pin Pull-up/down Enable Clock 1
.equ GPIO_TEST      ,     0xB0 // GPIO Test

.equ GPIO_FSEL_IN   , 0x0 // GPIO Function Select: GPIO Pin X0 Is An Input
.equ GPIO_FSEL_OUT  , 0x1 // GPIO Function Select: GPIO Pin X0 Is An Output
.equ GPIO_FSEL_ALT0 , 0x4 // GPIO Function Select: GPIO Pin X0 Takes Alternate Function 0
.equ GPIO_FSEL_ALT1 , 0x5 // GPIO Function Select: GPIO Pin X0 Takes Alternate Function 1
.equ GPIO_FSEL_ALT2 , 0x6 // GPIO Function Select: GPIO Pin X0 Takes Alternate Function 2
.equ GPIO_FSEL_ALT3 , 0x7 // GPIO Function Select: GPIO Pin X0 Takes Alternate Function 3
.equ GPIO_FSEL_ALT4 , 0x3 // GPIO Function Select: GPIO Pin X0 Takes Alternate Function 4
.equ GPIO_FSEL_ALT5 , 0x2 // GPIO Function Select: GPIO Pin X0 Takes Alternate Function 5
.equ GPIO_FSEL_CLR  , 0x7 // GPIO Function Select: GPIO Pin X0 Clear Bits


.equ GPIO_0  ,        0x1 // GPIO Pin 0: 0
.equ GPIO_1  ,        0x2 // GPIO Pin 0: 1
.equ GPIO_2  ,        0x4 // GPIO Pin 0: 2
.equ GPIO_3  ,        0x8 // GPIO Pin 0: 3
.equ GPIO_4  ,       0x10 // GPIO Pin 0: 4
.equ GPIO_5  ,       0x20 // GPIO Pin 0: 5
.equ GPIO_6  ,       0x40 // GPIO Pin 0: 6
.equ GPIO_7  ,       0x80 // GPIO Pin 0: 7
.equ GPIO_8  ,      0x100 // GPIO Pin 0: 8
.equ GPIO_9  ,      0x200 // GPIO Pin 0: 9
.equ GPIO_10 ,      0x400 // GPIO Pin 0: 10
.equ GPIO_11 ,      0x800 // GPIO Pin 0: 11
.equ GPIO_12 ,     0x1000 // GPIO Pin 0: 12
.equ GPIO_13 ,     0x2000 // GPIO Pin 0: 13
.equ GPIO_14 ,     0x4000 // GPIO Pin 0: 14
.equ GPIO_15 ,     0x8000 // GPIO Pin 0: 15
.equ GPIO_16 ,    0x10000 // GPIO Pin 0: 16
.equ GPIO_17 ,    0x20000 // GPIO Pin 0: 17
.equ GPIO_18 ,    0x40000 // GPIO Pin 0: 18
.equ GPIO_19 ,    0x80000 // GPIO Pin 0: 19
.equ GPIO_20 ,   0x100000 // GPIO Pin 0: 20
.equ GPIO_21 ,   0x200000 // GPIO Pin 0: 21
.equ GPIO_22 ,   0x400000 // GPIO Pin 0: 22
.equ GPIO_23 ,   0x800000 // GPIO Pin 0: 23
.equ GPIO_24 ,  0x1000000 // GPIO Pin 0: 24
.equ GPIO_25 ,  0x2000000 // GPIO Pin 0: 25
.equ GPIO_26 ,  0x4000000 // GPIO Pin 0: 26
.equ GPIO_27 ,  0x8000000 // GPIO Pin 0: 27
.equ GPIO_28 , 0x10000000 // GPIO Pin 0: 28
.equ GPIO_29 , 0x20000000 // GPIO Pin 0: 29
.equ GPIO_30 , 0x40000000 // GPIO Pin 0: 30
.equ GPIO_31 , 0x80000000 // GPIO Pin 0: 31

app:
	// X0 contiene la direccion base del framebuffer

	//---------------- CODE HERE ------------------------------------

    // CODE EXAMPLE - Config GPIO1 as OUTPUT--------------------------

    //mov x8, GPIO_BASE                       // GPIO Base Address.
    //mov w9, GPIO_FSEL_OUT                   // Load OUTPUT configuration
    //lsl w9, w9, 3                           // GPIO1 (<<3)
    //sturh w9, [x8, GPIO_GPFSEL0]            // Set config at GPFSELx

	//-----------------------------------------------------------------

	// CODE EXAMPLE - Get GPIO2 state ---------------------------------

    //mov x8, GPIO_BASE                       // GPIO Base Address.
		//ldrh w9, [x8, GPIO_GPLEV0]              // Get GPIO 0-31 satate
    //and w10, w9, GPIO_2                     // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')

	//-----------------------------------------------------------------
	mov x5,x0

	//Save memory address in registers
	ldr x11, =CIRCLE_COORDS
	ldr x12, =CIRCLE_RADIUS
	ldr x13, =COLOR

	////////START////////

mainLoop:

	//mov x15,5
	//sub sp,sp, #8  // Reserve space for two registers
	//stur x15,[sp,#0]  // Store Register X30 in stack
	//mov x15,0
	//ldur x15,[sp,#0]  // Restore X30 value from stack
	//add sp,sp, #8  // Restore SP to initial position
	//sub x15,x15,5
	//cbnz x15,infLoop

	bl checkInputs
	b mainLoop
	b infLoop

checkInputs:
	mov x28,x30
	//2,4,17,22,10,11
	//10 func
	//11 click
	mov x8, GPIO_BASE                       // GPIO Base Address.
	ldrh w9, [x8, GPIO_GPLEV0]              // Get GPIO 0-31 satate
	and w10, w9, GPIO_10                      // Filter GPIO10 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, mode1
	b mode0

mode0:
	and w10, w9, GPIO_11                      // Filter GPIO11 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, click01
	b click00

mode1:
	and w10, w9, GPIO_11                      // Filter GPIO11 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, click11
	b click10

click00: //Mode draw, unclicked
	and w10, w9, GPIO_2                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn0_00
	and w10, w9, GPIO_4                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn1_00
	and w10, w9, GPIO_17                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn2_00
	and w10, w9, GPIO_22                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn3_00
	br x28
click01: //Mode draw, clicked
	and w10, w9, GPIO_2                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn0_01
	and w10, w9, GPIO_4                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn1_01
	and w10, w9, GPIO_17                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn2_01
	and w10, w9, GPIO_22                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn3_01
	br x28
click10: //Mode conf, unclicked
	and w10, w9, GPIO_2                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn0_10
	and w10, w9, GPIO_4                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn1_10
	and w10, w9, GPIO_17                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn2_10
	and w10, w9, GPIO_22                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn3_10
	br x28
click11: //Mode conf,clicked
	and w10, w9, GPIO_2                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn0_11
	and w10, w9, GPIO_4                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn1_11
	and w10, w9, GPIO_17                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn2_11
	and w10, w9, GPIO_22                      // Filter GPIO2 satate (GPIO2 = GND -> x10='0', else -> x10!='0')
	cbnz w10, btn3_11
	br x28

btn0_00:
	mov w0,0x07E0    // Set color 0x07E0 = GREEN
	strh w0,[x13]     //Store c
	mov w0,100
	strh w0,[x11]     //Store X coord
	mov w0,100
	strh w0,[x11,2]   //Store Y coord
	mov w0,40
	strh w0,[x12]     //Store width
	mov w0,512
	strh w0,[x12,2]   //Store height
	bl circle
	br x28
btn1_00:
	br x28
btn2_00:
	br x28
btn3_00:
	br x28

btn0_01:
	br x28
btn1_01:
	br x28
btn2_01:
	br x28
btn3_01:
	br x28

btn0_10:
	mov w0, 0x001F    // Set color 0x001F = BLUE
	strh w0,[x13]     //Store color
	mov w0,100
	strh w0,[x11]     //Store X coord
	mov w0,100
	strh w0,[x11,2]   //Store Y coord
	mov w0,40
	strh w0,[x12]     //Store width
	mov w0,512
	strh w0,[x12,2]   //Store height
	bl circle
	bl wait
	br x28
btn1_10:
	br x28
btn2_10:
	br x28
btn3_10:
	br x28

btn0_11:
	br x28
btn1_11:
	br x28
btn2_11:
	br x28
btn3_11:
	br x28

wait:
	//0.1 seg in theory
	ldr x0,=700000
waitLoop:
	sub x0,x0,1
	cbnz x0, waitLoop
	ret

  // Infinite Loop
infLoop:
	b infLoop
