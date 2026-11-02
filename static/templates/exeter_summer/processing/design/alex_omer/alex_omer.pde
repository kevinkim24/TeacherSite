//Alex & Omer GoGuitar :)
import processing.sound.*;
SoundFile Menu;
SoundFile E;
SoundFile A;
SoundFile D;
SoundFile G;
SoundFile B;
SoundFile e;

boolean started = false;
  void setup()
  {
    size(800,500);
Menu = new SoundFile(this, "QuietPlace.wav");
E = new SoundFile(this, "Estring.wav");
A = new SoundFile(this, "A String.wav");
D = new SoundFile(this, "D String.wav");
G = new SoundFile(this, "G String.wav");
B = new SoundFile(this, "B String.wav");
e = new SoundFile(this, "e String.wav");
Menu.loop();
  }
void draw() {
  background(255);
  textAlign(CENTER);
  
  if (started) {
    //  game code here
neck();
frets();
strings();
tracking();
activateSound();
}
    //game code ends
  //  text("gameplay", height/2, width/2);
   else {
    
noStroke();

//body and neck
fill(#AA5C09);
ellipse (height-60,width/2-100,175,175);
rect(height-60,width/2-123,230,45);
ellipse (height-160,width/2-100,225,225);
   
//bridge
fill (0);
rect (height-185,width/2-140,30,70);
      
//sound hole
fill (0);
ellipse (height-60,width/2-100,75,75);
    
//headstock
fill (0);
rect (height+130,width/2-125.5,50,50);

//stings
stroke(0);
fill(255);
   rect(height/2+65,width/2-121.5,362,5);
      rect(height/2+65,width/2-114.5,362,5);
         rect(height/2+65,width/2-107.5,362,5);
             rect(height/2+65,width/2-100.5,362,5);
                  rect(height/2+65,width/2-93.5,362,5);
                        rect(height/2+65,width/2-86.5,362,5);
                       
    fill (0); 
     textSize(40);
    text("Press Anything to Continue", height-60, width/6);
    
 }
}

void keyPressed()
{
  if (keyPressed) 
  {
    started = true;
    Menu.stop();
  }
}


//Functions

void neck(){
  stroke(0);
  strokeWeight(2);
int x =0;
int y =1*height/8;
int x2 =width;
int y2 =6*height/8;

 fill(#AA5C09);
  rect(x,y,x2,y2);
}

void strings(){
   stroke(255);
 strokeWeight(10);
 line(0,1.5*height/8,width,1.5*height/8);//E
 line(0,2.5*height/8,width,2.5*height/8);//A
 line(0,3.5*height/8,width,3.5*height/8);//D
 line(0,4.5*height/8,width,4.5*height/8);//G
 line(0,5.5*height/8,width,5.5*height/8);//B
 line(0,6.5*height/8,width,6.5*height/8);//e
}

void tracking(){
  //E
  if(mouseX > 0 && mouseX < width && mouseY > 1*height/8 && mouseY < 2*height/8){
  strokeWeight(10);
  stroke(#F4FC7F);
  line(0,1.5*height/8,width,1.5*height/8);
}
//A
else if(mouseX > 0 && mouseX < width && mouseY > 2*height/8 && mouseY < 3*height/8){
  stroke(#F4FC7F);
  line(0,2.5*height/8,width,2.5*height/8);
}
//D
else if(mouseX > 0 && mouseX < width && mouseY > 3*height/8 && mouseY < 4*height/8){
  stroke(#F4FC7F);
  line(0,3.5*height/8,width,3.5*height/8);
}
//G
else if(mouseX > 0 && mouseX < width && mouseY > 4*height/8 && mouseY < 5*height/8){
 stroke(#F4FC7F);
 line(0,4.5*height/8,width,4.5*height/8);
}
//B
else if(mouseX > 0 && mouseX < width && mouseY > 5*height/8 && mouseY < 6*height/8){
stroke(#F4FC7F);
line(0,5.5*height/8,width,5.5*height/8);
}
//e
else if(mouseX > 0 && mouseX < width && mouseY > 6*height/8 && mouseY < 7*height/8){
stroke(#F4FC7F);
line(0,6.5*height/8,width,6.5*height/8);
}
}

void activateSound(){
if(mousePressed && mouseX > 0 && mouseX < width && mouseY > 1*height/8 && mouseY < 2*height/8){
if(!E.isPlaying()){
E.play();
  }
}
if(mousePressed && mouseX > 0 && mouseX < width && mouseY > 2*height/8 && mouseY < 3*height/8){
if(!A.isPlaying()){
A.play();
  }
}
if(mousePressed && mouseX > 0 && mouseX < width && mouseY > 3*height/8 && mouseY < 4*height/8){
if(!D.isPlaying()){
D.play();
  }
}
if(mousePressed && mouseX > 0 && mouseX < width && mouseY > 4*height/8 && mouseY < 5*height/8){
if(!G.isPlaying()){
G.play();
  }
}
if(mousePressed && mouseX > 0 && mouseX < width && mouseY > 5*height/8 && mouseY < 6*height/8){
if(!B.isPlaying()){
B.play();
  }
}
if(mousePressed && mouseX > 0 && mouseX < width && mouseY > 6*height/8 && mouseY < 7*height/8){
if(!e.isPlaying()){
e.play();
    }
  }
}

void frets(){
int fretX = 0;
strokeWeight(10);
stroke(0);
while(fretX < width){
  line(fretX,1*height/8,fretX,7*height/8);
  fretX = fretX + 50;
}
}
