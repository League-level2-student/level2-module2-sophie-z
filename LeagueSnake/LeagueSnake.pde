//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int snakeX;
int snakeY;

// Add a constructor with parameters to initialize each variable.
Segment(int snakeX, int snakeY){
  this.snakeX = snakeX;
  this.snakeY = snakeY;
}
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
int foodX;
int foodY;
int direction = UP;
int foodeaten = 0;
ArrayList<Segment> tail = new ArrayList<Segment>();
Segment head;


//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
frameRate(20);
dropFood();
head = new Segment(250, 100);
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
   move();
   drawSnake();
   eat();
   print(tail.size());
   checkBoundaries();
}

void drawFood() {
  //Draw the food
  fill(#EA5002);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(#6A00B7);
  rect(head.snakeX, head.snakeY, 10, 10);
  manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
for(int i = 0; i<tail.size(); i++){
    rect(tail.get(i).snakeX, tail.get(i).snakeY, 10, 10);
}

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  tail.add(new Segment(head.snakeX, head.snakeY));
  tail.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for(int i = 0; i<tail.size(); i++){
  if(tail.get(i).snakeX == head.snakeX && tail.get(i).snakeY == head.snakeY){
  tail = new ArrayList <Segment>();
  foodeaten = 0;
  }
  }
    
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode == UP && direction != DOWN){
    direction = UP;
    checkBoundaries();
  }
  else if(keyCode == DOWN && direction != UP){
    direction = DOWN;
    checkBoundaries();
  }
  else if(keyCode == RIGHT && direction != LEFT){
    direction = RIGHT;
    checkBoundaries();
  }
  else if(keyCode == LEFT && direction != RIGHT){
    direction = LEFT;
    checkBoundaries();
  }
  else{
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(direction) {
  case UP:
    // move head up here 
    head.snakeY = head.snakeY - 10;
    break;
  case DOWN:
    // move head down here 
    head.snakeY = head.snakeY + 10;
    drawSnake();
    break;
  case LEFT:
   // figure it out 
   head.snakeX = head.snakeX - 10;
    break;
  case RIGHT:
    // mystery code goes here 
    head.snakeX = head.snakeX + 10;
    break;
  }
}
  

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.snakeX<=0){
  head.snakeX = 10;
  drawSnake();
 }
 else if(head.snakeX>=500){
   head.snakeX = 490;
   drawSnake();
 }
 else if(head.snakeY<=0){
   head.snakeY = 490;
   drawSnake();
 }
 else if(head.snakeY>=500){
   head.snakeY = 10;
   drawSnake();
 }
 else{
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if(head.snakeX == foodX && head.snakeY == foodY){
  dropFood(); 
  foodeaten = foodeaten + 1;
  tail.add(new Segment(head.snakeX, head.snakeY));
}
}
