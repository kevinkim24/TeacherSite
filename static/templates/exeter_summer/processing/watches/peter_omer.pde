//Collaborators: Peter, Omer
void setup()
{
  size(800,800);
}
void draw()
{ 
  noStroke();
  
  //case
  fill(#A3A5A0);
  arc(width/2,height/9,width*2/3,height/8,PI,TWO_PI);
  arc(width/2,height*8/9,width*2/3,height/8,TWO_PI,PI+TWO_PI);
  rect(width/6,height/9,width*2/3,height*6.25/8);

  //dial
  fill(255);
  rect(width*1.25/6,height/9,width*1.75/3,height*6.25/8);
  arc(width/2,height/9,width*1.75/3,height/10,PI,TWO_PI);
  arc(width/2,height*8/9,width*1.75/3,height/10,TWO_PI,PI+TWO_PI);
 
  //markers
  float widthDial1 = width*1.75/3+width*1.15/6;
  float heightDial1 = height*6.25/8+height/9;
  float heightDial2 = height/9+height*6.25/8;
  stroke(0);
  strokeWeight(15);
  fill(0);
  line(width*1.35/6,height/9,widthDial1,heightDial1);
  line(width/2,height*12/13,width/2,height/13);
  line(width*1.35/6,heightDial2,widthDial1,height/9);
  line(width*1.35/6,height/2,widthDial1,height/2);
  line(widthDial1,height*6/9,width*1.35/6,height*3/9);
  line(width*1.35/6,height*6/9,widthDial1,height*3/9);
  
  //cover
  noStroke();
  fill(255);
  ellipse(width/2,height/2,width*1.5/3,heightDial2*2.5/3);
  
  //date window
  //float posWidthDate = width*2.5/4+(width/10)/2;
  //float posHeightDate = height*0.9/2+(height/10)/2;
  //float fontSize = (width/25+height/25)/2;
  //stroke(0);
  //strokeWeight(2);
  //fill(255);
  //rect(width*2.5/4,height*0.9/2,width/10,height/10);
  //textSize(fontSize);
  //fill(0);
  //text("Mon",posWidthDate*0.95,posHeightDate*1.02);
  
  //hands
  stroke(0);
  strokeWeight(10);
  line(width/2,height/2,widthDial1/2,heightDial1/2);
  line(width/2,height/2,widthDial1,heightDial2/2);
  strokeWeight(5);
  line(width/2,height/2,widthDial1*2/6,heightDial1*3/4);
  
  //crown
  float widthCrown = width*1.1/6+width*2/3;
  float heightCrown = height/9+height*7/8;
  stroke(#DDDEDB);
  strokeWeight(2);
  fill(#A3A5A0);
  ellipse(widthCrown,heightCrown/2,width/20,height/10);
  
  //centre
  noStroke();
  fill(#6B6C69);
  ellipse(width/2,height/2,width/25,height/25); 
  
  //numbers
  //float fontSize = (width/18+height/18)/2;
  //textSize(fontSize);
  //text("12",width*0.95/2,height*2.2/13);
  //text("6",width*0.97/2,height*11.1/13);
  //text("9",width*1.52/6,height*1.03/2);
  //text("3",widthDial1*1.85/2,height*1.03/2);
}
