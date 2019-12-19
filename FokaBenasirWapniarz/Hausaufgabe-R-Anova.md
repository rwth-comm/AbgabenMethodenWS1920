    datensatz <- readRDS("robo_pflege.rds")

Varianzanalyse
--------------

    datensatz %>%
      ANOVA(dep = "robo_body", factors = c("gender"))

    ## 
    ##  ANOVA
    ## 
    ##  ANOVA                                                                  
    ##  ---------------------------------------------------------------------- 
    ##                 Sum of Squares    df     Mean Square    F       p       
    ##  ---------------------------------------------------------------------- 
    ##    gender                 23.8      2          11.88    5.44    0.005   
    ##    Residuals             632.8    290           2.18                    
    ##  ----------------------------------------------------------------------

Es gibt unterschiede zwischen den Geschlechtern in Hinblick auf die
Bereitschaft die Körperpflege von einem Roboter machen zu lassen
(F(2,290)=5.44\*\*\*, p &lt; 0.005).
