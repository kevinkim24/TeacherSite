import processing.sound.*;
import processing.core.PFont;
SoundFile celeb;
SoundFile correct; 
SoundFile error;
PFont font1;

Card flippedCards[] = new Card[2];
String[] images = {"aussie.jpeg", "corgie.jpg", "curly.jpeg", "DOG R.png", "FLUFFY.png","SAUSAGE.png"};

class Card {
  int x;
  int y;
  int index;
  int type;
  boolean flipped = false;
  boolean clickable = true;
  
  public Card(int x, int y, int index, int type) {
    this.x = x;
    this.y = y;
    this.index = index;
    this.type = type;
  }
  
  void drawCard() {
    if (flipped) {showFront();}
    else {showBack();}
  }
  
  void showBack() {
    fill(0);
    rect(x, y, 100, 200);
  }
  
  void showFront() {
    PImage img = loadImage(images[type]);
    image(img, x, y, 100, 200);
  }
  
  void checkClick() {
    if (mouseX >= x - 50 && mouseX <= x + 50 && mouseY >= y - 100 && mouseY <= y + 100 && this.clickable) {
      this.clicked();
    }
  }
  
  void clicked() {
    if (flippedCards[0] == null) {flippedCards[0] = this; this.clickable = false;}
    else {flippedCards[1] = this; this.clickable = false;}
  }
}

Card[] cards =  new Card[12];
int amount = 12;

void setup() {
  size (1000, 1000);
  background(255);
  rectMode(CENTER);
  imageMode(CENTER);
  
  int cXPos = 200;
  int cYPos = 200;
  for (int i = 0; i < amount; i++) {
     if (cXPos <= 800) {
       cards[i] = new Card(cXPos, cYPos, i, 1);
       cXPos += 150;
     } else {
       cYPos += 250;
       cXPos = 200;
       cards[i] = new Card(cXPos, cYPos, i, 1);
       cXPos += 150;
     }
     correct = new SoundFile(this, "correct.mp3");
      error = new SoundFile(this, "error.mp3");
      celeb = new SoundFile(this, "celeb.mp3");  
  }
  
  int[] typesChosen = new int[amount/2];
  
  for (int i = 0; i < amount; i++) {
    boolean chosen = false;
    while (!chosen){
      int rand = int(random(0, amount/2));
      if (typesChosen[rand] < 2) {
        cards[i].type = rand;
        typesChosen[rand] += 1;
        chosen = true;
      }
    }
  }
 font1 = loadFont("Superclarendon-LightItalic-48.vlw");


}

void draw() {
  if (flippedCards[1] != null && flippedCards[1].flipped == true) {delay(1500); checkEquality();}
  if(flippedCards[0] != null) {flippedCards[0].flipped = true;}
  if(flippedCards[1] != null) {flippedCards[1].flipped = true;}
  background(255);
  for (Card c : cards) {
    if (c != null) {
      c.drawCard();
    }
  }
  for (Card c : flippedCards) {
    if (c != null) {
      c.drawCard();
    }
  }
  
  //letters
textSize(20);
 fill(0);
 text("M", 10, 400);
  text ("E", 36, 420);
  text("S", 60, 390);
  text ("S", 100,410);
  text ("M" ,55,440);
  text ("O", 80, 460);
  text ("Y", 130,410);
  text ("R", 100, 435);
  

textFont(font1, 200);
text ("You", 160, 400);
text("WON!", 300, 540);
  
}

void checkEquality() {
  if (flippedCards[0].type == flippedCards[1].type) {cards[flippedCards[0].index] = null; cards[flippedCards[1].index] = null; flippedCards[0] = null; flippedCards[1] = null; correct.play();}
  else {cards[flippedCards[0].index].clickable = true; cards[flippedCards[1].index].clickable = true; cards[flippedCards[0].index].flipped = false; cards[flippedCards[1].index].flipped = false; 
        flippedCards[0] = null; flippedCards[1] = null; error.play();}
}

void mousePressed() {
  for (int i = 11; i >= 0; i--) {
    if (cards[i] != null){
      cards[i].checkClick();
    }
  }
} 
