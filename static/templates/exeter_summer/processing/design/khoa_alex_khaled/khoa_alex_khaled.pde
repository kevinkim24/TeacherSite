PImage img;
float sizeWidth;
float sizeHeight;
String sound;


void setup()
{
  size(600,950); 
  sound = "C:/Users/Admin/Documents/code/processing-4.2/processing_project/finalPinBall/starwar.mp3";
  launch(sound);  
  surface.setAlwaysOnTop(true);
  sizeWidth=width/2;
  sizeHeight=height/2;
  background(#DEA760);
  stroke(0);
  strokeWeight(1.5);
  rectMode(CENTER);
  img = loadImage("OIP.jpg");
  
  //text box
  fill(#60B3DE);
  rectMode(CENTER);
  rect(sizeWidth,sizeHeight,sizeWidth/1.1,sizeHeight/5);
  fill(0);
  textSize(sizeWidth/5);
  textAlign(CENTER);
  text("Do you want to play ?",sizeWidth,sizeHeight-sizeHeight/8);
  text("Yes",sizeWidth,sizeHeight+sizeHeight/30);
  
  //game name
  textSize(sizeWidth/3);
  fill(255,0,0);
  text("PINBALL",sizeWidth,sizeHeight/1.5);
}

void drawPinBall(){
  stroke(255);
  sizeHeight=height/2;
  sizeWidth=width/2;
  //drop
  line(0,sizeHeight+sizeHeight/1.3, sizeWidth-sizeWidth/3,height);
  line(width-width/15,sizeHeight+sizeHeight/1.2, sizeWidth+sizeWidth/3,height);


  //curve left
  noFill();
  arc(sizeWidth,sizeHeight-sizeHeight/2.8,width+width/20,width+width/20,3.14,4.71);
  arc(sizeWidth,sizeHeight-sizeHeight/2.7,width,width,3.14,4.71);  
  //curve right
  noFill();
  arc(sizeWidth,sizeHeight-sizeHeight/2.8,width+width/20,width+width/20,4.71,TWO_PI);
  arc(sizeWidth,sizeHeight-sizeHeight/2.7,width,width,4.71,TWO_PI);
  
  //circle center
  noFill();
  ellipse(sizeWidth-sizeWidth/10,sizeHeight,sizeWidth/8,sizeWidth/8);
  ellipse(sizeWidth+sizeWidth/10,sizeHeight,sizeWidth/8,sizeWidth/8);
  ellipse(sizeWidth-sizeWidth/3.5,sizeHeight+sizeHeight/25,sizeWidth/8,sizeWidth/8);
  ellipse(sizeWidth+sizeWidth/3.5,sizeHeight+sizeHeight/25,sizeWidth/8,sizeWidth/8);
  
  fill(#013358);
  ellipse(sizeWidth-sizeWidth/10,sizeHeight,sizeWidth/12,sizeWidth/12);
  ellipse(sizeWidth+sizeWidth/10,sizeHeight,sizeWidth/12,sizeWidth/12);
  ellipse(sizeWidth-sizeWidth/3.5,sizeHeight+sizeHeight/25,sizeWidth/12,sizeWidth/12);
  ellipse(sizeWidth+sizeWidth/3.5,sizeHeight+sizeHeight/25,sizeWidth/12,sizeWidth/12);

  
  
  //LOCK
  textSize(30);
  textAlign(CENTER);
  fill(#DEC955);
  
  rotate(radians(-20));
  text("L",sizeWidth-sizeWidth/1.15,sizeHeight+sizeHeight/4.2);
  rotate(radians(20));
  
  rotate(radians(-10));
  text("O",sizeWidth-sizeWidth/2.6,sizeHeight+sizeHeight/5.5);
  rotate(radians(10));
  
  rotate(radians(10));
  text("C",sizeWidth+sizeWidth/2.7,sizeHeight-sizeHeight/25);
  rotate(radians(-10));
  
  rotate(radians(20));
  text("K",sizeWidth+sizeWidth/1.3,sizeHeight-sizeHeight/5);
  rotate(radians(-20));
  fill(255);
  
  
  //circle above hand
  noFill();
  ellipse(sizeWidth,sizeHeight+sizeHeight/1.4,sizeWidth/4.5,sizeWidth/4.5);
  fill(#55DEDC);
  ellipse(sizeWidth,sizeHeight+sizeHeight/1.4,sizeWidth/5.5,sizeWidth/5.5);
  
  
  //rect above hand
  quad(sizeWidth,sizeHeight+sizeHeight/2, 
       sizeWidth-sizeWidth/12,sizeHeight+sizeHeight/1.8,
       sizeWidth,sizeHeight+sizeHeight/1.65,
       sizeWidth+sizeWidth/12,sizeHeight+sizeHeight/1.8);
  //rect above hand left
  quad(sizeWidth-sizeWidth/4,sizeHeight+sizeHeight/1.75, 
       sizeWidth-sizeWidth/3,sizeHeight+sizeHeight/1.6,
       sizeWidth-sizeWidth/4,sizeHeight+sizeHeight/1.48,
       sizeWidth-sizeWidth/5.85,sizeHeight+sizeHeight/1.6);
  //rect above hand right
  quad(sizeWidth+sizeWidth/4,sizeHeight+sizeHeight/1.75, 
       sizeWidth+sizeWidth/3,sizeHeight+sizeHeight/1.6,
       sizeWidth+sizeWidth/4,sizeHeight+sizeHeight/1.48,
       sizeWidth+sizeWidth/5.85,sizeHeight+sizeHeight/1.6);
   
       
  //rect above the rect that above the hand
  fill(#55DEDC);
  rect(sizeWidth-sizeWidth/15,sizeHeight+sizeHeight/2.3,sizeWidth/10,sizeHeight/10);
  rect(sizeWidth+sizeWidth/15,sizeHeight+sizeHeight/2.3,sizeWidth/10,sizeHeight/10);
  
  quad(sizeWidth-sizeWidth/3.8,sizeHeight+sizeHeight/2.3,
       sizeWidth-sizeWidth/5,sizeHeight+sizeHeight/2.1,
       sizeWidth-sizeWidth/5-sizeWidth/10,sizeHeight+sizeHeight/2.3+sizeHeight/10,
       sizeWidth-sizeWidth/5-sizeWidth/6,sizeHeight+sizeHeight/2);
       
  quad(sizeWidth+sizeWidth/3.8,sizeHeight+sizeHeight/2.3,
       sizeWidth+sizeWidth/5,sizeHeight+sizeHeight/2.1,
       sizeWidth+sizeWidth/5+sizeWidth/10,sizeHeight+sizeHeight/2.3+sizeHeight/10,
       sizeWidth+sizeWidth/5+sizeWidth/6,sizeHeight+sizeHeight/2);
       
 
  //ball shoot
  noFill();
  line(width-width/15,sizeHeight+sizeHeight/1.35, width-width/15,sizeHeight+sizeHeight/3);
  line(width-width/15,sizeHeight+sizeHeight/1.2, width-width/15,height);
  arc(width-width/5.22,sizeHeight+sizeHeight/3, sizeWidth/1.3,sizeWidth/1.3, 5.8,TWO_PI);
  arc(width-width/5.22,sizeHeight+sizeHeight/3, sizeWidth/2,sizeWidth/2, 5.8,TWO_PI);
  stroke(0);
  
  //rect in the middle
  fill(#16A9F0);
  rotate(radians(-20));
  rect(sizeWidth-2.3*sizeWidth/2,sizeHeight+sizeHeight/4,sizeWidth/5,sizeHeight/6);
  rotate(radians(20));

  rotate(radians(20));
  rect(sizeWidth+2.1*sizeWidth/2,sizeHeight-sizeHeight/4,sizeWidth/5,sizeHeight/6);
  rotate(radians(-20));
  
  //arrows middle left
  fill(#F5D20C);
  rect(sizeWidth-sizeWidth/6,sizeHeight-sizeHeight/7, sizeWidth/20,sizeHeight/8);
  rect(sizeWidth-sizeWidth/6,sizeHeight-sizeHeight/8.5,sizeWidth/8,sizeHeight/20);
  triangle(sizeWidth-sizeWidth/6,sizeHeight-sizeHeight/7-sizeHeight/11,
           sizeWidth-sizeWidth/6-sizeWidth/20,sizeHeight-sizeHeight/7-sizeHeight/30,
           sizeWidth-sizeWidth/6+sizeWidth/20,sizeHeight-sizeHeight/7-sizeHeight/30);
  //middle right
  rect(sizeWidth+sizeWidth/6,sizeHeight-sizeHeight/4.5, sizeWidth/20,sizeHeight/8);
  rect(sizeWidth+sizeWidth/6,sizeHeight-sizeHeight/5,sizeWidth/8,sizeHeight/20);
  triangle(sizeWidth+sizeWidth/6,sizeHeight-sizeHeight/3.2,
           sizeWidth+sizeWidth/6-sizeWidth/20,sizeHeight-sizeHeight/3.8,
           sizeWidth+sizeWidth/6+sizeWidth/20,sizeHeight-sizeHeight/3.8);
  //middle middle
  rect(sizeWidth,sizeHeight-sizeHeight/3, sizeWidth/20,sizeHeight/8);
  rect(sizeWidth,sizeHeight-sizeHeight/3.2,sizeWidth/8,sizeHeight/20);
  triangle(sizeWidth,sizeHeight-sizeHeight/2,
           sizeWidth+sizeWidth/20,sizeHeight-sizeHeight/2.7,
           sizeWidth-sizeWidth/20,sizeHeight-sizeHeight/2.7);

  //left
  rotate(radians(-30));
  rect(sizeWidth/2-sizeWidth/1.5,sizeHeight-sizeHeight/8, sizeWidth/20,sizeHeight/8);
  rect(sizeWidth/2-sizeWidth/1.5,sizeHeight-sizeHeight/9,sizeWidth/8,sizeHeight/20);
  triangle(sizeWidth/2-sizeWidth/1.5,sizeHeight-sizeHeight/4,
           sizeWidth-1.85*sizeWidth/1.5,sizeHeight-sizeHeight/6,
           sizeWidth-1.8*sizeWidth/1.5+sizeWidth/10,sizeHeight-sizeHeight/6);
  rotate(radians(30));
  //right
  rotate(radians(30));
  rect(sizeWidth+sizeWidth/1.2,sizeHeight-1.6*sizeHeight/2, sizeWidth/20,sizeHeight/8);
  rect(sizeWidth+sizeWidth/1.2,sizeHeight-1.55*sizeHeight/2,sizeWidth/8,sizeHeight/20);
  triangle(sizeWidth+sizeWidth/1.2,sizeHeight-1.9*sizeHeight/2,
           sizeWidth+sizeWidth/1.1,sizeHeight-1.68*sizeHeight/2,
           sizeWidth+sizeWidth/1.3,sizeHeight-1.68*sizeHeight/2);
  rotate(radians(-30));
  //right right
  rotate(radians(30));
  rect(sizeWidth+1.3*sizeWidth/1.2,sizeHeight-2.1*sizeHeight/2, sizeWidth/20,sizeHeight/8);
  rect(sizeWidth+1.3*sizeWidth/1.2,sizeHeight-2.05*sizeHeight/2,sizeWidth/8,sizeHeight/20);
  triangle(sizeWidth+1.3*sizeWidth/1.2,sizeHeight-2.38*sizeHeight/2,
           sizeWidth+1.24*sizeWidth/1.2,sizeHeight-2.18*sizeHeight/2,
           sizeWidth+1.36*sizeWidth/1.2,sizeHeight-2.18*sizeHeight/2);
  rotate(radians(-30));

  //left left
  rotate(radians(-30));
  rect(-sizeWidth+sizeWidth/1.8,sizeHeight-sizeHeight/3.2,sizeWidth/20,sizeHeight/8);
  rect(-sizeWidth+sizeWidth/1.8,sizeHeight-sizeHeight/3.5,sizeWidth/8,sizeHeight/20);
  triangle((-sizeWidth+sizeWidth/1.98+-sizeWidth+sizeWidth/1.65)/2,sizeHeight-sizeHeight/2.3,
           -sizeWidth+sizeWidth/1.98,sizeHeight-sizeHeight/2.8,
           -sizeWidth+sizeWidth/1.65,sizeHeight-sizeHeight/2.8);
  rotate(radians(30));

  //upper
  //left
  rotate(radians(-10));
  rect(sizeWidth-sizeWidth/5,sizeHeight-sizeHeight/2,sizeWidth/20,sizeHeight/8);
  rect(sizeWidth-sizeWidth/5,sizeHeight-sizeHeight/2.1,sizeWidth/8,sizeHeight/20);
  triangle(sizeWidth-sizeWidth/4,sizeHeight-sizeHeight/1.8,
           sizeWidth-sizeWidth/6.5,sizeHeight-sizeHeight/1.8,
           (2*sizeWidth-sizeWidth/6.5-sizeWidth/4)/2,sizeHeight-sizeHeight/1.6);
  rotate(radians(10));
  //right
  rotate(radians(10));
  rect(sizeWidth+sizeWidth/5,sizeHeight/3.6,sizeWidth/20,sizeHeight/8);
  rect(sizeWidth+sizeWidth/5,sizeHeight/3.4,sizeWidth/8,sizeHeight/20);
  triangle(sizeWidth+sizeWidth/4,sizeHeight/4.2,
           sizeWidth+sizeWidth/6.5,sizeHeight/4.2,
           (2*sizeWidth+sizeWidth/6.5+sizeWidth/4)/2,-sizeHeight+1.27*sizeHeight/1.1);
  rotate(radians(-10));
  
  //rect above the arrows
  fill(#A078A5);
  rect(sizeWidth-sizeWidth/5.5,sizeHeight-sizeHeight/2.8,sizeWidth/6,sizeWidth/4);
  rect(sizeWidth+sizeWidth/5.5,sizeHeight-sizeHeight/2.3,sizeWidth/6,sizeWidth/4);
  
  
  //circle at the top
  fill(#30E8ED);
  ellipse(sizeWidth-sizeWidth/5,sizeHeight/17,sizeWidth/10,sizeWidth/10);
  ellipse(sizeWidth+sizeWidth/5,sizeHeight/17,sizeWidth/10,sizeWidth/10);
  //three circles on the right
  ellipse(sizeWidth+sizeWidth/2,sizeHeight/3,sizeWidth/10,sizeWidth/10);
  ellipse(sizeWidth+sizeWidth/2.5,sizeHeight/2.5,sizeWidth/10,sizeWidth/10);
  ellipse(sizeWidth+sizeWidth/1.9,sizeHeight/2.35,sizeWidth/10,sizeWidth/10);
  //line above the three circles
  stroke(#30ED93);
  strokeWeight(5);
  line(sizeWidth+sizeWidth/2,sizeHeight/5,sizeWidth+sizeWidth/1.5,sizeHeight/4);
  line(sizeWidth-sizeWidth/2,sizeHeight/5,sizeWidth-sizeWidth/1.5,sizeHeight/4);
  strokeWeight(1.5);
  stroke(0);
  
  
  //triangles above hand
  fill(#E0F016);
  triangle(sizeWidth+sizeWidth/2.3,height-sizeHeight/3.5,
           sizeWidth+sizeWidth/1.9,height-sizeHeight/3.5,
           (2*sizeWidth+sizeWidth/1.9+sizeWidth/2.3)/2,height-sizeHeight/2.9);

  triangle(sizeWidth-sizeWidth/2.3,height-sizeHeight/3.5,
           sizeWidth-sizeWidth/1.9,height-sizeHeight/3.5,
           (2*sizeWidth-sizeWidth/1.9-sizeWidth/2.3)/2,height-sizeHeight/2.9);

 
  //connect to the hands && lines near the hands && right
  noFill();
  stroke(255);
  line(sizeWidth+sizeWidth/2,sizeHeight+sizeHeight/1.35,sizeWidth+sizeWidth/1.38,sizeHeight+sizeHeight/1.48);
  line(sizeWidth+sizeWidth/1.65,sizeHeight+sizeHeight/1.23,sizeWidth+sizeWidth/1.32,sizeHeight+sizeHeight/1.29);
  line(sizeWidth+sizeWidth/1.65,sizeHeight+sizeHeight/1.23,sizeWidth+sizeWidth/2,sizeHeight+sizeHeight/1.35);
  line(sizeWidth+sizeWidth/1.32,sizeHeight+sizeHeight/1.29,sizeWidth+sizeWidth/1.32,sizeHeight+sizeHeight/1.56);
  arc(sizeWidth+sizeWidth/1.52,sizeHeight+sizeHeight/1.6,sizeWidth/5,sizeWidth/5, 6.13,TWO_PI+1);
 
  line(sizeWidth+sizeWidth/1.52+sizeWidth/5/2,sizeHeight+sizeHeight/1.6,
       sizeWidth+sizeWidth/1.52+sizeWidth/5/2,sizeHeight+sizeHeight/2); //left
  line(sizeWidth+sizeWidth/1.8,sizeHeight+sizeHeight/1.7,
       sizeWidth+sizeWidth/1.8,sizeHeight+sizeHeight/2); //right
  line((sizeWidth+sizeWidth/1.8+sizeWidth+sizeWidth/1.52+sizeWidth/5/2)/2,sizeHeight+sizeHeight/1.7,
       (sizeWidth+sizeWidth/1.8+sizeWidth+sizeWidth/1.52+sizeWidth/5/2)/2,sizeHeight+sizeHeight/2); //middle
  
  //left
  line(sizeWidth-sizeWidth/2,sizeHeight+sizeHeight/1.35,sizeWidth-sizeWidth/1.4,sizeHeight+sizeHeight/1.48);
  line(sizeWidth-sizeWidth/1.65,sizeHeight+sizeHeight/1.23,sizeWidth-sizeWidth/1.2,sizeHeight+sizeHeight/1.32);
  line(sizeWidth-sizeWidth/1.65,sizeHeight+sizeHeight/1.23,sizeWidth-sizeWidth/2,sizeHeight+sizeHeight/1.35);
  line(sizeWidth-sizeWidth/1.2,sizeHeight+sizeHeight/1.32,sizeWidth-sizeWidth/1.2,sizeHeight+sizeHeight/1.8);
  arc(sizeWidth-sizeWidth/1.52,sizeHeight+sizeHeight/1.6,sizeWidth/5,sizeWidth/5, 2.24,3.3);
  line(sizeWidth-sizeWidth/1.25-sizeWidth/20,sizeHeight+sizeHeight/1.75,
       sizeWidth-sizeWidth/1.35,sizeHeight+sizeHeight/2.1);
  line(sizeWidth-sizeWidth/1.2-sizeWidth/20,sizeHeight+sizeHeight/1.85,
       sizeWidth-sizeWidth/1.35-sizeWidth/30,sizeHeight+sizeHeight/2.1-sizeHeight/(20*2));
  noFill();
  line(sizeWidth-sizeWidth/1.25-sizeWidth/20,sizeHeight+sizeHeight/1.75,
       sizeWidth-sizeWidth/1.2-sizeWidth/20,sizeHeight+sizeHeight/1.85);
  line(sizeWidth-sizeWidth/1.35,sizeHeight+sizeHeight/2.1,
       sizeWidth-sizeWidth/1.35-sizeWidth/30,sizeHeight+sizeHeight/2.1-sizeHeight/(20*2));
  
  //vertical lines
  float ave = (2*sizeWidth-sizeWidth/1.52-sizeWidth/5/2-sizeWidth/1.8)/2;
  float wid_line = sizeWidth-sizeWidth/1.52-sizeWidth/5/2;
  
  line(wid_line,sizeHeight+sizeHeight/1.6,wid_line,sizeHeight+sizeHeight/2); 
  line(sizeWidth-sizeWidth/1.8,sizeHeight+sizeHeight/1.7, sizeWidth-sizeWidth/1.8,sizeHeight+sizeHeight/2); 
  line(ave,sizeHeight+sizeHeight/1.7,ave,sizeHeight+sizeHeight/2);
 
  //rect above vertical lines
  fill(#16A9F0);
  rect(ave,sizeHeight+sizeHeight/2.4, sizeWidth/14,sizeWidth/8);
  rect(sizeWidth-sizeWidth/1.8,sizeHeight+sizeHeight/2.4, sizeWidth/14,sizeWidth/8);
  
  //triangles above triangles that above hands
  //right
  fill(#F016C8);
  triangle(sizeWidth+sizeWidth/2.5,height-sizeHeight/2.9,
           sizeWidth+sizeWidth/2,height-sizeHeight/2.65,
           sizeWidth+sizeWidth/2,sizeHeight+sizeHeight/2.1);
  //left
  triangle(sizeWidth-sizeWidth/2.5,height-sizeHeight/2.9,
           sizeWidth-sizeWidth/2,height-sizeHeight/2.65,
           sizeWidth-sizeWidth/2,sizeHeight+sizeHeight/2.1);
           
  //three rects on the left
  fill(#16A9F0);
  rotate(radians(25));
  rect(sizeWidth-sizeWidth/10,sizeHeight+sizeHeight/10,sizeWidth/15,sizeWidth/15);
  rect(sizeWidth-sizeWidth/9.5,sizeHeight+sizeHeight/25,sizeWidth/15,sizeWidth/15);
  rect(sizeWidth-sizeWidth/9.5,sizeHeight-sizeHeight/50,sizeWidth/15,sizeWidth/15);
  rotate(radians(-25));
  //five rects on the upper left
  rotate(radians(45));
  rect(sizeWidth,sizeHeight-sizeHeight/1.4,sizeWidth/15,sizeWidth/15);
  rect(sizeWidth,sizeHeight-sizeHeight/1.3,sizeWidth/15,sizeWidth/15);
  rect(sizeWidth,sizeHeight-sizeHeight/1.22,sizeWidth/15,sizeWidth/15);
  rect(sizeWidth,sizeHeight-sizeHeight/1.15,sizeWidth/15,sizeWidth/15);
  rect(sizeWidth,sizeHeight-sizeHeight/1.08,sizeWidth/15,sizeWidth/15);
  rotate(radians(-45)); 
  
}

void hands(){
  //hands
  strokeWeight(10);
  stroke(#F20000);
  //left
  line(sizeWidth-sizeWidth/1.65,sizeHeight+sizeHeight/1.23,
       sizeWidth-sizeWidth/4.5,sizeHeight+sizeHeight/1.15);
  //right
  line(sizeWidth+sizeWidth/1.65,sizeHeight+sizeHeight/1.23,
       sizeWidth+sizeWidth/4.5,sizeHeight+sizeHeight/1.15);
  stroke(0);
  strokeWeight(1.5);
}


void draw(){
  if (mouseX>sizeWidth-(sizeWidth/1.1)/2 && mouseX<sizeWidth+(sizeWidth/1.1)/2 
      && mouseY>sizeHeight-(sizeHeight/5)/2 && mouseY<sizeHeight+(sizeHeight/5)/2 && mousePressed){
        image(img,0,0,width,height);
        drawPinBall();
        hands();
        
      }
}
