int mapSize = 500, 
speed = 2, 
score = 0, 
numFood, 
gridSize = 10, 
borderSize = 50;
float counter = 1;
Pac woman;
Maze maze;
ArrayList foods;
boolean[][] collisionMap;
PImage colMapImage;
Enemy [] enemies; //Enemy is the object, enemies is the array
int numEnemies = 5;

void setup() {
  size(mapSize+2*borderSize, mapSize+2*borderSize);
  woman = new Pac (width/2, height/2, gridSize, speed);
  maze = new Maze (width/2, height/2, 30, 10);
  colMapImage = loadImage("level_image9.jpg");
  collisionArray();
  makeFoods();
  makeEnemies();
}

void makeFoods() {
  foods = new ArrayList<Food>();
  for (int x = borderSize; x<mapSize+borderSize; x+= gridSize) {
    for (int y = borderSize; y< mapSize+borderSize; y+= gridSize) {
      if ((random(10)<4) && (collisionMap[x][y]==true)) {
        foods.add(new Food(x, y));
      }
    }
  }
}

void collisionArray() {
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
}

void makeEnemies() {
  enemies = new Enemy[numEnemies];  //create the array
  for (int i = 0; i< numEnemies; i++) {
    enemies [i] = new Enemy();
  }   //create each object in the array
  for (int i = 0; i< numEnemies; i++) {
    //enemies[i].start(random(0, width), random(0, height));
    enemies[i].display(); 
    enemies[i].start(random(0, width), random(0, height));

    //enemies[i].move();
  }
}


void draw() {
  noStroke();
  background(255);
  fill(0);
  rect(borderSize-20, borderSize-20, mapSize+40, mapSize+40);
  image (colMapImage, 0, 0); 
  counter += 0.15;

  for (int i=0; i<foods.size (); i++) {
    Food myFood = (Food)foods.get(i);
    myFood.display();
  }

  // maze.display();
  woman.display();
  woman.move();
  woman.isonMap();
  checkIsFoodEaten();
  drawScore();
}


void drawScore() {
  fill(0);
  if (foods.size() == 0) {
    fill(255);
    text("You win!", width/2, height/2);
  } else {
    text("Your score is " + score, width - 150, height - borderSize/4);
  }
}

void checkIsFoodEaten() {

  for (int i=0; i<foods.size (); i++) {
    Food myFood = (Food)foods.get(i);
    if (myFood.x < (woman.circleX + woman.circleWidth/4) && 
      myFood.x > (woman.circleX - woman.circleWidth/4) &&
      myFood.y < (woman.circleY + woman.circleWidth/4) && 
      myFood.y > (woman.circleY - woman.circleWidth/4)) {
      foods.remove(i);
      score++;
      break;
    }
  }
}

