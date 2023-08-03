//Sound handler
import processing.sound.*;
Sound s;
SoundFile file;

//global variables for controlling the GUI - mode defines the screen that is on, and musicMode says if music will be playing or not
int mode = 0;
boolean musicMode = true;

//setup sets the size and the standard rectMode, as well as starting the sound play
void setup(){
  size (1250,700);
  rectMode(CORNER);
  
  s = new Sound(this);
  file = new SoundFile(this, "music.mp3");
  file.loop();
}

//the following two functions check whether the mouse is over a rectangle (overRect) or a circle (overCircle), useful for creating buttons
boolean overRect(int rectX,int rectY,int rectW,int rectH){
  if(mouseX>rectX&&mouseX<rectX+rectW&&mouseY>rectY&&mouseY<rectY+rectH){
    return true;
  }
  else{
    return false;
  }
}

boolean overCircle(int circX, int circY, int circD){
  if (sqrt((mouseX-circX)*(mouseX-circX)+(mouseY-circY)*(mouseY-circY))<=circD/2){
    return true;
  }
  else{
    return false;
  }
}

//global variables for all games

//flappy ball variables
float a = 980; //acceleration
float v = 0; //velocity
float x = 250;
float y = 250;
float y1 = 0; //y1 is used to record the value of y when the mouse is clicked.
float t = 0; //t is used in the distance formula
float t2 = 0; //t2 is for another counter which need to use time as a measurement.
//variables that control how pillars appear
float stable = 0;
float stable1 = 0;
float stable2 = 0;
float stable3 = 0;
float stable4 = 0;
//height of the pillars
float hPillar;
float hPillar1;
float hPillar2;
float hPillar3;
float hPillar4;
//initial place for the pillars
float x1 = 1250;
float x2 = 1250;
float x3 = 1250;
float x4 = 1250;
//allows the game to restart
int alreadystop = 0;
  
//pong variables
//ball position
float bXPos;
float bYPos;
//paddles 1 and 2 - positons (x positions are fixed)
float p1YPos;
float p2YPos;
//score counter (rP and lP stand for "right points" and "left points")
int rP = 0;
int lP = 0;
//direction is either 1 or -1, depending on where the ball is heading
int direction = -1;
//velocity of the ball in the x and y directions, respectively
float bXVel = 2;
float bYVel = random(-1, 1);

//snake variables
//array that represents the snake
BodyPart[] parts = new BodyPart[350];
//dir varies from 1 to 4, and define where the nake is heading
int dir = 1;
//useful variable to avoid changing the direction 180 degrees (going inside yourself)
int lastDir = dir;
//stores the current apples' details
Apple currentApple = null;
//useful variable for increasing the size of the snake - it stores the position of the last segment of the snake before it moves - that way, if it eats, this is simply added to the parts array
BodyPart lastSegment = null;
//checks whether the player died
boolean dead = false;

//snake classes - they store x and y positions
static class BodyPart {
    int x;
    int y;
    
    public BodyPart(int x, int y) {
      this.x = x;
      this.y = y;
    }
}

static class Apple {
    int x;
    int y;
    
    public Apple(int x, int y) {
      this.x = x;
      this.y = y;
    }
}

//inside draw, we check which screen should be drawn based on the variable mode, as well as turning on/off the sound according to musicMode
void draw(){
  if (mode==0){
    menu();
  }

  else if (mode == 1){
    flappy();
  }
  
  else if (mode == 2) {    
    pong();
  }
  
  else if (mode == 3) {
    snake();
  }
  
  else if (mode == 4) {
    paint(); //yes, the mistery is paint
  }
  
  if (musicMode) {s.volume(1);}
  else {s.volume(0);}
}

void menu(){
  background(0);
  fill(255);
  title();
  buttonFlappy();
  buttonPong();
  buttonSnake();
  buttonMystery();
  musicButton();
  if (overRect(width/16,310,3*width/8,3*height/16)){
    if(mousePressed){
      buttonFlappyClicked();
    }
  }
  if (overRect(9*width/16, 310, 3*width/8, 3*height/16)){
    if(mousePressed){
      buttonPongClicked();
    }
  }
  if (overRect(width/16, 410+3*height/16, 3*width/8,3*height/16)){
    if(mousePressed){
      buttonSnakeClicked();
    }
  }
  if (overRect(9*width/16, 410+3*height/16, 3*width/8, 3*height/16)){
    if(mousePressed){
      buttonMysteryClicked();
    }
  }
  if (overCircle(1200,140,50)){
    if (mousePressed){
      musicMode=!musicMode;
      delay(200);
    }
  }
}

void title(){
  textSize(200);
  text("Arcade Sim", 100, 175);
}

void buttonFlappy(){
  fill(116);
  rect(width/16,310,3*width/8,3*height/16);
  fill(255);
  textSize(72);
  text("Flappy Ball", width/16 + 40, 162+3*width/16);
}

void buttonFlappyClicked(){
  mode=1;
}

void buttonPong(){
  fill(116);
  rect(9*width/16, 310, 3*width/8, 3*height/16);
  fill(255);
  textSize(72);
  text("PONG", 9*width/16+140, 267+ 3*height/16);
}

void buttonPongClicked(){
  mode=2;
  bXPos = width/2;
  bYPos = height/2;
    
  p1YPos = height/2;
  p2YPos = height/2;
  
  rP = 0;
  lP = 0;
  
  rectMode(CENTER);
}

void buttonSnake(){
  fill(116);
  rect(width/16, 410+3*height/16, 3*width/8,3*height/16);
  fill(255);
  textSize(72);
  text("SNAKE", width/16 + 120, 3*height/16 + 500);
}

void buttonSnakeClicked(){
  mode=3;
  rectMode(CENTER);
  parts[0] = new BodyPart(625, 375);  
  generateNewApple(); 
}

void buttonMystery(){
  fill(116);
  rect(9*width/16, 410+3*height/16, 3*width/8, 3*height/16);
  fill(255);
  textSize(72);
  text("MYSTERY", 9*width/16+100, 3*height/16 + 500);
}

void buttonMysteryClicked(){
  mode=4;
  background(0);
}

void musicButton(){
  if(musicMode){
    fill(0,255,0);
    ellipse(1200 , 140, 50, 50);
  }
  else{
    fill(255,0,0);
    ellipse(1200,140,50,50);
  }
}

//Pong Handler
void pong() {
  background(0); 
  drawBall();
  drawPads();
  ballMovement();
  textHandle();
  checkForCollisions();
  AIMovement();
  checkPointWon();
}

void drawBall() {
  fill(255);
  ellipse(bXPos, bYPos, 18, 18);
}


void drawPads() {
  rect(width/20, p1YPos, 8, 80);
  rect(19*width/20, p2YPos, 8, 80);
}

void ballMovement() {
  bXPos += bXVel*direction;
  bYPos += bYVel;
}

void checkForCollisions() {
  if(bXPos - 9 <= width/20 + 4 && bXPos + 9 >= width/20 - 4) {
    if (bYPos - 9 <= p1YPos + 40 && bYPos + 9 >= p1YPos - 40) {
      direction = -direction;
      bXVel += 0.7;
      bYVel = (bYPos - p1YPos)/12;
    }
  }
  
  if(bXPos + 9 >= 19*width/20 - 4 && bXPos - 9 <= 19*width/20 + 4) {
    if (bYPos - 9 <= p2YPos + 40 && bYPos + 9 >= p2YPos - 40) {
      direction = -direction;
      bXVel += 0.7;
      bYVel = (bYPos - p2YPos)/10;
    }
  }
  
  if (bYPos - 9 <= 0 || bYPos + 9 >= height) {
    bYVel = -bYVel;
  }
}

void AIMovement() {
  if (bYPos > p2YPos && bYPos < height - 40) {p2YPos += 3;}
  if (bYPos < p2YPos && bYPos > 40) {p2YPos -= 3;}
}

void checkPointWon() {
  if (bXPos + 9 <= 0) {
    rP ++;
    reset(-1);
  }
  if (bXPos - 9 >= width) {
    lP ++;
    reset(1);
  }
}

void reset(int d) {
  direction = d;
  bXVel = 2;
  bYVel = random(-1, 1);
  
  bXPos = width/2;
  bYPos = height/2;
  
  p1YPos = height/2;
  p2YPos = height/2;
}

void textHandle() {
  textSize(20);
  text(str(lP) + " : " + str(rP), width/2, 50);
}

//snake code
void snake() {
  drawBackground();
  calculateMovement();
  checkDeath();
  if (dead) {deathHandler();}
  checkAppleEat();
  drawApple();
  drawSnake();
  delay(100);
}

void drawBackground() {
  background(0);
  stroke(255);
  for (int i = 0; i <= width; i += 50) {
    line(i, 0, i, height);
  }
  
  for (int i = 0; i <= height; i += 50) {
    line(0, i, width, i);
  }
}

void drawSnake() {
  fill(255);
  for (BodyPart part: parts) {
    if (part != null) {
      rect(part.x, part.y, 50, 50);
    } else {break;}
  }
}

void calculateMovement() {
  boolean savedLast = false;
  for (int i = parts.length - 1; i >= 0; i--) {
      if (parts[i] != null && i != 0) {
        if (!savedLast) {
          lastSegment = new BodyPart(parts[i].x, parts[i].y);
          savedLast = true;
        }
        parts[i].x = parts[i-1].x;
        parts[i].y = parts[i-1].y;
      }
  }
  
  if (!savedLast) {
    lastSegment = new BodyPart(parts[0].x, parts[0].y);; 
    savedLast = true;
  }
  
  if (dir == 1) {parts[0].x += 50;} 
  else if (dir == 2) {parts[0].y -= 50;} 
  else if (dir == 3) {parts[0].x -= 50;} 
  else if (dir == 4) {parts[0].y += 50;}
  
  lastDir = dir;
}

void checkDeath() {
  if (parts[0].x < 0 || parts[0].x > width || parts[0].y < 0 || parts[0].y > height) {dead = true;}
  
  for (int i = 1; i < parts.length; i++) {
    if (parts[i] != null) {
      if (parts[0].x == parts[i].x && parts[0].y == parts[i].y) {dead = true;}
    } else {break;}
  }
}

void deathHandler() {
  noLoop();
  textSize(50);
  fill(150);
  textAlign(CENTER, CENTER); 
  text("YOU LOST! Press R to restart!", width/2, height/2 - 25);
}

void generateNewApple(){
  boolean generated = false;
  while (!generated) {
    int aX = 50*int(random(1, 26)) - 25;
    int aY = 50*int(random(1,15)) - 25;
    
    boolean goodSpot = true;
    for (int i = 0; i < parts.length; i++) {
      if (parts[i] != null) {
        if (parts[i].x == aX && parts[i].y == aY) {goodSpot = false; break;}
      } else {break;}
    }
    
    if (goodSpot) {
      currentApple = new Apple(aX, aY);
      generated = true;
    }
  }
}

void checkAppleEat() {
  if (parts[0].x == currentApple.x && parts[0].y == currentApple.y) {
    for (int i = 0; i < parts.length; i++) {
      if (parts[i] == null) {parts[i] = lastSegment; break;}
    }
    generateNewApple();
  }
}

void drawApple() {
  noStroke();
  fill(#4BFF31);
  rect(currentApple.x, currentApple.y, 35, 35);
}

void reset() {
  loop();
  
  for (int i = 0; i < parts.length; i++) {
    parts[i] = null;
  }
  
  currentApple = null;
  lastSegment = null;
  dead = false;
  parts[0] = new BodyPart(625, 375); 
  generateNewApple();  
}

//flappy ball
void flappy(){
  background(0);
  fill(255);
  y = v*t/60 + 0.5*a*t*t/3600; //the distance formula(60 and 3600 divided is used to counterbalance the framerate.
  ellipse(x, y1 + y, 70, 70); //the reason why y of the ellipse is y + y1 is that t will be set as zero when you press the mouse, therefore there need two value to acheive the function of jumping.
    if(mousePressed){
    y1 += y;  //let the computer remember the place where the player has pressed the mouse.
    v = -250; //the new initail speed for the ball to go up(jump).
    t = 0; //reset t as zero.
    }
      t ++;
     
     //obstacle:
        

     //1
    if(t2 % 720 == 0){
      stable = 1; //stable is a variable that let pillar exist even when this 'if' cannot be achieved.
     hPillar = random(170,530); //random height for each circle
     x1 = width;
    }
    
    if(stable == 1){ //another 'if' so that the pillar will not disappear when t2 % 720 != 0
      rect(x1, hPillar, 130, 50); //small rectangle
      rect(x1 + 15, hPillar + 50, 100, 650 - hPillar); //thin & long pillar
      rect(x1, hPillar - 200, 130, 50); //upper one
      rect(x1 + 15, 0, 100, hPillar - 200);//upper one
      x1 -=2;
    }
  //2    
      
          if(t2 % 720 == 180){
      stable2 = 1;
          hPillar2 = random(170,530);
     x2 = width;
    }
    
    if(stable2 == 1){
      rect(x2, hPillar2, 130, 50);
      rect(x2 + 15, hPillar2 + 50, 100, 650 - hPillar2);
      rect(x2, hPillar2 - 200, 130, 50);
      rect(x2 + 15, 0, 100, hPillar2 - 200);
      x2 -=2;
    }
  //3    
          if(t2 % 720 == 360){
      stable3 = 1;
          hPillar3 = random(170,530);
     x3 = width;
    }
    
    if(stable3 == 1){
      rect(x3, hPillar3, 130, 50);
      rect(x3 + 15, hPillar3 + 50, 100, 650 - hPillar3);
      rect(x3, hPillar3 - 200, 130, 50);
      rect(x3 + 15, 0, 100, hPillar3 - 200);
      x3 -=2;
    }
  //4    
          if(t2 % 720 == 540){
      stable4 = 1;
         hPillar4 = random(170,530);
     x4 = width;
    }
    
    if(stable4 == 1){
      rect(x4, hPillar4, 130, 50);
      rect(x4 + 15, hPillar4 + 50, 100, 650 - hPillar4);
      rect(x4, hPillar4 - 200, 130, 50);
      rect(x4 + 15, 0, 100, hPillar4 - 200);
       x4 -= 2;
    }

      //crash

if((x+35 >= x2 && x - 35 <= x2+130 && (hPillar2 - 150 >= y1+y - 35 || hPillar2 <= y1+y+35))){ // these four lines is for the collision part, 
//if the ball is in the gap between upper and down pillars, and it is not actually in the gap, the game over
  stoploop();
}
if((x+35 >= x3 && x - 35 <= x3+130 && (hPillar3 - 150 >= y1+y - 35 || hPillar3 <= y1+y+35))){
  stoploop();
}
if((x+35 >= x4 && x - 35 <= x4+130 && (hPillar4 - 150 >= y1+y - 35 || hPillar4 <= y1+y+35))){
  stoploop();
}
if((x+35 >= x1 && x - 35 <= x1+130 && (hPillar - 150 >= y1+y - 35 || hPillar <= y1+y+35))){
  stoploop();
}


    //score system
textSize(100);
int num;


 num = int((t2 - 512)/184) + 1;

if(t2<512){
  num = 0;
}
fill(#AFAFAF);
text(num, 50, 100);

//t2 increase 
 t2 ++;

}

 //this is the function to stop the loop, and reset most of the variables.
 void stoploop(){
    noLoop();
        background(0);
        textSize(100);
        text("Game Over", width/4+70, height/2);
        textSize(50);
        text("press to restart", width/4+250, height/2 + 100);
        t = 0;
     
     stable1 = 0;
     stable2 = 0;
     stable3 = 0;
     stable4 = 0;
     x1 = x2 = x3 = x4 = width;
     
        a = 980;
        v = 0;
        x = 250;
        y = 250;
        y1 = 0;
        t = 0;
        alreadystop = 1; //this is for the restart function.
      

 }
 
void paint(){
  stroke(255);
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
void keyPressed(){
  if (mode == 0){
    if(key=='m'||key=='M'){
      musicMode=!musicMode;
      delay(200);
    }
  }
  
  if (mode == 1) {
    if (key == 'l' || key == 'L'){
     stable1 = 0;
     stable2 = 0;
     stable3 = 0;
     stable4 = 0;
     x1 = x2 = x3 = x4 = width;
     
        a = 980;
        v = 0;
        x = 250;
        y = 250;
        y1 = 0;
        t = 0;
        alreadystop = 0;
        t2 = 0;
        loop();
    }
  } 
  
  else if (mode == 2) {
    if(key == 'w' || key == 'W'){
      if (p1YPos > 44) {p1YPos -= 4;}
    }
  if(key == 's' || key == 'S'){
      if (p1YPos < height - 44) {p1YPos += 4;}
    }
  }
  
  else if (mode == 3) {
    if (key == 'l' || key == 'L') {reset();}
    if (keyCode == UP && lastDir != 4) {dir = 2;}
    if (keyCode == DOWN && lastDir != 2) {dir = 4;}
    if (keyCode == LEFT && lastDir != 1) {dir = 3;}
    if (keyCode == RIGHT && lastDir != 3) {dir = 1;}
    if (key == 'r' || key == 'R' || keyCode == ENTER) {if (dead) {reset();}}
  }
  
  else if (mode == 4) {
    if (key == 'c' || key == 'C') {background(0);}
  }
  
  if(key=='l'||key=='L') {
    rectMode(CORNER);
    textAlign(CORNER, CORNER);
    stroke(0);
    mode = 0;
  }
  
  if (keyCode == ESC) {exit();}
}

void mousePressed(){
  if (mode == 1){
   if(alreadystop == 1){
  loop();
  t2 = 0; 
  alreadystop = 0;
   }
  }
}
