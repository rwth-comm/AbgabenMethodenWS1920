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
