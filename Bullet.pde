class Bullet{
  PVector position;
  PVector directionSpeed;
  int range = 8;
  
  Bullet(float playerPosX, float playerPosY, int mousePosX, int mousePosY){
    this.position = new PVector(playerPosX, playerPosY);
    this.directionSpeed = new PVector(mousePosX - playerPosX, mousePosY - playerPosY);
  }
  void show(){
    ellipse(this.position.x, this.position.y, 10, 10);
  }
  void move(){
    this.position.add(this.directionSpeed.div(this.range));
  }
  
}
