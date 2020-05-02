import processing.core.*;


class Player{
  boolean isInfected = true;
  int shootDelay = 3000;
  int movementSpeed = 1;
  int playerSize = 50;
  PVector position;
  
  Player(int initPosX, int initPosY){
    position = new PVector(initPosX, initPosY);
  }
  void move(){
    if (keyPressed) {
      if (key == 'w') {
        position.y -= movementSpeed;
      }
      if (key == 'a') {
        position.x -= movementSpeed;
      }
      if (key == 's') {
        position.y += movementSpeed;
      }
      if (key == 'd') {
        position.x += movementSpeed;
      }
    }
  }
  PVector getPosition (){
    return this.position;
  }
  void show(){
    ellipse(this.position.x, this.position.y, this.playerSize, this.playerSize);
  }
  Bullet createBullet(int mousePosX, int mousePosY){
    Bullet sneeze = new Bullet(this.position.x, this.position.y, mousePosX, mousePosY);
    return sneeze;
  }
}
