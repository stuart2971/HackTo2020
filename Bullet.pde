class Bullet{
  PVector position;
  PVector directionSpeed;
  int lifespan = 2000;
  
  Bullet(float playerPosX, float playerPosY, int mousePosX, int mousePosY){
    this.position = new PVector(playerPosX, playerPosY);
    this.directionSpeed = new PVector(map(mousePosX - playerPosX, 0, width, 0, 10), map(mousePosY - playerPosY, 0, height, 0, 10));
  }
  void show(){
    fill(0, 255, 0);
    noStroke();
    ellipse(this.position.x, this.position.y, 10, 10);
  }
  void move(){
    this.position.add(this.directionSpeed);
    this.decelerate();
  }
  void decelerate(){
    this.directionSpeed.sub(new PVector(map(this.directionSpeed.x, -10, 10, -1, 1), map(this.directionSpeed.y, -10, 10, -1, 1)));
  }
  void die(){
    
  }
}
