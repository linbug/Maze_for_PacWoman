class Maze {
  float x, y, blockWidth, blockHeight;
  
  Maze (float xpos, float ypos, float widthValue, float heightValue)  {
    x = xpos;
    y = ypos;
    blockWidth = widthValue;
    blockHeight = heightValue;
  }
  
  void display(){
    fill (255);
    rect (x, y, blockWidth, blockHeight);
  }
}


