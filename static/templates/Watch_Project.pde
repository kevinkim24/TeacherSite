float currentSec = 0;
void setup(){
  size(800,800);
  background(0);
  //frameRate(1);
}
void draw(){
  smooth();
  
  // case
  strokeWeight(20);
  stroke(#B7B7B7);
  fill(255);
  ellipse(width/2,height/2,width*0.8,height*0.8);
  
  // hands
  strokeWeight(1);
  fill(#B7B7B7);
  ellipse(width/2,height/2,width*0.04,height*0.04);
  strokeWeight(10);
  float hourX = cos(float(7) / 12 * TWO_PI)*0.25*width + width/2;
  float hourY = sin(float(7) / 12 * TWO_PI)*0.25*height + height/2;
  float minuteX = cos(float(11) / 12 * TWO_PI)* 0.35*width + width/2;
  float minuteY = sin(float(11) / 12 * TWO_PI)*0.35*height + height/2;
  stroke(0);
  line(width/2,height/2,hourX, hourY);
  line(width/2,height/2,minuteX, minuteY);
  
  // seconds -- END!
  frameRate(60);
  stroke(#CE4949);
  currentSec = (currentSec + 1) % 60;
  print(currentSec);
  strokeWeight(5);
  float currentX = cos(currentSec / 60 * TWO_PI)* 0.35*width + width/2;
  float currentY = sin(currentSec / 60 * TWO_PI)*0.35*height + height/2;
  line(width/2,height/2,currentX, currentY);
}
