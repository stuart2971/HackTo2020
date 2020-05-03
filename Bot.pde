class Bot {
  boolean isInfected = false;
  PVector position;
  PVector velocity = new PVector(floor(random(1,3))*pow(-1,floor(random(0,2))), floor(random(1,3))*pow(-1,floor(random(0,2))));
  int size = 20;
  
  void makeBot (float initPosX, float initPosY) {
    this.position = new PVector(initPosX, initPosY);
  }
  void showBot () {
    if(isInfected()){
      fill(0,255,0);
    }else{
      fill(255, 255, 255);
    }
    noStroke();
    ellipse(this.position.x,this.position.y,this.size,this.size);
  }
  float getX(){
    return this.position.x;
  }
  float getY(){
    return this.position.y;
  }
  int getSize(){
    return this.size;
  }
  void moveBot () {
    this.position.x += this.velocity.x;
    this.position.y += this.velocity.y;
  }
  boolean isInfected(){
    return this.isInfected;
  }
  void setIsInfected(boolean newIsInfected){
    this.isInfected = newIsInfected;
  }
  void botCollision (float left, float right, float top, float bottom) {
    if(this.position.x + this.size > left &&
            this.position.y + this.size > top &&
            this.position.x - this.size < right &&
            this.position.y - this.size < bottom){
              this.velocity.rotate(HALF_PI);
            }
                
  }
  boolean checkIfHitAnotherBot(Bot b) {
    return sq(b.position.x - this.position.x) + sq(b.position.y - this.position.y) < sq(b.getSize() + this.size);
  }
}
