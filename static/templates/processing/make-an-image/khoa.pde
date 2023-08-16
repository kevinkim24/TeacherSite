void setup()
{
  size(500,500);
}

void draw()
{
  //hands
  line(200,350, 80,300);
  line(270,350, 450,300);
  
  //body
  fill(255);
  ellipse(250,220, 140,140);
  ellipse(250,370, 200,200);
  
  //eyes
  fill(0,0,255);
  ellipse(220,200, 20,20);
  ellipse(280,200, 20, 20);
  
  //nose
  fill(#FCA503);
  triangle(230,220, 270,220, 250,250);
  
  //hat
  fill(#FF0D0D);
  triangle(200,150, 300,150, 250, 70);
  fill(255);
  ellipse(250,70,30,30);
  fill(#4085E3);
  rect(190,135, 120,20);
}
