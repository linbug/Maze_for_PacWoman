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
  noStroke();
  background(0);
  fill(255);
  rect(borderSize-20, borderSize-20, mapSize+40, mapSize+40);
  size(mapSize+2*borderSize, mapSize+2*borderSize);
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
  fill(255);
  if (foods.size() == 0) {
    fill(255);
    text("You win!", width/2, height/2);
  } else {
    text("Your score is " + score, width - 150, height - borderSize/4);
  }
}

