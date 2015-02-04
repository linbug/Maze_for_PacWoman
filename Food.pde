class Food {
  float gridX, gridY;
  float foodDiameter = 4;

  Food(float x, float y) {
    gridX = x;
    gridY = y;
  }

  void display() {
    fill (#E60042);
    ellipse (borderSize + gridSize/2+ (gridX*gridSize),  borderSize+ gridSize/2+(gridY*gridSize), foodDiameter, foodDiameter);
  }
}

