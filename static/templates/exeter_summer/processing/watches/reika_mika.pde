void setup(){
  size(400,400);
  background(255);
}

void draw(){
  //case top half
  
  //darkest base
  stroke(190,190,190);
  fill(180,180,180);
  strokeWeight(4);
  quad(width/4.5, height/3, width/3*2.33, height/3, width/3.75*2.6, height/10.5, width/3.5, height/10.5);
  
  //second darkest outside quads
  fill(200,200,200);
  strokeWeight(6);
  stroke(190,190,190);
  quad(width/3.85, height/5, width/3, height/5, width/3, height/ 7.5, width/3.6, height/7.5);
  quad(width/3*1.9, height/5, width/3*2.18, height/5, width/3.75*2.6, height/7.5, width/3*1.9, height/7.5);
  
  //2and inner quad
  stroke(200,200,200);
  fill(210,210,210);
  quad(width/3, height/5, width/3*1.9, height/5, width/3*1.9, height/10.5, width/3, height/10.5);
  
  //inner lightest quad
  strokeWeight(3);
  stroke(205,205,205);
  fill(220,220,220);
  quad(width/1.8, height/5, width/2.5, height/5, width/2.5, height/9.5, width/1.8, height/9.5);
  
  //upper inner chain link
  strokeWeight(8);
  stroke(210,210,210);
  fill(200,200,200);
  quad(width/2.5, height/11.5, width/1.8, height/11.5, width/1.8, height/100, width/2.5, height/100);
  
  //left chain link
  strokeWeight(4);
  stroke(190,190,190);
  fill(200,200,200);
  quad(width/3,height/11.5, width/2.5, height/11.5, width/2.5, height/110, width/3, height/110);
  
  //right chain link
  quad(width/1.8, height/11.5, width/3*1.9, height/11.5, width/3*1.9, height/110, width/1.8, height/110);
  
  //inner quad upper
  strokeWeight(4); 
  stroke(195,195,195);
  fill(210,210,210);
  quad(width/1.8, height/9.5, width/2.5, height/9.5, width/2.5, height/15, width/1.8, height/15);
   
  //case lower half
  
  //darkest base
  stroke(190,190,190);
  fill(180,180,180);
  strokeWeight(4);
  quad(width/4.9, height/3*2, width/3*2.44, height/3*2, width/3.75*2.5, height/10*9, width/3.25, height/10*9);
  
  //second darkest outside quads
  fill(200,200,200);
  strokeWeight(6);
  stroke(190,190,190);
  quad(width/3.75, height/5*4, width/2.9, height/5*4, width/2.9, height/7.5*6.5, width/3.35, height/7.5*6.5);
  quad(width/3*1.9, height/5*4, width/3*2.18, height/5*4, width/3.75*2.5, height/7.5*6.5, width/3*1.9, height/7.5*6.5);
  
  //2and inner quad
  stroke(200,200,200);
  fill(210,210,210);
  quad(width/2.85, height/5*4, width/3*1.9, height/5*4, width/3*1.9, height/10.5*9.4, width/2.85, height/10.5*9.4);
  
  //inner lightest quad
  strokeWeight(3);
  stroke(205,205,205);
  fill(220,220,220);
  quad(width/1.8, height/5*4, width/2.5, height/5*4, width/2.5, height/9.5*8.4, width/1.8, height/9.5*8.4);
  
  //upper inner chain link
  strokeWeight(16);
  stroke(210,210,210);
  fill(200,200,200);
  quad(width/2.5, height/11.5*10.5, width/1.8, height/11.5*10.5, width/1.8, height, width/2.5, height);
  
  //left chain link
  strokeWeight(6);
  stroke(190,190,190);
  fill(200,200,200);
  quad(width/3,height/11.5*10.5, width/2.5, height/11.5*10.5, width/2.5, height, width/3, height);
  
  //right chain link
  quad(width/1.8, height/11.5*10.5, width/3*1.9, height/11.5*10.5, width/3*1.9, height, width/1.8, height);
  
  //inner quad upper
  strokeWeight(4); 
  stroke(195,195,195);
  fill(210,210,210);
  quad(width/1.8, height/9.5*8.5, width/2.5, height/9.5*8.5, width/2.5, height/15*14.5, width/1.8, height/15*14.5);
  
  //side thinger
  
  //side thingies
  strokeWeight(3);
  //top
  quad(width/15*13.5, height/2.25, width/15*13.5, height/2.35, width/15*13, height/2.45, width/15*13, height/2.15);
  //bottom
 quad(width/15*13.5, height/1.75, width/15*13.5, height/1.85, width/15*13, height/1.9, width/15*13, height/1.7);
  
  //left dial part(with lines)
  stroke(210,210,210);
  fill(195,195,195);
  quad(width/15*13, height/2.15, width/15*13, height/1.9, width/15*13.5, height/1.95, width/15*13.5, height/2.1);
  //right dial
  
  //main circle
  stroke(210,210,210);
  fill(200,200,200);
  strokeWeight(6);
  //ellipse(width/2, height/2, 280,280);
  
  
  strokeWeight(1);
  stroke(0,0,0);
  ///case
  
  //red part
fill(#950B0B);
  arc(width/2,height/2,280,280,0,3.14);
  
  //blue part
  fill(#230076);
  arc(width/2,height/2,280,280,3.14,6.28);
  
  //circle between black part and bluered part
  fill(#DFDEE3);
  ellipse(width/2,height/2,230,230);
  
  //black part
  fill(0);
  ellipse(width/2,height/2,222,222);
  
 
  //scale
  fill(#E8E8E8);
  triangle(width/2,height/3,width/2+12,height/4,width/2-12,height/4);
  quad(width/2-7,height/1.5,width/2+7,height/1.5,width/2+7,height/1.3,width/2-7,height/1.3);
  quad(width/4,height/2+7,width/4,height/2-7,width/3,height/2-7,width/3,height/2+7);
  fill(#3747ED);
  ellipse(width/1.5,height/2,15,30);
  ellipse(width/1.35,height/2,15,30);
  rect(width/1.5,height/2-15,30,30);
  fill(255);
  quad(width/1.5,height/2-10,width/1.35,height/2-10,width/1.35,height/2+10,width/1.5,height/2+10);
  fill(0);
  textSize(20);
  text("23",width/1.47,height/2+5);
  //cilcle scales
  fill(255);
  ellipse(width/2.6,height/3.2,20,20);
  ellipse(width/1.6,height/3.2,20,20);
  ellipse(width/3.3,height/2.5,20,20);
  ellipse(width/1.425,height/2.5,20,20);
  ellipse(width/3.3,height/1.65,20,20);
  ellipse(width/1.425,height/1.65,20,20);
  ellipse(width/2.6,height/1.45,20,20);
  ellipse(width/1.6,height/1.45,20,20);
  
  //scale on the blue part
  triangle(width/2,height/5,width/2-20,height/6,width/2+20,height/6);
  
  //middle part
  fill(#6C6C6C);
  stroke(#E8E8EA);
  ellipse(width/2,height/2,25,25);
  ellipse(width/2,height/2,18,18);
  ellipse(width/2,height/2,15,15);
  fill(255);
  ellipse(width/2,height/2,4,4);
  
  //logo
  text("ROLEX",width/2-28,height/2-30);
  
  //hands
  line(width/2,height/2,width/2.6,height/2.4);
  line(width/2,height/2,width/3,height/1.55);
  line(width/2,height/2,width/1.5,height/2.7);
  
  line(width/2,height/2,width/3.6,height/1.6);
  
  
}
