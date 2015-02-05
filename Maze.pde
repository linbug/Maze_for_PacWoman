int[][] loadMaze() {
    
    mazeArray = new int [15][15];
    mazeArray[0] = new int[] { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
    mazeArray[1] = new int[] { 1,0,1,0,1,1,0,1,0,1,1,1,1,1,1};
    mazeArray[2] = new int[] { 1,0,1,0,0,0,0,1,0,0,0,0,0,0,1};
    mazeArray[3] = new int[] { 1,0,0,0,1,1,0,0,0,1,1,1,1,0,1};
    mazeArray[4] = new int[] { 1,1,1,1,1,1,0,1,1,1,1,1,1,0,1};
    mazeArray[5] = new int[] { 1,1,1,1,1,1,0,0,1,1,1,0,0,0,1};
    mazeArray[6] = new int[] { 1,1,1,1,1,1,1,0,1,1,1,1,0,1,1};
    mazeArray[7] = new int[] { 1,1,1,1,1,0,0,0,1,0,1,1,0,1,1};
    mazeArray[8] = new int[] { 1,1,1,1,1,0,1,1,1,0,1,1,0,1,1};
    mazeArray[9] = new int[] { 1,1,1,1,0,0,1,1,1,0,1,1,0,1,1};
    mazeArray[10] = new int[] { 1,1,1,1,0,1,1,1,1,0,1,0,0,1,1};
    mazeArray[11] = new int[] { 1,1,1,1,0,1,1,0,0,0,0,0,1,1,1};
    mazeArray[12] = new int[] { 1,1,1,1,0,0,0,0,1,1,1,1,1,1,1};
    mazeArray[13] = new int[] { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
    mazeArray[14] = new int[] { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
    
    return mazeArray;
}

void makeMaze(){
  for (int i = 0; i <= 14 ; i++) {
    
    for (int j = 0; j <= 14 ; j++) {
      
      if (mazeArray[j][i] == 1) {
        fill (#009b95);
        rectMode(CORNER);
        rect(borderSize+(gridSize*i), borderSize+(gridSize*j), gridSize, gridSize);
        
      }
    }
  }
}
