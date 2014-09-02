class Maze {
  
  float x, y, blockWidth, blockHeight;
  
  int [][] MazeArray;
  
  Maze (float xpos, float ypos, float widthValue, float heightValue)  {
    MazeArray = new int [5][5];
    MazeArray[0] = new int[] { 1,1,1,1,1};
    MazeArray[1] = new int[] { 1,0,1,0,1};
    MazeArray[2] = new int[] { 1,0,1,0,1};
    MazeArray[3] = new int[] { 1,0,0,0,1};
    MazeArray[4] = new int[] { 1,1,1,1,1};
  }
    
    void makeMaze() {
 //fill (#FF0000);
  //      ellipse(50, 50, 20, 20);
  for (int i = 0; i <= 4 ; i++) {
    
    for (int j = 0; j <= 4 ; j++) {
      print (MazeArray[i][j]);
      if (MazeArray[i][j] == 1) {
        fill (#FF0000);
        ellipse(i*gridSize, j*gridSize, 20, 20);
        
      }
    }
  }
}
   /* x = xpos;
    y = ypos;
    blockWidth = widthValue;
    blockHeight = heightValue;
  }
  
  void display(){
    fill (#009B95);
    rect (x, y, blockWidth, blockHeight);
    */
    
    
    
  
}



