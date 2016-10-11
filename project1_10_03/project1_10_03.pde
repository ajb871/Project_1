//colors
//animated background that cycles through shades of yellow?

//adjective I'm using: BRIGHT
//head and brain, with functions that will do basic math problems above it
//background pattern?
//add animated stars & "bright" shapes in draw
//eyes animated by mousePosition
int a = 40; //variable for length of array
int [] x = new int[a]; //arrays for x and y positions
int [] y = new int[a];
float random1; //two values for calling "smarts()" function
float random2;  
float bubbleX = 300;
float bubbleDir = 0.5;
float x1 = 40;
void setup() {
  size(600, 680);
  //frameRate(30);
}

void draw() {
  //will add more animations
  pattern();
  int widthA = int(random(2, 10));
  // background(40, 230, 130);
  bubble(bubbleX);
  trail();
  brain(); //function call for head shapes
  if (keyPressed) {  //when keyisPressed, generates the random #'s for digit();
    random1 = random(1, 6);
    random2 = random(1, 6);
  }
  //bubble bounces back and forth along screen
  bubbleX = bubbleX + bubbleDir; //bubble direction can be positive or negative
  x1 = x1 + bubbleDir;
  if (bubbleX > 310) {
    bubbleDir *= -1;
  }
  if (bubbleX < 290) {
    bubbleDir *= -1;
  }
  if (mousePressed) { //calls the stars() function when mouse is pressed
    sparkles(widthA); //parameters for size
  }
  smarts(int(random1), int(random2), x1);
}
void brain() {
  strokeWeight(9);
  stroke(180, 130, 90);
  fill(50);
  ellipse(300, 635, 400, 400); //black ellipse
  fill(180, 130, 90);
  rect(100, 635, 400, 200); //brown rect
  noStroke();
  fill(50);
  rect(105, 630, 391, 28); //black rect
  fill(255, 105, 160, 200);
  noStroke();
  ellipse(300, 560, 270, 170);
  ellipse(180, 610, 110, 70);
  ellipse(160, 560, 50, 50);
  ellipse(420, 560, 80, 60);
  ellipse(400, 610, 90, 70);
  ellipse(440, 600, 50, 50);
  ellipse(230, 630, 70, 50);
  ellipse(310, 610, 120, 90);
  ellipse(200, 520, 80, 80);
  ellipse(400, 520, 80, 50);
  ellipse(260, 490, 80, 80);
  ellipse(260, 490, 80, 80);
  ellipse(320, 490, 80, 70);
  ellipse(370, 500, 80, 80);
  //eyes
  fill(255);
  ellipse(200, 680, 130, 100);
  ellipse(400, 680, 130, 100);
  //pupils
  fill(0);
  //************pupils go slighty out of eyewhites***************
  float pupil1 = map(mouseX, 0, 600, 185, 215); //pupil left&right position tracked by map mouseX
  float pupil2 = map(mouseX, 0, 600, 385, 415);
  int pupilY = 658; //y value of pupils
  ellipse(pupil1, pupilY, 60, 60);
  ellipse(pupil2, pupilY, 60, 60);
  fill(255);
  noStroke();
  ellipse(pupil1 + 15, pupilY - 18, 15, 15);//pupil details
  ellipse(pupil2 + 15, pupilY - 18, 15, 15);//pupil details
}
///sparkles on mouse position
//When you move the mouse around small "glitter" graphics appear in the mouse's previous position
//Refrences to example 9-8 in Learning Proccessing, and Ex_16 in class
//Use an array that takes the last mouseXandmouseY positions to draw a diamond(quad)
void trail() {
  //use this for statement to create the "trail" effect with an array
  //while int i is positive, starting from length of the array - 1
  for (int i = a-1; i > 0; i --) {
    x[i] = x[i-1]; //each variable in the array shifts over the next slot 
    y[i] = y[i-1];
  }
  //the mouseXandY determine values at beginning of arrays
  x[0] = mouseX;
  y[0] = mouseY;
  //"sparkles" made of + shapes from lines()
  // + i to x and y positions to create more movement
  for (int i = 0; i < a; i++) {
    fill(60, 255, 230);
    stroke(0);
    strokeWeight(3);
    int starA = 6; //width and height of this + shape
    //first star displaced by -10
    stroke(255, 255, 0);
    line(x[i] + i - 10, y[i] + i, x[i] + i - 10, y[i] + starA + i);
    line(x[i] - starA/2 + i - 10, y[i] + starA/2 + i, x[i] + starA/2 + i - 10, y[i] + starA/2 + i);
    int starB = 8;
    stroke(230, 200, 0);
    line(x[i] + i/2, y[i] + i/2, x[i] + i/2, y[i] + starB + i/2);
    line(x[i] - starB/2 + i/2, y[i] + starB/2 + i/2, x[i] + starB/2 + i/2, y[i] + starB/2 + i/2);
    int starC = 4; //this star is displaced ten left and down
    stroke(255, 200, 0);
    line(x[i] + i/3 - 10, y[i] + i/3 + 10, x[i] + i/3 - 10, y[i] + starC + i/3 + 10);
    line(x[i] - starC/2 + i/3 - 10, y[i] + starC/2 + i/3 + 10, x[i] + starC/2 + i/3 - 10, y[i] + starC/2 + i/3 + 10);
  }
}
//background pattern or animation
//function for "pattern", will probably change
void pattern() {
  background(240, 210, 0);
  for (int x = -100; x < 1200; x += 40) {
    for (int y = 0; y < 800; y += 40) {
      float r1 = map(x, 0, 600, 200, 255);
      float g1 = map(y, 0, 600, 130, 255);
      float b1 = map(x, 0, 600, 0, 200);
      stroke(255);
      //strokeWeight(2);
      noStroke();//removed stroke
      fill(r1, g1, b1, 250);
      quad(x, y, x + 40, y, x + 60, y + 40, x + 20, y + 40);
    }
  }
}
//sparklers on brain
void sparkles(int w) {
  //int x = 0;
  //int y = 0;
  fill(255);
  for (int i = 140; i < 440; i +=10) {
    //fill
    ellipse(i, 500 + random(130), w, w);
  }
}
//white thought-bubbles to encase math problems
void bubble(float bubbleX) {
  //int bubbleX = 680;//bubble x position
  fill(255, 240);
  //main bubble
  ellipse(bubbleX - 120, 150, 260, 260);
  ellipse(bubbleX + 120, 150, 260, 260);
  ellipse(bubbleX, 150, 300, 300);
  ellipse(bubbleX - 220, 150, 160, 160);
  ellipse(bubbleX + 220, 150, 160, 160);
  //smaller bubbles
  ellipse(map(bubbleX, 290, 310, 298, 302), 400, 60, 40);
  ellipse(map(bubbleX, 290, 310, 295, 305), 340, 90, 60);
}
//in draw statement: when the mouse is pressed, 2 random integers (0-5) will be generated,the sum of them assigned to num3
//These integers will be passed through the function smarts, and then digit, which uses 3 parameters:
//one for the number, the other two for the x and y position
//with void keyPressed, math problem graphics are immediately covered up by white background looping
//changed to normal function, random numbers ctrled by if(keyPressed) statement instead
void smarts(int num1, int num2, float x1) {
  //PLUS AND EQUAL SIGNS
  fill(0, 240);
  noStroke();
  rect(x1+130, 115, 20, 70);
  rect(x1+105, 140, 70, 20);
  rect(x1+325, 125, 70, 20);
  rect(x1+325, 155, 70, 20);
  int y = 100; //height of all digits
  //int x1 = 40; //first digit pos
  float x2 = x1 + 220; //second digit pos
  float x3 = x1 + 440; //sum pos
  //int num1 = int(random(1, 6));
  //int num2 = int(random(1, 6));
  int num3 = num1 + num2;
  digit(num1, x1, y); //call the function digit for the two numbers as well as their sum, all in different positions
  digit(num2, x2, y);
  digit(num3, x3, y);
  println(num1); //print the numbers to console to double check 
  println(num2);
  println(num3);
}
//digits function uses the num 1,2,3 and x,y positions as parameters 
void digit(int number, float xpos, float ypos) {
  //cchanged from if to switch to determine which number function is going to be called
  switch(number) {
  case 1:
    one(xpos, ypos);
    break;
  case 2:
    two(xpos, ypos);
    break;
  case 3:
    three(xpos, ypos);
    break;
  case 4:
    four(xpos, ypos);
    break;
  case 5:
    five(xpos, ypos);
    break;
  case 6:
    six(xpos, ypos);
    break;
  case 7:
    seven(xpos, ypos);
    break;
  case 8:
    eight(xpos, ypos);
    break;
  case 9:
    nine(xpos, ypos);
    break;
  case 10:
    ten(xpos, ypos);
    break;
  }
}
//all number shape functions
void one(float x, float y) {
  fill(60, 40, 255);
  rect(x + 30, y, 30, 100);
  rect(x + 15, y, 15, 20);
}
void two(float x, float y) {
  fill(40, 130, 230);
  rect(x, y, 80, 20);
  rect(x + 60, y, 20, 60);
  rect(x, y + 40, 80, 20);
  rect(x, y + 40, 20, 60);
  rect(x, y + 80, 80, 20);
}
void three(float x, float y) {
  fill(50, 255, 240);
  rect(x + 60, y, 20, 100);
  rect(x, y, 80, 20);
  rect(x + 5, y + 40, 75, 20);  
  rect(x, y + 80, 80, 20);
}
void four(float x, float y) {
  fill(25, 230, 80);
  rect(x - 10, y, 20, 60);
  rect(x - 10, y + 40, 80, 20);
  rect(x + 60, y, 20, 100);
}
void five(float x, float y) {
  fill(170, 255, 105);
  rect(x, y, 80, 20);
  rect(x, y, 20, 60);
  rect(x, y + 40, 80, 20);
  rect(x + 60, y + 40, 20, 60);
  rect(x, y + 80, 80, 20);
}
void six(float x, float y) {
  fill(25, 255, 125);
  rect(x, y, 90, 20);
  rect(x, y, 20, 100);
  rect(x, y + 40, 80, 20);
  rect(x + 70, y + 40, 20, 60);
  rect(x, y + 80, 80, 20);
}
void seven(float x, float y) {
  fill(75, 232, 20);
  rect(x - 10, y, 90, 20);
  rect(x + 60, y, 20, 100);
}
void eight(float x, float y) {
  fill(255, 255, 40);
  rect(x, y, 80, 20);
  rect(x + 70, y, 20, 100);
  rect(x, y + 40, 80, 20);
  rect(x, y, 20, 100);
  rect(x, y + 80, 80, 20);
}
void nine(float x, float y) {
  fill(230, 180, 10);
  rect(x, y, 80, 20);
  rect(x + 70, y, 20, 100);
  rect(x, y + 40, 80, 20);
  rect(x, y, 20, 60);
  rect(x, y + 80, 80, 20);
}
void ten(float x, float y) {
  fill(255, 175, 90);
  rect(x, y, 30, 100);
  rect(x - 15, y, 15, 20);
  //zero
  rect(x + 40, y, 80, 20);
  rect(x + 100, y, 20, 100);
  rect(x + 40, y, 20, 100);
  rect(x + 40, y + 80, 80, 20);
}
