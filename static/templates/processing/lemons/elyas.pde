void setup()
{
  size(1000,1000);
  background(#08219B);
}
void draw()
{
 fill(255);
 beginShape();
 vertex(300,370);
 vertex(325,345);
 vertex(190,210);
 vertex(140,260);
 vertex(160,280);
 vertex(185,255);
 endShape();
 beginShape();
 vertex(500,250);
 vertex(620,120);
 endShape();
 fill(183,0,0);
 arc(620,120,90,90,PI,TWO_PI+HALF_PI);
 fill(255);
 ellipse(500,800,800,200);
 fill(#E3EA28);
 ellipse(500,500,660,600);
 fill(#E6E8B4);
 ellipse(680,500,300,450);
 fill(#DFE377);
 arc(680,500,250,400,4.4,5.27);
 arc(680,500,250,400,5.47,6.34);
 arc(680,500,250,400,6.54,7.41);
 arc(680,500,250,400,7.61,8.48);
 arc(680,500,250,400,8.68,9.55);
 arc(680,500,250,400,9.75,10.62);
}
