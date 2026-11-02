int time = 3600;
int mpx = 50;
int mpy = 45;
boolean fail = false;
boolean timeroff = false;
int x = 250;
int y = 250;
int direction = 1;

void setup(){
  size(500, 500);
}

void draw(){
  frameRate(60);
  background(0);
  
  //Movement of main character
  if (fail == false){
    if (keyPressed){
      if (key == 'w'){
        mpy -= 2;
      }
      else if (key == 'a'){
        mpx -= 2;
      }
      else if (key == 'd'){
        mpx += 2;
      }
      else if (key == 's'){
        mpy += 2;
      }
    }
  }
  
  
  //Area in which character can move
  stroke(1);
  fill(255);
  rect(width/14.285,height/16.667,width/16.667,height/10);
  rect(width/14.286,height/8.333,width/1.1628,height/1.235);
  
  
  //Obstacles
  fill(125,125,125);
  rect(width/5,height/4.1667,width/1.667,height/16.667);
  quad(width/3.571,height/2.703,width/1.471,height/2.703,width/1.25,height/2.174,width/6.667,height/2.174);
  triangle(width/1.351,height/2.083,width/1.163,height/1.724,width/1.471,height/1.786);
  triangle(width/5.556,height/3.2258,width/5,height/3.0303,width/5.882,height/3.0303);
  ellipse(width/1.613,height/1.786,width/25,height/25);
  rect(width/8.333,height/1.724,width/11.111,height/11.111);
  rect(width/3.333,height/1.512,width/2.632,height/10);
  rect(width/4.1667,height/1.282,width/9.091,height/14.286);
  rect(width/1.1628,height/1.1628 - 15, width/14.286, 15);
  
  //Movement of enemies
  if (fail == false){
    noStroke();
    fill(0);
    x += direction; //direction of the ball/make the ball move
    if (x == 475 || x == 25){//conditions
      direction *= -1;//make the ball bounce left, +1 = bounce right
    }
  
    y += direction; //direction of the ball/make the ball move
    if (y == 465 || y == 60){//conditions
      direction *= -1;//make the ball bounce left, +1 = bounce righ
    }
  }
  
  //Enemies
  ellipse(x,440,10,10);
  ellipse(y,80,10,10);
  
  
  //Limited vision 
  fill(255);
  float hx = width*0.25;
  float hy = height*0.25;
  if (fail == false){
    noStroke();
    if (mpx >= width*0.25 || mpy >= height*0.25)
      rect (0,0,width*0.25,height*0.25);
    if (mpx < width*0.25 || mpx >= width*0.5 || mpy >= height*0.25)
      rect (width*0.25,0,hx,hy);
    if (mpx < width*0.5 || mpx >= width*0.75|| mpy >= height*0.25)
      rect (width*0.5,0,hx,hy);
    if (mpx < width*0.75 || mpx >= width|| mpy >= height*0.25)
      rect (width*0.75,0,hx,hy);
    if (mpx < width*0.75 || mpx >= width|| mpy < height*0.25 || mpy >= height*0.5)
      rect (width*0.75,height*0.25,hx,hy);
    if (mpx < width*0.75 || mpx >= width|| mpy < height*0.5 || mpy >= height*0.75)
      rect (width*0.75,height*0.5,hx,hy);
    if (mpx < width*0.75 || mpx >= width|| mpy < height*0.75 || mpy >= height)
      rect (width*0.75,height*0.75,hx,hy);
    if (mpx < width*0.5 || mpx >= width*0.75|| mpy < height*0.25 || mpy >= height*0.5)
      rect (width*0.5,height*0.25,hx,hy);
    if (mpx < width*0.5 || mpx >= width*0.75|| mpy < height*0.5 || mpy >= height*0.75)
      rect (width*0.5,height*0.5,hx,hy);
    if (mpx < width*0.5 || mpx >= width*0.75|| mpy < height*0.75 || mpy >= height)
      rect (width*0.5,height*0.75,hx,hy);
    if (mpx < width*0.25 || mpx >= width*0.5|| mpy < height*0.25 || mpy >= height*0.5)
      rect (width*0.25,height*0.25,hx,hy);
    if (mpx < width*0.25 || mpx >= width*0.5|| mpy < height*0.5 || mpy >= height*0.75)
      rect (width*0.25,height*0.5,hx,hy);
    if (mpx < width*0.25 || mpx >= width*0.5|| mpy < height*0.75 || mpy >= height)
      rect (width*0.25,height*0.75,hx,hy);
    if (mpx >= width*0.25|| mpy < height*0.25 || mpy >= height*0.5)
      rect (0,height*0.25,hx,hy);
    if (mpx >= width*0.25|| mpy < height*0.5 || mpy >= height*0.75)
      rect (0,height*0.5,hx,hy);
    if (mpx >= width*0.25|| mpy < height*0.75 || mpy >= height)
      rect (0,height*0.75,hx,hy);
  }
  stroke(1);
  
  
  //Resetting the main character
  if (get(mpx + 12,mpy) != get(mpx - 12, mpy) || get(mpx, mpy + 12) != get(mpx, mpy - 12) || get(mpx + 6, mpy + 6) != get(mpx - 6, mpy - 6) || get(mpx - 6, mpy + 6) != get(mpx + 6, mpy - 6)){
    mpx = 50;
    mpy = 45;
  }
  
  //Timer
  time -= 1;
  if (fail == false){
    if(time <= 3600 && time >= 1){
      fill(255,0,0);
      textSize(30);
      text(time/60,450,35);
    }
    else{
      fail = true;
      timeroff = true;
    }
  }
  if (timeroff == true){
    textSize(100);
    fill(227,31,21);
    text("FAIL",170,275);
  }
  
  //printing complete once the main character reaches the end
  if( mpx > 430 && mpy > 430 && mpx < 465 && mpy < 465){
    textSize(100);
    fill(228,234,64);
    text("COMPLETE",25,280);
    fail = true;
  }
  
  fill(255);
  
  //End zone
  rect(width/1.1628,height/1.1628,width/14.286,height/14.286);

  //Main character
  ellipse(mpx,mpy,width/25,height/25);//character
}
