/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* ...  MSDS 6390 - Visualization of Information
/* ...
/* ...  Homework 7 - 01-mar-2018
/* ...
/* ...    patrick mcdevitt
/* ...
/* ...  le tour de france - 100 ans
/*
/* ...     develop with OOP
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
 
 
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* ...    This project provides a view of the history of the routes of
/* ...    the Tour de France. le Tour started in 1903, and has been contested
/* ...    every year since, excepting years during WWI and WWII. 2013 was
/* ...    the 100th edition of the race.
/* ...    - This visualization depicts the 
/* ...        route of each race from 1903 - 2013 superposed on a map of France.
/* ...    - A dashboard continuously updates to display the cumulative :
/* ...        distance covered, the number of starting and finishing racers, 
/* ...        the number of stages completed, and the nummber of years. Also
/* ...        displayed is the average speed for each year's race.
/* ...    - The crank rotates to indicate each succeeding decade (1900, 1910, ..)
/* ...        As this period spans 12 decades, the markers radially outward
/* ...        from the crank arm are arranged as a typical 12-hour clock.
/* ...    - User input includes the ability to select the decade to display,
/* ...        by mouse click in the area around the perimeter of the crank-clock.
/* ...    - Otherwise, the visualization begins in 1903 and successively displays
/* ...        each stage for each year in sequence. When 2013 route is completed
/* ...        the dynamic portion of the visualization stops. The user can
/* ...        re-start by selecting any decade from the crank-clock.
/* ...       
/* ...    - Data behind the scene :
/* ...
/* ...        - database of all stages (~2000) of each year with departure-arrival city pairs,
/* ...            the GPS coordinates of the cities (~715 in total),  stage distance,
/* ...            winners, leaders, average speed
/* ...            (data set provided by Bastien Lardeux, http://100ansdetour.fr/)
/* ...
/* ...        - .csv file with the GPS coordinates of the outline of France
/* ...            (extracted from R map() functions)
/* ...
/* ...        - data table that has starting values for dashboard for each decade
/* ...            (alllows to adapt to user input mouse click)
/* ...
/* ...        - image file for crank visual (downloaded from Noun Project, 
/* ...            icon by Oleksandr Panasovskyi), with some slight adaptations
/* ...            for this project
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* ...    Class Structure Definitions
/* ...
/* ...    Tour() - a collection of stage races, year, map boundary
/* ...    Stage() - a beginning, end, distance, winner
/* ...    City() - gps locations, future(population, facts, ..)
/* ...    Crank() - image, dynamic rotation behavior, mouse input position control
/* ...    Scoreboard() - collection of instruments
/* ...    Instrument() - an element of a dashboard, displays state of a sensor
/* ...
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* define global variables
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

/* ... begin OOP variables             ...*/

City[] ville_;
Stage[] etape_;
Tour[] tour_;
Country france_;
Scoreboard dashboard_;
Crank crank_;

Table etape;
Table tbl_etape;
Table france;
Table decade_debut;
Table villes_d_etapes;

IntDict tour_indx;

int ian = 1903;
int iet = 0;
int n_etape_rows, n_france_rows, n_decade_debut_rows, n_villes_d_etapes;

float km_grand_total;

float[] dash_value = {0, 0, 0, 0, 0, 1, 0};
int[] tour_years = new int[100];

PImage crank_img;
String crank_image = "crank.svg.png";

String[] dash_text = {
    "kilometres",
    "étapes",
    "vitesse",
    "partants",
    "arrivants",
    "années"
};


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* setup() routine
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

void setup()
{

float w, h, sf;

    size(1400, 800);
    background(30);

    frameRate(5);
    
 //    noLoop();
    
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* files with city, nation gps coords and stage definitions
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    france = loadTable("france_outline_pts.csv", "header");
    etape = loadTable("le_tour_map_pts.csv", "header");
    tbl_etape = loadTable("le_tour_etapes.csv", "header");
    decade_debut = loadTable("decade_debut.csv", "header");
    villes_d_etapes = loadTable("villes_d_etapes.csv", "header");
   
    n_etape_rows = etape.getRowCount();
    n_france_rows = france.getRowCount();
    n_decade_debut_rows = decade_debut.getRowCount();
    n_villes_d_etapes = villes_d_etapes.getRowCount();
    
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* ...    assemble Cities                ... */
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    ville_ = new City[n_villes_d_etapes];
    for (int iv = 0; iv < n_villes_d_etapes; iv++)
    {        
        int    tmp_id   = villes_d_etapes.getInt(iv, 0);
        String tmp_name = villes_d_etapes.getString(iv, 1);
        float  tmp_lat  = villes_d_etapes.getFloat(iv, 2);
        float  tmp_lon  = villes_d_etapes.getFloat(iv, 3);
        
        ville_[iv] = new City(tmp_id, tmp_name, tmp_lat, tmp_lon);
    }
    
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* ...    assemble Stages              ... */
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    int[] year = new int[100];
    int n_tour = 0;
    int n_etape =0;
    int tmp_tmp_year = 0;
    etape_ = new Stage[n_etape_rows];
    
    for (int ie = 0; ie < n_etape_rows; ie++)
    {        
        int    tmp_year      = tbl_etape.getInt(ie, 1);
        int    tmp_etape     = tbl_etape.getInt(ie, 2);
        int    tmp_dprt_id   = tbl_etape.getInt(ie, 5) - 1;
        int    tmp_arvee_id  = tbl_etape.getInt(ie, 6) - 1;
        float  tmp_dst       = tbl_etape.getFloat(ie, 11);
        String tmp_vnqr      = tbl_etape.getString(ie, 15);
        
        println(tmp_year, tmp_etape, tmp_dprt_id, tmp_arvee_id, tmp_dst, tmp_vnqr, n_tour);
        
        etape_[ie] = new Stage(tmp_year, tmp_etape,
                    ville_[tmp_dprt_id], ville_[tmp_arvee_id],
                    tmp_dst, tmp_vnqr);

        if(tmp_year != tmp_tmp_year)
        {
            tmp_tmp_year = tmp_year;
            year[n_tour] = tmp_year;
            n_tour++;
            n_etape = 0;
        }
    }
    
    int ie = 0;
    while (etape_[ie].year < 2013)
    {
        println(etape_[ie].year);
        ie++;
    }
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* ...    assemble Tours             ... */
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    tour_ = new Tour[n_tour];
    tour_indx = new IntDict();
    String country = "france";
    
    ie = 0;
    for (int it = 0; it < n_tour; it++)
    {
        int tmp_year = year[it];
        
        Stage[] stage_ = new Stage[50];
        int is = 0;
      
        while (ie < n_etape_rows && etape_[ie].year == tmp_year)
        {
            stage_[is] = etape_[ie];
            is++;
            ie++;
        }
        tour_[it] = new Tour(tmp_year, is, country, stage_);
        tour_indx.set(str(tmp_year), it);
        tour_years[it] = tmp_year;
    }

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* ...  define countries              ... */
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    france_ = new Country(1, "France", france, villes_d_etapes);

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* ...                ... */
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    dashboard_ = new Scoreboard(dash_value, dash_text);
    
    imageMode(CENTER);
    crank_img = loadImage(crank_image);
    smooth();
    
    w = crank_img.width;
    h = crank_img.height;
    if (w >= h) {sf = width/w/5;} else {sf = height/h/5;}
    crank_img.resize(int(w * sf), int(h * sf));
    
    crank_ = new Crank(crank_img, 0);
}

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* main draw routine
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
int second = 0;
int minute = 0;
int hour = 0;
int decade = 1;
int ian_mnt, ian_cnt = 0;
color tour_yellow = color(255, 200, 0);
float km_cum_dist = 0;
float draw_speed_factor = 2;
float seconds_to_years = 50;
int iyr_cnt;
int tour_now;
int stage_now;

void draw()
{
        second++;
        
        ian_mnt = etape.getInt(iet, 1);
        dash_value[0] = etape.getFloat(iet, 10);
        
        if (ian_mnt > ian)
        {
            ian = ian_mnt;
            decade = (ian - 1900)/10 + 1;
            dash_value[5]++;
            /* vitesse    partants    arrivants  */
            dash_value[2] = etape.getFloat(iet, 15);
            dash_value[3] += etape.getFloat(iet, 17);
            dash_value[4] += etape.getFloat(iet, 18);
            background(30);
        }

        iet = int(second / draw_speed_factor);
        if (iet > n_etape_rows-1) {iet = 0;}
        
        dash_value[1] = iet;
        
        add_year(ian);
        
        france_.display_outline();
        france_.display_cities();

        etape_[iet].realize(ian, iet, tour_yellow, 1);
        
        dashboard_.update(dash_value);
        
        crank_.update(decade);
        
        attribution();
}


void mousePressed()
{
    
int x = width/6;
int y = height/5;
int idec;

    float angle = atan2(mouseY - y, mouseX - x);
    float deg = angle * 180 / PI;
    
    println("\tset_hour() ...", angle, deg);
       
    if (deg < 0) {deg += 360;}
      
    hour = int(deg * 11 / 360 + 0.5) + 1;
    decade = hour;
      
    println("\tset_hour() ...", angle, deg, hour, ian, decade);
    
    idec = decade - 1;
    
    iet = decade_debut.getInt(idec, 1);
    second = int(iet * draw_speed_factor);
    
    dash_value[1] = iet;
    
    ian = decade_debut.getInt(idec, 2);
    ian_mnt = ian;
    
    dash_value[2] = decade_debut.getInt(idec, 3);
    dash_value[3] = decade_debut.getInt(idec, 5);
    dash_value[4] = decade_debut.getInt(idec, 6);
    dash_value[5] = decade_debut.getInt(idec, 7);
    
    println("\tset_hour() ...", hour, ian, idec, iet, "\n");    
    println(dash_value[2], dash_value[3], dash_value[4]);
    
    background(30);
  
}