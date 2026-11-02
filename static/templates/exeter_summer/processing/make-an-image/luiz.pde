void setup(){
  size(300,300);
  background(#39E6F7);
}

void draw(){
  fill(#955A1A);
  rect(0, 200, 300, 100);
  quad(200, 200, 300, 200, 300, 150, 240, 160);
  
  fill(#D2FC2B);
  rect(50, 150, 50, 50);
  
  fill(#FF6912);
  triangle(45, 150, 105, 150, 75, 120);
  
  fill(#FAFA00);
  ellipse(300, 0, 50, 50);
  line(270, 10, 220, 25);
  line(280, 25, 240, 55);
  line(270, 10, 220, 25);
  
  fill(#C68F1E);
  rect(145, 150, 10, 50);
  
  fill(#16F022);
  arc(150, 150, 50, 50, PI - QUARTER_PI, TWO_PI + QUARTER_PI);
}
