

class Country
{
// properties

    int id;
    String name;
    Table outline;
    Table cities;

// constructors

    Country(){}
    
    Country(int id, String name, Table outline, Table cities)
    {
        this.id = id;
        this.name = name;
        this.outline = outline;
        this.cities = cities;
    }

// general methods
 
    void display_outline()
    {
        float[] p = new float[2];
        float[] q = new float[2];
        float x1, x2, y1, y2;
    
/* ...    outline map                    */

        for (int ipt = 0; ipt < n_france_rows-1; ipt++)
        {   
                p[0] = outline.getFloat(ipt, 2);
                p[1] = outline.getFloat(ipt+1, 2);
                
                q[0] = outline.getFloat(ipt, 1);
                q[1] = outline.getFloat(ipt+1, 1);
                
                x1 = gps_2_sketch(1, q[0]);
                y1 = gps_2_sketch(0, p[0]);
                x2 = gps_2_sketch(1, q[1]);
                y2 = gps_2_sketch(0, p[1]);
                
                strokeWeight(1);
                stroke(80);
                noFill();
                
                line(x1, y1, x2, y2);
        }
    }

/* ...   city display method            */

    void display_cities()
    {
        float p, q;
        float x1, y1;
    
/* ...    outline map                    */

        for (int ivl = 0; ivl < n_villes_d_etapes-1; ivl++)
        {   
            p = cities.getFloat(ivl, 2);
            q = cities.getFloat(ivl, 3);
    
            x1 = gps_2_sketch(1, q);
            y1 = gps_2_sketch(0, p);
    
            strokeWeight(1);
            stroke(60, 60, 60);
            noFill();
    
            ellipse(x1, y1, 2, 2);
        }

    }

    
// setters and getters (mutators and accessors)

    void set_name(String name){this.name = name;}
    String get_name() {return name;}
}