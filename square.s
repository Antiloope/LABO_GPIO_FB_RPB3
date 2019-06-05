.globl app
///////////////////////////
// - x11,x12,x13 Memory
// - x0 - x6
// - x5 FB_BASE
///////////////////////////
square:
  sub sp,sp, #16  // Reserve space for two registers
  stur x30,[sp,#0]  // Store Register X9 in stack

  ldr x10, =ACTUAL_FIGURE
  mov w0,1                  //Set actual figure to square
  sturh w0,[x10]

  ldr x11, =SQUARE_COORDS
  ldr x12, =SQUARE_SIZE
  ldr x13, =COLOR
  mov x6,512
  ldrh w0,[x11,2]
  ldrh w2,[x11]
  lsl x2,x2 ,1
squareLoop0:
  cbz w0, squareNext
  add x2,x2,1024
  sub w0,w0,1
  b squareLoop0
squareNext:
 	add x0,x5,x2   // Set origin 100x100y
  ldrh w3,[x13]  //Load color
  ldrh w1,[x12,2]
	ldrh w2,[x12]         // X Size
squareLoop1:
	sturh w3,[x0]	   // Set color of pixel N
	add x0,x0,2	   // Next pixel
	sub w2,w2,1	   // decrement X counter
	cbnz w2,squareLoop1	   // If not end row jump
  ldrh w2,[x12]
  sub x4,x6,x2
  lsl x4,x4,1
	add x0,x0,x4
	sub w1,w1,1	   // Decrement Y counter
	cbnz w1,squareLoop1	   // if not last row, jump
  ldur x30,[sp,#0]  // Restore X15 value from stack
  add sp,sp, #16  // Restore SP to initial position
  br x30
