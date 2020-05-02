class Wall {
  float x1;
  float x2;
  float y1;
  float y2;
  void drawWall(float x, float y, float width, float height) {
    rect(x,y, width, height);
    x1 = x;
    x2 = x + width;
    y1 = y;
    y2 = y + height;
  }
  
}
