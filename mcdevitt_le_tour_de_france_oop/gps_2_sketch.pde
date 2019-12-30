


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* ...    converts GPC coordinates to sketch coordinates
/* ...
/* ...    input : x : GPS coord value
/* ...            lat_or_lon : boolean to indicate if x is latitude or longitude
/* ...            1 = longitude, 0 - latitude
/* ...
/* ...    returns : converted value in sketch coords
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

float lat_min = 53;
float lat_max = 40;
float lon_min = -20;
float lon_max = 0;

float gps_2_sketch(int lat_or_lon, float x)
{
    if (!Float.isNaN(x))
    {
        if(lat_or_lon == 1) {return(map(x,  lon_min, lon_max, 0, min(width, height)));}
    
        if(lat_or_lon == 0) {return(map(x,  lat_min, lat_max, 0, min(height, width)));}
    }
    return x;
   
}