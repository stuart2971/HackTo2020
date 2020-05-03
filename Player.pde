import processing.core.*;


class Player{
  boolean isInfected = true;
  int shootDelay = 3000;
  PVector direction;
  float movementSpeed = 5;
  float movementSpeedRight = 5;
  float movementSpeedLeft = 5;
  float movementSpeedTop = 5;
  float movementSpeedBottom = 5;
  int playerSize = 50;
  PVector position;
  
  Player(int initPosX, int initPosY){
    position = new PVector(initPosX, initPosY);
  }
  void calculateDirection(){
      this.direction = new PVector(mouseX - this.position.x, mouseY - this.position.y).normalize().mult(this.movementSpeed);
  }
  void move(){
   if (keyPressed) {
      if (key == 'w') {
        position.y -= movementSpeedTop;
        movementSpeedBottom = 5;
      }
      if (key == 'a') {
        position.x -= movementSpeedLeft;
        movementSpeedRight = 5;
      }
      if (key == 's') {
        position.y += movementSpeedBottom;
        movementSpeedTop = 5;
      }
      if (key == 'd') {
        position.x += movementSpeedRight;
         movementSpeedLeft = 5;
      }
    }
  }
  PVector getPosition (){
    return this.position;
  }
  void show(){
    noStroke();
    fill(0, 255, 0);
    ellipse(this.position.x, this.position.y, this.playerSize, this.playerSize);
  }
  Bullet createBullet(int mousePosX, int mousePosY){
    Bullet sneeze = new Bullet(this.position.x, this.position.y, mousePosX, mousePosY);
    return sneeze;
  }
  
  void checkIfHitObstacle(Wall[] walls){
    
    for(int i = 0; i < walls.length; i++) {
    float left = walls[i].getLeft();
    float right = walls[i].getRight();
    float top = walls[i].getTop();
    float bottom = walls[i].getBottom();
    float x = this.position.x;
    float y = this.position.y;
    
      
      if (x == left && y >= top && y <= bottom && (x < right)) {
        this.movementSpeedRight = 0;
      }
      else if (x == right && y >= top && y <= bottom && (x > left)) {
         this.movementSpeedLeft = 0;
      }
      else if(y == top && x >= left && x <= right && (y < bottom)) {
          this.movementSpeedBottom = 0;
      }
      else if (y == bottom && x >= left && x <= right && (y > top)){
         this.movementSpeedTop = 0;
      } 
    }
       
  }
}
