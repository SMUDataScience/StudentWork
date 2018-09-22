void drawPinWheel(){
  float pinLocation = TWO_PI / numPins;
  for (float i = 0; i < numPins; i++){
    pushMatrix();
    noStroke();
    rotate(pinLocation * i);
    rect(-pinWidth/2, 0, pinWidth, pinLength);
    popMatrix();
  }
}
