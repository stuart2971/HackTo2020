class Wall {
  float x1;
  float x2;
  float y1;
  float y2;
  
  
  //draw(x,y,width,height) draws a walls with the specific dimensions
  void drawWall(float x, float y, float width, float height) {
    rect(x,y, width, height);
    x1 = x;
    x2 = x + width;
    y1 = y;
    y2 = y + height;
  }
  
  float getLeft() {
    return x1;
  }
  float getRight() {
    return x2;
  }
  float getTop() {
    return y1;
  }
  float getBottom() {
    return y2;
  }
}
