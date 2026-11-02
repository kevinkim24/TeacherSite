//collaborators: Emily & A

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  
  smooth();
  
  
  //wristband
  fill(44,24,23);
  stroke(0,0,0);
  rect(width/4.1667,height/10,width/1.923,height/-0.25);//up
  rect(width/4.1667,height/1.1111,width/1.9231,height/0.25);//down
  fill(234,200,130);
  stroke(160,107,65);
  rect(width/5.556,height/3.333,width/16.667,height/-3.846);
  rect(width/5.556,height/3.333,width/16.667,height/1.515);
  rect(width/1.316,height/3.333,width/16.667,height/1.515);
  rect(width/1.316,height/3.333,width/16.667,height/-3.846);
  
  
  //crown
  fill(234,200,130);
  stroke(49,47,42);
  ellipse(width/1.0526,height/2,width/19.2307,height/8.333);//crown
  line(width/1.05932,height/2,width/1.0225,height/2);//decorations
  line(width/1.05932,height/1.92308,width/1.02669,height/1.92308);
  line(width/1.05485,height/1.85185,width/1.02881,height/1.85185);
  line(width/1.05932,height/2.0833,width/1.02669,height/2.0833);
  line(width/1.05485,height/2.1739,width/1.02881,height/2.1739);
  
  
  //circle
  fill(252,235,145);
  ellipse(width/2,height/2,width/1.11,height/1.11);//outsidesideside circle
  
  fill(252,228,145);
  ellipse(width/2,height/2,width/1.25,height/1.25);//outsideside circle
  
  fill(242,231,196);
  ellipse(width/2,height/2,width/1.3,height/1.3);//outside circle
  
  fill(255,252,246);
  ellipse(width/2,height/2,width/1.35,height/1.35);//inside circle
  
  fill(0,0,0);
  ellipse(width/2,height/2,width/40,height/40);//center circle
  
  fill(255,255,255);
  ellipse(width/2,3*height/4.2,width/6,height/6);//second circle
  
  fill(0,0,0);
  ellipse(width/2,3*height/4.2,width/100,height/100);//second center circle
  
  
  //hands
  fill(0,0,0);
  triangle(width/3,height/2.5,width/3.5,height/2.9,width/2,height/2);//hour
  triangle(width/1.25,height/3,3*width/4,height/2.6,width/2,height/2);//minute
  line(width/2,3*height/4.2,width/2.283,height/1.3158);//second


  //text
  textSize(16);
  fill(0,0,0);
  
  text("PATEK PHILIPPE",width/2.5,height/3.0303);
  textSize(10);
  text("GENEVE",width/2.08333,height/2.7778);
  
  textSize(45);
  text("I",width/1.4493,height/3.57143);//1
  text("II",width/1.333,height/2.5641);//2
  text("III",width/1.299,height/1.8868);//3
  text("IV",width/1.3624,height/1.441);//4
  text("V",width/1.5823,height/1.25);//5
  text("VI",width/2.1552,height/1.1628);//6
  text("VII",width/3.62319,height/1.25);//7
  text("VIII",width/5.2632,height/1.4706);//8
  text("IX",width/6.25,height/1.8868);//9
  text("X",width/5.37634,height/2.5641);//10
  text("XI",width/3.6232,height/3.5714);//11
  text("XII",width/2.1552,height/4.3478);//12 
  
}
