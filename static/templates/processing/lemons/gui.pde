void setup()
{ 
  size(500,500,P3D);
  
}

void draw()
{
 
  
  background(255);
  
  stroke(232,34,23);
  strokeWeight(2);
  
  fill(242,170,12);
  arc(199,202,100,100, 4.71,5.65); 
  fill(234,245,124);
  arc(198,200,100,100, 5.70,0.47+TWO_PI);  
    fill(242,170,12);
  arc(198,200,100,100, 0.47, 1.57);
 fill(234,245,124);
  arc(200,200,100,100,1.57,2.67);
    fill(242,170,12);
  arc(200,200,100,100,2.67,3.61);
  fill(234,245,124);
  arc(199,202,100,100,3.61,4.71);
  
  fill(255);
  ellipse(200,200,14,14);
  
  noStroke();
  fill(0);
  ellipse(200,201,4,4);
  
  fill(0);
  ellipse(170,201,4,4);
   ellipse(183,180,4,4);
     ellipse(210,180,4,4);
       ellipse(222,198,4,4);
         ellipse(215,224,4,4);
           ellipse(183,224,4,4);
  
  

}
