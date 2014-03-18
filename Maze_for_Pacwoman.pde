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

void setup() {
  size(mapSize+2*borderSize, mapSize+2*borderSize);
  woman = new Pac (mapSize/2, mapSize/2, gridSize, speed);
  maze = new Maze (width/2, height/2, 30, 10);
  makeFoods();
  colMapImage = loadImage("level_image.jpg");
  collisionArray();
}

void makeFoods() {
  foods = new ArrayList<Food>();
  for (int x = borderSize; x<mapSize+borderSize; x+= gridSize) {
    for (int y = borderSize; y< mapSize+borderSize; y+= gridSize) {
      if (random(10)<4) {
        foods.add(new Food(x, y));
      }
    }
  }
}

void collisionArray() {
  collisionMap = new boolean[mapSize][mapSize];
  color black = color(0);
  color wall = color(#009B95);
  
  //check the colour of each pixel in collisionMap and assign collisionMap boolean true or false
  for (int i = 0; i<colMapImage.width; i++) {
    for (int j = 0; j < colMapImage.height; j++) {
      color c = colMapImage.get(i, j);
      if (c==black) {
        collisionMap[i][j] = true;
      }
      else {
        if (c == wall) {
          collisionMap [i][j] = false;
        }
      }
    }
  }
}


void draw() {
  noStroke();
  background(255);
  fill(0);
  rect(borderSize-20, borderSize-20, mapSize+40, mapSize+40);
  image (colMapImage, borderSize, borderSize);
  counter += 0.15;

  for (int i=0; i<foods.size(); i++) {
    Food myFood = (Food)foods.get(i);
    myFood.display();
  }

  maze.display();
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
  } 
  else {
    text("Your score is " + score, width - 150, height - borderSize/4);
  }
}

void checkIsFoodEaten() {

  for (int i=0; i<foods.size(); i++) {
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

