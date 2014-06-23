class Enemy {
  int squareWidth = 10;
  float squareX, 
  squareY;

  void start (float x, float y) {
    squareX = x;
    squareY = y;
  } 

  void display() {
    fill(255);
    rect (squareX, squareY, squareWidth, squareWidth);
  }
}

