//Cole Miller

//Lab Assignment 5

//Code assistance used from ButtonExample1 and ButtonExample2



float rectX = 50;

float rectY = 350;

float rectW = 120;

float rectH = 70;

int ellipX = 370; 

int ellipY = 380; 

int ellipSize = 90;

int dimension, quadrant; 

//These variables will be used for saving ellipses pos. and colors if background is redrawn

int rP2, gP2, bP2, rP3, gP3, bP3, rP4, gP4, bP4; 

float rX1, rX2, rX3, rY1, rY2, rY3, rS1, rS2, rS3;

//Ellipse random positions

float randX, randY, randSize = 0; 

color r, g, b, rP, gP, bP, rect, ellip;

boolean rectWhite = true; 

boolean ellipWhite = true; 

boolean drawPlanet, drawBackground;

//Strings that house text for the text in the draw function 

String rectText = "Click me to change";

String rectText2 = "the background!"; 

String circleText = "Click me to"; 

String circleText2 = "draw new"; 

String circleText3 = "planets!";

String dimensionText = "The current dimension is: Dimension"; 

String quadrantText = "Quadrant"; 

void setup(){

  background (50); 

  size (500, 500);

  rect = 255; 

  ellip = 255; 

} 



void draw (){ 

  stroke(0); 

  strokeWeight(2);

  fill (rect);

  rect (rectX, rectY, rectW, rectH);

  fill (ellip); 

  ellipse(ellipX, ellipY, ellipSize, ellipSize);

  //Draw text on the screen for buttons

  fill (200, 0, 255); 

  text (rectText, 60, 380);

  text (rectText2, 65, 390);

  text (circleText, 340, 370); 

  text (circleText2, 345, 380);

  text (circleText3, 350, 390);

  //The text below displays the "dimension" that the user is currently in

  text (dimensionText, 50, 450); 

  text (dimension, 250, 450);

  text (quadrantText, 280, 450); 

  text (quadrant, 340, 450); 

  //Draw the background in a random color and redraw the previous ellipses

  if (drawBackground == true){

    colorBackground(); 

    background(r, g, b); 

    previousPlanets(); 

    drawBackground = false; 

  }

  

  //Draw the planets in a random color and size fashion

  if (drawPlanet == true){

    background (r, g, b); 

    colorPlanet();

    //Record the current color value of ellipse 1

    rP2 = rP; 

    gP2 = gP;  

    bP2 = bP; 

    randCoordinates();

    //Record the current pos value of ellipse 1

    rX1 = randX;

    rY1 = randY; 

    rS1 = randSize; 

    drawPlanet();

    colorPlanet();

    //Record the current color value of ellipse 2

    rP3 = rP; 

    gP3 = gP;  

    bP3 = bP;

    randCoordinates();

    //Record the current pos value of ellipse 2

    rX2 = randX;

    rY2 = randY; 

    rS2 = randSize;

    drawPlanet();

    colorPlanet();

    //Record the current color value of ellipse 3

    rP4 = rP; 

    gP4 = gP;  

    bP4 = bP;

    randCoordinates();

    //Record the current pos value of ellipse 3

    rX3 = randX;

    rY3 = randY; 

    rS3 = randSize;    

    drawPlanet();

    drawPlanet = false; 

  }

}



void mousePressed(){

  //If the mouse is within the boundaries of the rectangle, change color on click and draw new background

  if(mouseX > rectX && mouseX < rectX + rectW && mouseY > rectY && mouseY < rectY + rectH){

    if (rectWhite == true){

    rect = 150; 

    rectWhite = !rectWhite; 

    } else if (rectWhite == false){

    rect = 255; 

    rectWhite = !rectWhite; 

    }

    //Randomize quadrant number

    quadrant = round(random(10));

    drawBackground = true; 

    println ("Mouse Clicked Rectangle"); 

  }  

  //If the mouse is within the boundaries of the ellipse, change color on click and draw new planets

  else if (inCircle (ellipX, ellipY, ellipSize)){

    if (ellipWhite == true){

    ellip = 150; 

    ellipWhite = !ellipWhite; 

    } else if (ellipWhite == false){

    ellip = 255; 

    ellipWhite = !ellipWhite; 

    }

    //Randomize dimension number

    dimension = round(random(1000));

    drawPlanet = true; 

    println ("Mouse Clicked Circle");

  }

}



//This entire function returns a true or false value, which is used in the mouse pressed function

boolean inCircle (int x, int y, int diameter) {

  //Determine the distance between the determined "x" value, which will be ellipse x pos

  //and the "y" value, which will be the ellipse y pos

  float disX = x - mouseX;

  float disY = y - mouseY;

  //Pythagorean Theorem to find if mouse is inside the ellipse or not

  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {

    return true;

  } else {

    return false;

  }

}



//Use this function to randomly color background

void colorBackground () {

  r = round(random(255)); 

  g = round(random(255)); 

  b = round(random(255));   

}



//Use this funciton to give random unit to ellipse's color

void colorPlanet () {

  rP = round(random(255)); 

  gP = round(random(255)); 

  bP = round(random(255));   

}



void randCoordinates (){

  //Randomize coordinates so planets could go past screen but never 

  //interfere with ellipse and rectangle buttons

  randX = round(random(600)); 

  randY = round(random(200)); 

  randSize = round(random(150));

}



//Draw a random colored and positioned ellipse

void drawPlanet () {

 fill (rP, gP, bP); 

 stroke (0); 

 strokeWeight (2); 

 ellipse(randX, randY, randSize, randSize); 

}



//Use this funciton to redraw the previous ellipses

void previousPlanets () {

 stroke (0); 

 strokeWeight (2); 

 fill (rP2, gP2, bP2); 

 ellipse(rX1, rY1, rS1, rS1);

 fill (rP3, gP3, bP3);

 ellipse(rX2, rY2, rS2, rS2);

 fill (rP4, gP4, bP4); 

 ellipse(rX3, rY3, rS3, rS3); 

}
