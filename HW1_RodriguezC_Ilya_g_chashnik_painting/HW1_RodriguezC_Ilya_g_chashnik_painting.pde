
/**
Ilya_g_chashnik_painting1
*/

PImage paintingSMALL;
import processing.pdf.*;


void setup() {
  size(400,617);
  //paintingSMALL = loadImage("paintingSMALL.jpg");
  //background(0,0,0);

}


void draw() {
 
  background(0);
 //image(paintingSMALL,0,0);

stroke(125,26,20);
strokeWeight(4.5);
line(103,134,90,115);

 //white lines
stroke(240,240,238);
strokeWeight(3.0);
line(308,345,388,462);

//middle cream line
stroke(223,221,195);
strokeWeight(8.0);
line(188,402,252,354);

//light brown line
stroke(89,36,20);
strokeWeight(10.0);
beginShape();
vertex(97,1);
vertex(399,453);
endShape();  

//middle of circle line under middle \ lines
stroke(215,213,218); //cream
strokeWeight(16.0);
line(91,258,169,202);
stroke(202,174,127); //white
strokeWeight(13.0);
line(25,295,230,148);
stroke(120,0,11); //red
strokeWeight(6.0);
line(109,260,156,224);
stroke(23,58,90); //dark blue
strokeWeight(7.0);
line(55,247,177,163);
stroke(81,143,166); //blue
strokeWeight(25.0);
line(48,235,156,159);
stroke(221,206,185); //cream
strokeWeight(18.0);
line(47,210,115,162);


//under circle white lines
stroke(219,221,220);
strokeWeight(13.0);
line(0,299,399,18);

//brown line
stroke(63,40,26);
strokeWeight(15.0);
beginShape();
vertex(0,411);
vertex(400,132);
endShape();  

//center circle white lines
stroke(220,215,196);
strokeWeight(5.0);
line(168,241,220,314);

//center circle blue lines
stroke(40,65,96);
strokeWeight(5.0);
line(172,257,213,316);

//center circle white line
stroke(220,215,196);
strokeWeight(20.0);
strokeCap(PROJECT);
beginShape(LINES);
vertex(-10, 35);
vertex(396,616);
endShape(); 

//cream line
stroke(216,191,150);
strokeWeight(20.0);
beginShape(LINES);
vertex(385,616);
vertex(30,119);
endShape();  

//under circle white lines
stroke(219,221,220);
strokeWeight(13.0);
line(101,227,125,211);

//bottom right wheel right side
//cream line
stroke(234,230,221);
strokeWeight(10.0);
line(283,413,373,544);

//off gray line
stroke(225,226,228);
strokeWeight(10.0);
line(306,431,369,522);

//red line
stroke(162,25,19);
strokeWeight(4.0);
line(328,451,361,499);

//white line
stroke(238,238,236);
strokeWeight(9.0);
line(341,442,370,479);

 //gray line
stroke(198,200,197);
strokeWeight(10.0);
beginShape(LINES);
vertex(396,590);
vertex(259,395);
endShape(); 


//bottom left (unnder dark gray/blue lines
  //cream
stroke(234,230,221);
strokeWeight(7.0);
line(184,476,206,504);

  //white
stroke(225,220,214);
strokeWeight(5.0);
line(172,482,195,515);

  //blue
stroke(43,104,159);
strokeWeight(5.0);
line(156,486,192,535);

  //red 1
stroke(162,25,19);
strokeWeight(5.0);
line(141,508,174,552);

  //red 2
stroke(162,25,19);
strokeWeight(5.0);
line(126,517,164,566);

//white line (left side wheel)
stroke(212,222,224);
strokeWeight(18.0);
line(228,430,351,602);

//blue line (left side wheel)
stroke(39,59,122);
strokeWeight(5.0);
line(225,410,366,611);

//cream line (left side wheel)
stroke(223,211,195);
strokeWeight(10.0);
line(247,477,314,571);

//cream line (left side wheel)
stroke(223,211,195);
strokeWeight(8.0);
line(240,514,289,581);

//bottom left top layer
//dark gray line
stroke(127,128,123);
strokeWeight(15.0);
beginShape();
vertex(397,342);
vertex(31,616);
endShape();  

//bottom right bottom layer
//short white line
stroke(255,243,219);
strokeWeight(5.0);
line(383,422,397,443);


//bottom right top layer
//blue line
stroke(43,104,159);
strokeWeight(7.5);
beginShape();
vertex(154,616);
vertex(399,433);
endShape();  

//tiny triangle
stroke(226,216,214);
triangle(169,354,172,355,171,356);

//upper left lines off circle
stroke(213,196,144);
strokeWeight(5.0);
line(49,68,64,90);
stroke(226,221,199);
strokeWeight(5.0);
line(60,64,73,83);
stroke(220,218,206);
strokeWeight(10.0);
line(10,167,105,96);
stroke(140,0,3);
strokeWeight(4.0);
line(129,22,179,94);
stroke(72,8,9);
strokeWeight(4.0);
line(143,15,150,25);
stroke(198,184,175);
strokeWeight(2.0);
line(224,38,238,57);
stroke(201,144,125);
strokeWeight(4.0);
line(302,60,319,47);
stroke(85,21,11);
strokeWeight(4.0);
line(322,20,338,7);

//top left top layer
//red donut 
stroke(157,2,0);
strokeWeight(32);
noFill();
ellipse(170,200,270,280 );

//blue filled circle
stroke(16,50,113);
fill(16,50,113);
ellipse(80,460,50,50);
 
 //small red lines
stroke(162,25,19);
strokeWeight(5.0);
line(325,311,352,353);

stroke(162,25,19);
strokeWeight(5.0);
line(318,277,342,315);

stroke(162,25,19);
strokeWeight(5.0);
line(317,109,330,99);

stroke(162,25,19);
strokeWeight(5.0);

save("code_picture.jpg");
  }
  
