//Khoa & Khaled
//Movement variables
float angle = 4.71;
float angle2 = PI+QUARTER_PI+0.2;
float angle3 = PI+HALF_PI+QUARTER_PI;

float angleStep = TWO_PI / (60.0*60); //increment
float angleStep2 = TWO_PI / (60.0*50000); //increment2
float angleStep3 = TWO_PI / (60.0*50000*60); //increment3

void setup()
{
size(1000,1000);
background(#0C4650);
strokeWeight(2);
}


void draw()
{
int sizeWidth = width/2;
int sizeHeight = height/2;


//strap
//upper
stroke(0);
fill(0);
rect(width/2.5,0,
width-2*width/2.483,
height/4.5);
fill(#00046F);
rect(sizeWidth-sizeWidth/19.9,0, sizeWidth/10,sizeHeight/2.8);
arc(sizeWidth-sizeWidth/300,sizeHeight-sizeHeight/1.5, sizeWidth/10,sizeHeight/10, 0,PI);

fill(255);
noStroke();
rect(sizeWidth-sizeWidth/300-sizeWidth/10,
sizeHeight-sizeHeight/1.7,
sizeWidth/20,sizeHeight/27);
rect(sizeWidth-sizeWidth/300+sizeWidth/20,
sizeHeight-sizeHeight/1.7,
sizeWidth/20,sizeHeight/27);

fill(0);
rect(sizeWidth-sizeWidth/35,0, sizeWidth/18,sizeHeight/3);
arc(sizeWidth-sizeWidth/50/10,sizeHeight-sizeHeight/1.48, sizeWidth/18,sizeHeight/15, 0,PI);

//lower
fill(0);
rect(width/2.5,
height*3.55/4.5,
width-2*width/2.483,
height);

fill(#00046F);
rect(sizeWidth-sizeWidth/19.9,sizeHeight+sizeHeight/1.5, sizeWidth/10,sizeHeight/3);
arc(sizeWidth-sizeWidth/30/10+sizeWidth/50/10,sizeHeight+sizeHeight/1.5, sizeWidth/10,sizeHeight/10, PI,TWO_PI);

fill(255);
noStroke();
rect(sizeWidth-sizeWidth/300-sizeWidth/10,
sizeHeight+sizeHeight/1.73,
sizeWidth/20,sizeHeight/27);
rect(sizeWidth-sizeWidth/300+sizeWidth/20,
sizeHeight+sizeHeight/1.73,
sizeWidth/20,sizeHeight/27);

fill(0);
rect(sizeWidth-sizeWidth/35,sizeHeight+sizeHeight/1.45, sizeWidth/18,sizeHeight/3);
arc(sizeWidth-sizeWidth/50/11-sizeWidth/45/10,sizeHeight+sizeHeight/1.45, sizeWidth/18,sizeHeight/15, PI,TWO_PI);



//connect to the strap (Lugs)
//upper lugs
fill(#0C4650);
stroke(0);
arc(width/2.5-sizeWidth/6,
height/4.5,
sizeWidth/3,
sizeHeight/3,
radians(0),radians(50));

arc(width/2.5*1.9-sizeWidth/6,
height/4.5,
sizeWidth/3,
sizeHeight/3,
radians(130),radians(180));

//lower lugs
arc(width/2.48-sizeWidth/6,
height/1.3,
sizeWidth/3,sizeHeight/3,
5.65,PI+3.38);
arc(width*3/3.97-sizeWidth/6,
height/1.3,
sizeWidth/3,
sizeHeight/3,
2.898,3.77);


//Side buttons
//middle (Crown)
stroke(255);
fill(#080A3B);
rect(sizeWidth+width/5.5,
sizeHeight-sizeHeight/11.5,
sizeWidth/5,sizeHeight/5);
arc(sizeWidth+sizeWidth/2.33,
sizeHeight+sizeHeight/80,
sizeWidth/3,sizeHeight/2.9,
5.64, 0.64+TWO_PI,OPEN);

//Upper button
quad(width-sizeWidth/1.5,height/3.4,
width-sizeWidth/1.9,height/2.6,
width-sizeWidth/1.8,height/2.4,
width-sizeWidth/1.2,height/3.2);

//Lower button
quad(width-sizeWidth/1.9,sizeHeight+sizeHeight/4,
width-sizeWidth/1.45,sizeHeight+sizeHeight/2.3,
width-sizeWidth/1.3,sizeHeight+sizeHeight/2.5,
width-sizeWidth/1.3,sizeHeight-sizeHeight/5);


//face
fill(0);
ellipse(sizeWidth,sizeHeight, sizeWidth,sizeHeight);
fill(255);
ellipse(sizeWidth,sizeHeight, sizeWidth/1.08,sizeHeight/1.08);
fill(#312F2F);
ellipse(sizeWidth,sizeHeight, sizeWidth/1.15,sizeHeight/1.15);


//number
fill(255);
textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/8));
text("12",
sizeWidth,
sizeHeight-sizeHeight/3);

textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/8));
text("1",
sizeWidth+sizeWidth/1.1/2/2,
sizeHeight-sizeHeight/4);

textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/8));
text("11",
sizeWidth-sizeWidth/1.1/2/2.3,
sizeHeight-sizeHeight/4);

textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/8));
text("3",
sizeWidth+sizeWidth/2.6,
sizeHeight+sizeHeight/20);

textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/8));
text("9",
sizeWidth-sizeWidth/2.6,
sizeHeight+sizeHeight/20);

textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/8));
text("4",
sizeWidth+sizeWidth/3.2,
sizeHeight+sizeHeight/4.2);

textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/8));
text("8",
sizeWidth-sizeWidth/3.2,
sizeHeight+sizeHeight/4.2);

textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/8));
text("5",
sizeWidth+sizeWidth/1.1/5,
sizeHeight+sizeHeight/2.7);

textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/8));
text("7",
sizeWidth-sizeWidth/5.2,
sizeHeight+sizeHeight/2.7);

//bottom hour 6
textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/3.2));
text(".",
sizeWidth,
sizeHeight+sizeHeight/2.5);

//right hour 2
textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/3.2));
text(".",
sizeWidth+sizeWidth/2.9,
sizeHeight-sizeHeight/7.3);

//left hour 10
textFont(createFont("Times New Roman", (sizeWidth+sizeHeight)/2/3.2));
text(".",
sizeWidth-sizeWidth/2.9,
sizeHeight-sizeHeight/7.3);

//text
textFont(createFont("Arial Bold", (sizeWidth+sizeHeight)/2/15));
text("swatch",
sizeWidth+sizeWidth/80,
sizeHeight-sizeHeight/3.8);
textFont(createFont("Arial Bold", (sizeWidth+sizeHeight)/2/35));
text("SWISS",
sizeWidth,
sizeHeight-sizeHeight/4.5);

//chrono right
fill(#1E2339);
ellipse(sizeWidth+sizeWidth/5,
sizeHeight-sizeHeight/9,
sizeWidth/5,
sizeHeight/5);
fill(#7B8489); //center
ellipse(sizeWidth+sizeWidth/5,sizeHeight-sizeHeight/9, sizeWidth/30,sizeHeight/30);
fill(255);
textSize((sizeWidth+sizeHeight)/2/30); //numbers
fill(255);
text("10",sizeWidth+sizeWidth/5,sizeHeight-sizeHeight/5);
rotate(radians(36));
text("1",sizeWidth+sizeWidth/2,sizeHeight/20/5-sizeHeight/11);
rotate(radians(-36));
rotate(radians(72));
text("2",sizeWidth+sizeWidth/4.7,-sizeHeight+sizeHeight/25);
rotate(radians(-72));
rotate(radians(36*3));
text("3",sizeWidth-sizeWidth/1.9,-sizeHeight-sizeHeight/1.95);
rotate(radians(-36*3));
rotate(radians(36*4));
text("4",-sizeWidth+sizeWidth/1.85,-sizeHeight-sizeHeight/1.92);
rotate(radians(-36*4));
strokeWeight((sizeWidth+sizeHeight)/150);
stroke(255);
line(sizeWidth+sizeWidth/5,sizeHeight-sizeHeight/5.5, sizeWidth+sizeWidth/5,sizeHeight-sizeHeight/6);
line(sizeWidth+sizeWidth/5,sizeHeight-sizeHeight/20, sizeWidth+sizeWidth/5,sizeHeight-sizeHeight/30);
line(sizeWidth+sizeWidth/4,sizeHeight-sizeHeight/6, sizeWidth+sizeWidth/4.1,sizeHeight-sizeHeight/6.4);
line(sizeWidth+sizeWidth/6.1,sizeHeight-sizeHeight/16, sizeWidth+sizeWidth/6.5,sizeHeight-sizeHeight/20);
line(sizeWidth+sizeWidth/3.6,sizeHeight-sizeHeight/7.2, sizeWidth+sizeWidth/3.8,sizeHeight-sizeHeight/7.5);
line(sizeWidth+sizeWidth/3.6,sizeHeight-sizeHeight/11.5, sizeWidth+sizeWidth/3.8,sizeHeight-sizeHeight/10.5);
line(sizeWidth+sizeWidth/4,sizeHeight-sizeHeight/18.5, sizeWidth+sizeWidth/4.2,sizeHeight-sizeHeight/16);
line(sizeWidth+sizeWidth/7.3,sizeHeight-sizeHeight/11, sizeWidth+sizeWidth/6.8,sizeHeight-sizeHeight/10.8);
line(sizeWidth+sizeWidth/7.8,sizeHeight-sizeHeight/7.5, sizeWidth+sizeWidth/6.8,sizeHeight-sizeHeight/8);
line(sizeWidth+sizeWidth/6.5,sizeHeight-sizeHeight/5.8, sizeWidth+sizeWidth/6.2,sizeHeight-sizeHeight/6.4);
stroke(0);
strokeWeight((sizeWidth+sizeHeight)/200);
translate(sizeWidth+sizeWidth/5,sizeHeight-sizeHeight/9);
line(0, 0, cos(angle)*45, sin(angle)*45);
translate(-(sizeWidth+sizeWidth/5), -(sizeHeight-sizeHeight/9));
//Display Upside Down Text - Processing 2.x and 3.x Forum..
textAlign(CENTER);
pushMatrix();
translate(sizeWidth, sizeHeight);
rotate(PI);
text("5", -sizeWidth+sizeWidth*1.1/1.38,sizeHeight-sizeHeight/1.02); //This part was adjusted for the project
rotate(radians(36));
text("6",-sizeWidth/11,sizeHeight-sizeHeight/1.13);
rotate(radians(-36));
rotate(radians(36*2));
text("7",sizeWidth-sizeWidth/1.05,sizeHeight-sizeHeight/1.155);
rotate(radians(-36*2));
rotate(radians(36*3));
text("8",sizeWidth-sizeWidth/1.2,sizeHeight-sizeHeight/1.071);
rotate(radians(-36*3));
rotate(radians(36*4));
text("9",sizeWidth-sizeWidth/1.285,sizeHeight-sizeHeight/0.94);
rotate(radians(-36*4));
popMatrix();



//chrono middle
fill(255);
ellipse(sizeWidth,
sizeHeight+sizeHeight/5,
sizeWidth/5,
sizeHeight/5);
fill(#1E2339);
ellipse(sizeWidth,
sizeHeight+sizeHeight/5,
sizeWidth/5,
sizeHeight/5);
fill(#7B8489); //center
strokeWeight(1);
ellipse(sizeWidth,sizeHeight+sizeHeight/5, sizeWidth/30,sizeHeight/30);
strokeWeight((sizeWidth+sizeHeight)/150);
stroke(0);
translate(sizeWidth,sizeHeight+sizeHeight/5);
line(0, 0, cos(angle)*25, sin(angle)*25);
translate(-(sizeWidth),-(sizeHeight+sizeHeight/5));
textSize((sizeWidth+sizeHeight)/2/30); //numbers
fill(255);
text("60", sizeWidth,sizeHeight+sizeHeight/7);
text("30", sizeWidth,sizeHeight+sizeHeight/3.5);
text("15", sizeWidth+sizeWidth/15,sizeHeight+sizeHeight/4.7);
text("45", sizeWidth-sizeWidth/15,sizeHeight+sizeHeight/4.7);

//chrono left
fill(255);
stroke(255);;
ellipse(sizeWidth-sizeWidth/5,
sizeHeight-sizeHeight/9,
sizeWidth/5,
sizeHeight/5);
fill(#1E2339);
ellipse(sizeWidth-sizeWidth/5,
sizeHeight-sizeHeight/9,
sizeWidth/5,
sizeHeight/5);
strokeWeight(.5);
line(sizeWidth-sizeWidth/5,sizeHeight-sizeHeight/7, sizeWidth-sizeWidth/5,sizeHeight-sizeHeight/6);
line(sizeWidth-sizeWidth/5,sizeHeight-sizeHeight/12, sizeWidth-sizeWidth/5,sizeHeight-sizeHeight/15);
line(sizeWidth-sizeWidth/5.8,sizeHeight-sizeHeight/9.5, sizeWidth-sizeWidth/6.8,sizeHeight-sizeHeight/9.5);
line(sizeWidth-sizeWidth/4.4,sizeHeight-sizeHeight/9.5, sizeWidth-sizeWidth/4,sizeHeight-sizeHeight/9.5);


fill(#7B8489); //center
ellipse(sizeWidth-sizeWidth/5,sizeHeight-sizeHeight/9, sizeWidth/30,sizeHeight/30);
stroke(0);
strokeWeight(3);
stroke(#E5CE4A);
translate(sizeWidth-sizeWidth/5,sizeHeight-sizeHeight/9);
line(0, 0, cos(angle)*45, sin(angle)*45);

translate(-(sizeWidth-sizeWidth/5), -(sizeHeight-sizeHeight/9));
textSize((sizeWidth+sizeHeight)/2/30); //numbers
fill(255);
text("60",sizeWidth-sizeWidth/5,sizeHeight-sizeHeight/6);
rotate(PI);
text("30",-sizeWidth+sizeWidth/5,-sizeHeight+sizeHeight/20);
rotate(PI);
rotate(radians(90));
text("15",sizeWidth-sizeWidth/9,-sizeHeight/1.16);
rotate(radians(270));

//Display Upside Down Text - Processing 2.x and 3.x Forum..
textAlign(CENTER);
pushMatrix();
translate(sizeWidth, sizeHeight);
rotate(PI);
rotate(radians(90));
//textSize(100);
text("45", sizeWidth/40*4.3, sizeHeight-sizeHeight/1.01*1.27); //This part was adjusted for the project
popMatrix();


//hands
//seconds
translate(width/2, height/2); // move the origin to the center of the screen


stroke(0);
strokeWeight(10);
line(0, 0, cos(angle)*200, sin(angle)*200);
angle = angle + angleStep;

stroke(255);
strokeWeight(5);
line(0, 0, cos(angle)*200, sin(angle)*200);
angle = angle + angleStep;

//minute hand

stroke(255);
strokeWeight(15);
line(0, 0, cos(angle2)*150, sin(angle2)*150);
angle2 = angle2 + angleStep2;

stroke(#1E2339);
strokeWeight(10);
line(0, 0, cos(angle2)*150, sin(angle2)*150);
angle2 = angle2 + angleStep2;


//hours
stroke(255);
strokeWeight(15);
line(0, 0, cos(angle3)*100, sin(angle3)*100);
angle3 = angle3 + angleStep3;

stroke(#1E2339);
strokeWeight(10);
line(0, 0, cos(angle3)*100, sin(angle3)*100);
angle3 = angle3 + angleStep3;

//center
strokeWeight(1);
translate(0,0);
fill(255);
ellipse(sizeWidth,sizeHeight, sizeWidth/50,sizeHeight/50);
} 
