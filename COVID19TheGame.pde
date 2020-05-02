  
Wall[] walls = new Wall[6];
Bullet[] sneezes = new Bullet[0];
Player you;
void setup() {
  size(1200,500);
  for(int i = 0; i < walls.length; i++) {
    walls[i] = new Wall();
  }
   you = new Player(50, 50);
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
}

void mouseClicked() {
  sneezes = (Bullet[])append(sneezes, you.createBullet(mouseX, mouseY));
  
  println(sneezes.length);
}
void drawWalls(){
  walls[0].drawWall(520,100,10,400);
  walls[1].drawWall(0,420,400,10);
  walls[2].drawWall(640,0,10,400);
  walls[3].drawWall(740,400,250,10);
  walls[4].drawWall(860,120,10,280);
  walls[5].drawWall(1100,0,10,400);
}
