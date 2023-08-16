float currentSec = 0;
void setup(){
  size(800,800);
  background(0);
  
}
void draw(){
  smooth();
  
  // case
  strokeWeight(20);
  stroke(#B7B7B7);
  fill(#F5E8BE);
  ellipse(width/2,height/2,width*0.8,height*0.8);
  
  // hour markers
  strokeWeight(8);
  fill(#CB7B7B);
  stroke(#CB7B7B);
  textSize(100);
  text("12",width/2-width/15,0.24*height);
  float ind1X1 = cos(float(10) / 12 * TWO_PI)* 0.27*width + width/2;
  float ind1Y1 = sin(float(10) / 12 * TWO_PI)*0.27*height + height/2;
  float ind1X2 = cos(float(10) / 12 * TWO_PI)* 0.35*width + width/2;
  float ind1Y2 = sin(float(10) / 12 * TWO_PI)*0.35*height + height/2;
  line(ind1X1,ind1Y1,ind1X2, ind1Y2);
  float ind2X = cos(float(11) / 12 * TWO_PI)* 0.27*width + width/2;
  float ind2Y = sin(float(11) / 12 * TWO_PI)*0.27*height + height/2;
  text("2",ind2X,ind2Y);
  float ind3X1 = cos(float(0) / 12 * TWO_PI)* 0.27*width + width/2;
  float ind3Y1 = sin(float(0) / 12 * TWO_PI)*0.27*height + height/2;
  float ind3X2 = cos(float(0) / 12 * TWO_PI)* 0.35*width + width/2;
  float ind3Y2 = sin(float(0) / 12 * TWO_PI)*0.35*height + height/2;
  line(ind3X1,ind3Y1,ind3X2, ind3Y2);
  float ind4X = cos(float(1) / 12 * TWO_PI)* 0.25*width + width/2;
  float ind4Y = sin(float(1) / 12 * TWO_PI)*0.4*height + height/2;
  text("IV",ind4X,ind4Y);
  float ind5X1 = cos(float(2) / 12 * TWO_PI)* 0.27*width + width/2;
  float ind5Y1 = sin(float(2) / 12 * TWO_PI)*0.27*height + height/2;
  float ind5X2 = cos(float(2) / 12 * TWO_PI)* 0.35*width + width/2;
  float ind5Y2 = sin(float(2) / 12 * TWO_PI)*0.35*height + height/2;
  line(ind5X1,ind5Y1,ind5X2, ind5Y2);
  float ind7X1 = cos(float(4) / 12 * TWO_PI)* 0.27*width + width/2;
  float ind7Y1 = sin(float(4) / 12 * TWO_PI)*0.27*height + height/2;
  float ind7X2 = cos(float(4) / 12 * TWO_PI)* 0.35*width + width/2;
  float ind7Y2 = sin(float(4) / 12 * TWO_PI)*0.35*height + height/2;
  line(ind7X1,ind7Y1,ind7X2, ind7Y2);
  float ind8X = cos(float(5) / 12 * TWO_PI)* 0.37*width + width/2;
  float ind8Y = sin(float(5) / 12 * TWO_PI)*0.4*height + height/2;
  text("VIII",ind8X,ind8Y);
  float ind9X1 = cos(float(6) / 12 * TWO_PI)* 0.27*width + width/2;
  float ind9Y1 = sin(float(6) / 12 * TWO_PI)*0.27*height + height/2;
  float ind9X2 = cos(float(6) / 12 * TWO_PI)* 0.35*width + width/2;
  float ind9Y2 = sin(float(6) / 12 * TWO_PI)*0.35*height + height/2;
  line(ind9X1,ind9Y1,ind9X2, ind9Y2);
  float ind10X = cos(float(7) / 12 * TWO_PI)* 0.37*width + width/2;
  float ind10Y = sin(float(7) / 12 * TWO_PI)*0.27*height + height/2;
  text("10",ind10X,ind10Y);
  float ind11X1 = cos(float(8) / 12 * TWO_PI)* 0.27*width + width/2;
  float ind11Y1 = sin(float(8) / 12 * TWO_PI)*0.27*height + height/2;
  float ind11X2 = cos(float(8) / 12 * TWO_PI)* 0.35*width + width/2;
  float ind11Y2 = sin(float(8) / 12 * TWO_PI)*0.35*height + height/2;
  line(ind11X1,ind11Y1,ind11X2, ind11Y2);
  
  // min/hour hands
  strokeWeight(1);
  fill(#B7B7B7);
  stroke(#B7B7B7);
  ellipse(width/2,height/2,width*0.04,height*0.04);
  strokeWeight(15);
  float hourX = cos(float(7) / 12 * TWO_PI)*0.25*width + width/2;
  float hourY = sin(float(7) / 12 * TWO_PI)*0.25*height + height/2;
  float minuteX = cos(float(11) / 12 * TWO_PI)* 0.35*width + width/2;
  float minuteY = sin(float(11) / 12 * TWO_PI)*0.35*height + height/2;
  line(width/2,height/2,hourX, hourY);  // silver base
  line(width/2,height/2,minuteX, minuteY);
  stroke(255);                                      
  
  //lume
  strokeWeight(10);
  float hourLumeX1 = cos(float(7) / 12 * TWO_PI)*0.05*width + width/2;
  float hourLumeY1 = sin(float(7) / 12 * TWO_PI)*0.05*height + height/2;
  float hourLumeX2 = cos(float(7) / 12 * TWO_PI)*0.23*width + width/2;
  float hourLumeY2 = sin(float(7) / 12 * TWO_PI)*0.23*height + height/2;
  line(hourLumeX1,hourLumeY1,hourLumeX2, hourLumeY2);
  float minLumeX1 = cos(float(11) / 12 * TWO_PI)*0.05*width + width/2;
  float minLumeY1 = sin(float(11) / 12 * TWO_PI)*0.05*height + height/2;
  float minLumeX2 = cos(float(11) / 12 * TWO_PI)*0.33*width + width/2;
  float minLumeY2 = sin(float(11) / 12 * TWO_PI)*0.33*height + height/2;
  line(minLumeX1,minLumeY1,minLumeX2, minLumeY2);
  
  // seconds markers
  stroke(#E5DBB7);
  noFill();
  strokeWeight(4);
  ellipse(width/2,height/2+0.18*height, 0.22*width,0.22*height);
  
  // seconds -- END!
  frameRate(1);
  stroke(#CE4949);
  currentSec = (currentSec + 1) % 60;
  //println(currentSec);
  strokeWeight(5);
  float currentX = cos(currentSec / 60 * TWO_PI)* 0.1*width + width/2;
  float currentY = sin(currentSec / 60 * TWO_PI)*0.1*height + height/2 + 0.18* height;
  line(width/2,height/2+0.18*height,currentX, currentY);
}
