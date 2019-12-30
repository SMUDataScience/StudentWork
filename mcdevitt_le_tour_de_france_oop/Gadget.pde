

class Crank
{
// properties

    PImage crank_img;
    int decade;

// constructors

    Crank(){}
    
    Crank(PImage crank_img, int decade)
    {
        this.crank_img = crank_img;
        this.decade = decade;
    }

// general methods
    
    void update(int decade)
    {
    int x = width/6;
    int y = height/5;
    float ang, deg;
      
        deg = (decade - 1) * 360 / 12;
        ang = deg * PI / 180;
         
        pushMatrix();
            translate(x, y);  
                face();
            rotate(ang);
                image(crank_img, 0, 0);
        popMatrix();
    }
    
    void face()
    {
    float x, y;
    
        for(int i = 0; i < 12; i++)
        {
            x = width/12 * cos(float(i) / 12 * 2 * PI);
            y = width/12 * sin(float(i) / 12 * 2 * PI);
            ellipse(x, y, 15, 15);
        }   
    }
    
}