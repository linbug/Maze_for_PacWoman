int mapSize = 450, 
speed = 12, 
score = 0, 
numFood, 
gridSize = 30, 
borderSize = 50;
int [][] mazeArray;
float counter = 1;
Pac woman;
ArrayList foods;
boolean[][] collisionMap;
PImage colMapImage;
Enemy [] enemies; //Enemy is the object, enemies is the array
int numEnemies = 5;


void setup() {
  noStroke();
  background(0);
  fill(255);
  rect(borderSize-20, borderSize-20, mapSize+40, mapSize+40);
  size(mapSize+2*borderSize, mapSize+2*borderSize);
  woman = new Pac (1, 1, gridSize, speed);
  colMapImage = loadImage("level_image9.jpg");
  //collisionArray();
  mazeArray = loadMaze();
  makeFoods();
  makeEnemies();
  
  
}

void makeFoods() {
  foods = new ArrayList<Food>();
  for (int i = 0; i <= 14 ; i++) {
    
    for (int j = 0; j <= 14 ; j++) {
      
      if (mazeArray[j][i] == 0) {
  
        /*for (int x = borderSize; x<mapSize+borderSize; x+= gridSize) {
    for (int y = borderSize; y< mapSize+borderSize; y+= gridSize) {
      if ((random(10)<4) /*&& (collisionMap[x][y]==true)) */
        ellipseMode(CENTER);
        foods.add(new Food(borderSize + gridSize/2+ (i*gridSize), borderSize + gridSize/2+ (j*gridSize)));
      }
    }
  }
}

/*void collisionArray() {
 collisionMap = new boolean[width][height];
 color black = color(0);
 color wall = color(0, 155, 149);
 
 //check the colour of each pixel in collisionMap and assign collisionMap boolean true or false
 for (int i = 0; i<width; i++) {
 for (int j = 0; j < height; j++) {
 color c = colMapImage.get(i, j);
 if (c==wall) {
 collisionMap[i][j] = false;
 } else {
 if (c == black) {
 collisionMap [i][j] = true;
 }
 }
 }
 }
 }*/

void makeEnemies() {
  enemies = new Enemy[numEnemies];  //create the array
  for (int i = 0; i< numEnemies; i++) {
    enemies [i] = new Enemy();
    enemies[i].start(random(0, width), random(0, height));
  }
}



void draw() {

  //image (colMapImage, 0, 0); 
  counter += 0.15;
  noStroke();
  background(0);
  fill(255);
  rect(borderSize-20, borderSize-20, mapSize+40, mapSize+40);
  makeMaze();
  displayFoods();
  woman.display();
  woman.move();
  //woman.isonMap();
  checkIsFoodEaten();
  drawEnemies();
  drawScore();
}



void displayFoods() {
  for (int i=0; i<foods.size (); i++) {
    Food myFood = (Food)foods.get(i);
    myFood.display();
  }
}


void checkIsFoodEaten() {

  for (int i=0; i<foods.size (); i++) {
    Food myFood = (Food)foods.get(i);
        
    if (myFood.x < (woman.gridX + woman.circleWidth) && 
      myFood.x > (woman.gridX - woman.circleWidth) &&
      myFood.y < (woman.gridY + woman.circleWidth) && 
      myFood.y > (woman.gridY - woman.circleWidth)) {
      
      foods.remove(i);
      score++;
      break;
    }
  }
}


//Draw enemies on map
void drawEnemies() {
  for (int i = 0; i< numEnemies; i++) { 
    enemies[i].display();
  }
}

void drawScore() {
  fill(255);
  if (foods.size() == 0) {
    fill(255);
    text("You win!", width/2, height/2);
  } else {
    text("Your score is " + score, width - 150, height - borderSize/4);
  }
}

