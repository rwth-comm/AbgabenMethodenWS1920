Dies sind die deskriptiven Statistiken für den Datensatz.
=========================================================

Man sieht deskriptiv, dass die Probanden sich eher von einem Roboter als
von einem Menschen beim Toilettengang helfen lassen würden.

    datensatz_kurz %>% psych::describe() %>% select(vars, mean, sd, median, min, max)

    ##               vars  mean    sd median min max
    ## age              1 32.25 13.83   26.0  19  81
    ## gender*          2  2.58  0.51    3.0   1   3
    ## kut              3  4.32  1.03    4.5   1   6
    ## human_toilett    4  3.01  1.36    3.0   1   6
    ## robo_toilett     5  3.93  1.61    4.0   1   6

Histogramme
===========

    datensatz %>% select(robo_toilett) %>% ggplot() + aes(x = robo_toilett) + geom_histogram(bins = 30, fill="red")

![](DS_GeigerWielRoth_files/figure-markdown_strict/unnamed-chunk-2-1.png)

    datensatz %>% select(human_toilett) %>% ggplot() + aes(x = human_toilett) + geom_histogram(bins = 30, fill="blue")

![](DS_GeigerWielRoth_files/figure-markdown_strict/unnamed-chunk-2-2.png)

### mit Pipe

datensatz\_kurz %&gt;% psych::describe() %&gt;% select()

### ohne Pipe

psych::describe(select(datensatz)human\_toilett)
