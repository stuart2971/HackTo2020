import processing.sound.*;

int[][] obstacles = {
{520,100,10,400},
{0,420,400,10},
{640,0,10,400},
{740,400,250,10},
{860,120,10,280},
{1100,0,10,400},
{0, 0, 1200, 10},
{0, 0, 10, 500},
{0, 490, 1200, 10},
{1190, 0, 10, 500}
};
Wall[] walls = new Wall[obstacles.length];
Bullet[] sneezes = new Bullet[0];
Player you;
Bot[] bots = new Bot[50];

void setup() {
  size(1200,500);
  for(int i = 0; i < walls.length; i++) {
    walls[i] = new Wall();
  }
   you = new Player(50, 50);
   SoundFile file = new SoundFile(this, sketchPath("sample.wav"));
   file.play();
   for(int i = 0; i < bots.length; i++) {
    bots[i] = new Bot();
    bots[i].makeBot(51,51);
  }
}

void draw(){
  background(51);
  fill(255);
  drawWalls();
  you.show();
  you.calculateDirection();
  you.checkIfHitObstacle(walls);
  you.move();
  for(int i = 0; i < sneezes.length; i++){
    sneezes[i].move();
    sneezes[i].show();
    for(int j = 0; j < walls.length; j++){
      sneezes[i].checkIfHitObstacle(walls[j].getLeft(), walls[j].getRight(), walls[j].getTop(), walls[j].getBottom());
    }
    for(int j = 0; j < bots.length; j++){
      if(sneezes[i].checkIfHitBot(bots[j])){
        bots[j].setIsInfected(true);
      }
    }
  }
  for (int i = 0; i < bots.length; i++) {
    bots[i].showBot();
    bots[i].moveBot();
    for(int j = 0; j < bots.length; j++){
      if(i == j) continue;
      if(bots[i].checkIfHitAnotherBot(bots[j]) & bots[i].isInfected()){
        bots[j].setIsInfected(true);
      }
    }
    for(int j = 0; j < walls.length; j++)
      bots[i].botCollision(walls[j].getLeft(), walls[j].getRight(), walls[j].getTop(), walls[j].getBottom()); 
  }
}

void mouseClicked() {
  sneezes = (Bullet[])append(sneezes, you.createBullet(mouseX, mouseY));
  if(sneezes.length > 5){
    sneezes = (Bullet[])subset(sneezes, 1);
  }
}
void drawWalls(){
  for(int i = 0; i < obstacles.length; i ++){
    walls[i].drawWall(obstacles[i][0], obstacles[i][1], obstacles[i][2], obstacles[i][3]);
  }
}
