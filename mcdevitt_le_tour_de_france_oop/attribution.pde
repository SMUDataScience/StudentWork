

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* ...    give credit where credit is due
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */


String credit1 = "* - crank icon by Oleksandr Panasovskyi from the Noun Project";
String credit2 = "* - and much thanks to Bastien Lardeux for sharing a nice dataset";

void attribution()
{
PFont f_body;
f_body = createFont("Ubuntu", 12, true);
smooth();
    
    textFont(f_body);
    textAlign(LEFT);
    textLeading(0);
    fill(50);
    text(credit1, width/20, 19*height/20);
    text(credit2, width/20, 19*height/20+14);

}