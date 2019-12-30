


PFont f_title, f_body, f_logo_1, f_logo_2;

class Scoreboard
{
// properties

    float[] metric_value;
    String[] metric;

// constructors

    Scoreboard(){}
    
    Scoreboard(float[] metric_value, String[] metric)
    {
        this.metric_value = metric_value;
        this.metric = metric;
    }

// general methods
    
    void update(float[] metric_value)
    {  
    f_title = createFont("Ubuntu", 35, true);
    f_body = createFont("Ubuntu", 50, true);
    f_logo_1 = createFont("Ubuntu", 100, true);
    f_logo_2 = createFont("Ubuntu", 45, true);
    
    smooth();
    char bullet = '•';

        textFont(f_title);
        textAlign(RIGHT);
        textLeading(0);
        fill(50, 50, 50);
    //    text(description[0], width/4, height/6);
    
        textFont(f_body);
        textAlign(LEFT);
        textLeading(20);    
        
         for (int iqx = 0; iqx < metric.length; iqx++)
         {
             fill(50);
             text(metric[iqx], width/20, height/2 + iqx * 60);
         }
         
         textFont(f_title);
         textAlign(RIGHT);
         for (int iqx = 0; iqx < metric.length; iqx++)
         {
             fill(30);
             stroke(30);
             rect(width/4-20, height/2 + iqx * 60-50 + 5, 200, 50);
             
             fill(40, 40, 40, 50);
             rect(width/4-20, height/2 + iqx * 60-50 + 5, 150, 50);
             
             fill(60);
             text(str(int(metric_value[iqx])), width/3, height/2 + iqx * 60);    
         }

    }
    
// setters and getters (mutators and accessors)

    float[] get_metric_value() {return metric_value;}

}