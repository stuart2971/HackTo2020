import processing.core.*;


class Player{
  boolean isInfected = true;
  int shootDelay = 3000;
  PVector direction;
  float movementSpeed = 1;
  int playerSize = 50;
  PVector position;
  
  Player(int initPosX, int initPosY){
    position = new PVector(initPosX, initPosY);
  }
  void calculateDirection(){
      this.direction = new PVector(mouseX - this.position.x, mouseY - this.position.y).normalize().mult(this.movementSpeed);
  }
  void move(){
    this.position.add(this.direction);
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
    //This is the if statement needed to determine if a circle hits a rectangle.      
    //if(this.position.x + this.playerSize > walls[i].getLeft() &&
    //   this.position.y + this.playerSize > walls[i].getTop() &&
    //   this.position.x - this.playerSize < walls[i].getRight() &&
    //   this.position.y - this.playerSize < walls[i].getBottom()){
    //     println("hit");
    //     this.movementSpeed = 0;
    //   }
    
       
  }
}
