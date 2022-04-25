int numFrames = 15;//圖片數量
PImage[] images = new PImage[numFrames];//圖片儲存
int condition;//場景切換
int xPos = 320, yPos = 80;//地鼠的起始位子
color c1 = color(124, 204, 25);//草地
color c2 = color(255, 255, 0);//太陽
color c3 = color(253, 184, 19);//太陽
int x1 = int (random(0, 560));//白菜
int x2 = int (random(240, 400));//白菜
int s = 0;//兵士
int s2 = int (random(240, 400));//兵士

void setup()
{
  size(640, 480, P2D);
  images[0] = loadImage("img/title.jpg");//一開始的畫面
  images[1] = loadImage("img/startNormal.png");//開始按鈕（白）
  images[2] = loadImage("img/startHovered.png");//開始按鈕（黃）
  images[3] = loadImage("img/bg.jpg");//天空
  images[4] = loadImage("img/soil.png");//泥土
  images[5] = loadImage("img/soldier.png");//士兵
  images[6] = loadImage("img/groundhogIdle.png");//地鼠（站）
  images[7] = loadImage("img/life.png");//生命（HP）
  images[8] = loadImage("img/cabbage.png");//白菜
  images[9] = loadImage("img/groundhogDown.png");//地鼠（下↓）
  images[10] = loadImage("img/groundhogLeft.png");//地鼠（左←）
  images[11] = loadImage("img/groundhogRight.png");//地鼠（右→）
  images[12] = loadImage("img/gameover.jpg");//結束畫面
  images[13] = loadImage("img/restartNormal.png");//重新開始按鈕（白）
  images[14] = loadImage("img/restartHovered.png");//重新開始按鈕（黃）
}

void draw()
{
  // Game Start
  if (condition == 0)
  {
    image(images[0], 0, 0);
    if (mouseX >248 && mouseX <392 && mouseY >360 && mouseY <420)//滑鼠移動到這地方會變色
    {
      image(images[2], 248, 360, 144, 60);
    } else
    {
      image(images[1], 248, 360, 144, 60);
    }
  }

  // Game Run
  if (condition == 1)
  {
    image(images[3], 0, 0);
    image(images[4], 0, 160);
    //image(images[7], 10, 10);
    //image(images[7], 80, 10);

    fill(c1);
    rect(0, 145, 640, 15);
    fill(c2);
    ellipse(580, 60, 120, 120);
    fill(c3);
    ellipse(580, 60, 105, 105);

    if (dist(s, s2, xPos, yPos)<80)
    {
      condition = 2;
    } else {
      image(images[7], 10, 10);
      image(images[7], 80, 10);
    }

    if (dist(x1,x2, xPos, yPos)<80)
    {
      image(images[7], 10, 10);      
    }
    image(images[5], s, s2);//兵士
    image(images[6], xPos, yPos);//地鼠
    image(images[8], x1, x2);//白菜
  }

  // Game Lose
  if (condition == 2)
  {
    image(images[12], 0, 0);
    if (mouseX >248 && mouseX <392 && mouseY >360 && mouseY <420)//滑鼠移動到這地方會變色
    {
      image(images[14], 248, 360, 144, 60);
    } else
    {
      image(images[13], 248, 360, 144, 60);
    }
  }
  s=s+2;
  if (s > 640)
  {
    s = -80;
  }
}

void mousePressed()
{
  if (condition == 0)
  {
    if (mouseButton == LEFT && dist(320, 390, mouseX, mouseY)<50)
    {
      condition = 1;
    }
  }
  if (condition == 2)
  {
    if (mouseButton == LEFT && dist(320, 390, mouseX, mouseY)<50)
    {
      condition = 1;
    }
  }
}

void keyPressed()
{
  if (keyCode == UP) {
    yPos -= 80;//一次移動的距離
  }
  if (keyCode == DOWN) {
    yPos += 80;
    image(images[9], xPos, yPos);
  }
  if (keyCode == LEFT) {
    xPos -= 80;
    image(images[10], xPos, yPos);
  }
  if (keyCode == RIGHT) {
    xPos += 80;
    image(images[11], xPos, yPos);
  }
  delay(100);//鍵盤按下後到執行的延遲

  if (xPos > 560)//超過560後從0出現
  {
    xPos = 0;
  } else if (xPos < 0)//超過0後從560出現
  {
    xPos = 560;
  }
  if (yPos > 400)
  {
    yPos = 160;
  } else if (yPos < 160)
  {
    yPos = 400;
  }
}
