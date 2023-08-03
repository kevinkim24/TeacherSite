int player = 1;
void setup() {
  size(800, 800);
  background(0);
}
void draw() {
  if(player == 1) {
  strokeWeight(60);
  stroke(#041315);
  line(width/3+25, height/6, width/3+25, height/6*5);
  line(width/3*2-25, height/6, width/3*2-25, height/6*5);
  line(width/6, height/3+25, width/6*5, height/3+25);
  line(width/6, height/3*2-25, width/6*5, height/3*2-25);
  
  strokeWeight(45);
  stroke(#092729);
  line(width/3+25, height/6, width/3+25, height/6*5);
  line(width/3*2-25, height/6, width/3*2-25, height/6*5);
  line(width/6, height/3+25, width/6*5, height/3+25);
  line(width/6, height/3*2-25, width/6*5, height/3*2-25);
  
  strokeWeight(27);
  stroke(#6EE4F2);
  line(width/3+25, height/6, width/3+25, height/6*5);
  line(width/3*2-25, height/6, width/3*2-25, height/6*5);
  line(width/6, height/3+25, width/6*5, height/3+25);
  line(width/6, height/3*2-25, width/6*5, height/3*2-25);
  
  strokeWeight(18);
  stroke(#BCF8FF);
  line(width/3+25, height/6, width/3+25, height/6*5);
  line(width/3*2-25, height/6, width/3*2-25, height/6*5);
  line(width/6, height/3+25, width/6*5, height/3+25);
  line(width/6, height/3*2-25, width/6*5, height/3*2-25);
  
  strokeWeight(9);
  stroke(255);
  line(width/3+25, height/6, width/3+25, height/6*5);
  line(width/3*2-25, height/6, width/3*2-25, height/6*5);
  line(width/6, height/3+25, width/6*5, height/3+25);
  line(width/6, height/3*2-25, width/6*5, height/3*2-25);
  }
  
  if(player == 2) {
  strokeWeight(60);
  stroke(#1F0505);
  line(width/3+25, height/6, width/3+25, height/6*5);
  line(width/3*2-25, height/6, width/3*2-25, height/6*5);
  line(width/6, height/3+25, width/6*5, height/3+25);
  line(width/6, height/3*2-25, width/6*5, height/3*2-25);
  
  strokeWeight(45);
  stroke(#430909);
  line(width/3+25, height/6, width/3+25, height/6*5);
  line(width/3*2-25, height/6, width/3*2-25, height/6*5);
  line(width/6, height/3+25, width/6*5, height/3+25);
  line(width/6, height/3*2-25, width/6*5, height/3*2-25);
  
  strokeWeight(27);
  stroke(#FF4848);
  line(width/3+25, height/6, width/3+25, height/6*5);
  line(width/3*2-25, height/6, width/3*2-25, height/6*5);
  line(width/6, height/3+25, width/6*5, height/3+25);
  line(width/6, height/3*2-25, width/6*5, height/3*2-25);
  
  strokeWeight(18);
  stroke(#FFB4B4);
  line(width/3+25, height/6, width/3+25, height/6*5);
  line(width/3*2-25, height/6, width/3*2-25, height/6*5);
  line(width/6, height/3+25, width/6*5, height/3+25);
  line(width/6, height/3*2-25, width/6*5, height/3*2-25);
  
  strokeWeight(9);
  stroke(255);
  line(width/3+25, height/6, width/3+25, height/6*5);
  line(width/3*2-25, height/6, width/3*2-25, height/6*5);
  line(width/6, height/3+25, width/6*5, height/3+25);
  line(width/6, height/3*2-25, width/6*5, height/3*2-25);
  }
}
void mouseClicked() {
  noFill();
  if(player == 1) {
    println(player);
  if(mouseX < width/3 && mouseY < height/3) {//top left
    strokeWeight(50);
    stroke(#041315);
    line(width/3-35, height/6+25, width/6+15, height/3-25);
    line(width/3-35, height/3-25, width/6+15, height/6+25);
    
    strokeWeight(35);
    stroke(#092729);
    line(width/3-35, height/6+25, width/6+15, height/3-25);
    line(width/3-35, height/3-25, width/6+15, height/6+25);
    
    strokeWeight(21);
    stroke(#6EE4F2);
    line(width/3-35, height/6+25, width/6+15, height/3-25);
    line(width/3-35, height/3-25, width/6+15, height/6+25);
    
    strokeWeight(14);
    stroke(#BCF8FF);
    line(width/3-35, height/6+25, width/6+15, height/3-25);
    line(width/3-35, height/3-25, width/6+15, height/6+25);
    
    strokeWeight(7);
    stroke(255);
    line(width/3-35, height/6+25, width/6+15, height/3-25);
    line(width/3-35, height/3-25, width/6+15, height/6+25);
    
  }
  else if(mouseX < width/3 && mouseY < height/3*2) {//middle left
    strokeWeight(50);
    stroke(#041315);
    line(width/3-35, height/2-42, width/6+15, height/2+42);
    line(width/3-35, height/2+42, width/6+15, height/2-42);
    
    strokeWeight(35);
    stroke(#092729);
    line(width/3-35, height/2-42, width/6+15, height/2+42);
    line(width/3-35, height/2+42, width/6+15, height/2-42);
    
    strokeWeight(21);
    stroke(#6EE4F2);
    line(width/3-35, height/2-42, width/6+15, height/2+42);
    line(width/3-35, height/2+42, width/6+15, height/2-42);
    
    strokeWeight(14);
    stroke(#BCF8FF);
    line(width/3-35, height/2-42, width/6+15, height/2+42);
    line(width/3-35, height/2+42, width/6+15, height/2-42);
    
    strokeWeight(7);
    stroke(255);
    line(width/3-35, height/2-42, width/6+15, height/2+42);
    line(width/3-35, height/2+42, width/6+15, height/2-42);
  }
  else if(mouseX < width/3 && mouseY < height) {//bottom left
    strokeWeight(50);
    stroke(#041315);
    line(width/3-35, height/6*5-25, width/6+15, height/3*2+25);
    line(width/3-35, height/3*2+25, width/6+15, height/6*5-25);
    
    strokeWeight(35);
    stroke(#092729);
    line(width/3-35, height/6*5-25, width/6+15, height/3*2+25);
    line(width/3-35, height/3*2+25, width/6+15, height/6*5-25);
    
    strokeWeight(21);
    stroke(#6EE4F2);
    line(width/3-35, height/6*5-25, width/6+15, height/3*2+25);
    line(width/3-35, height/3*2+25, width/6+15, height/6*5-25);
    
    strokeWeight(14);
    stroke(#BCF8FF);
    line(width/3-35, height/6*5-25, width/6+15, height/3*2+25);
    line(width/3-35, height/3*2+25, width/6+15, height/6*5-25);
    
    strokeWeight(7);
    stroke(255);
    line(width/3-35, height/6*5-25, width/6+15, height/3*2+25);
    line(width/3-35, height/3*2+25, width/6+15, height/6*5-25);
  }
  else if(mouseX < width/3*2 && mouseY < height/3) {//top middle
    strokeWeight(50);
    stroke(#041315);
    line(width/2+45, height/6+25, width/2-45, height/3-25);
    line(width/2+45, height/3-25, width/2-45, height/6+25);
    
    strokeWeight(35);
    stroke(#092729);
    line(width/2+45, height/6+25, width/2-45, height/3-25);
    line(width/2+45, height/3-25, width/2-45, height/6+25);
    
    strokeWeight(21);
    stroke(#6EE4F2);
    line(width/2+45, height/6+25, width/2-45, height/3-25);
    line(width/2+45, height/3-25, width/2-45, height/6+25);
    
    strokeWeight(14);
    stroke(#BCF8FF);
    line(width/2+45, height/6+25, width/2-45, height/3-25);
    line(width/2+45, height/3-25, width/2-45, height/6+25);
    
    strokeWeight(7);
    stroke(255);
    line(width/2+45, height/6+25, width/2-45, height/3-25);
    line(width/2+45, height/3-25, width/2-45, height/6+25);
    
  }
  else if(mouseX < width/3*2 && mouseY < height/3*2) {//middle
    strokeWeight(50);
    stroke(#041315);
    line(width/2+45, height/2-42, width/2-45, height/2+42);
    line(width/2+45, height/2+42, width/2-45, height/2-42);
    
    strokeWeight(35);
    stroke(#092729);
    line(width/2+45, height/2-42, width/2-45, height/2+42);
    line(width/2+45, height/2+42, width/2-45, height/2-42);
    
    strokeWeight(21);
    stroke(#6EE4F2);
    line(width/2+45, height/2-42, width/2-45, height/2+42);
    line(width/2+45, height/2+42, width/2-45, height/2-42);
    
    strokeWeight(14);
    stroke(#BCF8FF);
    line(width/2+45, height/2-42, width/2-45, height/2+42);
    line(width/2+45, height/2+42, width/2-45, height/2-42);
    
    strokeWeight(7);
    stroke(255);
    line(width/2+45, height/2-42, width/2-45, height/2+42);
    line(width/2+45, height/2+42, width/2-45, height/2-42);
  }
  else if(mouseX < width/3*2 && mouseY < height) {//bottom middle
    strokeWeight(50);
    stroke(#041315);
    line(width/2+45, height/6*5-25, width/2-45, height/3*2+25);
    line(width/2+45, height/3*2+25, width/2-45, height/6*5-25);
    
    strokeWeight(35);
    stroke(#092729);
    line(width/2+45, height/6*5-25, width/2-45, height/3*2+25);
    line(width/2+45, height/3*2+25, width/2-45, height/6*5-25);
    
    strokeWeight(21);
    stroke(#6EE4F2);
    line(width/2+45, height/6*5-25, width/2-45, height/3*2+25);
    line(width/2+45, height/3*2+25, width/2-45, height/6*5-25);
    
    strokeWeight(14);
    stroke(#BCF8FF);
    line(width/2+45, height/6*5-25, width/2-45, height/3*2+25);
    line(width/2+45, height/3*2+25, width/2-45, height/6*5-25);
    
    strokeWeight(7);
    stroke(255);
    line(width/2+45, height/6*5-25, width/2-45, height/3*2+25);
    line(width/2+45, height/3*2+25, width/2-45, height/6*5-25);
  }
  else if(mouseX < width && mouseY < height/3) {//top right
    strokeWeight(50);
    stroke(#041315);
    line(width/3*2+35, height/6+25, width/6*5-15, height/3-25);
    line(width/3*2+35, height/3-25, width/6*5-15, height/6+25);
    
    strokeWeight(35);
    stroke(#092729);
    line(width/3*2+35, height/6+25, width/6*5-15, height/3-25);
    line(width/3*2+35, height/3-25, width/6*5-15, height/6+25);
    
    strokeWeight(21);
    stroke(#6EE4F2);
    line(width/3*2+35, height/6+25, width/6*5-15, height/3-25);
    line(width/3*2+35, height/3-25, width/6*5-15, height/6+25);
    
    strokeWeight(14);
    stroke(#BCF8FF);
    line(width/3*2+35, height/6+25, width/6*5-15, height/3-25);
    line(width/3*2+35, height/3-25, width/6*5-15, height/6+25);
    
    strokeWeight(7);
    stroke(255);
    line(width/3*2+35, height/6+25, width/6*5-15, height/3-25);
    line(width/3*2+35, height/3-25, width/6*5-15, height/6+25);
  }
  else if(mouseX < width && mouseY < height/3*2) {//middle right
    strokeWeight(50);
    stroke(#041315);
    line(width/3*2+35, height/2-42, width/6*5-15, height/2+42);
    line(width/3*2+35, height/2+42, width/6*5-15, height/2-42);
    
    strokeWeight(35);
    stroke(#092729);
    line(width/3*2+35, height/2-42, width/6*5-15, height/2+42);
    line(width/3*2+35, height/2+42, width/6*5-15, height/2-42);
    
    strokeWeight(21);
    stroke(#6EE4F2);
    line(width/3*2+35, height/2-42, width/6*5-15, height/2+42);
    line(width/3*2+35, height/2+42, width/6*5-15, height/2-42);
    
    strokeWeight(14);
    stroke(#BCF8FF);
    line(width/3*2+35, height/2-42, width/6*5-15, height/2+42);
    line(width/3*2+35, height/2+42, width/6*5-15, height/2-42);
    
    strokeWeight(7);
    stroke(255);
    line(width/3*2+35, height/2-42, width/6*5-15, height/2+42);
    line(width/3*2+35, height/2+42, width/6*5-15, height/2-42);
  }
  else if(mouseX < width && mouseY < height) {//bottom right
    strokeWeight(50);
    stroke(#041315);
    line(width/3*2+35, height/6*5-25, width/6*5-15, height/3*2+25);
    line(width/3*2+35, height/3*2+25, width/6*5-15, height/6*5-25);
    
    strokeWeight(35);
    stroke(#092729);
    line(width/3*2+35, height/6*5-25, width/6*5-15, height/3*2+25);
    line(width/3*2+35, height/3*2+25, width/6*5-15, height/6*5-25);
    
    strokeWeight(21);
    stroke(#6EE4F2);
    line(width/3*2+35, height/6*5-25, width/6*5-15, height/3*2+25);
    line(width/3*2+35, height/3*2+25, width/6*5-15, height/6*5-25);
    
    strokeWeight(14);
    stroke(#BCF8FF);
    line(width/3*2+35, height/6*5-25, width/6*5-15, height/3*2+25);
    line(width/3*2+35, height/3*2+25, width/6*5-15, height/6*5-25);
    
    strokeWeight(7);
    stroke(255);
    line(width/3*2+35, height/6*5-25, width/6*5-15, height/3*2+25);
    line(width/3*2+35, height/3*2+25, width/6*5-15, height/6*5-25);
  }
player++;
}
  else if(player == 2) {
    println(player);
  if(mouseX < width/3 && mouseY < height/3) {//top left
    strokeWeight(34);
    stroke(#1F0505);
    ellipse(width/4-10, height/5+38, 100, 100);
  
    strokeWeight(24);
    stroke(#430909);
    ellipse(width/4-10, height/5+38, 100, 100);
  
    strokeWeight(18);
    stroke(#FF4848);
    ellipse(width/4-10, height/5+38, 100, 100);
  
    strokeWeight(12);
    stroke(#FFB4B4);
    ellipse(width/4-10, height/5+38, 100, 100);
  
    strokeWeight(6);
    stroke(255);
    ellipse(width/4-10, height/5+38, 100, 100);
  }
  else if(mouseX < width/3 && mouseY < height/3*2) {//middle left
    strokeWeight(34);
    stroke(#1F0505);
    ellipse(width/4-10, height/2, 100, 100);
  
    strokeWeight(24);
    stroke(#430909);
    ellipse(width/4-10, height/2, 100, 100);
  
    strokeWeight(18);
    stroke(#FF4848);
    ellipse(width/4-10, height/2, 100, 100);
  
    strokeWeight(12);
    stroke(#FFB4B4);
    ellipse(width/4-10, height/2, 100, 100);
  
    strokeWeight(6);
    stroke(255);
    ellipse(width/4-10, height/2, 100, 100);
  }
  else if(mouseX < width/3 && mouseY < height) {//bottom left
    strokeWeight(34);
    stroke(#1F0505);
    ellipse(width/4-10, height/5*4-38, 100, 100);
  
    strokeWeight(24);
    stroke(#430909);
    ellipse(width/4-10, height/5*4-38, 100, 100);
  
    strokeWeight(18);
    stroke(#FF4848);
    ellipse(width/4-10, height/5*4-38, 100, 100);
  
    strokeWeight(12);
    stroke(#FFB4B4);
    ellipse(width/4-10, height/5*4-38, 100, 100);
  
    strokeWeight(6);
    stroke(255);
    ellipse(width/4-10, height/5*4-38, 100, 100);
  }
  else if(mouseX < width/3*2 && mouseY < height/3) {//top middle
    strokeWeight(34);
    stroke(#1F0505);
    ellipse(width/2, height/5+38, 100, 100);
  
    strokeWeight(24);
    stroke(#430909);
    ellipse(width/2, height/5+38, 100, 100);
  
    strokeWeight(18);
    stroke(#FF4848);
    ellipse(width/2, height/5+38, 100, 100);
  
    strokeWeight(12);
    stroke(#FFB4B4);
    ellipse(width/2, height/5+38, 100, 100);
  
    strokeWeight(6);
    stroke(255);
    ellipse(width/2, height/5+38, 100, 100);
  }
  else if(mouseX < width/3*2 && mouseY < height/3*2) {//middle
    strokeWeight(34);
    stroke(#1F0505);
    ellipse(width/2, height/2, 100, 100);
  
    strokeWeight(24);
    stroke(#430909);
    ellipse(width/2, height/2, 100, 100);
  
    strokeWeight(18);
    stroke(#FF4848);
    ellipse(width/2, height/2, 100, 100);
  
    strokeWeight(12);
    stroke(#FFB4B4);
    ellipse(width/2, height/2, 100, 100);
  
    strokeWeight(6);
    stroke(255);
    ellipse(width/2, height/2, 100, 100);
  }
  else if(mouseX < width/3*2 && mouseY < height) {//bottom middle
    strokeWeight(34);
    stroke(#1F0505);
    ellipse(width/2, height/5*4-38, 100, 100);
  
    strokeWeight(24);
    stroke(#430909);
    ellipse(width/2, height/5*4-38, 100, 100);
  
    strokeWeight(18);
    stroke(#FF4848);
    ellipse(width/2, height/5*4-38, 100, 100);
  
    strokeWeight(12);
    stroke(#FFB4B4);
    ellipse(width/2, height/5*4-38, 100, 100);
  
    strokeWeight(6);
    stroke(255);
    ellipse(width/2, height/5*4-38, 100, 100);
  }
  else if(mouseX < width && mouseY < height/3) {//top right
    strokeWeight(34);
    stroke(#1F0505);
    ellipse(width/4*3+10, height/5+38, 100, 100);
  
    strokeWeight(24);
    stroke(#430909);
    ellipse(width/4*3+10, height/5+38, 100, 100);
  
    strokeWeight(18);
    stroke(#FF4848);
    ellipse(width/4*3+10, height/5+38, 100, 100);
  
    strokeWeight(12);
    stroke(#FFB4B4);
    ellipse(width/4*3+10, height/5+38, 100, 100);
  
    strokeWeight(6);
    stroke(255);
    ellipse(width/4*3+10, height/5+38, 100, 100);
  }
  else if(mouseX < width && mouseY < height/3*2) {//middle right
    strokeWeight(34);
    stroke(#1F0505);
    ellipse(width/4*3+10, height/2, 100, 100);
  
    strokeWeight(24);
    stroke(#430909);
    ellipse(width/4*3+10, height/2, 100, 100);
  
    strokeWeight(18);
    stroke(#FF4848);
    ellipse(width/4*3+10, height/2, 100, 100);
  
    strokeWeight(12);
    stroke(#FFB4B4);
    ellipse(width/4*3+10, height/2, 100, 100);
  
    strokeWeight(6);
    stroke(255);
    ellipse(width/4*3+10, height/2, 100, 100);
  }
  else if(mouseX < width && mouseY < height) {//bottom right
    strokeWeight(34);
    stroke(#1F0505);
    ellipse(width/4*3+10, height/5*4-38, 100, 100);
  
    strokeWeight(24);
    stroke(#430909);
    ellipse(width/4*3+10, height/5*4-38, 100, 100);
  
    strokeWeight(18);
    stroke(#FF4848);
    ellipse(width/4*3+10, height/5*4-38, 100, 100);
  
    strokeWeight(12);
    stroke(#FFB4B4);
    ellipse(width/4*3+10, height/5*4-38, 100, 100);
  
    strokeWeight(6);
    stroke(255);
    ellipse(width/4*3+10, height/5*4-38, 100, 100);
  }
  player--;
  }
}
