class Pac {
  int gridSpacing; 
  float circleWidth = 20, 
  circleX, 
  circleY, 
  bottomLip=PI/6, 
  topLip = 11*PI/6;

  Pac (float x, float y, int z, int speed) {
    circleX = x; 
    circleY = y;
    gridSpacing = z;
  }

  void display() {
    fill(255);
    arc (circleX, circleY, circleWidth, circleWidth, bottomLip+0.55*sin(counter), topLip-0.55*sin(counter));
  }

  void move() {
    if (keyPressed && (key == CODED)) {
      if (keyCode == LEFT) {
        bottomLip = 7*PI/6; 
        topLip = 17*PI/6;
        circleX-=gridSpacing;
      } 
      else if (keyCode == RIGHT) {
        topLip = 11*PI/6; 
        bottomLip = PI/6; 
        circleX+=gridSpacing;
      }
    }
    if (keyPressed && (key ==CODED)) {
      if (keyCode == UP) {
        bottomLip = 10*PI/6; 
        topLip = 20*PI/6; 
        circleY-=gridSpacing;
      } 
      else if (keyCode == DOWN) {
        bottomLip = 2*PI/3; 
        topLip = 14*PI/6;
        circleY+=gridSpacing;
      }
    }
  }
  void isonMap() {
    if (circleX > mapSize+borderSize) {
      circleX = borderSize;
    }
    if (circleY > mapSize+borderSize) {
      circleY = borderSize;
    }
    if (circleX < borderSize) {
      circleX = width - borderSize;
    }
    if (circleY < borderSize) {
      circleY = height - borderSize;
    }
  }
}

