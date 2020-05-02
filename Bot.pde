class Bot {
  float xSpeed = random(-1, 1);
  float ySpeed = 1;
  float x = 250;
  float y = 250;
  
  void showBot () {
    ellipse (x,y,50,50);
  }
  
  void moveBot () {
    x -= xSpeed;
    y -= ySpeed;
  }
  void botCollision () {
    
  }
}
