Wall[] walls = new Wall[6];


void setup() {
  size(1200,500);
  for(int i = 0; i < walls.length; i++) {
    walls[i] = new Wall();
  }
}

void draw(){
  background(51);
  walls[0].drawWall(520,100,10,400);
  walls[1].drawWall(0,420,400,10);
  walls[2].drawWall(640,0,10,400);
  walls[3].drawWall(740,400,250,10);
  walls[4].drawWall(860,120,10,280);
  walls[5].drawWall(1100,0,10,400);
}
