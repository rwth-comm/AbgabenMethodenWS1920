Varianzanalyse
==============

    datensatz %>%

    ANOVA(dep = "robo_wash", factors = c("gender"), 
          effectSize = "partEta",
         postHoc = robo_wash ~ gender,
         emMeans = list ~ gender,
         emmPlots = TRUE)

    ## 
    ##  ANOVA
    ## 
    ##  ANOVA                                                                            
    ##  ──────────────────────────────────────────────────────────────────────────────── 
    ##                 Sum of Squares    df     Mean Square    F       p         η²p     
    ##  ──────────────────────────────────────────────────────────────────────────────── 
    ##    gender                 37.9      2          18.93    7.95    < .001    0.052   
    ##    Residuals             690.3    290           2.38                              
    ##  ──────────────────────────────────────────────────────────────────────────────── 
    ## 
    ## 
    ##  POST HOC TESTS
    ## 
    ##  Post Hoc Comparisons - gender                                                            
    ##  ──────────────────────────────────────────────────────────────────────────────────────── 
    ##    gender               gender      Mean Difference    SE       df     t        p-tukey   
    ##  ──────────────────────────────────────────────────────────────────────────────────────── 
    ##    keine Angabe    -    männlich              0.361    1.100    290    0.328      0.942   
    ##                    -    weiblich              1.080    1.097    290    0.984      0.588   
    ##    männlich        -    weiblich              0.719    0.183    290    3.924    < .001   
    ##  ────────────────────────────────────────────────────────────────────────────────────────

![](DiagrammJillKöster_files/figure-markdown_strict/ANOVA-1.png)

Es gibt Unterschiede zwischen den Geschlechtern in Hinblick auf die
Bereitschaft sich von einem Roboter waschen zu lassen. (F(2,
290)=7.95\*\*\*, p &lt; .001). Dabei unterscheiden sich aber nur Männer
und Frauen. (Unterschied M= 0.719, t(290)=3.924, p-tukey &lt; .001)

    datensatz %>%
      group_by(gender) %>%
      summarise (robo_wash_mean = mean(na.rm = TRUE, robo_wash) -1,
                 count = n(),
                 robo_wash_se = std.error (robo_wash)) %>%
      mutate(robo_wash_ci = robo_wash_se * 1.96) %>%
      ggplot() +
      aes(x = gender, fill = gender,
          y = robo_wash_mean,
          ymin = robo_wash_mean - robo_wash_ci,
          ymax = robo_wash_mean + robo_wash_ci,
          group = 1) +
      geom_col(width = 0.4) +
      geom_errorbar(width= 0.2) +
      geom_line () +
    scale_y_continuous(limits = c(0,5), breaks = 0:5) +
    labs(title = "Männer würden sich eher von einem Roboter waschen lassen",
         subtitle = "Mittelwertplot mit 95% Konfidenzintervall",
         x = "Geschlecht",
         y = "Bereitschaft sich von einem Roboter waschen zu lassen 0-5]",
         fill = "Geschlecht")

![](DiagrammJillKöster_files/figure-markdown_strict/unnamed-chunk-1-1.png)

    datensatz %>% 
      filter(gender != "keine Angabe") %>%
      group_by(gender) %>%
      summarise(human = mean(human_wash, na.rm = TRUE),
      roboter = mean(robo_wash, na.rm = TRUE))  %>%
      pivot_longer(cols = c(human, roboter),
                   names_to = "wash_by",
                   values_to = "value") %>%
      ggplot() +
      aes(x = gender, y = value, color = wash_by, group = wash_by) +
      geom_point(size = 3) +
      geom_line() +
      scale_y_continuous(limits = c(1,6), breaks = 1:6) +
      labs(title = "Männer würden sich eher von einem Roboter waschen lassen",
           subtitle = "Geschlechtsunterschiede im Punktdiagramm (n = 322)",
           x = "Geschlecht",
           y = "Bereitschaft, sich waschen zu lassen [1-6]")

![](DiagrammJillKöster_files/figure-markdown_strict/MANOVA-1.png)

    datensatz %>%

    ancova(dep = "robo_wash", factors = c("gender", "job_type"),
           covs = c("age"),
          effectSize = "partEta",
         postHoc = robo_wash ~ gender + job_type + gender: job_type,
         emMeans = ~ gender + job_type + gender: job_type,
         emmPlots = TRUE)

    ## Error in Anova.III.lm(mod, error, singular.ok = singular.ok, ...) : 
    ##   there are aliased coefficients in the model

    ## Note: model has aliased coefficients
    ##       sums of squares computed by model comparison

    ## NOTE: Results may be misleading due to involvement in interactions
    ## NOTE: Results may be misleading due to involvement in interactions

    ## 
    ##  ANCOVA
    ## 
    ##  ANCOVA - robo_wash                                                                 
    ##  ────────────────────────────────────────────────────────────────────────────────── 
    ##                       Sum of Squares    df     Mean Square    F    p        η²p     
    ##  ────────────────────────────────────────────────────────────────────────────────── 
    ##    gender                     0.0000    NaN                                         
    ##    job_type                   0.0476      1         0.0476         0.888            
    ##    age                        0.4201      1         0.4201         0.676            
    ##    gender:job_type           13.7222      5         2.7444         0.337            
    ##    Residuals                663.6453    277         2.3958                          
    ##  ────────────────────────────────────────────────────────────────────────────────── 
    ##    Note. Singular fit encountered; one or more predictor variables are a linear
    ##    combination of other predictor variables
    ## 
    ## 
    ##  POST HOC TESTS
    ## 
    ##  Post Hoc Comparisons - gender                                                           
    ##  ─────────────────────────────────────────────────────────────────────────────────────── 
    ##    gender               gender      Mean Difference    SE       df     t       p-tukey   
    ##  ─────────────────────────────────────────────────────────────────────────────────────── 
    ##    keine Angabe    -    männlich                                                         
    ##                    -    weiblich                                                         
    ##    männlich        -    weiblich              0.806    0.411    277    1.96      0.124   
    ##  ─────────────────────────────────────────────────────────────────────────────────────── 
    ## 
    ## 
    ##  Post Hoc Comparisons - job_type                                                                          
    ##  ──────────────────────────────────────────────────────────────────────────────────────────────────────── 
    ##    job_type                job_type                 Mean Difference    SE       df     t        p-tukey   
    ##  ──────────────────────────────────────────────────────────────────────────────────────────────────────── 
    ##    Arbeitnehmer/in    -    Arbeitssuchend                                                                 
    ##                       -    Rentner/in                                                                     
    ##                       -    Selbstständig                                                                  
    ##                       -    Studierend/Schüler/in                                                          
    ##    Arbeitssuchend     -    Rentner/in                                                                     
    ##                       -    Selbstständig                                                                  
    ##                       -    Studierend/Schüler/in                                                          
    ##    Rentner/in         -    Selbstständig                                                                  
    ##                       -    Studierend/Schüler/in                                                          
    ##    Selbstständig      -    Studierend/Schüler/in              0.120    0.850    277    0.141      1.000   
    ##  ──────────────────────────────────────────────────────────────────────────────────────────────────────── 
    ## 
    ## 
    ##  Post Hoc Comparisons - gender:job_type                                                                                                            
    ##  ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 
    ##    gender          job_type                      gender          job_type                 Mean Difference    SE       df     t           p-tukey   
    ##  ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 
    ##    keine Angabe    Arbeitnehmer/in          -    keine Angabe    Arbeitssuchend                                                                    
    ##                                             -    keine Angabe    Rentner/in                                                                        
    ##                                             -    keine Angabe    Selbstständig                                                                     
    ##                                             -    keine Angabe    Studierend/Schüler/in                                                             
    ##                                             -    männlich        Arbeitnehmer/in                                                                   
    ##                                             -    männlich        Arbeitssuchend                                                                    
    ##                                             -    männlich        Rentner/in                                                                        
    ##                                             -    männlich        Selbstständig                                                                     
    ##                                             -    männlich        Studierend/Schüler/in                                                             
    ##                                             -    weiblich        Arbeitnehmer/in                                                                   
    ##                                             -    weiblich        Arbeitssuchend                                                                    
    ##                                             -    weiblich        Rentner/in                                                                        
    ##                                             -    weiblich        Selbstständig                                                                     
    ##                                             -    weiblich        Studierend/Schüler/in                                                             
    ##                    Arbeitssuchend           -    keine Angabe    Rentner/in                                                                        
    ##                                             -    keine Angabe    Selbstständig                                                                     
    ##                                             -    keine Angabe    Studierend/Schüler/in                                                             
    ##                                             -    männlich        Arbeitnehmer/in                                                                   
    ##                                             -    männlich        Arbeitssuchend                                                                    
    ##                                             -    männlich        Rentner/in                                                                        
    ##                                             -    männlich        Selbstständig                                                                     
    ##                                             -    männlich        Studierend/Schüler/in                                                             
    ##                                             -    weiblich        Arbeitnehmer/in                                                                   
    ##                                             -    weiblich        Arbeitssuchend                                                                    
    ##                                             -    weiblich        Rentner/in                                                                        
    ##                                             -    weiblich        Selbstständig                                                                     
    ##                                             -    weiblich        Studierend/Schüler/in                                                             
    ##                    Rentner/in               -    keine Angabe    Selbstständig                                                                     
    ##                                             -    keine Angabe    Studierend/Schüler/in                                                             
    ##                                             -    männlich        Arbeitnehmer/in                                                                   
    ##                                             -    männlich        Arbeitssuchend                                                                    
    ##                                             -    männlich        Rentner/in                                                                        
    ##                                             -    männlich        Selbstständig                                                                     
    ##                                             -    männlich        Studierend/Schüler/in                                                             
    ##                                             -    weiblich        Arbeitnehmer/in                                                                   
    ##                                             -    weiblich        Arbeitssuchend                                                                    
    ##                                             -    weiblich        Rentner/in                                                                        
    ##                                             -    weiblich        Selbstständig                                                                     
    ##                                             -    weiblich        Studierend/Schüler/in                                                             
    ##                    Selbstständig            -    keine Angabe    Studierend/Schüler/in           -1.02359    2.190    277    -0.46745      1.000   
    ##                                             -    männlich        Arbeitnehmer/in                  0.23727    1.579    277     0.15028      1.000   
    ##                                             -    männlich        Arbeitssuchend                   0.18962    1.696    277     0.11182      1.000   
    ##                                             -    männlich        Rentner/in                       0.92810    1.782    277     0.52081      1.000   
    ##                                             -    männlich        Selbstständig                   -1.91744    1.906    277    -1.00603      1.000   
    ##                                             -    männlich        Studierend/Schüler/in           -0.31604    1.559    277    -0.20275      1.000   
    ##                                             -    weiblich        Arbeitnehmer/in                  0.72341    1.571    277     0.46060      1.000   
    ##                                             -    weiblich        Arbeitssuchend                   0.99528    1.896    277     0.52501      1.000   
    ##                                             -    weiblich        Rentner/in                       0.19108    1.733    277     0.11026      1.000   
    ##                                             -    weiblich        Selbstständig                    0.72980    1.616    277     0.45173      1.000   
    ##                                             -    weiblich        Studierend/Schüler/in            0.51157    1.556    277     0.32869      1.000   
    ##                    Studierend/Schüler/in    -    männlich        Arbeitnehmer/in                  1.26086    1.586    277     0.79487      1.000   
    ##                                             -    männlich        Arbeitssuchend                   1.21321    1.696    277     0.71539      1.000   
    ##                                             -    männlich        Rentner/in                       1.95169    1.796    277     1.08649      0.999   
    ##                                             -    männlich        Selbstständig                   -0.89385    1.913    277    -0.46735      1.000   
    ##                                             -    männlich        Studierend/Schüler/in            0.70755    1.559    277     0.45398      1.000   
    ##                                             -    weiblich        Arbeitnehmer/in                  1.74700    1.577    277     1.10780      0.999   
    ##                                             -    weiblich        Arbeitssuchend                   2.01887    1.896    277     1.06466      0.999   
    ##                                             -    weiblich        Rentner/in                       1.21467    1.749    277     0.69461      1.000   
    ##                                             -    weiblich        Selbstständig                    1.75339    1.624    277     1.07982      0.999   
    ##                                             -    weiblich        Studierend/Schüler/in            1.53516    1.556    277     0.98653      1.000   
    ##    männlich        Arbeitnehmer/in          -    männlich        Arbeitssuchend                  -0.04765    0.765    277    -0.06226      1.000   
    ##                                             -    männlich        Rentner/in                       0.69084    0.851    277     0.81178      1.000   
    ##                                             -    männlich        Selbstständig                   -2.15470    1.124    277    -1.91729      0.843   
    ##                                             -    männlich        Studierend/Schüler/in           -0.55331    0.379    277    -1.46043      0.981   
    ##                                             -    weiblich        Arbeitnehmer/in                  0.48614    0.337    277     1.44332      0.983   
    ##                                             -    weiblich        Arbeitssuchend                   0.75801    1.140    277     0.66508      1.000   
    ##                                             -    weiblich        Rentner/in                      -0.04619    0.735    277    -0.06281      1.000   
    ##                                             -    weiblich        Selbstständig                    0.49254    0.487    277     1.01241      1.000   
    ##                                             -    weiblich        Studierend/Schüler/in            0.27430    0.369    277     0.74374      1.000   
    ##                    Arbeitssuchend           -    männlich        Rentner/in                       0.73848    1.132    277     0.65254      1.000   
    ##                                             -    männlich        Selbstständig                   -2.10706    1.314    277    -1.60366      0.957   
    ##                                             -    männlich        Studierend/Schüler/in           -0.50566    0.716    277    -0.70662      1.000   
    ##                                             -    weiblich        Arbeitnehmer/in                  0.53379    0.747    277     0.71449      1.000   
    ##                                             -    weiblich        Arbeitssuchend                   0.80566    1.295    277     0.62209      1.000   
    ##                                             -    weiblich        Rentner/in                       0.00146    1.054    277     0.00138      1.000   
    ##                                             -    weiblich        Selbstständig                    0.54018    0.839    277     0.64366      1.000   
    ##                                             -    weiblich        Studierend/Schüler/in            0.32195    0.710    277     0.45327      1.000   
    ##                    Rentner/in               -    männlich        Selbstständig                   -2.84554    1.360    277    -2.09269      0.739   
    ##                                             -    männlich        Studierend/Schüler/in           -1.24414    0.919    277    -1.35447      0.990   
    ##                                             -    weiblich        Arbeitnehmer/in                 -0.20469    0.850    277    -0.24092      1.000   
    ##                                             -    weiblich        Arbeitssuchend                   0.06718    1.410    277     0.04765      1.000   
    ##                                             -    weiblich        Rentner/in                      -0.73703    1.000    277    -0.73731      1.000   
    ##                                             -    weiblich        Selbstständig                   -0.19830    0.904    277    -0.21932      1.000   
    ##                                             -    weiblich        Studierend/Schüler/in           -0.41654    0.914    277    -0.45548      1.000   
    ##                    Selbstständig            -    männlich        Studierend/Schüler/in            1.60139    1.133    277     1.41288      0.986   
    ##                                             -    weiblich        Arbeitnehmer/in                  2.64085    1.117    277     2.36401      0.544   
    ##                                             -    weiblich        Arbeitssuchend                   2.91272    1.562    277     1.86495      0.868   
    ##                                             -    weiblich        Rentner/in                       2.10851    1.290    277     1.63437      0.950   
    ##                                             -    weiblich        Selbstständig                    2.64724    1.170    277     2.26239      0.619   
    ##                                             -    weiblich        Studierend/Schüler/in            2.42900    1.130    277     2.14935      0.700   
    ##                    Studierend/Schüler/in    -    weiblich        Arbeitnehmer/in                  1.03945    0.340    277     3.05843      0.138   
    ##                                             -    weiblich        Arbeitssuchend                   1.31132    1.110    277     1.18176      0.998   
    ##                                             -    weiblich        Rentner/in                       0.50712    0.821    277     0.61790      1.000   
    ##                                             -    weiblich        Selbstständig                    1.04584    0.513    277     2.03994      0.773   
    ##                                             -    weiblich        Studierend/Schüler/in            0.82761    0.241    277     3.43530      0.048   
    ##    weiblich        Arbeitnehmer/in          -    weiblich        Arbeitssuchend                   0.27187    1.128    277     0.24103      1.000   
    ##                                             -    weiblich        Rentner/in                      -0.53233    0.735    277    -0.72429      1.000   
    ##                                             -    weiblich        Selbstständig                    0.00639    0.471    277     0.01356      1.000   
    ##                                             -    weiblich        Studierend/Schüler/in           -0.21184    0.329    277    -0.64469      1.000   
    ##                    Arbeitssuchend           -    weiblich        Rentner/in                      -0.80420    1.348    277    -0.59679      1.000   
    ##                                             -    weiblich        Selbstständig                   -0.26548    1.190    277    -0.22302      1.000   
    ##                                             -    weiblich        Studierend/Schüler/in           -0.48372    1.106    277    -0.43727      1.000   
    ##                    Rentner/in               -    weiblich        Selbstständig                    0.53872    0.795    277     0.67750      1.000   
    ##                                             -    weiblich        Studierend/Schüler/in            0.32049    0.816    277     0.39267      1.000   
    ##                    Selbstständig            -    weiblich        Studierend/Schüler/in           -0.21824    0.505    277    -0.43189      1.000   
    ##  ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

![](DiagrammJillKöster_files/figure-markdown_strict/ANCOVA-1.png)![](DiagrammJillKöster_files/figure-markdown_strict/ANCOVA-2.png)![](DiagrammJillKöster_files/figure-markdown_strict/ANCOVA-3.png)
