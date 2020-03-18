//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*
int snakeX;
int snakeY;
class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.


// Add a constructor with parameters to initialize each variable.
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
int foodX;
int foodY;
int direction = UP;
int foodeaten = 0;






//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
snakeX = ((int)random(50)*10);
snakeY = ((int)random(50)*10);
frameRate(20);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
   background(#AF203A);
   drawFood();
   drawSnake();
}

void drawFood() {
  //Draw the food
  fill(#EA5002);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(#6A00B7);
  rect(snakeX, snakeY, 10, 10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode == UP){
    move();
    checkBoundaries();
  }
  if(keyCode == DOWN){
    move();
    checkBoundaries();
  }
  if(keyCode == RIGHT){
    move();
    checkBoundaries();
  }
  if(keyCode == LEFT){
    move();
    checkBoundaries();
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(direction) {
  case UP:
    // move head up here 
    snakeY = snakeY - 10;
    break;
  case DOWN:
    // move head down here 
    snakeY = snakeY + 10;
    break;
  case LEFT:
   // figure it out 
   snakeX = snakeX - 10;
    break;
  case RIGHT:
    // mystery code goes here 
    snakeX = snakeX + 10;
    break;
  }
}
  

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(snakeX==0){
  snakeX = 500;
  drawSnake();
 }
 else if(snakeX==500){
   snakeX = 0;
   drawSnake();
 }
 else if(snakeY==0){
   snakeY = 500;
   drawSnake();
 }
 else if(snakeY==500){
   snakeY = 0;
   drawSnake();
 }
 else{
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear

}
