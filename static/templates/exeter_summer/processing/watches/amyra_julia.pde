//collaborators Julia Srour and Amyra Penaherrera

void setup()

{
 size(500,500);
  //make variabels for locations
float caseW = (3*width/4);
float caseL = (3*height/4);
float centerX = (width/2);
float centerY = (height/2);


 // size(500,500);
  background(227,222,222);
  
//crown at first so that its at the background, made up of two shapes, as well as the wrist
fill(193,193,193);
ellipse(centerX+195, centerY-5, 30,30);
rect(centerX+170, centerY-20, 30,30);
fill(129,83,46);
rect(centerX-110,0,220,height);

  // case and body, tweo main circles, customizing the thickness, colour and smoothness of lines
  strokeWeight(3);
  smooth(); //to smooth out the lines
  fill(255,222,129); //colour of outer circle
  ellipse(width/2,height/2,caseW,caseL); //outer case
  fill(255,255,255);
  ellipse(width/2,height/2,300,300);
    fill(232,146,112);
    
    //make variables for numbers to show hours, only 3,6,9 and 12 
  
char letter = ('I');
char letterV = ('V');
char letterX = ('X');
  
  //numbers, starting with 3, stating the text size for all numbers as well as the colour
  textSize(40);
  fill(247,217,140);
  text(letter, caseW, centerY+10);
  text(letter, caseW-20, centerY+10);
  text(letter, caseW-10, centerY+10);
  
  // Adding number 6
  
  text(letterV, centerX-18, caseL);
  text(letter, centerX+5, caseL);
  
  //Adding number 9 using variables that show Roman numerals
  
  text(letter, caseW/3, centerY+10);
  text(letterX, caseW/3+10, centerY+10);
  
  
  // Making last and highest number in roman numerals
  
  text(letterX, centerX-28, caseL/3+15);
  text(letter, centerX-10, caseL/3+15);
  text(letter, centerX, caseL/3+15);
  
  //hour marking lines adding new variables and working with numbers that correctly present hour markings

float markingX = (width/3);
float markingY = (height/3);

  line(2*markingX-30, markingY-10, 2*markingX-13, markingY-47);
  line(2*markingX+10, markingY+30, 2*markingX+48, markingY+10);
  line(markingX+25, markingY-10, markingX, markingY-40);
  line(markingX, markingY+30, markingX-45, markingY+10);
  line(2*markingX+50, 2*markingY-10, 2*markingX+10, 2*markingY-35);
  line(2*markingX, 2*markingY+45, 2*markingX-27, 2*markingY+5);
  line(markingX+40, 2*markingY+5, markingX+5, 2*markingY+45);
  line(markingX-50, 2*markingY-15, markingX, 2*markingY-40);
  
 //hours hand, using feature of quad to customize the shape
  fill(255,222,129);
  quad(centerX,centerY, centerX+40, centerY+50, centerX+40, centerY+70, centerX+20, centerY+60);
  
  //minutes hand altering thickness and colour
  strokeWeight(5);
  line(centerX,centerY, centerX+70, centerY-70);
  strokeWeight(3);
  fill(247,199,140);
  ellipse(centerX, centerY, 10,10);
    
 //seconds circle and hand using previous variables
 fill(255,255,255);
 ellipse(centerX, centerY-60, 50,50);
 stroke(255,28,8);
 line(centerX,centerY-60, centerX+18, centerY-70);
 

  

}
