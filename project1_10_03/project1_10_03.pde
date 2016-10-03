//adjective I'm using: BRIGHT
//head and brain, with functions that will do basic math problems above it
//background pattern with stars
//add animated suns & "bright" shapes in draw
//eyes animated by mousePosition

void setup() {
  size(600, 700);
  background(240, 210, 0);
}

void draw() {

  //will add more animations
  head(); //function call for head shapes
}

void head() {
  ////HEAD
  strokeWeight(9);
  stroke(180, 130, 90);
  fill(0);
  ellipse(300, 625, 400, 400); //black ellipse
  fill(180, 130, 90);
  rect(100, 625, 400, 200); //brown rect
  noStroke();
  fill(0);
  rect(105, 620, 391, 28); //black rect
  //brain
  fill(255, 150, 190);
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
  fill(0);
  float pupil1 = map(mouseX, 0, 600, 175, 225); //pupil left&right position tracked by mapped mouseX
  float pupil2 = map(mouseX, 0, 600, 375, 425);
  ellipse(pupil1, 675, 60, 50);
  ellipse(pupil2, 675, 60, 50);
}

//When the mouse is pressed, 2 random integers (0-5) will be generated, num1 and num2. the sum is assigned to num3
//These integers will be passed through the function digit, which uses 3 parameters:
//one for the number, the other two for the x and y position
void mousePressed() {
  fill(240, 210, 0);
  rect(0, 0, 600, 350);
  //PLUS AND EQUAL SIGNS
  fill(0);
  rect(180, 115, 20, 70);
  rect(155, 140, 70, 20);
  rect(355, 125, 70, 20);
  rect(355, 155, 70, 20);
  int y = 100; //height of all digits
  int x1 = 50; //first digit pos
  int x2 = 250; //second digit pos
  int x3 = 450; //sum pos
  int num1 = int(random(1, 6));
  int num2 = int(random(1, 6));
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
  //currently using if statements to determine which number function is going to be called
  if (number == 1) {
    one(xpos, ypos);
  }
  if (number == 2) {
    two(xpos, ypos);
  }
  if (number == 3) {
    three(xpos, ypos);
  }
  if (number == 4) {
    four(xpos, ypos);
  }
  if (number == 5) {
    five(xpos, ypos);
  }
  if (number == 6) {
    six(xpos, ypos);
  }
  if (number == 7) {
    seven(xpos, ypos);
  }
  if (number == 8) {
    eight(xpos, ypos);
  }
  if (number == 9) {
    nine(xpos, ypos);
  }
  if (number == 10) {
    ten(xpos, ypos);
  }
}

//roman-numeral type numbers are placeholders for actual number shapes I will create in the future
void one(int x, int y) {
  fill(0);
  rect(x + 30, y, 30, 100);
  rect(x + 15, y, 15, 20);
}
void two(int x, int y) {
  fill(255);
  rect(x, y, 80, 20);
  rect(x + 60, y, 20, 60);
  rect(x, y + 40, 80, 20);
  rect(x, y + 40, 20, 60);
  rect(x, y + 80, 80, 20);
}
void three(int x, int y) {
  fill(100);
  rect(x + 60, y, 20, 100);
  rect(x, y, 80, 20);
  rect(x + 5, y + 40, 75, 20);  
  rect(x, y + 80, 80, 20);
}
void four(int x, int y) {
  fill(150);
  rect(x - 10, y, 20, 60);
  rect(x - 10, y + 40, 80, 20);
  rect(x + 60, y, 20, 100);
}
void five(int x, int y) {
  fill(10, 50, 70);
  rect(x, y, 80, 20);
  rect(x, y, 20, 60);
  rect(x, y + 40, 80, 20);
  rect(x + 60, y + 40, 20, 60);
  rect(x, y + 80, 80, 20);
}
void six(int x, int y) {
  fill(10, 50, 70);
  rect(x, y, 90, 20);
  rect(x, y, 20, 100);
  rect(x, y + 40, 80, 20);
  rect(x + 70, y + 40, 20, 60);
  rect(x, y + 80, 80, 20);
}
void seven(int x, int y) {
  fill(40, 85, 10);
  rect(x - 10, y, 90, 20);
  rect(x + 60, y, 20, 100);
}
void eight(int x, int y) {
  fill(20, 10, 80);
  rect(x, y, 80, 20);
  rect(x + 70, y, 20, 100);
  rect(x, y + 40, 80, 20);
  rect(x, y, 20, 100);
  rect(x, y + 80, 80, 20);
}
void nine(int x, int y) {
  fill(90, 50, 20);
  rect(x, y, 80, 20);
  rect(x + 70, y, 20, 100);
  rect(x, y + 40, 80, 20);
  rect(x, y, 20, 60);
  rect(x, y + 80, 80, 20);
}
void ten(int x, int y) {
  fill(10, 120, 0);
  rect(x, y, 30, 100);
  rect(x - 15, y, 15, 20);
  //zero
  rect(x + 40, y, 80, 20);
  rect(x + 100, y, 20, 100);
  rect(x + 40, y, 20, 100);
  rect(x + 40, y + 80, 80, 20);
}
