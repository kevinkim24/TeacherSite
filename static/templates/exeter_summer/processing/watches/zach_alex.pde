void setup() {
  size(800, 800);
background(255);
frameRate(1);
}
void draw() {
  float a = (TWO_PI);
  float x = (width/4*cos(a) + width/2);
  float y = (height/4*sin(a)+ height/2);
  background(255);
  textSize(64);
  strokeWeight(1);
  fill(256, 256, 256, 256);
  fill(#CECECE);
  stroke(#717171);
  quad(width/4*3+15, height/3+40, width/3*2+20, height/7, width/3-20, height/7, width/4-15, height/3+40);//top part
  quad(width/4*3+15, height/3*2-40, width/3*2+20, height/7*6, width/3-20, height/7*6, width/4-15, height/3*2-40);//bottom part
  quad(width/3*2, height/7, width/3*2-15, 0, width/3+15, 0, width/3, height/7);//top bracelet
  quad(width/3*2, height/7*6, width/3*2-15, height, width/3+15, height, width/3, height/7*6);//bottom bracelet
  ellipse(width/2, height/2, width/2+70, height/2+70);//outside circle
  rect(width/4*3+35, height/2-25, 25, 50);//crown
  fill(#9E9E9E);
  ellipse(width/2, height/2, width/2+20, height/2+20);//2nd outside circle
  fill(0);
  stroke(0);
  ellipse(width/2, height/2, width/2, height/2);//inside circle
  fill(255, 255, 255);
  triangle(width/2-18, height/4+18, width/2+18, height/4+18, width/2, height/4+59);//triangle
  stroke(255);
  line(width/2, height/4+4, width/2, height/4+14);//12h
  line(width/2, height/4*3-4, width/2, height/4*3-14);//6h
  line(width/4+4, height/2, width/4+14, height/2);//9h
 line(width/4*3-4, height/2, width/4*3-14, height/2);//3h
  quad(width/4*0.853-17+width/2, height/4*0.5225-17+height/2, width/4*0.8788-17+width/2, height/4*0.477-17+height/2, width/4*-0.853+17+width/2, height/4*-0.5225+17+height/2, width/4*-0.87+17+width/2, height/4*-0.49+17+height/2);//10-4
  quad(width/4*0.477-17+width/2, height/4*0.879-17+height/2, width/4*0.5225-17+width/2, height/4*0.8526-17+height/2, width/4*-0.477+17+width/2, height/4*-0.8788+17+height/2, width/4*-0.5225+17+width/2, height/4*-0.853+17+height/2);//11-5
  quad(width/4*0.5225-17+width/2, height/4*-0.853+17+height/2, width/4*0.477-17+width/2, height/4*-0.8788+17+height/2, width/4*-0.5225+17+width/2, height/4*0.853-17+height/2, width/4*-0.477+17+width/2, height/4*0.8788-17+height/2);//7-1
  quad(width/4*-0.8788+17+width/2, height/4*0.477-17+height/2, width/4*-0.853+17+width/2, height/4*0.5225-17+height/2, width/4*0.8788-17+width/2, height/4*-0.477+17+height/2, width/4*0.853-17+width/2, height/4*-0.5225+17+height/2);//8-2
  fill(0);
  stroke(0);
  ellipse(width/2, height/2, width/2-114, height/2-114);//center circle
  fill(255, 255, 255);
  ellipse(width/2, height/2, 20, 20);//watch center
  fill(#404040);
  ellipse(width/2, height/8*5-20, width/10, height/10); //chronograph outside
  fill(#CECECE);
  ellipse(width/2, height/8*5-20, width/10-15, height/10-15);//chronograph inside
  fill(#404040);
  ellipse(width/2, height/8*5-20, 10, 10);//chronograph center
  fill(#CECECE);
  fill(255, 255, 255);
  text("3", width/4*3-45, height/2+20);
  text("6", width/2-15, height/4*3-16);
text("9", width/4+15, height/2+20);
textSize(25);
text("ROLEX", width/2-35, height/8*3+30);
textSize(15);
text("OYSTER PERPETUAL", width/2-60, height/8*3+45);
text("EXPLORER", width/2-30, height/8*3+60);
stroke(255);
  line(width/2, height/2, x, y);//seconds
  strokeWeight(1);
  stroke(0);
  line(width/2, height/8*5-20, width/2+28, height/2+height/10);
  strokeWeight(10);
  stroke(255);
  line(width/2, height/2, width/5*2, height/5*2);//hours
  line(width/2, height/2, width/2, height/7*5);//minutes
a = a+1;
}
