//Our interpretation of a Ferris Wheel= https://www.youtube.com/watch?v=x6--fV2rFog 
//pinwheel ints
float numPins = 12;
float pinWidth = 6;
float pinLength = 200;
float spinSpeed = 0.3;
float maxSpinSpeed = 10;
float r = 0;
float x = -205;
float y = 0;
float len = 10;
float spacing = 10;

void setup() {
  size(600, 600);

  ellipseMode(CENTER);
  rectMode(CENTER);
  drawCages();
  drawCenter(10);
}

//CenterPinWheel
void drawCenter(float pinCenter){
  
  pushMatrix();
  noStroke();

  ellipse(0, 0, pinCenter, pinCenter);
  popMatrix();
}


void draw() { 
  background(150);
  
  pushMatrix();
  translate(width/2, height/2);
  fill(255,69,0);
  rotate(radians(r));
  drawPinWheel();
    if (spinSpeed < maxSpinSpeed) {
      spinSpeed += 0.025;
      
    }
    if (spinSpeed > maxSpinSpeed) {
      spinSpeed += (maxSpinSpeed * -random(2,4));
      
  
    }
  r += spinSpeed;
  popMatrix();
  
  stroke(255,0,0);
  strokeWeight(5);
  translate(width/2, height/2); //call translate first
  
  pushMatrix();
  //rotate(radians(r)); //move one 1 unit per second
  noFill();
  
  //inner circle
  ellipse(0, 0, 200, 200); //outer circle with ride seats (3 enclosures between triangle
  r += 1;  
  popMatrix();

  stroke(50, 139, 203);
  strokeWeight(5);  
  pushMatrix();
  //rotate(radians(r)); //move one 1 unit per second
  
  //outer circle
  ellipse(0, 0, 410, 410);
  r += 1;
  popMatrix();


  
  stroke(116,0102,56);
  strokeWeight(5);
  pushMatrix();
  rotate(radians(-r)); //move one 1 unit per second
  //Star pattern between circles
  line(175, -100, 2, 2);
  line(175, 100, 2, 2);
  line(-175, 100, 2, 2);
  line(-175, -100, 2, 2);
  r += 1;
  popMatrix();
  
  
  drawCages();
  
  save("code_picture.jpg");
}
