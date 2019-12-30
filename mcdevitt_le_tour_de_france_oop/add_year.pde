
    
    
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* displays year in upper right display
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */


void add_year(int an)
{
PFont f_title, f_body, f_logo_1, f_logo_2;
f_title = createFont("Ubuntu", 24, true);
f_body = createFont("Ubuntu", 14, true);
f_logo_1 = createFont("Ubuntu", 50, true);
f_logo_2 = createFont("Ubuntu", 45, true);

smooth();
    
    textFont(f_logo_1);
    textAlign(CENTER);
    textLeading(0);
    fill(90);
    text(str(an), 7*width/8, height/10);

}