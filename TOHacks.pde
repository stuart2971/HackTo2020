Wall[] walls = new Wall[20];


void setup() {
  size(800,800);
  for(int i = 0; i < walls.length; i++) {
    walls[i] = new Wall();
  }
}

void draw(){
  background(51);
  walls[0].drawWall(50,50,500,50);
  walls[1].drawWall(150,150,50,500);
}
