Man sieht deskriptiv, dass die Probanden sich eher von einem Menschen
als von einem Roboter füttern lassen würden.

    dataset.short %>% psych::describe() %>% select(vars, mean, sd, median, min, max) 

    ##            vars  mean    sd median min max
    ## age           1 32.25 13.83   26.0  19  81
    ## gender*       2  2.58  0.51    3.0   1   3
    ## kut           3  4.32  1.03    4.5   1   6
    ## robo_food     4  3.88  1.40    4.0   1   6
    ## human_food    5  4.32  1.25    5.0   1   6

    # vars, mean, sd, median, min, max(psych::describe(dataset.short))

Histogramme
===========

    dataset %>% ggplot() +  aes(x = robo_food) + geom_histogram(bins = 30, fill="red")

![](DS_SchmitzHolle_files/figure-markdown_strict/unnamed-chunk-2-1.png)

    dataset %>% ggplot() +  aes(x = human_food) + geom_histogram(bins = 30, fill="blue")

![](DS_SchmitzHolle_files/figure-markdown_strict/unnamed-chunk-2-2.png)
