int p1, p2 = 0; //Keep track of the player's scores
Ball ball; //Initialize the ball
Paddle player, ai; //Initialize player paddle and computer paddle


void setup() {
  size(1000, 650);//Size of the screen
  background(0);//Initialize a black background color
  textSize(60); //Set the text size to 60
  ball = new Ball();//Create a ball
  
  //Instantiate player
  PVector playerPos = new PVector(20, 20);
  PVector paddleSize = new PVector(20, 150);
  player = new Paddle(playerPos, paddleSize);
  
  //Instantiate computer
  PVector aiPos = new PVector(960, 20);
  ai = new Paddle(aiPos, paddleSize);
}

void draw() {
  background(0); //Clear the screen every loop
  
  //TODO Move the paddles
  player.pos.y = mouseY-player.dim.y/2; //Fill in the position of the paddle relative to the mouse
  ai.pos.y = ball.pos.y-ai.dim.y/2; //Fill in the position of the paddle relative to the ball
  
  //TODO Draw the paddles
  player.drawPaddle();
  ai.drawPaddle();
  
  //Display the score
  fill(0, 0, 255);
  text("P1: " + p1, 50, 50, 200, 200);
  text("P2: " + p2, 810, 50, 200, 200);
  
  //TODO Draw the ball
  ball.drawBall();
}