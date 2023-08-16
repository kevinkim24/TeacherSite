//Collaboration with Rosa and Luke

//rosa
import processing.core.PFont;
float angle;
PFont font1;
PFont font2;
float angleRotate = 0.0;
//rosa end

void setup(){
  size (500,500);
//luke start
  fill(#ebc388);
  quad(width*0.75,height*0.81,width*0.65,height*0.95,width*0.55,height,width*0.56,height*0.9);//bottom right corner
  quad(width*0.25,height*0.81,width*0.35,height*0.95,width*0.45,height,width*0.44,height*0.9);//bottom left corner
  quad(width*0.55,0,width*0.65,height*0.05,width*0.75,height*0.19,width*0.56,height*0.1);//top right corner
  quad(width*0.45,0,width*0.35,height*0.05,width*0.25,height*0.19,width*0.44,height*0.1);//top left corner

  quad(width*0.89,height*0.45,width*0.93,height*0.45,width*0.93,height*0.55,width*0.89,height*0.55);//middle crown
  ellipse(width*0.93,height/2,width/30,height/10);//crown
  
  quad(width*0.79,height*0.25,width*0.815,height*0.195,width*0.885,height*0.265,width*0.84,height*0.32);//upper crown
  quad(width*0.79,height*0.75,width*0.815,height*0.805,width*0.885,height*0.735,width*0.84,height*0.68);//upper crown

  
  ellipse(width/2,height/2,width*0.8,height*0.8); //case
  fill(#122856);
  ellipse(width/2,height/2,height*0.75,height*0.75); //bezel face
  fill(#163c6a);
  ellipse(width/2,height/2,width*0.6,height*0.6); //dial face
  fill(#122856);
//luke end  
  
  //collaborative start
  ellipse(width*0.5,height*0.67,width*0.2,height*0.2);//bottom outer subdial
  ellipse(width*0.65,height*0.5,width*0.2,height*0.2);//right outer subdial
  ellipse(width*0.35,height*0.5,width*0.2,height*0.2);//left outer subdial
  fill(#163c6a);
  ellipse(width*0.5,height*0.67,width*0.15,height*0.15);//bottom inner subdial  
  ellipse(width*0.65,height*0.5,width*0.15,height*0.15);//right inner subdial  
  ellipse(width*0.35,height*0.5,width*0.15,height*0.15);//left inner subdial
//collaborative end

//luke start
  fill(#FAFAFA);
  triangle(width*0.44,height*0.14,width*0.56,height*0.14,width/2,height*0.18);
  strokeWeight(4);
  stroke(#FAFAFA);
  line(width*0.69,height*0.2,width*0.67,height*0.23);
  line(width*0.79,height*0.3,width*0.76,height*0.32);
  line(width*0.82,height*0.5,width*0.86,height*0.5);
  line(width*0.69,height*0.8,width*0.67,height*0.77);
  line(width*0.31,height*0.8,width*0.33,height*0.77);
  line(width*0.18,height*0.5,width*0.14,height*0.5);
  line(width*0.31,height*0.2,width*0.33,height*0.23);
//luke end


//small circle hands 
//rosa start
 fill(242,81,81);
 line(width*0.5,height*0.67, width*0.5,height*0.60);
 line(width*0.65,height*0.5, width*0.65,height*0.57);
  line(width*0.35,height*0.5, width*0.28,height*0.5);
 //rosa end


//luke start
  strokeWeight(15);
  stroke(#ebc388);
  line(width/2,height/2,width/2,height/4);
  strokeWeight(6);
  stroke(#FAFAFA);
  line(width/2,height/2,width/2,height/4);//minute hand

  strokeWeight(15);
  stroke(#ebc388);
  line(width/2,height/2,width/3,height/2);
  strokeWeight(6);
  stroke(#FAFAFA);
  line(width/2,height/2,width/3,height/2);//hour hand

  strokeWeight(2);
  stroke(#FAFAFA);
  line(width/2,height/2,width*0.7,height*0.7); //second hand
 //luke end
 
 
 //rosa start
 font1 = loadFont("Copperplate-Light-48.vlw");
font2 = loadFont("AppleMyungjo-48.vlw");

    smooth();
    angle = 0;
    
//rosa end

//luke start
  strokeWeight(1);
  stroke(0,0,0);
  
  fill(#ebc388);
  translate(width*0.85,height*0.23);
  rotate(1.75*PI);
  ellipse(0,0,width/30,height/10);//upper crown
 
  rotate(0.5*PI);
  ellipse(width*0.38,height*0.38,width/30,height/10);//upper crown 
  //luke end
}

//rosa start
void draw() {
       //outside numbers 
      
textSize(30);
textFont(font1,30);
fill(255);

pushMatrix();
float angle1 = radians(-52);
translate(width*0.2, height*0.35); 
rotate(angle1);
text("50", 0, 0); //50   
popMatrix();
 
pushMatrix();
float angle2 = radians(228);
translate(width*0.25, height*0.72); 
rotate(angle2);
text("40", 0,0); //40   
popMatrix();

pushMatrix();
float angle3 = radians(180);
translate(width*0.53, height*0.836); 
rotate (angle3);
text("30", 0,0); //30    
popMatrix();

pushMatrix();
float angle4 = radians(133);
translate(width*0.8, height*0.66); 
rotate (angle4);
text("20", 0,0); //20  
popMatrix();


textFont(font2,20);
pushMatrix();
float angle5 = radians(0);
translate(width*0.42, height*0.35); 
rotate (angle5);
text("BULOVA", 0,0); //brand name  
popMatrix();

//rosa end

}
