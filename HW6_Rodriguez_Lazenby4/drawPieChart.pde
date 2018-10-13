void drawPieChart() {
  stroke(2);

  //calculate the % of a grand total for each agency in radians
  float Tech = calcRadians(TechnologySale);
  float BI = calcRadians(BasicIndustriesSales);
  float PU = calcRadians(PublicUtilitiesSales);
  float HC = calcRadians(HealthCareSales);

  float currPos = 0;

  //draw an arc based on the % to our graph
  fill(255, 0, 0);
  arc(width-250, height/2, 400, 400, currPos, Tech) ;
  currPos += Tech;

  fill(0, 255, 0);
  arc(width-250, height/2, 400, 400, currPos, BI + currPos) ; 
  currPos += BI;

  fill(0, 0, 255);
  arc(width-250, height/2, 400, 400, currPos, PU + currPos) ; 
  currPos += PU;

  fill(50, 150, 300);
  arc(width-250, height/2, 400, 400, currPos, HC + currPos) ;
}
