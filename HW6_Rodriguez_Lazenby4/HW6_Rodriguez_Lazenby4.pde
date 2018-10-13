//NASDAQ company list: https://www.nasdaq.com/screening/company-list.aspx
//String url = "https://www.nasdaq.com/screening/companies-by-industry.aspx?exchange=NASDAQ";
//Symbol  Name  LastSale  MarketCap  ADR TSO  IPOyear  Sector  Industry  Summary Quote
//Table variables
PFont f;
Table rawData;
Table tickTable;
String fileName = "companylist.csv";
int headerHeight = 50;
int symbolX = 5;
int nameX = 80;
int lastX = 320;
int ipoX = 400;
int sectorX = 490;
int industryX = 640;
int spacing = 17;
boolean saveFile = false;

//Pie Chart varilables
String filename = "companylist_clean.csv";
String[] rawData2;
float thisRow = 0;
float LastSaleTotal =0.0;
float TechnologySale=0.0;
float ConsumerServicesSales=0.0;
float BasicIndustriesSales=0.0;
float HealthCareSales=0.0;
float OtherSales=0.0;
float PublicUtilitiesSales=0.0;
float arcRadians;

void setup () {

  size(1500,600);
  
  //load data as a string for Pie chart
  rawData2 = loadStrings(filename);

  //load data as a table for show table
  f = createFont("Arial",18,true); // Arial, 16 point, anti-aliasing on
  
  // read in raw data from csv file in data folder
  rawData = new Table();
  rawData = loadTable(fileName, "header");
  println(rawData.getRowCount() + " total rows in table");
   
  // create table columns
  tickTable = new Table();
  tickTable.addColumn("Symbol");
  tickTable.addColumn("Name");
  tickTable.addColumn("LastSale");
  tickTable.addColumn("IPOyear");
  tickTable.addColumn("Sector");
  tickTable.addColumn("Industry");
  
  // create table columns 
  for (TableRow row : rawData.rows()) {
    TableRow newRow = tickTable.addRow();
    newRow.setString("Symbol", row.getString("Symbol"));
    newRow.setString("Name", row.getString("Name"));
    newRow.setString("LastSale", row.getString("LastSale"));
    newRow.setInt("IPOyear", row.getInt("IPOyear"));
    newRow.setString("Sector", row.getString("Sector"));
    newRow.setString("Industry", row.getString("Industry"));
  } 
  

  drawEverything(); //function that runs all the drawXXX tabs
  
  if (saveFile) {
  saveTable(tickTable, "ProcessedList.csv");  // export table
 
  }

}

//Pie Chart - identify radians
//draw arc based on % to our grph
//f = x% of grandTotal
float calcRadians(float f) {
  float TotalSales = (TechnologySale + BasicIndustriesSales + PublicUtilitiesSales + HealthCareSales);
  float percentage = (f / TotalSales) * 100;
  float arcPercent = (percentage / 100) * 360;
  float arcRadians = radians(arcPercent);
  return arcRadians; 
}
