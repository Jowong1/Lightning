int startX = mouseX;
int startY = 0;
int endX = mouseX;
int endY = 0;
int h = (int)(Math.random()*420) + 380;
float mySize, myX, myY;
Load bar = new Load(20,30);
int offOn = 0;

int objX = 250;
int moveObjX = 1;
int newGame = 0;
int fade = 0;
int resetFade = 0;
int checkWin = 0;
int loadColor = 255;
int loadColorShift = 3;

int light = 1;
void setup()
{
  size(500, 500);
  background(0, 0, 0);
}
void draw()
{
  // Loading Bar
  bar.show();
  bar.inflate();
  
  // Lightning
  int randomStrokeWeight = (int)(Math.random()* 4)+2;
  stroke((int)(Math.random()*256)+50);
  strokeWeight(randomStrokeWeight);
  while (endY < h) {
    endY = startY + (int)(Math.random()*9) + 1;
    endX = startX + (int)(Math.random()*20) - 10;
    line(startX, startY, endX, endY);
      if(endX < objX + 25 && endX > objX - 25 && endY > 425 && endY < 475){
        noStroke();
        fill(120);
        rect(150,225,200,50);
        fill(200);
        rect(152.5,227.5,195,45);
        fill(0,0,0);
        textAlign(LEFT,BOTTOM);
        textSize(12);
        text("                You Win!\nClick here to start a new game!", 160, 266);
        newGame = 1;
        checkWin = 1;
        h = 0;
      }else{
        light = 1;
      }
    startX = endX;
    startY = endY;
  }
  object();
}
void mousePressed()
{
  resetFade = 0;
  fade = 0;
  if(endX < objX + 25 && endX > objX - 25 && endY > 425 && endY < 475 && checkWin == 1){
    checkWin = 0;
  }
  if(light == 1){
    h = (int)(Math.random()*420) + 419;
    //light == 1;
  }
  if(newGame == 1){
    h = 0;
    if(mouseX >= 150 && mouseX <= 350 && mouseY >= 225 && mouseY <= 275){
      checkWin = 0;
      fill(0);
      rect(150,225,200,50);
      newGame = 0;
      moveObjX = 0;
      light = 0;
      objX = objX  + moveObjX;
      if(objX < 500 && objX > 250){
        moveObjX = 1;
        h = 0;
      }else{
        moveObjX = -1;
        h = 0;
      }
      h = (int)(Math.random()*420) + 419;
    }
}
  if(offOn == 1){
    mySize = 0;
    fill(0,0,0);
    noStroke();
    rect(20,30,100,20);
    startX = mouseX;
    startY = 0;
    endX = mouseX;
    endY = 0;
    offOn = 0;
  }
  fill(255,255,255);
}

class Load
{
  void inflate()
  {
    // Fade
    fill(0,0,0,fade);
    fade = fade + 1;
    rect(0,0, 19, 500);
    rect(0,0, 500, 29);
    rect(0,51, 500, 29);
    rect(123,23, 500, 29);
    rect(0,51, 500, 174);
    rect(0,275, 500, 225);
    rect(19,225,131,51); // fillers next to win text box (left)
    rect(350,225,150,51); // fillers next to win text box (right)
    if(checkWin == 0){
      fill(0, 0, 0, fade);
      rect(150,225,200,50);
    }
    if(mySize > 98){
      fill(0,0,0);
      rect(19,29,104,22);
      mySize = 100;
      fill(255,0,0);
      noStroke();
      fill(255,255,255);
      rect(19,29,102,22);
      fill(255,0,0);
      rect(20,30,100,20);
      offOn = 1;
    }else if(h == 0){
      mySize = 100;
    }else{
      mySize = mySize + 1.5;
    }
    if(moveObjX == 1 || moveObjX == -1){
      fill(loadColor);
      textAlign(CENTER);
      textSize(50);
      text("Loading...",250, 400);
      h = 0;
      loadColor = loadColor + loadColorShift;
      if(loadColor > 245){
        loadColorShift = -3;
      }else if(loadColor < 10){
        loadColorShift = 3;
      }
    }else{
      light = 1;
    }
    resetFade = 1;
  }
  void show()
  {
    noStroke();
    fill(255,255,255);
    rect(19,29,102,22);
    fill(255,0,0);
    rect(myX, myY, mySize, 20);
  }
  Load(int x, int y) //constuctor initialize the variables
  {
    mySize = 0;
    myX = x;
    myY = y;
  }
}

void object(){
  noStroke();
  fill(0,0,0);
  ellipse(objX+7, 450, 50, 50);
  ellipse(objX-7, 450, 50, 50);
  noStroke();
  // Target
  fill(255,0,0);
  ellipse(objX,450, 50, 50);
  fill(255,255,255);
  ellipse(objX,450, 40, 40);
  fill(255,0,0);
  ellipse(objX,450, 30, 30);
  fill(255,255,255);
  ellipse(objX,450, 20, 20);
  fill(255,0,0);
  ellipse(objX,450, 10, 10);
  objX = objX  + moveObjX;
  if(objX > 500){
    moveObjX = -5;
}
  if(objX < 0){
    moveObjX = 5;
  }
}