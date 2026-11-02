void setup(){
  size(300, 300, P3D);
  background(180);
}

void draw(){
  fill(255);
  ellipse(150, 150, 100, 100);
  ellipse(150, 150, 90, 90);
  
  fill(#FFE93B);
  ellipse(150, 150, 70, 65);
  rotateY(-QUARTER_PI/2);
  for (int i = 0; i < 9; i++) {
    arc(155, 150, 50, 50, i*TWO_PI/9, (i+1)*TWO_PI/9, PIE);
  }
}
