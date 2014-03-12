class Food {
  float x, y;
  float foodDiameter = 4;

  Food(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }

  void display() {
    fill (#E60042);
    ellipse (x, y, foodDiameter, foodDiameter);
  }
}

