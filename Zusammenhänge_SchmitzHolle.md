    # Hypothese: Es gibt einen Zusammenhang zwischen dem Alter und der Bereitschaft, sich von einem Roboter füttern zu lassen.
    datensatz <- readRDS("MaikeHolle/robo_pflege.rds")

    cor(datensatz$age, datensatz$robo_food, method = "spearman", use = "pairwise.complete.obs")

    ## [1] -0.06263844

    jmv::corrMatrix(datensatz, c("age", "robo_food"), spearman = TRUE)

    ## 
    ##  CORRELATION MATRIX
    ## 
    ##  Correlation Matrix                                     
    ##  ────────────────────────────────────────────────────── 
    ##                                   age       robo_food   
    ##  ────────────────────────────────────────────────────── 
    ##    age          Pearson's r            —                
    ##                 p-value                —                
    ##                 Spearman's rho         —                
    ##                 p-value                —                
    ##                                                         
    ##    robo_food    Pearson's r       -0.075            —   
    ##                 p-value            0.202            —   
    ##                 Spearman's rho    -0.063            —   
    ##                 p-value            0.285            —   
    ##  ──────────────────────────────────────────────────────

    # Es besteht kein signikanter Zusammenhang zwischen Alter und der Bereitschaft, sich von einem Roboter füttern zu lassen (r=-.063, p=.285)“.

    datensatz %>% ggplot() + aes(x = age, y = robo_food) +
      geom_jitter(alpha = 0.2) +
      geom_smooth(method = "lm", color = "black") + cowplot::theme_half_open() +
      labs(x = "Alter", y = "Bereitschaft, sich von einem Roboter füttern zu lassen", title = "Es gibt keinen Zusammenhang zwischen dem Alter und der \nBereitschaft, sich füttern zu lassen.")

    ## Warning: Removed 32 rows containing non-finite values (stat_smooth).

    ## Warning: Removed 32 rows containing missing values (geom_point).

![](Zusammenhänge_SchmitzHolle_files/figure-markdown_strict/korrelation-1.png)

    # Hypothese: Je höher das Alter, desto höher die Bereitschaft, sich von einem Roboter füttern zu lassen.

    jmv::linReg(datensatz, dep = "robo_food", covs = c("age"),
                blocks = list("age"),
                r2Adj = TRUE,
                anova = TRUE,
                stdEst = TRUE)

    ## 
    ##  LINEAR REGRESSION
    ## 
    ##  Model Fit Measures                            
    ##  ───────────────────────────────────────────── 
    ##    Model    R         R²         Adjusted R²   
    ##  ───────────────────────────────────────────── 
    ##        1    0.0747    0.00558        0.00216   
    ##  ───────────────────────────────────────────── 
    ## 
    ## 
    ##  MODEL SPECIFIC RESULTS
    ## 
    ##  MODEL 1
    ## 
    ##  Omnibus ANOVA Test                                                     
    ##  ────────────────────────────────────────────────────────────────────── 
    ##                 Sum of Squares    df     Mean Square    F       p       
    ##  ────────────────────────────────────────────────────────────────────── 
    ##    age                    3.20      1           3.20    1.63    0.202   
    ##    Residuals            569.62    291           1.96                    
    ##  ────────────────────────────────────────────────────────────────────── 
    ##    Note. Type 3 sum of squares
    ## 
    ## 
    ##  Model Coefficients - robo_food                                             
    ##  ────────────────────────────────────────────────────────────────────────── 
    ##    Predictor    Estimate    SE         t        p         Stand. Estimate   
    ##  ────────────────────────────────────────────────────────────────────────── 
    ##    Intercept     4.12715    0.20961    19.69    < .001                      
    ##    age          -0.00771    0.00604    -1.28     0.202            -0.0747   
    ##  ──────────────────────────────────────────────────────────────────────────

    # Die lineare Regression zeigt, dass ein Modell mit einem Prädiktor (F(1, 291) = 1.63, p = 0.202, adj.r2 = 0.002) nicht signifikant wird. Die dazugehörige Formel lautet: robo_food = 4.127 + (-0.008) * age.

    datensatz %>% ggplot() + aes(x = age, y = robo_food) +
      geom_point() +
      geom_smooth(method = "lm")

    ## Warning: Removed 32 rows containing non-finite values (stat_smooth).

    ## Warning: Removed 32 rows containing missing values (geom_point).

![](Zusammenhänge_SchmitzHolle_files/figure-markdown_strict/lineare%20Regression-1.png)
