

void setup() {
  size(500, 500);
  
}

void draw()
{
  
  background(44,176,240);
    noFill();

  ellipse(250,150, 100,100);
  ellipse(250,300, 200,200);
  
  line(150,300,60,175);
  line(350,300,420,175);

fill(0);
rect(190,240,120,125);

fill(237,252,25);
triangle(230,100,250,70,270,100);

arc(250,300,35,35,0,PI+QUARTER_PI);


fill(229,25,252);
ellipse(255,290,10,10);
ellipse(260,275,10,10);

}
