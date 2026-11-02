void setup()
{
 size(1000,1000);
 background(255);
  
} 
void draw()
{
  fill(#D6B429);
  ellipse(width/2,height/2,width/1.6,height/1.6);
  
  fill(#F0EBD7);
  ellipse(width/2,height/2,width/1.8,height/1.8);    //outline
  
  fill(0);
  ellipse(width/2,height/2,width/2.2,height/2.2);
  
  fill(#F0EBD7);
  ellipse(width/2,height/2,width/2.6,height/2.6);
  
  textSize(40);
  fill(0);
  text("ZENITH",435,385);
  
  textSize(25);
  fill(0);
  text("EL PRIMERO",435,410);
  
  //-------------------------------------------------------------------------------------------------------------
  
  fill(#404246);
  ellipse(width/2,width/3*1.8,width/22*3,width/22*3);
  ellipse(width/2,width/3*1.8,width/28*3,width/28*3);
  
  fill(#9E9FA0);
  ellipse(width/2.4,width/2,width/22*3,width/22*3);
  ellipse(width/2.4,width/2,width/28*3,width/28*3);         //small circles
  
  fill(#0C3476);
  ellipse(width/5.15*3,width/2,width/22*3,width/22*3);
  ellipse(width/5.15*3,width/2,width/28*3,width/28*3);
  
  textSize(30);
  fill(255);
  text("1",492,570);
  
  textSize(30);
  fill(255);
  text("9",452,615);
  
  textSize(30);
  fill(255);
  text("3",532,618);
  
  textSize(30);
  fill(255);                              //numbers inside small circles
  text("6",492,645);
  
  textSize(30);
  fill(255);
  text("30",568,472);
  
  textSize(30);
  fill(255);
  text("20",540,525);
  
  textSize(30);
  fill(255);
  text("10",600,525);
  
  textSize(30);
  fill(255);
  text("60",400,472);
  
  textSize(30);
  fill(255);
  text("45",370,512);
  
  textSize(30);
  fill(255);
  text("15",436,512);
  
  textSize(30);
  fill(255);
  text("30",400,548);
  
  //---------------------------------------------------------------------------------------------
  
  textSize(40);
  fill(0);
  text("60",480,260);
  
  textSize(40);
  fill(0);
  text("70",300,342);
  
  textSize(40);
  fill(0);
  text("120",475,765);
  
  textSize(35);
  fill(0);
  text("100",308,700);                      //number in the big circle
  
  textSize(35);
  fill(0);
  text("180",640,700);
  
  textSize(35);
  fill(0);
  text("400",660,342);
  
  textSize(40);
  fill(0);
  text("80",225,520);
  
  textSize(30);
  fill(0);
  text("260",730,520);
  
  
  
  //-------------------------------------------------------------------------------------------------
  
  fill(#D6B429);
  ellipse(500,500,20,20);
  
  fill(#D6B429);
  ellipse(500,600,15,15);
  
  fill(#D6B429);
  ellipse(418,500,15,15);                      //indicators
  
  fill(#D6B429);
  ellipse(584,500,15,15);
  
  line(500,250,500,500);  
  
  line(500,600,540,645);
  
  line(418,500,380,450);
  
  line(584,500,610,555);

  line(515,515,380,380);
  
  line(485,515,670,350);
  
  
  //----------------------------------------------------------------------------------------------
  

  fill(#D6B429);
  rect(490,272,20,60);
  
  fill(#D6B429);
  rect(490,692,20,36);                //small rectangles
  
  fill(#D6B429);
  rect(272,495,36,20);
  
  fill(#D6B429);
  rect(691,495,36,20);
  
  fill(#D6B429);
  rect(810,470,26,70);
  
  fill(#D6B429);
  rect(775,350,46,20);
  fill(#D6B429);
  rect(810,340,16,40);
  
  fill(#D6B429);
  rect(768,640,46,20);
  rect(810,630,16,40);
 
  
//-------------------------------------------------------------------------------------------------------

fill(#D6B429);
triangle(280,720,400,795,400,900);

fill(#D6B429);
triangle(710,730,600,795,600,900);

fill(#D6B429);                                  //brown outline
triangle(280,278,400,205,400,108); 

fill(#D6B429);
triangle(715,272,600,205,600,108);

fill(#43360D);
rect(400,814,200,200);

fill(#43360D);
rect(400,-15,200,200);

line(460,814,460,1000);
line(540,814,540,1000);
line(400,950,600,950);

line(460,0,460,185);
line(540,0,540,185);
line(400,60,600,60);
  
  
  
 
  
}
