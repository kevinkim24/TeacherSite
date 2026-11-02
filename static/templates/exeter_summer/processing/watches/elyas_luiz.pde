//Collaborators: Elyas and Luiz

int fRate = 60;
void setup() {
  size(500, 500);
  background(255);
  frameRate(fRate);
  smooth();
}

float secondsPassed = 0;
void draw() {
  
  //standard settings and time counting
  stroke(0);
  strokeWeight(1);
  background(255);
  secondsPassed += (float(1)/float(fRate)); // counts the correct time no matter the frame rate
  float minutesPassed = secondsPassed/60;
  float hoursPassed = minutesPassed/60;
  //println(secondsPassed, minutesPassed, hoursPassed); //debugging
  
  //lugs
  fill(#FFB70D);
  quad(1.5*width/5, 0.3*height/5, 1.3*width/5, 0.4*height/5, 1.3*width/5, 4.6*height/5, 1.5*width/5, 4.7*height/5);
  quad(3.5*width/5, 0.3*height/5, 3.7*width/5, 0.4*height/5, 3.7*width/5, 4.6*height/5, 3.5*width/5, 4.7*height/5);
  
  //strap
  fill(#8B3307);
  rect(1.5*width/5, 0, 2*width/5, height);
  
  //shape of the clock and crown
  fill(#FFB70D);
  rect(width/2 + 2*width/5, height/2 - height/14, width/11, height/7);
  rect(width/2 + 2*width/5, height/2 - height/12, width/13, height/6);
  
  line(width/2 + 2*width/5, height/2 - height/12 + 1*height/30, width/2 + 2*width/5 + width/13, height/2 - height/12 + 1*height/30);
  line(width/2 + 2*width/5, height/2 - height/12 + 2*height/30, width/2 + 2*width/5 + width/13, height/2 - height/12 + 2*height/30);
  line(width/2 + 2*width/5, height/2 - height/12 + 3*height/30, width/2 + 2*width/5 + width/13, height/2 - height/12 + 3*height/30);
  line(width/2 + 2*width/5, height/2 - height/12 + 4*height/30, width/2 + 2*width/5 + width/13, height/2 - height/12 + 4*height/30);
  
  ellipse(width/2,height/2,4.3*width/5,4.3*height/5);
  
  fill(#FFCC00);
  ellipse(width/2, height/2, 4*width/5, 4*height/5);
  
  noStroke();
  fill(#FFF586);
  ellipse(width/2, height/2, 3*width/5, 3*height/5);
  
  //OMEGA logo
  float x = width/9;
  float y = height/9;
  stroke(180);
  strokeWeight(3);
  fill(#FFF586);
  arc(width/2, height/3, x , y, 2*PI/3, PI/3 + 2*PI);
  line(width/2 + x/2*cos(2*PI/3), height/3 + y/2*sin(2*PI/3), width/2 + x/2*cos(2*PI/3) - x/3, height/3 + y/2*sin(2*PI/3));
  line(width/2 + x/2*cos(PI/3), height/3 + y/2*sin(PI/3), width/2 + x/2*cos(PI/3) + x/3, height/3 + y/2*sin(PI/3));
  
  //seconds sub-dial
  strokeWeight(1);
  noFill();
  ellipse(width/2, 2*height/3, width/5, height/5);
  
  //watch hands
  strokeWeight(3);
  stroke(180);
  line(width/2, 2*height/3, width/2 + width*cos((PI + HALF_PI + PI*secondsPassed/30) % TWO_PI)/15, 2*height/3 + height*sin((PI + HALF_PI + PI*secondsPassed/30) % TWO_PI)/15);
 
  strokeWeight(5);
  stroke(0);
  line(width/2, height/2, width/2 + 1.3*width*cos((PI + HALF_PI + PI*minutesPassed/30) % TWO_PI)/5, height/2 + 1.3*height*sin((PI + HALF_PI + PI*minutesPassed/30) % TWO_PI)/5);
  
  stroke(120);
  line(width/2, height/2, width/2 + width*cos((PI + HALF_PI + PI*hoursPassed/6) % TWO_PI)/10, height/2 + height*sin((PI + HALF_PI + PI*hoursPassed/6) % TWO_PI)/10);

  //Numbers and circles
  fill(81);
  strokeWeight(1);
  stroke(81);
  textAlign(CENTER, CENTER);
  textSize(25);
  
  text("III", width/2 + 1.7*width*cos(0)/5, height/2 + 1.7*height*sin(0)/5);
  text("VI", width/2 + 1.7*width*cos(0.5*PI)/5, height/2 + 1.7*height*sin(0.5*PI)/5);
  text("IX", width/2 + 1.7*width*cos(PI)/5, height/2 + 1.7*height*sin(PI)/5);
  text("XII", width/2 + 1.7*width*cos(1.5*PI)/5, height/2 + 1.7*height*sin(1.5*PI)/5);
  
  ellipse(width/2 + 1.7*width*cos(PI/6)/5, height/2 + 1.7*height*sin(PI/6)/5, 10, 10);
  ellipse(width/2 + 1.7*width*cos(2*PI/6)/5, height/2 + 1.7*height*sin(2*PI/6)/5, 10, 10);
  ellipse(width/2 + 1.7*width*cos(4*PI/6)/5, height/2 + 1.7*height*sin(4*PI/6)/5, 10, 10);
  ellipse(width/2 + 1.7*width*cos(5*PI/6)/5, height/2 + 1.7*height*sin(5*PI/6)/5, 10, 10);
  ellipse(width/2 + 1.7*width*cos(7*PI/6)/5, height/2 + 1.7*height*sin(7*PI/6)/5, 10, 10);
  ellipse(width/2 + 1.7*width*cos(8*PI/6)/5, height/2 + 1.7*height*sin(8*PI/6)/5, 10, 10);
  ellipse(width/2 + 1.7*width*cos(10*PI/6)/5, height/2 + 1.7*height*sin(10*PI/6)/5, 10, 10);
  ellipse(width/2 + 1.7*width*cos(11*PI/6)/5, height/2 + 1.7*height*sin(11*PI/6)/5, 10, 10);
}
