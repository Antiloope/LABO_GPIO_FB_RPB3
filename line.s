.globl app

line:
  ldr x11, =LINE_COORDS1
  ldr x12, =LINE_COORDS2
  ldr x13, =COLOR

  ldrh w1,[x11]           //w1=x1
  ldrh w2,[x11,2]         //w2=y1
  ldrh w3,[x12]           //w3=x2
  ldrh w4,[x12,2]         //w4=y2

  sub xzr,x1,x3           //x1<x2
  b.LT lineIf1            //if x1<x2 go to if
  //else
  mov x6,x3               //x6=xorigen=x2
  mov x7,x1               //x7=xmax=x1
  b lineNext1
lineIf1:
  mov x7,x3               //x7=xmax=x2
  mov x6,x1               //x6=xorigen=x1
lineNext1:
  sub xzr,x2,x4           //y1<y2
  b.LT lineIf2            //if y1<y2 go to if
  //else
  mov x8,x2               //x8=yorigen=y1
  mov x9,x4               //x9=ymax=y2
  sub x0,x6,x1            //xorigen==x1
  cbnz x0,lineIf4         //if xorigen!=x1 goto if
  mov x10,0               //flag=x10=0=resta
  b lineNext2
lineIf4:
  //else
  mov x10,1               //flag=x10=1=suma
  b lineNext2
lineIf2:
  mov x8,x4               //x8=yorigen=y2
  mov x9,x2               //x9=ymax=y1
  sub x0,x6,x3            //xorigen==x2
  cbnz x0, lineIf3        //if xorigen!=x2 goto if
  mov x10,1               //flag=x10=1=suma
  b lineNext2
lineIf3:
  //else
  mov x10,0               //flag=x10=0=resta
lineNext2:
  mov x1,x8
  lsl x0,x6,1     //Set x offset
lineLoop0:
  cbz x1, lineNext3
  add x0,x0,1024
  sub x1,x1,1
  b lineLoop0
lineNext3:
  mov x1,x8               //x1=i=yorigen
lineLoop1:
  subs xzr,x1,x9          //i>ymax
  b.LE lineEnd            //if i<=ymax end
  //else
  mov x2,x6               //x2=j=xorigen
lineLoop2:
  subs xzr,x2,x7          //j<xmax
  b.GE lineNextLoop1
  //else

  cbz x10 lineResta       //if flag == resta resta
  //else suma
  mul x3,x1,x9            //i*ymax
  mul x4,x2,x7            //j*xmax
  add x3,x3,x4            //i*ymax+j*xmax

lineResta:

lineNextLoop2:
  add x2,x2,1             //j++
  b lineLoop2
lineNextLoop1:
  sub x1,x1,1             //i--
  b lineLoop1
lineEnd:

for(i=yorigen;i>ymax;i--){
  for(j=xorigen;j<xmax;j++){
    if(flag == suma){
      if(i*ymax+j*xmax==0){
        buffer[inicio+2*(j+(i*512))]=color;
      }
    }else{
      if(i*ymax-j*xmax==0){
        buffer[inicio+2*(j+(i*512))]=color;
      }
    }
  }
}



x1=coord1x
y1=coord1y
x2=coord2x
y2=coordy2
xorigen,yorigen;
xmax,ymax;
flag;
if(x1<x2){
  xorigen=x1
  xmax=x2
}else{
  xorigen=x2
  xmax=x1
}
if(y1<y2){
  yorigen=y2
  if(xorigen==x2){
    flag=suma
  }else{
    flag=resta
  }
  ymax=y1
}else{
  yorigen=y1
  if(xorigen==x1){
    flag=resta
  }else{
    flag=suma
  }
  ymax=y2
}
