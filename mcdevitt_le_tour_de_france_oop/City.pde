

class City
{
// properties

    int id;
    String name;
    float lon;
    float lat;

// constructors

    City(){}
    
    City(int id, String name, float lat, float lon)
    {
        this.id = id;
        this.name = name;
        this.lon = lon;
        this.lat = lat;
    }

// general methods
 
    void display(){}
    
// setters and getters (mutators and accessors)

    void set_lon(float lon){this.lon = lon;}
    float get_lon() {return lon;}

    void set_lat(float lat){this.lat = lat;}
    float get_lat() {return lat;}

    void set_name(String name){this.name = name;}
    String get_name() {return name;}
}