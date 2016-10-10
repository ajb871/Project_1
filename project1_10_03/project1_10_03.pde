//CHANGE COLORS TO BETTER "BRIGHT" THEME
//animated background that cycles through shades of yellow?

//adjective I'm using: BRIGHT
//head and brain, with functions that will do basic math problems above it
//background pattern with stars
//add animated suns & "bright" shapes in draw
//eyes animated by mousePosition
int a = 40; //variable for length of array
int [] x = new int[a]; //arrays for x and y positions
int [] y = new int[a];
float random1; //two values for calling "smarts()" function
float random2;

void setup() {
  size(1000, 700); //extended canvas width
  //frameRate(30);
}

void draw() {
  //will add more animations
  //pattern();
  background(240, 210, 0);
  bubble();
  trail();
  head(); //function call for head shapes
  if (keyPressed) {  //when keyisPressed, generates the random #'s for digit();
    random1 = random(1, 6);
    random2 = random(1, 6);
  }
  smarts(int(random1), int(random2));
}
void head() {
  ////HEAD
  strokeWeight(9);
  stroke(180, 130, 90);
  fill(50);
  ellipse(300, 625, 400, 400); //black ellipse
  fill(180, 130, 90);
  rect(100, 625, 400, 200); //brown rect
  noStroke();
  fill(50);
  rect(105, 620, 391, 28); //black rect
  //brain
  fill(255, 130, 170);
  ellipse(300, 550, 270, 170);
  ellipse(180, 600, 110, 70);
  ellipse(160, 550, 50, 50);
  ellipse(420, 550, 80, 60);
  ellipse(400, 600, 90, 70);
  ellipse(440, 590, 50, 50);
  ellipse(230, 620, 70, 50);
  ellipse(310, 600, 120, 90);
  ellipse(200, 510, 80, 80);
  ellipse(400, 510, 80, 50);
  ellipse(260, 480, 80, 80);
  ellipse(260, 480, 80, 80);
  ellipse(320, 480, 80, 70);
  ellipse(370, 490, 80, 80);
  //eyes
  fill(255);
  ellipse(200, 700, 130, 100);
  ellipse(400, 700, 130, 100);
  //pupils
  fill(50);
  //************pupils go slighty out of eyewhites***************
  float pupil1 = map(mouseX, 0, 1000, 185, 215); //pupil left&right position tracked by map mouseX
  float pupil2 = map(mouseX, 0, 1000, 385, 415);
  int pupilY = 678; //y value of pupils
  ellipse(pupil1, pupilY, 60, 60);
  ellipse(pupil2, pupilY, 60, 60);
  fill(255);
  ellipse(pupil1 + 15, pupilY - 18, 10, 10);//pupil details
  ellipse(pupil2 + 15, pupilY - 18, 10, 10);//pupil details
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
    strokeWeight(2);
    int starA = 3; //width and height of this + shape
    //first line displaced by -10
    line(x[i] + i - 10, y[i] + i, x[i] + i - 10, y[i] + starA + i);
    line(x[i] - starA/2 + i - 10, y[i] + starA/2 + i, x[i] + starA/2 + i - 10, y[i] + starA/2 + i);
    int starB = 6;
    line(x[i] + i/2, y[i] + i/2, x[i] + i/2, y[i] + starB + i/2);
    line(x[i] - starB/2 + i/2, y[i] + starB/2 + i/2, x[i] + starB/2 + i/2, y[i] + starB/2 + i/2);
    int starC = 2;
    line(x[i] + i/3 - 10, y[i] + i/3 + 10, x[i] + i/3 - 10, y[i] + starC + i/3 + 10);
    line(x[i] - starC/2 + i/3 - 10, y[i] + starC/2 + i/3 + 10, x[i] + starC/2 + i/3 - 10, y[i] + starC/2 + i/3 + 10);
  }
  //for statement to draw the "glitter"
  /*for (int i = 0; i < a; i++) {
   fill(0, 100);
   float ranInt3 = 0;
   quad(x[i] + ranInt3, y[i] + ranInt3, (x[i] - i/8) + ranInt3, y[i] - i/4 + ranInt3, x[i] + ranInt3, y[i] - i/2 + ranInt3, x[i] + i/8 + ranInt3, y[i] - i/4 + ranInt3);
   float ranInt2 = 5;
   quad(x[i] + ranInt2, y[i] + ranInt2, (x[i] - i/8) + ranInt2, y[i] - i/4 + ranInt2, x[i] + ranInt2, y[i] - i/2 + ranInt2, x[i] + i/8 + ranInt2, y[i] - i/4 + ranInt2);
   //quad(x[i] + ranInt2, y[i] + ranInt2, (x[i] - i/8) + ranInt2, y[i] - i/4 + ranInt2, x[i] + ranInt2, y[i] - i/2 + ranInt2, x[i] + i/8 + ranInt2, y[i] - i/4 + ranInt2);
   float ranInt = 10;
   quad(x[i] + ranInt, y[i] + ranInt, (x[i] - i/4) + ranInt, y[i] - i/8 + ranInt, x[i] + ranInt, y[i] - i/4 + ranInt, x[i] + i/4 + ranInt, y[i] - i/8 + ranInt);
   }
   */
}
//function for "pattern", will probably change
/*void pattern() {
 background(240, 210, 0);
 for (int x = 0; x < 1200; x += 20) {
 for (int y = 0; y < 660; y += 20) {
 noStroke();
 fill(120);
 ellipse(x, y, 20, 22);
 }
 }
 }
 */

//white thought-bubbles to encase math problems
void bubble() {
  int bubbleX = 680;//bubble x position
  fill(255);
  //main bubble
  ellipse(bubbleX - 120, 150, 260, 260);
  ellipse(bubbleX + 120, 150, 260, 260);
  ellipse(bubbleX, 150, 300, 300);
  ellipse(bubbleX - 220, 150, 160, 160);
  ellipse(bubbleX + 220, 150, 160, 160);
  //smaller bubbles
  ellipse(450, 410, 90, 70);
  ellipse(550, 340, 120, 90);
}
//in draw statement: when the mouse is pressed, 2 random integers (0-5) will be generated,the sum of them assigned to num3
//These integers will be passed through the function smarts, and then digit, which uses 3 parameters:
//one for the number, the other two for the x and y position
//with void keyPressed, math problem graphics are immediately covered up by white background looping
//changed to normal function, random numbers ctrled by if(keyPressed) statement instead
void smarts(int num1, int num2) {
  //fill(240, 210, 0);
  //rect(40, 100, 530, 100); //replaced by thought bubble
  //PLUS AND EQUAL SIGNS
  fill(0);
  rect(560, 115, 20, 70);
  rect(535, 140, 70, 20);
  rect(735, 125, 70, 20);
  rect(735, 155, 70, 20);
  int y = 100; //height of all digits
  int x1 = 430; //first digit pos
  int x2 = 630; //second digit pos
  int x3 = 830; //sum pos
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
void digit(int number, int xpos, int ypos) {
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
void one(int x, int y) {
  fill(230, 210, 0);
  rect(x + 30, y, 30, 100);
  rect(x + 15, y, 15, 20);
}
void two(int x, int y) {
  fill(255, 140, 0);
  rect(x, y, 80, 20);
  rect(x + 60, y, 20, 60);
  rect(x, y + 40, 80, 20);
  rect(x, y + 40, 20, 60);
  rect(x, y + 80, 80, 20);
}
void three(int x, int y) {
  fill(60, 70, 255);
  rect(x + 60, y, 20, 100);
  rect(x, y, 80, 20);
  rect(x + 5, y + 40, 75, 20);  
  rect(x, y + 80, 80, 20);
}
void four(int x, int y) {
  fill(10, 235, 20);
  rect(x - 10, y, 20, 60);
  rect(x - 10, y + 40, 80, 20);
  rect(x + 60, y, 20, 100);
}
void five(int x, int y) {
  fill(160, 20, 255);
  rect(x, y, 80, 20);
  rect(x, y, 20, 60);
  rect(x, y + 40, 80, 20);
  rect(x + 60, y + 40, 20, 60);
  rect(x, y + 80, 80, 20);
}
void six(int x, int y) {
  fill(210, 0, 120);
  rect(x, y, 90, 20);
  rect(x, y, 20, 100);
  rect(x, y + 40, 80, 20);
  rect(x + 70, y + 40, 20, 60);
  rect(x, y + 80, 80, 20);
}
void seven(int x, int y) {
  fill(205, 0, 180);
  rect(x - 10, y, 90, 20);
  rect(x + 60, y, 20, 100);
}
void eight(int x, int y) {
  fill(170, 0, 200);
  rect(x, y, 80, 20);
  rect(x + 70, y, 20, 100);
  rect(x, y + 40, 80, 20);
  rect(x, y, 20, 100);
  rect(x, y + 80, 80, 20);
}
void nine(int x, int y) {
  fill(105, 0, 200);
  rect(x, y, 80, 20);
  rect(x + 70, y, 20, 100);
  rect(x, y + 40, 80, 20);
  rect(x, y, 20, 60);
  rect(x, y + 80, 80, 20);
}
void ten(int x, int y) {
  fill(45, 0, 200);
  rect(x, y, 30, 100);
  rect(x - 15, y, 15, 20);
  //zero
  rect(x + 40, y, 80, 20);
  rect(x + 100, y, 20, 100);
  rect(x + 40, y, 20, 100);
  rect(x + 40, y + 80, 80, 20);
}

