PImage carImage;
int numCars = 3;
float[] carX = new float[numCars];
float[] carSpeed = new float[numCars];

PImage chickenImage;
PImage deadChickenImage;
float chickenX, chickenY;

boolean isChickenAlive = true;

void setup() {
  size(800, 800);
  drawBackground();

  carImage = loadImage("car.png");
  chickenImage = loadImage("download.png");
  deadChickenImage = loadImage("deadchicken.png");

  for (int i = 0; i < numCars; i++) {
    carX[i] = random(0, width);
    carSpeed[i] = random(1, 5);
  }

  chickenX = width / 2;
  chickenY = height - 100;
}

void draw() {
  background(255);
  drawBackground();

  for (int i = 0; i < numCars; i++) {
    carX[i] += carSpeed[i];

    if (carX[i] > width + carImage.width) {
      carX[i] = -carImage.width;
    }

    image(carImage, carX[i], height * 0.75, width / 10, height / 12);
  }

  if (isChickenAlive) {
    imageMode(CENTER);
    image(chickenImage, chickenX, chickenY, width / 14, height / 10);

    for (int i = 0; i < numCars; i++) {
      float distance = dist(chickenX, chickenY, carX[i], height * 0.75);
      println(distance);
      if (distance < 40) {
        isChickenAlive = false;
        break;
      }
      
      if (chickenY == 0) {
        chickenX = width / 2;
        chickenY = height;
      }
    }
  } else {
    image(deadChickenImage, chickenX, chickenY, width / 14, height / 10);
    textSize(40);
    fill(0);
    //text("Game Over. Press 'R' to restart.", width / 2 - 220, height / 2);
  }
}

void drawBackground() {
    //grass
  fill(188,240,111); 
  rect(0, height - 100, width, 100);
  
  //road
  fill(85, 85, 85); 
  rect(0, height - 200, width, 100);
  
  //grass 2
  fill(188,240,111); 
  rect(0, height - 300, width, 100);
  
  //river
  fill(85, 85, 85); // Blue color
  rect(0, height - 400, width, 100);
  
  //grass 3
  fill(188,240,111); 
  rect(0, height - 500, width, 100);
  
  //road 2
  fill(85, 85, 85); // Gray color
  rect(0, height - 700, width, 200);
  
  //grass 3
  fill(188,240,111); 
  rect(0, height - 800, width, 100);
  
  //white lines
  fill(255);
  int laneWidth = width / 10;
  int laneY = height - 620;
  for (int i = 0; i < 10; i++) {
    rect(i * laneWidth, laneY, laneWidth * 0.8, 20);
  }
  
  //trees 
  strokeWeight(6);
  stroke(145,193,101);
  
  //first row
  //1
  fill(155,206,108);
  
  rect(5,740, 50,50);
  fill(161,203,121);
  rect(15,750, 30,30);
  
  
  //2
  fill(155,206,108);
  rect(70,740, 50,50);
  fill(161,203,121);
  rect(80,750, 30,30);
  
  //3
  fill(155,206,108);
  rect(250,740, 50,50);
  fill(161,203,121);
  rect(260,750, 30,30);
   
   
   //4
  fill(155,206,108);
  rect(310,740, 50,50);
  fill(161,203,121);
  rect(320,750, 30,30);
  
  
  //5
  fill(155,206,108);
  rect(370,740, 50,50);
  fill(161,203,121);
  rect(380,750, 30,30);
  
  //6
  fill(155,206,108);
  rect(745,740, 50,50);
  fill(161,203,121);
  rect(755,750, 30,30);
  
  //7
  fill(155,206,108);
  rect(690,740, 50,50);
  fill(161,203,121);
  rect(700,750, 30,30);
  
  //8
  fill(155,206,108);
  rect(630,740, 50,50);
  fill(161,203,121);
  rect(640,750, 30,30);
  
  //second row
  
  //9
  fill(155,206,108);
  rect(70,530, 50,50);
  fill(161,203,121);
  rect(80,540, 30,30);
  
  //10
  fill(155,206,108);
  rect(130,530, 50,50);
  fill(161,203,121);
  rect(140,540, 30,30);
  
  //11
  fill(155,206,108);
  rect(190,530, 50,50);
  fill(161,203,121);
  rect(200,540, 30,30);
  
  //12
  fill(155,206,108);
  rect(400,530, 50,50);
  fill(161,203,121);
  rect(410,540, 30,30);
  
  //13
  fill(155,206,108);
  rect(460,530, 50,50);
  fill(161,203,121);
  rect(470,540, 30,30);
  
  //14
  fill(155,206,108);
  rect(650,530, 50,50);
  fill(161,203,121);
  rect(660,540, 30,30);
  
  //15
  fill(155,206,108);
  rect(710,530, 50,50);
  fill(161,203,121);
  rect(720,540, 30,30);
  
  //third row
  
  //16
  fill(155,206,108);
  rect(5,325, 50,50);
  fill(161,203,121);
  rect(15,335, 30,30);
  
  //17
  fill(155,206,108);
  rect(210,325, 50,50);
  fill(161,203,121);
  rect(220,335, 30,30);
  
  //18
  fill(155,206,108);
  rect(270,325, 50,50);
  fill(161,203,121);
  rect(280,335, 30,30);
  
  //19
  fill(155,206,108);
  rect(410,325, 50,50);
  fill(161,203,121);
  rect(420,335, 30,30);
  
  //20
  fill(155,206,108);
  rect(470,325, 50,50);
  fill(161,203,121);
  rect(480,335, 30,30);
  
  //21
  fill(155,206,108);
  rect(530,325, 50,50);
  fill(161,203,121);
  rect(540,335, 30,30);
  
  //22
  fill(155,206,108);
  rect(750,325, 50,50);
  fill(161,203,121);
  rect(760,335, 30,30);
  
  //fouth row
  
  //23
  fill(155,206,108);
  rect(20,20, 50,50);
  fill(161,203,121);
  rect(30,30, 30,30);
  
  //24
  fill(155,206,108);
  rect(80,20, 50,50);
  fill(161,203,121);
  rect(90,30, 30,30);
  
  //25
  fill(155,206,108);
  rect(280,20, 50,50);
  fill(161,203,121);
  rect(290,30, 30,30);
  
  //26
  fill(155,206,108);
  rect(440,20, 50,50);
  fill(161,203,121);
  rect(450,30, 30,30);
  
  //27
  fill(155,206,108);
  rect(500,20, 50,50);
  fill(161,203,121);
  rect(510,30, 30,30);
  
  //27
  fill(155,206,108);
  rect(620,20, 50,50);
  fill(161,203,121);
  rect(630,30, 30,30);
  
  //28
  fill(155,206,108);
  rect(680,20, 50,50);
  fill(161,203,121);
  rect(690,30, 30,30);
  
  
 
 
  
  
  strokeWeight(2);
  stroke(6);
  

}

void keyPressed() {
  if (!isChickenAlive && (key == 'r' || key == 'R')) {
    isChickenAlive = true;
    chickenX = width / 2;
    chickenY = height - 100;
  }

  float speed = 10;

  if (isChickenAlive) {
    if (keyCode == UP) {
      chickenY -= speed;
    } else if (keyCode == DOWN) {
      chickenY += speed;
    } else if (keyCode == LEFT) {
      chickenX -= speed;
    } else if (keyCode == RIGHT) {
      chickenX += speed;
    }
  }
}
