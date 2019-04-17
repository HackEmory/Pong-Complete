class Paddle {
  //Instance variable declarations
  PVector pos;
  PVector dim;  
  color paddleColor = color(0, 255, 0);

  Paddle(PVector poss, PVector dime) {//Set the local variables passed in to the instance variables
    pos = poss;
    dim = dime;
  }
  void drawPaddle() {
    //Draw and color the paddle
    fill(paddleColor);
    stroke(paddleColor);
    rect(pos.x, pos.y, dim.x, dim.y);

    //Check if the ball is off the screen and update score
    checkOffScreen();
    
    //Check if the ball collided with a paddle
    checkCollision();
  }
  void checkOffScreen() {
    //If the ball passes the player
    if (ball.pos.x<0) {
      p2++;//Add a point to the computer
      ball.speed.y=0;//Reset ball y speed
      ball.pos.x=500;//Reset x position of the ball
    }
    //If the ball goes passed the computer
    if (ball.pos.x>1000) {
      p1++;//Add a point to the player
      ball.speed.y=0;//Reset ball y speed
      ball.pos.x=500;//Reset x position of the ball
    }

    if (ball.pos.y<0) {//If the ball hits the top
      ball.speed.y=2;//Change the ball speed to downwards
    }

    if (ball.pos.y>650) {//If the ball hits the bottom
      ball.speed.y=-2;//Change the ball speed to go upwards
    }
  }
  void checkCollision(){
  //If the ball is moving to the left 
    if (ball.speed.x<0) {
      if (ball.pos.x<(player.pos.x+player.dim.x) && ball.pos.y>player.pos.y && ball.pos.y < (player.pos.y+player.dim.y)) {
        ball.speed.x*=-1;//Change the direction of the ball
        ball.speed.y=random(-3, 3);//Give the ball a random Y speed
      }
    }
    //If the ball is moving to the right
    else {
      if (ball.pos.x>960 && ball.pos.y>ai.pos.y && ball.pos.y < (ai.pos.y+ai.dim.y)) {
        ball.speed.x*=-1;//Change the direction of the ball
        ball.speed.y=random(-5, 5);//Give the ball a random Y speed
      }
    }
  }
}