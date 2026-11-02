void setup(){
  size(500,500);
}

//Human
void human(float x,float y,float x2,float y2,float sizeX,float sizeY){
  fill(150,100,50);
  rect(x,y,50,50);
  fill(200,125,100);
  rect(x2,y2,sizeX,sizeY);
}

//Bullets
  //X axis Bullets
void bullet(float BulletX,float BulletY){
  fill(0);
  ellipse(BulletX,BulletY,10,10);
}
void bullet2(float BulletX2,float BulletY2){
  fill(0);
  ellipse(BulletX2,BulletY2,10,10);
}
void bullet3(float BulletX3,float BulletY3){
  fill(0);
  ellipse(BulletX3,BulletY3,10,10);
}

  //Y axis Bullets
void bullet4(float Bullet2X,float Bullet2Y){
  fill(0);
  ellipse(Bullet2X,Bullet2Y,10,10);
}
void bullet5(float Bullet2X2,float Bullet2Y2){
  fill(0);
  ellipse(Bullet2X2,Bullet2Y2,10,10);
}
void bullet6(float Bullet2X3,float Bullet2Y3){
  fill(0);
  ellipse(Bullet2X3,Bullet2Y3,10,10);
}

//Variables
  //Human Variables
float x=250;
float y=250;
float x2=x+20;
float y2=y+50;
float sizeX=10;
float sizeY=20;
int HP = 3;

  //Bullet Variables
float DifficultyLevel = 0.0;
float BulletY = 0;
float BulletX = 0;
float BulletY2 = 0;
float BulletX2 = -100;
float BulletY3 = 0;
float BulletX3 = -200;
float Bullet2Y = -50;
float Bullet2X = 0;
float Bullet2Y2 = -150;
float Bullet2X2 = 0;
float Bullet2Y3 = -250;
float Bullet2X3 = 0;

  //Randomizer Variables
int RandomNumber1 = int(random(10));
int RandomNumber2 = int(random(10));
int RandomNumber3 = int(random(10));
int RandomNumber4 = int(random(10));
int RandomNumber5 = int(random(10));
int RandomNumber6 = int(random(10));


void draw(){
  background(100,255,100);
  textSize(12);
  text(DifficultyLevel*10,0,10);
  text(HP,492,10);
  
//Movement
  //Rows
    //Row 1
  if(mouseX<50&&mouseX>0&&mouseY<50&&mouseY>0){
    x=0;
    y=0;
  }
  else if(mouseX<100&&mouseX>50&&mouseY<50&&mouseY>0){
    x=50;
    y=0;
  }
  else if(mouseX<150&&mouseX>100&&mouseY<50&&mouseY>0){
    x=100;
    y=0;
  }
  else if(mouseX<200&&mouseX>150&&mouseY<50&&mouseY>0){
    x=150;
    y=0;
  }
  else if(mouseX<250&&mouseX>200&&mouseY<50&&mouseY>0){
    x=200;
    y=0;
  }
  else if(mouseX<300&&mouseX>250&&mouseY<50&&mouseY>0){
    x=250;
    y=0;
  }
  else if(mouseX<350&&mouseX>300&&mouseY<50&&mouseY>0){
    x=300;
    y=0;
  }
  else if(mouseX<400&&mouseX>350&&mouseY<50&&mouseY>0){
    x=350;
    y=0;
  }
  else if(mouseX<450&&mouseX>400&&mouseY<50&&mouseY>0){
    x=400;
    y=0;
  }
  else if(mouseX<500&&mouseX>450&&mouseY<50&&mouseY>0){
    x=450;
    y=0;
  }
  
    //Row 2
  else if(mouseX<50&&mouseX>0&&mouseY<100&&mouseY>50){
    x=0;
    y=50;
  }
  else if(mouseX<100&&mouseX>50&&mouseY<100&&mouseY>50){
    x=50;
    y=50;
  }
  else if(mouseX<150&&mouseX>100&&mouseY<100&&mouseY>50){
    x=100;
    y=50;
  }
  else if(mouseX<200&&mouseX>150&&mouseY<100&&mouseY>50){
    x=150;
    y=50;
  }
  else if(mouseX<250&&mouseX>200&&mouseY<100&&mouseY>50){
    x=200;
    y=50;
  }
  else if(mouseX<300&&mouseX>250&&mouseY<100&&mouseY>50){
    x=250;
    y=50;
  }
  else if(mouseX<350&&mouseX>300&&mouseY<100&&mouseY>50){
    x=300;
    y=50;
  }
  else if(mouseX<400&&mouseX>350&&mouseY<100&&mouseY>50){
    x=350;
    y=50;
  }
  else if(mouseX<450&&mouseX>400&&mouseY<100&&mouseY>50){
    x=400;
    y=50;
  }
  else if(mouseX<500&&mouseX>450&&mouseY<100&&mouseY>50){
    x=450;
    y=50;
  }
  
    //Row 3
  else if(mouseX<50&&mouseX>0&&mouseY<150&&mouseY>100){
    x=0;
    y=100;
  }
  else if(mouseX<100&&mouseX>50&&mouseY<150&&mouseY>100){
    x=50;
    y=100;
  }
  else if(mouseX<150&&mouseX>100&&mouseY<150&&mouseY>100){
    x=100;
    y=100;
  }
  else if(mouseX<200&&mouseX>150&&mouseY<150&&mouseY>100){
    x=150;
    y=100;
  }
  else if(mouseX<250&&mouseX>200&&mouseY<150&&mouseY>100){
    x=200;
    y=100;
  }
  else if(mouseX<300&&mouseX>250&&mouseY<150&&mouseY>100){
    x=250;
    y=100;
  }
  else if(mouseX<350&&mouseX>300&&mouseY<150&&mouseY>100){
    x=300;
    y=100;
  }
  else if(mouseX<400&&mouseX>350&&mouseY<150&&mouseY>100){
    x=350;
    y=100;
  }
  else if(mouseX<450&&mouseX>400&&mouseY<150&&mouseY>100){
    x=400;
    y=100;
  }
  else if(mouseX<500&&mouseX>450&&mouseY<150&&mouseY>100){
    x=450;
    y=100;
  }
  
    //Row 4
  else if(mouseX<50&&mouseX>0&&mouseY<200&&mouseY>150){
    x=0;
    y=150;
  }
  else if(mouseX<100&&mouseX>50&&mouseY<200&&mouseY>150){
    x=50;
    y=150;
  }
  else if(mouseX<150&&mouseX>100&&mouseY<200&&mouseY>150){
    x=100;
    y=150;
  }
  else if(mouseX<200&&mouseX>150&&mouseY<200&&mouseY>150){
    x=150;
    y=150;
  }
  else if(mouseX<250&&mouseX>200&&mouseY<200&&mouseY>150){
    x=200;
    y=150;
  }
  else if(mouseX<300&&mouseX>250&&mouseY<200&&mouseY>150){
    x=250;
    y=150;
  }
  else if(mouseX<350&&mouseX>300&&mouseY<200&&mouseY>150){
    x=300;
    y=150;
  }
  else if(mouseX<400&&mouseX>350&&mouseY<200&&mouseY>150){
    x=350;
    y=150;
  }
  else if(mouseX<450&&mouseX>400&&mouseY<200&&mouseY>150){
    x=400;
    y=150;
  }
  else if(mouseX<500&&mouseX>450&&mouseY<200&&mouseY>150){
    x=450;
    y=150;
  }
  
    //Row 5
  else if(mouseX<50&&mouseX>0&&mouseY<250&&mouseY>200){
    x=0;
    y=200;
  }
  else if(mouseX<100&&mouseX>50&&mouseY<250&&mouseY>200){
    x=50;
    y=200;
  }
  else if(mouseX<150&&mouseX>100&&mouseY<250&&mouseY>200){
    x=100;
    y=200;
  }
  else if(mouseX<200&&mouseX>150&&mouseY<250&&mouseY>200){
    x=150;
    y=200;
  }
  else if(mouseX<250&&mouseX>200&&mouseY<250&&mouseY>200){
    x=200;
    y=200;
  }
  else if(mouseX<300&&mouseX>250&&mouseY<250&&mouseY>200){
    x=250;
    y=200;
  }
  else if(mouseX<350&&mouseX>300&&mouseY<250&&mouseY>200){
    x=300;
    y=200;
  }
  else if(mouseX<400&&mouseX>350&&mouseY<250&&mouseY>200){
    x=350;
    y=200;
  }
  else if(mouseX<450&&mouseX>400&&mouseY<250&&mouseY>200){
    x=400;
    y=200;
  }
  else if(mouseX<500&&mouseX>450&&mouseY<250&&mouseY>200){
    x=450;
    y=200;
  }
  
    //Row 6
  else if(mouseX<50&&mouseX>0&&mouseY<300&&mouseY>250){
    x=0;
    y=250;
  }
  else if(mouseX<100&&mouseX>50&&mouseY<300&&mouseY>250){
    x=50;
    y=250;
  }
  else if(mouseX<150&&mouseX>100&&mouseY<300&&mouseY>250){
    x=100;
    y=250;
  }
  else if(mouseX<200&&mouseX>150&&mouseY<300&&mouseY>250){
    x=150;
    y=250;
  }
  else if(mouseX<250&&mouseX>200&&mouseY<300&&mouseY>250){
    x=200;
    y=250;
  }
  else if(mouseX<300&&mouseX>250&&mouseY<300&&mouseY>250){
    x=250;
    y=250;
  }
  else if(mouseX<350&&mouseX>300&&mouseY<300&&mouseY>250){
    x=300;
    y=250;
  }
  else if(mouseX<400&&mouseX>350&&mouseY<300&&mouseY>250){
    x=350;
    y=250;
  }
  else if(mouseX<450&&mouseX>400&&mouseY<300&&mouseY>250){
    x=400;
    y=250;
  }
  else if(mouseX<500&&mouseX>450&&mouseY<300&&mouseY>250){
    x=450;
    y=250;
  }
  
    //Row 7
  else if(mouseX<50&&mouseX>0&&mouseY<350&&mouseY>300){
    x=0;
    y=300;
  }
  else if(mouseX<100&&mouseX>50&&mouseY<350&&mouseY>300){
    x=50;
    y=300;
  }
  else if(mouseX<150&&mouseX>100&&mouseY<350&&mouseY>300){
    x=100;
    y=300;
  }
  else if(mouseX<200&&mouseX>150&&mouseY<350&&mouseY>300){
    x=150;
    y=300;
  }
  else if(mouseX<250&&mouseX>200&&mouseY<350&&mouseY>300){
    x=200;
    y=300;
  }
  else if(mouseX<300&&mouseX>250&&mouseY<350&&mouseY>300){
    x=250;
    y=300;
  }
  else if(mouseX<350&&mouseX>300&&mouseY<350&&mouseY>300){
    x=300;
    y=300;
  }
  else if(mouseX<400&&mouseX>350&&mouseY<350&&mouseY>300){
    x=350;
    y=300;
  }
  else if(mouseX<450&&mouseX>400&&mouseY<350&&mouseY>300){
    x=400;
    y=300;
  }
  else if(mouseX<500&&mouseX>450&&mouseY<350&&mouseY>300){
    x=450;
    y=300;
  }
  
    //Row 8
  else if(mouseX<50&&mouseX>0&&mouseY<400&&mouseY>350){
    x=0;
    y=350;
  }
  else if(mouseX<100&&mouseX>50&&mouseY<400&&mouseY>350){
    x=50;
    y=350;
  }
  else if(mouseX<150&&mouseX>100&&mouseY<400&&mouseY>350){
    x=100;
    y=350;
  }
  else if(mouseX<200&&mouseX>150&&mouseY<400&&mouseY>350){
    x=150;
    y=350;
  }
  else if(mouseX<250&&mouseX>200&&mouseY<400&&mouseY>350){
    x=200;
    y=350;
  }
  else if(mouseX<300&&mouseX>250&&mouseY<400&&mouseY>350){
    x=250;
    y=350;
  }
  else if(mouseX<350&&mouseX>300&&mouseY<400&&mouseY>350){
    x=300;
    y=350;
  }
  else if(mouseX<400&&mouseX>350&&mouseY<400&&mouseY>350){
    x=350;
    y=350;
  }
  else if(mouseX<450&&mouseX>400&&mouseY<400&&mouseY>350){
    x=400;
    y=350;
  }
  else if(mouseX<500&&mouseX>450&&mouseY<400&&mouseY>350){
    x=450;
    y=350;
  }
  
    //Row 9
  else if(mouseX<50&&mouseX>0&&mouseY<450&&mouseY>400){
    x=0;
    y=400;
  }
  else if(mouseX<100&&mouseX>50&&mouseY<450&&mouseY>400){
    x=50;
    y=400;
  }
  else if(mouseX<150&&mouseX>100&&mouseY<450&&mouseY>400){
    x=100;
    y=400;
  }
  else if(mouseX<200&&mouseX>150&&mouseY<450&&mouseY>400){
    x=150;
    y=400;
  }
  else if(mouseX<250&&mouseX>200&&mouseY<450&&mouseY>400){
    x=200;
    y=400;
  }
  else if(mouseX<300&&mouseX>250&&mouseY<450&&mouseY>400){
    x=250;
    y=400;
  }
  else if(mouseX<350&&mouseX>300&&mouseY<450&&mouseY>400){
    x=300;
    y=400;
  }
  else if(mouseX<400&&mouseX>350&&mouseY<450&&mouseY>400){
    x=350;
    y=400;
  }
  else if(mouseX<450&&mouseX>400&&mouseY<450&&mouseY>400){
    x=400;
    y=400;
  }
  else if(mouseX<500&&mouseX>450&&mouseY<450&&mouseY>400){
    x=450;
    y=400;
  }
  
    //Row 10
  else if(mouseX<50&&mouseX>0&&mouseY<500&&mouseY>450){
    x=0;
    y=450;
  }
  else if(mouseX<100&&mouseX>50&&mouseY<500&&mouseY>450){
    x=50;
    y=450;
  }
  else if(mouseX<150&&mouseX>100&&mouseY<500&&mouseY>450){
    x=100;
    y=450;
  }
  else if(mouseX<200&&mouseX>150&&mouseY<500&&mouseY>450){
    x=150;
    y=450;
  }
  else if(mouseX<250&&mouseX>200&&mouseY<500&&mouseY>450){
    x=200;
    y=450;
  }
  else if(mouseX<300&&mouseX>250&&mouseY<500&&mouseY>450){
    x=250;
    y=450;
  }
  else if(mouseX<350&&mouseX>300&&mouseY<500&&mouseY>450){
    x=300;
    y=450;
  }
  else if(mouseX<400&&mouseX>350&&mouseY<500&&mouseY>450){
    x=350;
    y=450;
  }
  else if(mouseX<450&&mouseX>400&&mouseY<500&&mouseY>450){
    x=400;
    y=450;
  }
  else if(mouseX<500&&mouseX>450&&mouseY<500&&mouseY>450){
    x=450;
    y=450;
  }
  
  //Nose
  x2=x+20;
  y2=y-20;
  sizeX=10;
  sizeY=20;
  
//Keys
  //Lines
  if(keyPressed){ 
    if(key=='c'){
      line(0,50,width,50);
      line(0,100,width,100);
      line(0,150,width,150);
      line(0,200,width,200);
      line(0,250,width,250);
      line(0,300,width,300);
      line(0,350,width,350);
      line(0,400,width,400);
      line(0,450,width,450);
      line(50,0,50,height);
      line(100,0,100,height);
      line(150,0,150,height);
      line(200,0,200,height);
      line(250,0,250,height);
      line(300,0,300,height);
      line(350,0,350,height);
      line(400,0,400,height);
      line(450,0,450,height);
    }
    
  //Restart
    if(key=='r'){
      HP=3;
      DifficultyLevel=0.0;
      BulletX=0;
      Bullet2Y=-50;
      BulletX2=-100;
      Bullet2Y2=-150;
      BulletX3=-200;
      Bullet2Y3=-250;
    }
  }
  
//Difficulty
  if(DifficultyLevel<=1){
    DifficultyLevel=DifficultyLevel+0.01;
    delay(10);
  }
  else if(DifficultyLevel<=2&&DifficultyLevel>1){
    DifficultyLevel=DifficultyLevel+0.001;
    delay(10);
  }
  else if(DifficultyLevel>2){
    DifficultyLevel=DifficultyLevel+0.0005;
    delay(10);
  }
  
//Bullets
  //Bullet Location
  if(BulletX>500){
    RandomNumber1=int(random(10));
    BulletX=0;
  }
  if(BulletX2>500){
    RandomNumber2=int(random(10));
    BulletX2=0;
  }
  if(BulletX3>500){
    RandomNumber3=int(random(10));
    BulletX3=0;
  }
  if(Bullet2Y>500){
    RandomNumber4=int(random(10));
    Bullet2Y=0;
  }
  if(Bullet2Y2>500){
    RandomNumber5=int(random(10));
    Bullet2Y2=0;
  }
  if(Bullet2Y3>500){
    RandomNumber6=int(random(10));
    Bullet2Y3=0;
  }
  
  //Bullet Movement
    //Bullet 1
  if(RandomNumber1==0){
    BulletY = 25;
    BulletX = BulletX + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber1==1){
    BulletY = 75;
    BulletX = BulletX + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber1==2){
    BulletY = 125;
    BulletX = BulletX + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber1==3){
    BulletY = 175;
    BulletX = BulletX + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber1==4){
    BulletY = 225;
    BulletX = BulletX + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber1==5){
    BulletY = 275;
    BulletX = BulletX + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber1==6){
    BulletY = 325;
    BulletX = BulletX + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber1==7){
    BulletY = 375;
    BulletX = BulletX + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber1==8){
    BulletY = 425;
    BulletX = BulletX + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber1==9){
    BulletY = 475;
    BulletX = BulletX + DifficultyLevel*10;
    delay(3);
  }
  
    //Bullet 2
  if(RandomNumber2==0){
    BulletY2 = 25;
    BulletX2 = BulletX2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber2==1){
    BulletY2 = 75;
    BulletX2 = BulletX2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber2==2){
    BulletY2 = 125;
    BulletX2 = BulletX2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber2==3){
    BulletY2 = 175;
    BulletX2 = BulletX2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber2==4){
    BulletY2 = 225;
    BulletX2 = BulletX2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber2==5){
    BulletY2 = 275;
    BulletX2 = BulletX2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber2==6){
    BulletY2 = 325;
    BulletX2 = BulletX2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber2==7){
    BulletY2 = 375;
    BulletX2 = BulletX2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber2==8){
    BulletY2 = 425;
    BulletX2 = BulletX2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber2==9){
    BulletY2 = 475;
    BulletX2 = BulletX2 + DifficultyLevel*10;
    delay(3);
  }
  
    //Bullet 3
  if(RandomNumber3==0){
    BulletY3 = 25;
    BulletX3 = BulletX3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber3==1){
    BulletY3 = 75;
    BulletX3 = BulletX3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber3==2){
    BulletY3 = 125;
    BulletX3 = BulletX3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber3==3){
    BulletY3 = 175;
    BulletX3 = BulletX3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber3==4){
    BulletY3 = 225;
    BulletX3 = BulletX3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber3==5){
    BulletY3 = 275;
    BulletX3 = BulletX3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber3==6){
    BulletY3 = 325;
    BulletX3 = BulletX3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber3==7){
    BulletY3 = 375;
    BulletX3 = BulletX3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber3==8){
    BulletY3 = 425;
    BulletX3 = BulletX3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber3==9){
    BulletY3 = 475;
    BulletX3 = BulletX3 + DifficultyLevel*10;
    delay(3);
  }
  
    //Bullet 4
  if(RandomNumber4==0){
    Bullet2X = 25;
    Bullet2Y = Bullet2Y + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber4==1){
    Bullet2X = 75;
    Bullet2Y = Bullet2Y + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber4==2){
    Bullet2X = 125;
    Bullet2Y = Bullet2Y + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber4==3){
    Bullet2X = 175;
    Bullet2Y = Bullet2Y + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber4==4){
    Bullet2X = 225;
    Bullet2Y = Bullet2Y + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber4==5){
    Bullet2X = 275;
    Bullet2Y = Bullet2Y + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber4==6){
    Bullet2X = 325;
    Bullet2Y = Bullet2Y + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber4==7){
    Bullet2X = 375;
    Bullet2Y = Bullet2Y + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber4==8){
    Bullet2X = 425;
    Bullet2Y = Bullet2Y + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber4==9){
    Bullet2X = 475;
    Bullet2Y = Bullet2Y + DifficultyLevel*10;
    delay(3);
  }
  
    //Bullet 5
  if(RandomNumber5==0){
    Bullet2X2 = 25;
    Bullet2Y2 = Bullet2Y2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber5==1){
    Bullet2X2 = 75;
    Bullet2Y2 = Bullet2Y2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber5==2){
    Bullet2X2 = 125;
    Bullet2Y2 = Bullet2Y2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber5==3){
    Bullet2X2 = 175;
    Bullet2Y2 = Bullet2Y2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber5==4){
    Bullet2X2 = 225;
    Bullet2Y2 = Bullet2Y2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber5==5){
    Bullet2X2 = 275;
    Bullet2Y2 = Bullet2Y2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber5==6){
    Bullet2X2 = 325;
    Bullet2Y2 = Bullet2Y2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber5==7){
    Bullet2X2 = 375;
    Bullet2Y2 = Bullet2Y2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber5==8){
    Bullet2X2 = 425;
    Bullet2Y2 = Bullet2Y2 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber5==9){
    Bullet2X2 = 475;
    Bullet2Y2 = Bullet2Y2 + DifficultyLevel*10;
    delay(3);
  }
  
    //Bullet 6
  if(RandomNumber6==0){
    Bullet2X3 = 25;
    Bullet2Y3 = Bullet2Y3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber6==1){
    Bullet2X3 = 75;
    Bullet2Y3 = Bullet2Y3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber6==2){
    Bullet2X3 = 125;
    Bullet2Y3 = Bullet2Y3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber6==3){
    Bullet2X3 = 175;
    Bullet2Y3 = Bullet2Y3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber6==4){
    Bullet2X3 = 225;
    Bullet2Y3 = Bullet2Y3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber6==5){
    Bullet2X3 = 275;
    Bullet2Y3 = Bullet2Y3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber6==6){
    Bullet2X3 = 325;
    Bullet2Y3 = Bullet2Y3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber6==7){
    Bullet2X3 = 375;
    Bullet2Y3 = Bullet2Y3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber6==8){
    Bullet2X3 = 425;
    Bullet2Y3 = Bullet2Y3 + DifficultyLevel*10;
    delay(3);
  }
  else if(RandomNumber6==9){
    Bullet2X3 = 475;
    Bullet2Y3 = Bullet2Y3 + DifficultyLevel*10;
    delay(3);
  }
  
//Getting Hit
  if(BulletX<x+50&&BulletX>x&&BulletY<y+50&&BulletY>y){
    HP=HP-1;
    BulletX=BulletX-500;
  }
  else if(BulletX2<x+50&&BulletX2>x&&BulletY2<y+50&&BulletY2>y){
    HP=HP-1;
    BulletX2=BulletX2-500;
  }
  else if(BulletX3<x+50&&BulletX3>x&&BulletY3<y+50&&BulletY3>y){
    HP=HP-1;
    BulletX3=BulletX3-500;
  }
  else if(Bullet2X<x+50&&Bullet2X>x&&Bullet2Y<y+50&&Bullet2Y>y){
    HP=HP-1;
    Bullet2Y=Bullet2Y-500;
  }
  else if(Bullet2X2<x+50&&Bullet2X2>x&&Bullet2Y2<y+50&&Bullet2Y2>y){
    HP=HP-1;
    Bullet2Y2=Bullet2Y2-500;
  }
  else if(Bullet2X3<x+50&&Bullet2X3>x&&Bullet2Y3<y+50&&Bullet2Y3>y){
    HP=HP-1;
    Bullet2Y3=Bullet2Y3-500;
  }
  
//Things On the Screen
  bullet(BulletX,BulletY);
  bullet2(BulletX2,BulletY2);
  bullet3(BulletX3,BulletY3);
  bullet4(Bullet2X,Bullet2Y);
  bullet5(Bullet2X2,Bullet2Y2);
  bullet6(Bullet2X3,Bullet2Y3);
  human(x,y,x2,y2,sizeX,sizeY);
  
//Losing
  if(HP<1){
    background(0);
    textSize(40);
    text("YOU LOST",165,250);
    textSize(20);
    text("Press r to Restart",180,270);
  }
}
