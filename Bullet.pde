class Bullet{
  PVector position;
  PVector directionSpeed;
  float size = 4;
  int travelDistance = 60;
  
  Bullet(float playerPosX, float playerPosY, int mousePosX, int mousePosY){
    this.position = new PVector(playerPosX, playerPosY);
    this.directionSpeed = new PVector(map(mousePosX - playerPosX, 0, width, 0, travelDistance), map(mousePosY - playerPosY, 0, height, 0, travelDistance));
  }
  void show(){
    fill(0, 255, 0);
    noStroke();
    ellipse(this.position.x, this.position.y, this.size, this.size);
  }
  void move(){
    this.position.add(this.directionSpeed);
    this.decelerate();
  }
  void decelerate(){
    this.directionSpeed.sub(new PVector(map(this.directionSpeed.x, -10, 10, -1, 1), map(this.directionSpeed.y, -10, 10, -1, 1)));
  }
  void checkIfHitObstacle(float x1, float x2, float y1, float y2){
    
    if(this.position.x + this.size > x1 &&
       this.position.y + this.size > y1 &&
       this.position.x - this.size < x2 &&
       this.position.y - this.size < y2){
           this.directionSpeed = new PVector(0, 0); 
       }
  }
  boolean checkIfHitBot(Bot bot){
    if(dist(this.position.x, this.position.y, bot.getX(), bot.getY()) < this.size + bot.getSize()){
      return true;
    }
    return false;
  }
}
