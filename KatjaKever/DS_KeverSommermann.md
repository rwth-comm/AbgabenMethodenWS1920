    library(tidyverse)

    ## -- Attaching packages ----------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.2.1     v purrr   0.3.3
    ## v tibble  2.1.3     v dplyr   0.8.3
    ## v tidyr   1.0.0     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.4.0

    ## -- Conflicts -------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

    library(dplyr)

    datensatz <- readRDS("robo_pflege.rds")

    datensatz.short <- datensatz[, c("age", "gender", "robo_food", "human_food")]

    datensatz.short %>% psych::describe()

    ##            vars   n  mean    sd median trimmed  mad min max range  skew
    ## age           1 325 32.25 13.83     26   30.13 5.93  19  81    62  1.25
    ## gender*       2 325  2.58  0.51      3    2.61 0.00   1   3     2 -0.52
    ## robo_food     3 293  3.88  1.40      4    3.93 1.48   1   6     5 -0.21
    ## human_food    4 293  4.32  1.25      5    4.41 1.48   1   6     5 -0.47
    ##            kurtosis   se
    ## age            0.36 0.77
    ## gender*       -1.25 0.03
    ## robo_food     -0.66 0.08
    ## human_food    -0.60 0.07

Aus den Daten lässt sich ablesen, dass sich die Leute eher von Menschen
füttern lassen würden als von Robotern. Generell würden sich aber auch
viele von Robotern füttern lassen.

    datensatz.short %>% ggplot() + aes(x = robo_food) + geom_histogram(bins = 30, fill = "red")

    ## Warning: Removed 32 rows containing non-finite values (stat_bin).

![](DS_KeverSommermann_files/figure-markdown_strict/unnamed-chunk-5-1.png)

    datensatz.short %>% ggplot() + aes(x = human_food) + geom_histogram(bins = 30, fill = "green")

    ## Warning: Removed 32 rows containing non-finite values (stat_bin).

![](DS_KeverSommermann_files/figure-markdown_strict/unnamed-chunk-6-1.png)

Code mit Pipe
-------------

    datensatz.short %>% psych::describe()

    ##            vars   n  mean    sd median trimmed  mad min max range  skew
    ## age           1 325 32.25 13.83     26   30.13 5.93  19  81    62  1.25
    ## gender*       2 325  2.58  0.51      3    2.61 0.00   1   3     2 -0.52
    ## robo_food     3 293  3.88  1.40      4    3.93 1.48   1   6     5 -0.21
    ## human_food    4 293  4.32  1.25      5    4.41 1.48   1   6     5 -0.47
    ##            kurtosis   se
    ## age            0.36 0.77
    ## gender*       -1.25 0.03
    ## robo_food     -0.66 0.08
    ## human_food    -0.60 0.07

Code ohne Pipe
--------------

    psych::describe(datensatz.short)

    ##            vars   n  mean    sd median trimmed  mad min max range  skew
    ## age           1 325 32.25 13.83     26   30.13 5.93  19  81    62  1.25
    ## gender*       2 325  2.58  0.51      3    2.61 0.00   1   3     2 -0.52
    ## robo_food     3 293  3.88  1.40      4    3.93 1.48   1   6     5 -0.21
    ## human_food    4 293  4.32  1.25      5    4.41 1.48   1   6     5 -0.47
    ##            kurtosis   se
    ## age            0.36 0.77
    ## gender*       -1.25 0.03
    ## robo_food     -0.66 0.08
    ## human_food    -0.60 0.07
