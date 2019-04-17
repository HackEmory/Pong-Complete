int p1 = 0;//Keep track of player 1 score
int p2 = 0;//Keep track of player 2 score
Ball ball;//Initialize the ball
Paddle player, ai;//Initialize player paddle and computer paddle


void setup() {
  size(1000, 650);//Size of the screen
  background(0);//Initialize a black background color
  textSize(60); //Set the text size to 60
  ball = new Ball();//Create a ball
  
  //Instantiate player
  PVector playerPos = new PVector(20, 20);
  PVector paddleDim = new PVector(20, 150);
  player = new Paddle(playerPos, paddleDim);
  //Instantiate computer
  PVector aiPos = new PVector(960, 20);
  ai = new Paddle(aiPos, paddleDim);

}

void draw() {
  //Clear the screen every loop
  background(0);
  //Move the paddles
  player.pos.y = mouseY-player.dim.y/2;
  ai.pos.y = ball.pos.y-ai.dim.y/2;
  //Draw the paddles
  player.drawPaddle();
  ai.drawPaddle();
  
  
  
   //Display the score
  fill(0, 0, 255);
  text("P1: " + p1, 50, 50, 200, 200);
  text("P2: " + p2, 810, 50, 200, 200);
  
  //Draw the ball
  ball.drawBall();
}