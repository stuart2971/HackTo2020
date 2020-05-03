import processing.sound.*;
String[] tips = {
  "If you feel sick you should rest, drink plenty of fluid, and eat nutritious food. Stay in a separate room from other family members, and use a dedicated bathroom if possible. Clean and disinfect frequently touched surfaces.",
  "Everyone should keep a healthy lifestyle at home. Maintain a healthy diet, sleep, stay active, and make social contact with loved ones through the phone or internet. Children need extra love and attention from adults during difficult times. Keep to regular routines and schedules as much as possible.",
  "It is normal to feel sad, stressed, or confused during a crisis. Talking to people you trust, such as friends and family, can help. If you feel overwhelmed, talk to a health worker or counsellor.",
  "If you have mild symptoms and are otherwise healthy, self-isolate and contact your medical provider or a COVID-19 information line for advice."
};
int[][] obstacles = {
{0,420,400,10},
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
Bot[] bots = new Bot[100];

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
    bots[i].makeBot(random(40, 100),random(40, 100));
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
  int infectedBots = 0;
  for (int i = 0; i < bots.length; i++) {
    bots[i].showBot();
    bots[i].moveBot();
    if(bots[i].isInfected())
      infectedBots++;
      
    for(int j = 0; j < bots.length; j++){
      if(i == j) continue;
      if(bots[i].checkIfHitAnotherBot(bots[j]) & bots[i].isInfected()){
        bots[j].setIsInfected(true);
      }
    }
    for(int j = 0; j < walls.length; j++)
      bots[i].botCollision(walls[j].getLeft(), walls[j].getRight(), walls[j].getTop(), walls[j].getBottom()); 
  }
  
  if(infectedBots == bots.length){
    background(51);
    textSize(22);
    fill(255);
    String tip = tips[floor(random(0, tips.length))];
    text(tip, 0, 0, width, height);
    noLoop();
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
