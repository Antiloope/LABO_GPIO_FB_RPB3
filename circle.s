.globl app
///////////////////////////
// - CIRCLE_COORDS center of the circle
// - CIRCLE_RADIUS in the first word the radius
// - COLOR color of the circle
// - x0 - x10
// Require:
// - x5 FB_BASE
///////////////////////////
circle:
  sub sp,sp, #16  // Reserve space for two registers
  stur x30,[sp,#0]  // Store Register X9 in stack
  ldr x11, =CIRCLE_COORDS
  ldr x12, =CIRCLE_RADIUS
  ldr x13, =COLOR
  ldrh w1,[x11,2]  //Load y coord
  ldrh w0,[x11]    //Load x coord
  lsl x0,x0 ,1     //Set x offset
circleLoop0:
  cbz w1, circleNext
  add x0,x0,1024
  sub w1,w1,1
  b circleLoop0
circleNext:
  ldrh w2,[x12]     // Radius
  ldrh w3,[x13]     // Load color
 	add x1,x5,x0      // Set origin

  sub x6,xzr,x2     //x6 = -radius
  mul x10,x2,x2      //x10 = radius^radius

  mov x4,x2         //j=radius
circleLoop1:
  subs x0,x4,x6      //j>-radius
  b.lt circleExit   //if j<-radius exit
  mul x9,x4,x4        //y^y (j^j)
  //else
  mov x7,x6         //i=-radius
circleLoop2:
  subs x0,x7,x2       //i<radius
  b.GT circleNextLoop    //if i>radius for j
  //else
  mul x8,x7,x7        //x^x (i^i)
  add x8,x8,x9        //x^x + y^y
  cmp x8,x10          // x^x + y^y <= r^r
  b.GT circleNextIf       //if x^x + y^y > r^r no-if
  //else
  mov x0,512        //Fllowing lines apply xy-formula
  mul x0,x4,x0
  add x0,x0,x7
  lsl x0,x0,1
  add x0,x0,x1

  sturh w3,[x0]     //store the color in the pixel
circleNextIf:
  add x7,x7,1       //i++
  b circleLoop2
circleNextLoop:
  sub x4,x4,1       //j--
  b circleLoop1
circleExit:
  ldur x30,[sp,#0]  // Restore X15 value from stack
  add sp,sp, #16  // Restore SP to initial position
  br x30
