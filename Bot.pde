class Bot {
  boolean isInfected = false;
  float x;
  float y;
  float xSpeed = floor(random(1,3))*pow(-1,floor(random(0,2)));
  float ySpeed = floor(random(1,3))*pow(-1,floor(random(0,2)));
  int size = 30;
  
  void makeBot (float initPosX, float initPosY) {
    x = initPosX;
    y = initPosY;
  }
  void showBot () {
    if(isInfected()){
      fill(0,255,0);
    }else{
      fill(255, 255, 255);
    }
    noStroke();
    ellipse(x,y,this.size,this.size);
  }
  float getX(){
    return this.x;
  }
  float getY(){
    return this.y;
  }
  int getSize(){
    return this.size;
  }
  void moveBot () {
    x += xSpeed;
    y += ySpeed;
  }
  boolean isInfected(){
    return this.isInfected;
  }
  void setIsInfected(boolean newIsInfected){
    this.isInfected = newIsInfected;
  }
  void botCollision (float left, float right, float top, float bottom) {
    if (x == left && y >= top && y <= bottom && (x < right)) {
      xSpeed *= -1;
    }
    if (x == right && y >= top && y <= bottom && (x > left)) {
      xSpeed *= -1;
    }
    if(y == top && x >= left && x <= right && (y < bottom)) {
       ySpeed *= -1;
    }
    if (y == bottom && x >= left && x <= right && (y > top)){
      ySpeed *= -1;
    }
  }
  boolean checkIfHitAnotherBot(Bot b) {
    return sq(b.x - this.x) + sq(b.y - this.y) < sq(b.getSize() + this.size);
  }
}
