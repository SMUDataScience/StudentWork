void drawCages() {
  float pinLocation = TWO_PI / 10;
  
    for (float i = 0; i < 30; i++){
  pushMatrix();
  rotate(pinLocation * i); //move one 1 unit per second
  rotate(radians(r));
  //rotate(radians(pinLocation * i));
  //Cages
  rect(x, 0, spacing/2, spacing/2 + len);
  y = y + spacing;
  popMatrix();
   }
}
