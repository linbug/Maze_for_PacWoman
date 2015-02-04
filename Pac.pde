class Pac {
  int gridSpacing, 
  gridX, 
  gridY; 
  
  float circleWidth = gridSize - 5, 

  bottomLip=PI/6, 
  topLip = 11*PI/6;
  boolean notBlocked = true;

  Pac (int x, int y, int z, int speed) {
    gridX = x; 
    gridY = y;
    gridSpacing = z;
  }

  void display() {
    fill(#FF4C00);
    ellipseMode(CENTER);
    arc (borderSize+gridSize/2+ (gridSize*gridX), borderSize+ gridSize/2+(gridSize*gridY), circleWidth, circleWidth, bottomLip+0.55*sin(counter), topLip-0.55*sin(counter));
  }

  void move() {
    if (keyPressed && (key == CODED)) {
      if (keyCode == LEFT) {
        bottomLip = 7*PI/6; 
        topLip = 17*PI/6;
        
        if (mazeArray[gridY][gridX-1] == 0) {
          notBlocked = true;
        } else {
          notBlocked = false;
        }
        //notBlocked = collisionMap[int(gridX -gridSize)][int(gridY)];
        
        if (notBlocked) {
          gridX-=1;
        }
        
      } else if (keyCode == RIGHT) {
        topLip = 11*PI/6; 
        bottomLip = PI/6;
        if (mazeArray[gridY][gridX+1] == 0) {
          notBlocked = true;
        } else {
          notBlocked = false;
        }
        //notBlocked = collisionMap[int(gridX +gridSize)][int(gridY)];
        if (notBlocked) {
          gridX+=1;
        }
      }
    }
    
    if (keyPressed && (key ==CODED)) {
      if (keyCode == UP) {
        bottomLip = 10*PI/6; 
        topLip = 20*PI/6;
        if (mazeArray[gridY-1][gridX] == 0) {
          notBlocked = true;
        } else {
          notBlocked = false;
        }
        //notBlocked = collisionMap[int(gridX)][int(gridY-gridSize)];
        if (notBlocked) {
          gridY-=1;
        }
      } else if (keyCode == DOWN) {
        bottomLip = 2*PI/3; 
        topLip = 14*PI/6;
        if (mazeArray[gridY+1][gridX] == 0) {
          notBlocked = true;
        } else {
          notBlocked = false;
        }
        //notBlocked = collisionMap[int(gridX)][int(gridY+gridSize)];
        if (notBlocked) {
          gridY+=1;
        }
      }
      delay(200);
    }
   
  }
  /*void isonMap() {
   if (gridX > mapSize+borderSize) {
   gridX = borderSize;
   }
   if (gridY > mapSize+borderSize) {
   gridY = borderSize;
   }
   if (gridX < borderSize) {
   gridX = width - borderSize;
   }
   if (gridY < borderSize) {
   gridY = height - borderSize;
   }
   }*/

  //might use later for something
}

