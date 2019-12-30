

class Stage
{
// properties

    int year;
    int ietape;
    City depart_;
    City arrivee_;
    float distance;
    String winner;

// constructors

    Stage(){}
    
    Stage(int year, int ietape, City depart_, City arrivee_, float distance, String winner)
    {
        this.year = year;
        this.ietape = ietape;
        this.depart_ = depart_;
        this.arrivee_ = arrivee_;
        this.distance = distance;
        this.winner = winner;
    }

// general methods
 
    int realize(int ian, int iet, color clr, int lwidth)
    {
    float[] p = new float[2];
    float[] q = new float[2];
    float x1, x2, y1, y2;
    float paris_lat = 46;
    float paris_lon = 2.5;
    float z1, z2;
 
        
        p[0] = depart_.lat;
        p[1] = arrivee_.lat;
        
        q[0] = depart_.lon;
        q[1] = arrivee_.lon;

        x1 = gps_2_sketch(1, q[0]);
        y1 = gps_2_sketch(0, p[0]);
        x2 = gps_2_sketch(1, q[1]);
        y2 = gps_2_sketch(0, p[1]);
        z1 = gps_2_sketch(1, paris_lon);
        z2 = gps_2_sketch(0, paris_lat);
    
        noFill();
        
/* ... departure city */

        strokeWeight(3);
        stroke(100);
        ellipse(x1, y1, 5, 5);
        
/* ...    connnective curve        */ 

        strokeWeight(lwidth);
        stroke(clr);
//        curveTightness(0);
        curve(z1, z2, x1, y1, x2, y2, z1, z2);
        
/* ...    arrival city            */

        strokeWeight(3);
        stroke(100);
        ellipse(x2, y2, 5, 5);
        
        return 1;
    }
    
// setters and getters (mutators and accessors)

    void set_distance(float distance){this.distance = distance;}
    float get_distance() {return distance;}

    void set_winner(String winner){this.winner = winner;}
    String get_winner() {return winner;}
}