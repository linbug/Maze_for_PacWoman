int mapSize = 450, 
score = 0, 
numFood, 
gridSize = 30, 
borderSize = 50;
int [][] mazeArray;
float counter = 1;
Pac woman;
ArrayList foods;
Enemy [] enemies; //Enemy is the object, enemies is the array
int numEnemies = 5;


void setup() {
  surface.setSize(mapSize+2*borderSize, mapSize+2*borderSize);
  noStroke();
  rect(borderSize-20, borderSize-20, mapSize+40, mapSize+40);
  woman = new Pac (1, 1, gridSize);
  mazeArray = loadMaze();
  makeFoods();
  makeEnemies();
}

void makeFoods() {
  foods = new ArrayList<Food>();
  for (int i = 0; i <= 14; i++) {

    for (int j = 0; j <= 14; j++) {

      if (mazeArray[j][i] == 0) {
        ellipseMode(CENTER);
        foods.add(new Food(i, j));
      }
    }
  }
}


void makeEnemies() {
  enemies = new Enemy[numEnemies];  //create the array
  for (int i = 0; i< numEnemies; i++) {
    enemies [i] = new Enemy();
    enemies[i].start(random(0, width), random(0, height));
  }
}



void draw() {
  
  counter += 0.15;
  noStroke();
  background(#ef1d74);
  fill(0);
  rect(borderSize-20, borderSize-20, mapSize+40, mapSize+40);
  makeMaze();
  displayFoods();
  woman.display();
  woman.move();
  checkIsFoodEaten();
//  drawEnemies();
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
    if ((myFood.gridX == woman.gridX) &&
      (myFood.gridY == woman.gridY )) {
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
  textSize(20);
  fill(0);
  if (foods.size() == 0) {
    
    text("You win!", width/2 - 25, height - borderSize/4);
  } else 
  {
    textSize(12);
    text("Your score is " + score, width - 150, height - borderSize/4);
  }
}