import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class pong extends PApplet {

int p1 = 0;//Keep track of player 1 score
int p2 = 0;//Keep track of player 2 score
Ball ball;//Initialize the ball
Paddle player, ai;//Initialize player paddle and computer paddle


public void setup() {
  //Size of the screen
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

public void draw() {
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
class Ball{
  PVector pos = new PVector(500, 325);//Default position of the ball
  PVector speed = new PVector(-5,0);
  int ballColor= color(0, 0, 255);//Makes the ball blue
  float radius= 8;//8 pixel radius

 
  public void drawBall(){
    fill(ballColor);
    stroke(ballColor);
    ellipse(pos.x,pos.y, radius, radius);
    pos.x+=speed.x;
    pos.y+=speed.y;
  }
}
class Paddle {
  //Instance variable declarations
  PVector pos;
  PVector dim;  
  int paddleColor = color(0, 255, 0);

  Paddle(PVector poss, PVector dime) {//Set the local variables passed in to the instance variables
    pos = poss;
    dim = dime;
  }
  public void drawPaddle() {
    //Draw and color the paddle
    fill(paddleColor);
    stroke(paddleColor);
    rect(pos.x, pos.y, dim.x, dim.y);

    //Check if the ball is off the screen and update score
    checkOffScreen();
    
    //Check if the ball collided with a paddle
    checkCollision();
  }
  public void checkOffScreen() {
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
  public void checkCollision(){
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
  public void settings() {  size(1000, 650); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "pong" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
