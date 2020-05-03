class Bot {
  float x;
  float y;
  float xSpeed = floor(random(1,3))*pow(-1,floor(random(0,2)));
  float ySpeed = floor(random(1,3))*pow(-1,floor(random(0,2)));
  
  void makeBot (float x_0, float y_0) {
    x = x_0;
    y = y_0;
  }
  void showBot () {
    color c = #88ff00;
    fill(c);
    noStroke();
    ellipse(x,y,10,10);
  }
  
  void moveBot () {
    x += xSpeed;
    y += ySpeed;
  }
  
  void botCollision (float left, float right, float top, float bottom) {
    if (x == left && y >= top && y <= bottom && (x < right)) {
      xSpeed *= -1;
      print("left");
    }
    if (x == right && y >= top && y <= bottom && (x > left)) {
      xSpeed *= -1;
      print("right");
    }
    if(y == top && x >= left && x <= right && (y < bottom)) {
       ySpeed *= -1;
       print("top");
    }
    if (y == bottom && x >= left && x <= right && (y > top)){
      ySpeed *= -1;
      print("bottom");
    }
  }
}
