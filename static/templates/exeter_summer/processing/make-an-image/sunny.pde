void setup()
{
  size(1000,500);
  background(234,235,221);
}

void draw()
{
fill(#EFF01F);
arc(200, 200, 320, 320, QUARTER_PI, PI+HALF_PI+QUARTER_PI,PIE);
fill(0);
ellipse(225,110,20,20);
fill(#1F55F0);
ellipse(270,200,20,20);
fill(#F01FDB);
ellipse(370,200,20,20);
fill(#1FF074);
ellipse(470,200,20,20);
fill(#F01F62);
ellipse(570,200,20,20);
fill(#401624);
ellipse(670,200,20,20);
fill(#162640);
ellipse(770,200,20,20);
fill(#CEC2CB);
line(200,210,200,190);

fill(#549861);
rect(0,450,1000,100);
fill(#202115);
rect(880,200,100,250);
fill(#2D8647);
triangle(800,200,1060,200,930,100);
}
