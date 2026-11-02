void setup()
{
  size(1000,1000);
  background(#81A799);
}

void draw()
{
  //plate
  fill(255);
  strokeWeight(5);
  stroke(100);
  ellipse(500, 650, 500,100);
  fill(200);
  stroke(200);
  ellipse(500, 650, 300,80);
  

 
  //lemon
  fill(#FFA30D);
  stroke(#FFA30D);
  ellipse(360,500, 50,30);
  ellipse(500,500, 300, 300);
  fill(#FFCA74);
  stroke(#FFCA74);
  ellipse(420,500, 130,200);
  
  //detail
  fill(255);
  stroke(255);
  ellipse(430,400, 50,20);
  fill(#B48B02);
  stroke(#B48B02);
  ellipse(500,630, 30,10);
  ellipse(520,640, 50,10);
  ellipse(460,630, 30,10);
  
  
  //inside
  fill(#FFF6D8);
  ellipse(570,500, 140,210);
  
  //citrus
  fill(#FAF07C);  
  stroke(#FAF07C);
  arc(590,490, 95,100, 5.55,QUARTER_PI+5.8);
  arc(590,500, 95,160, 0.15,0.7); 
  arc(585, 500, 110,180, 0.73,HALF_PI+0.6);
  arc(580, 490, 150,220, 2.2,3.14);
  arc(580,485, 150, 180, 3.2, 3.93);
  arc(585,485, 150,170, 4,4.6);
  arc(585,485, 95,160, 4.8,5.8);
}
