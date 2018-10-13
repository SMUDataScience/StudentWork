void drawTable() {
  background(255);
  line(0,headerHeight,width,headerHeight);  // header
  //textFont(f, 12);
  fill(0);
  text("Symbol", symbolX, 30);
  text("Name", nameX, 30);
  text("Last Sale", lastX, 30);
  text("IPO Year", ipoX, 30);
  text("Sector", sectorX, 30);
  text("Industry", industryX, 30);
  
  // Iterate thru string array and populate on-screen table
  String [] sym = tickTable.getStringColumn("Symbol");
  String [] nam = tickTable.getStringColumn("Name");
  String [] sal = tickTable.getStringColumn("LastSale");
  String [] ipo = tickTable.getStringColumn("IPOyear");
  String [] sec = tickTable.getStringColumn("Sector");
  String [] ind = tickTable.getStringColumn("Industry");
  for (int i=0; i<tickTable.getRowCount(); i++) {
    int y = headerHeight + 20 + i * spacing;
    text(sym[i], symbolX, y);
    text(nam[i], nameX, y);
    text(sal[i], lastX, y);
    text(ipo[i], ipoX, y);
    text(sec[i], sectorX, y);
    text(ind[i], industryX, y);
  }
}
