PImage img;



void setup(){
  
  size(500,500);
  img = loadImage("bbcircle.jpg");
  background(255);
}
void draw() {
  
  
  // case
  
  noFill();
  stroke(90,58,16);
  strokeWeight(10);
  rect(width/25,width/2.8571,width/1.7,width/3.333);
  rect(width/2.8,width/2.8571,width/1.7,width/3.333);
  
  
  
  
 // watch crown
 noStroke();
 fill(160);
 rect(width/1.19,height/2.08,width/20,height/20);

 stroke(0);
 strokeWeight(1);
 line(width/1.18,height/2.04,width/1.13,height/2.04);
 line(width/1.18,height/2,width/1.13,height/2);
 line(width/1.18,height/1.96,width/1.13,height/1.96);
 line(width/1.18,height/1.92,width/1.13,height/1.92);

 
 
  
  
  
  
  // image
   fill(160);
 image(img,(width/6.7),(height/6.7),(width/1.43),(height/1.43));
  

  

  // the watch (watch shape)
  stroke(203,188,64);
  strokeWeight(12);
 noFill();
  ellipse(width/2,height/2, (width/1.43),(height/1.43));
  
  
 // hour markers
  
  stroke(0);
  strokeWeight(4);
  line(width/2,width/7.04,width/2,width/6.33);
  
  line(width/1.19,width/2,width/1.17,width/2);
  
  line(width/2,width/1.19,width/2,width/1.17);
  
  line(width/7.04,width/2,width/6.33,width/2);
  
   line(width/5.61,width/2.94,500/5.15,width/2.84);
   
   line(width/3.4,width/4.85,width/3.289,width/4.545);
   
   line(width/1.42,width/4.85,width/1.44,width/4.545);
   
   line(width/1.219,width/2.94,width/1.24,width/2.84);
   
   line(width/1.25,width/1.497,width/1.237,width/1.47);
   
   line(width/1.49,width/1.26,width/1.47,width/1.24);
   
   line(width/5.43,width/1.497,width/5.102,width/1.519);
   
   line(width/3.4,width/1.26,width/3.289,width/1.285);
   
  
  
  


  // minutes
  stroke(203,188,64);
  strokeWeight(3);
  line(width/2,height/2,width/5,height/2);
 
 // hours
  stroke(203,188,64);
  strokeWeight(3);
  line(width/2,height/2,width/2.63157,height/2.222);
 
// seconds
  stroke(203,188,64);
  strokeWeight(1);
  line(width/2,height/2,width/4,height/1.428);
  
  
  // ellipse in the center(origin of the indicators)
  fill(0);
  ellipse(width/2,height/2,width/50,height/50);
  
  
  // texts (beauty and the beast and signing)
  fill(0);
  textSize(20);
  text("B&B",width/16.7,width/1.111);
  text("G&E",width/1.25,width/1.111);
  text("9:45 AM",width/10,width/10);
  
  
 // wenger brand
 fill(216,51,17);
 rect(width/1.25,width/10,width/10,width/10);
 fill(255);
 rect(width/1.234,width/7.142,width/12.5,width/50);
 rect(width/1.1904,width/9.0909,width/50,width/12.5);
 
  
  
  
  
  
}
