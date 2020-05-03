import processing.sound.*;

Wall[] walls = new Wall[10];
Bullet[] sneezes = new Bullet[0];
Bot[] bot = new Bot[5];
Player you;
SoundFile file;
String path;

void setup() {
  size(1200,500);
  for(int i = 0; i < walls.length; i++) {
    walls[i] = new Wall();
  }
   you = new Player(50, 50);
   path = sketchPath("sample.wav");
   file = new SoundFile(this, path);
   file.play();
   for(int i = 0; i < bot.length; i++) {
    bot[i] = new Bot();
    bot[i].makeBot(250,250);
  }
   
}

void draw(){
  background(51);
  fill(255);
  drawWalls();
  you.show();
  you.move();
  
  for(int i = 0; i < sneezes.length; i++){
    sneezes[i].move();
    sneezes[i].show();
  }
  
  for (int i = 0; i < bot.length; i++) {
    bot[i].showBot();
    bot[i].moveBot();
    for (int j = 0; j < walls.length; j++)
      bot[i].botCollision(walls[j].getLeft(),walls[j].getRight(), walls[j].getTop(), walls[j].getBottom()); 
  }
}

void mouseClicked() {
  sneezes = (Bullet[])append(sneezes, you.createBullet(mouseX, mouseY));
  
  println(sneezes.length);
}
void drawWalls(){
 fill(108, 194, 58);
  rect(0, 430, 70, 70);
  
  fill(240, 54, 34);
  rect(0, 0, 240, 240);
  
  fill(240, 54, 34);
  rect(1110, 0, 90, 70);
  
  fill(255);
  
  walls[0].drawWall(520,100,10,400);
  walls[1].drawWall(0,420,400,10);
  walls[2].drawWall(640,0,10,400);
  walls[3].drawWall(740,400,250,10);
  walls[4].drawWall(860,120,10,280);
  walls[5].drawWall(1100,0,10,400);
  walls[6].drawWall(0, 0, 1200, 10);
  walls[7].drawWall(0, 0, 10, 500);
  walls[8].drawWall(0, 490, 1200, 10);
  walls[9].drawWall(1190, 0, 10, 500);
}
