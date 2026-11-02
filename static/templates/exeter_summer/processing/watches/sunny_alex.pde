//collaborations Sunny&Alex



  float a = second();
  float b = minute();
  float c = hour();
void setup()
{
  
  size(700,700);
  background(#D7E3E8);
 
   c = c*6.28/12-6.28/4+a*6.28/3600;
   b= b*6.28/60-6.28/4;
   a= a*6.28/60-6.28/4;
}

void draw()
{
   strokeWeight(1.5);
    stroke(0);
    rect(width/2-width/6,0,width/3,height);
    rect(width/2,height/2-40,15*width/40+width/10-35,70);
  rect(width/2+12*width/40,height/2-height/12,width/9,height/6.7);
  line(width/2+12*width/40,height/2-height/12+height/36,width/2+12*width/40+width/9,height/2-height/12+height/36);
line(width/2+12*width/40,height/2-height/12+2*height/36,width/2+12*width/40+width/9,height/2-height/12+2*height/36);
line(width/2+12*width/40,height/2-height/12+3*height/36,width/2+12*width/40+width/9,height/2-height/12+3*height/36);
line(width/2+12*width/40,height/2-height/12+4*height/36,width/2+12*width/40+width/9,height/2-height/12+4*height/36);
line(width/2+12*width/40,height/2-height/12+5*height/36,width/2+12*width/40+width/9,height/2-height/12+5*height/36);
line(width/2+12*width/40,height/2-height/12+0.4*height/36,width/2+12*width/40+width/9,height/2-height/12+0.4*height/36);

fill(198,230,255);
  ellipse(width/2,height/2,15*width/20,15*height/20);
  fill(190,221,245);
  ellipse(width/2,height/2,16*width/25,16*height/25);
  arc(width/2,height/2,7*width/10,7*height/10,4.96,5.50,PIE);
  arc(width/2,height/2,7*width/10,7*height/10,6.03,6.48,PIE);
  arc(width/2,height/2,7*width/10,7*height/10,0.75,1.26,PIE);
  arc(width/2,height/2,7*width/10,7*height/10,1.88,2.36,PIE);
  arc(width/2,height/2,7*width/10,7*height/10,2.9,3.38,PIE);
  arc(width/2,height/2,7*width/10,7*height/10,3.93,4.4,PIE);
  stroke(190,221,245);
  ellipse(width/2,height/2,63*width/100,63*height/100);
  stroke(0);
    fill(#1C57A2);

  ellipse(width/2,height/2,23*width/40,23*height/40);
  
    //Hour times
  stroke(255);
strokeWeight(10);
line(width/2,height*0.22,width/2,height*0.30);//12
line(width*0.78,height/2,width*0.7,height/2);//3
line(width/2,height*0.7,width/2,height*0.78);//6
line(width*0.22,height/2,width*0.26,height/2);//9
line(width*0.635,height*0.255,width*0.596,height*0.325);//1
line(width*0.734,height*0.346,width*0.656,height*0.404);//2
line(width*0.734,height*0.654,width*0.656,height*0.596);//4
line(width*0.635,height*0.745,width*0.596,height*0.675);//5
line(width*0.365,height*0.745,width*0.404,height*0.675);//7
line(width*0.266,height*0.654,width*0.344,height*0.596);//8
line(width*0.266,height*0.346,width*0.344,height*0.404);//10
line(width*0.365,height*0.255,width*0.404,height*0.325);//11
  
  
  fill(#D4DADB);
 strokeWeight(1.5);
 stroke(0);

  
  
  fill(#E8F9FF);
  ellipse(width/2-15*width/100,height/2,width/6,height/6);
  ellipse(width/2-15*width/100,height/2,10,10);
  line(width/2-15*width/100,height/2,width/2-15*width/100+width/13*cos(a),height/2+width/13*sin(a));
     strokeWeight(13); 
 stroke(#B9B4B6);
 line(width/2,height/2,width/2+23*width/100*cos(b),height/2+23*height/100*sin(b));
 line(width/2,height/2,width/2+23*width/180*cos(c),height/2+23*height/180*sin(c));
  a += 0.001744;
  b += 0.001744/float(60);
  c += 0.001744/float(3600);
  
    fill(#D4DADB);
 strokeWeight(1.5);
 stroke(0);
  ellipse(width/2,height/2,30,30);
  ellipse(width/2,height/2,25,25);
  ellipse(width/2,height/2,14,14);
  

}
