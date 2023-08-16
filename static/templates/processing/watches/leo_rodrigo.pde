//collaboration between Rodrigo Bentacourt and Leo Moustakas
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup(){
  size(400, 400);
    int radius = min(width, height) / 2;
  secondsRadius = radius * 0.45; //the following variables decide the size of the clock handles
  minutesRadius = radius * 0.5;
  hoursRadius = radius * 0.4;
  clockDiameter = radius * 1.8;

  cx = width / 2; //this variable shows that the x coordinate
  //that is at the center point of the clock is equal to width/2
  cy = height / 2;//this variable shows that the y coordinate
  //that is at the center point of the clock is equal to height/2
}

void draw(){
    background(0);
     stroke (0,0,0);
  strokeWeight (2);
  //watch band (top)
fill (147,147,147);
quad (width/2 * 0.80, height/4 * 0.20,width/2 * 0.82, 1, width/2 * 1.18, 1, width/2 * 1.20, height/4 * 0.20);
quad (width/2 * 0.75, height/4 * 0.50, width/2 * 0.80, height/4 * 0.20, width/2 * 1.20, height/4 * 0.20, width/2 * 1.25, height/4 * 0.50);
quad (width/2 * 0.7, height/4 * 0.80 , width/2 * 0.75, height/4 * 0.50, width/2 * 1.25, height/4 * 0.50, width/2 * 1.30, height/4 * 0.80);
quad (width/2 * 0.6, height/4 * 1.10 , width/2 * 0.7, height/4 * 0.80, width/2 * 1.30, height/4 * 0.80, width/2 * 1.40, height/4 * 1.10);

fill (185,185,185);
rect (width/2 * 0.85, height/4 * 0.72, width/7, height/25);
rect (width/2 * 0.85, height/4 * 0.42, width/7, height/25);
rect (width/2 * 0.85, height/4 * 0.12, width/7, height/25);

//watch band (bottom)
fill (147,147,147);
quad (width/2 * 0.80, height/4 * 3.80,width/2 * 0.82, height, width/2 * 1.18, height, width/2 * 1.20, height/4 * 3.80);
quad (width/2 * 0.75, height/4 * 3.50, width/2 * 0.80, height/4 * 3.80, width/2 * 1.20, height/4 * 3.80, width/2 * 1.25, height/4 * 3.50);
quad (width/2 * 0.7, height/4 * 3.20, width/2 * 0.75, height/4 * 3.50, width/2 * 1.25, height/4 * 3.50, width/2 * 1.30, height/4 * 3.20);
quad (width/2 * 0.6, height/4 * 2.90, width/2 * 0.7, height/4 * 3.20, width/2 * 1.30, height/4 * 3.20, width/2 * 1.40, height/4 * 2.90);

fill (185,185,185);
rect (width/2 * 0.85, height/4 * 3.12, width/7, height/25);
rect (width/2 * 0.85, height/4 * 3.42, width/7, height/25);
rect (width/2 * 0.85, height/4 * 3.72, width/7, height/25);
    
  //grey part + circle
  fill(221, 220, 215);
 stroke(121, 121, 121);
  ellipse(width/2, height/2, width * 0.65,height * 0.65);
  //nautic blue part + circle
  fill(117, 139, 176);
  ellipse(width/2, height/2, width * 0.55, height * 0.55);
  //dot + center point
  fill(221, 220, 215);
  ellipse(width/2, height/2, width * 0.02, height * 0.02);

  //signature
    textSize(10);
  text("PATEK PHILIPPE" , width/2 * 0.84, height/2 * 0.8);
  textSize(7);
  text("GENEVE", width/2 * 0.95, height/2 * 0.85);


 //latin numerals
 stroke(230, 229, 225); //lines
 strokeWeight(7);
 line( width/1.94, height/4 ,width/1.94, height/4 * 1.2);
line( width/2.02, height/4  , width/2.02, height/4 * 1.2);
line( width/2, height/4 * 2.8, width/2, height/4 * 3);
line(width/2 * 0.52, height/2, width/2 * 0.6, height/2);
line( width/1.55, height/4 * 1.22, width/1.63, height/4 * 1.39);
line(width/1.4, height/4 * 1.55 ,width/1.5, height/4 * 1.65);
line(width/1.67, height/2 * 1.29, width/1.6, height/2 * 1.39);
line(width/1.4, height/2 * 1.23 ,width/1.5, height/2 * 1.14);
line(width/4 * 1.42, height/4 * 1.2, width/4 * 1.52, height/4 * 1.38);
line(width/4 * 1.17, height/4 * 1.55, width/4 * 1.4, height/2 * 0.84);
line(width/4 * 1.17, height/4 * 2.5, width/4 * 1.4, height/2 * 1.2);
line(width/4 * 1.42, height/4 * 2.8, width/4 * 1.52, height/2 * 1.3);

//crown
fill(203, 205, 204);
//the following lines express the roughness of the crown
stroke(121, 121, 121);
strokeWeight(2);
rect(width/2 * 1.65, height/2 * 0.95, width/30, height/25);
line(width/2 * 1.65, height/2 * 0.97, width/2 * 1.715 ,height/2 * 0.97);
line(width/2 * 1.65, height/2 * 0.99, width/2 * 1.715 ,height/2 * 0.99);
line(width/2 * 1.65, height/2 * 1.01, width/2 * 1.715 ,height/2 * 1.01);

//aperture
strokeWeight (3);
fill (255,255,255);
rect (width/2 * 1.4, height/2 * 0.95, width/20, height/20);
fill(0);
textSize(13);
text("17", width/2 * 1.42, height/2 * 1.03);//date + it doesn't change every day

//these variables store the angles for the sec, min, hour hands
  //seconds: returns current second value
  //(TWO_PI * second() / 60.0): Converts the seconds value to an angle in radians. TWO_PI = 360 degrees and dividing by 60
  //makes the seconds value to the range of 0 to 1 (fraction of a minute)
 // - HALF_PI: Since angles for sin() and cos() start at 3 o'clock, we - HALF_PI to make them start at the top (12 o'clock)
  float a =  (TWO_PI * second() / 60.0) - HALF_PI;
  //minute: returns current minute value
  //norm: normalizes the current seconds value (from 0 to 59) to a value between 0 and 1
  //TWO_PI * (minute() + norm(second(), 0, 60)) / 60.0): Converts the minutes value  to an angle in radians 
   // - HALF_PI: Since angles for sin() and cos() start at 3 o'clock, we - HALF_PI to make them start at the top (12 o'clock)
  float b =  (TWO_PI * (minute() + norm(second(), 0, 60)) / 60.0) - HALF_PI;
 //hour: Returns the current hour value (from 0 to 23).
// hour() % 12: Uses the operator % to make sure the hour value is in the range of 0 to 11 converting it to a 12-hour format.
//TWO_PI * (hour() % 12 + norm(minute(), 0, 60)) / 12.0): Converts the hours value  to an angle in radians,
// - HALF_PI: Since angles for sin() and cos() start at 3 o'clock, we - HALF_PI to make them start at the top (12 o'clock)
  float c =  (TWO_PI * (hour() % 12 + norm(minute(), 0, 60)) / 12.0) - HALF_PI;
    stroke(255);
  strokeWeight(1);
  //starting point is cx, cy and end are calculated based on the angles and hand lengths
  line(cx, cy, cx + cos(a) * secondsRadius, cy + sin(a) * secondsRadius);//seconds
  strokeWeight(2);
  line(cx, cy, cx + cos(b) * minutesRadius, cy + sin(b) * minutesRadius);//minute
  strokeWeight(4);
  line(cx, cy, cx + cos(c) * hoursRadius, cy + sin(c) * hoursRadius);//hour

}
