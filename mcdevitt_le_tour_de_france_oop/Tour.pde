

class Tour
{
// properties

    int year;
    int n_etape;
    String country;
    Stage[] etape_;

// constructors

    Tour(){}
    
    Tour(int year, int n_etape, String country, Stage[] etape_)
    {
        this.year = year;
        this.n_etape = n_etape;
        this.country = country;
        this.etape_ = etape_;
    }

// general methods
 
    void begin(){}
    void end(){}
    
    int realize()
    {
        int stg_ok = 0;
        int msec;
        
        background(30);
        france_.display_outline();
        france_.display_cities();
        
       
        while (stage_now < n_etape-1)
        {
            msec = millis();
            stg_ok = etape_[stage_now].realize(year, stage_now, color(tour_yellow), 1);
            if (stg_ok == 1)
            {
               stage_now++;
            }
            stg_ok = 0;  
        }
        return 1;
    }
    
// setters and getters (mutators and accessors)

    void set_year(int year){this.year = year;}
    
    int get_year() {return year;}
    int get_n_etape() {return n_etape;}

}