void dataProcessing() {
  for(int i=0; i < int(rawData2.length); i++) {
  String[] thisRow = split(rawData2[i], ","); //separates each feature at " ," from the csv file

  //printArray(thisRow);
   
  if(thisRow[0].contains("Technology")) {
    TechnologySale += float(thisRow[2]);
    
  } else if(thisRow[0].contains("Basic Industries")) {
    BasicIndustriesSales += float(thisRow[2]);
    
  } else if(thisRow[0].contains("Health Care")) {
    HealthCareSales += float(thisRow[2]);
    
  } else if(thisRow[0].contains("Public Utilities")) {
    PublicUtilitiesSales += float(thisRow[2]);
    
  } else {
  println("ERROR");
  }
  
}
  
  println(TechnologySale);
  println(BasicIndustriesSales);
  println(PublicUtilitiesSales);
  println(HealthCareSales);
  println(OtherSales);
  println(LastSaleTotal);

  }
