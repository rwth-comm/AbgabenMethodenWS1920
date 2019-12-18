Diagramm\_HalleLaubach
================

``` r
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.2.1     v purrr   0.3.3
    ## v tibble  2.1.3     v dplyr   0.8.3
    ## v tidyr   1.0.0     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.4.0

    ## -- Conflicts ------------------------------------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(devtools)
```

    ## Loading required package: usethis

``` r
library(plotrix)
library(ggplot2)
library(ggthemes)

datensatz <- readRDS("robo_pflege.rds")

library(ggplot2)

devtools::install_github("HCIC/r-tools")
```

    ## WARNING: Rtools is required to build R packages, but is not currently installed.
    ## 
    ## Please download and install Rtools custom from http://cran.r-project.org/bin/windows/Rtools/.

    ## Skipping install of 'hcictools' from a github remote, the SHA1 (7d8e5458) has not changed since last install.
    ##   Use `force = TRUE` to force installation

``` r
rwthfarben <- hcictools::rwth.colorpalette()

datensatz %>% 
  filter(gender != "keine Angabe") %>%
  group_by(gender) %>% 
  summarise(robo_hair_wash_m = mean(robo_hair_wash)-1, robo_hair_wash_sem = std.error(robo_hair_wash)) %>%

ggplot() +
 aes(x = gender, weight = robo_hair_wash_m, ymin = robo_hair_wash_m-robo_hair_wash_sem, ymax = robo_hair_wash_m+robo_hair_wash_sem, fill = gender) +
 geom_bar(fill = c(rwthfarben$lightblue, rwthfarben$red), width = 0.4) +
  geom_errorbar(width = 0.2) +
 scale_y_continuous(limits = c(0,5)) +
  labs(x = "Geschlecht", 
      y = "robo_hair_wash [0-5]", 
      title = "Frauen lassen sich eher als Männer die Haare von einem Roboter waschen", 
      subtitle = "Unterschiede nach Geschlecht bezüglich des Haare Waschens von einem Roboter",
      caption = "Fehlerindikatoren zeigen Standardfehler des Mittelwerts.") +
 theme_linedraw()+
NULL
```

    ## Warning: Removed 2 rows containing missing values (geom_errorbar).

![](Diagramm_HalleLaubach_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

``` r
ggsave("Diagramm_HalleLaubach.pdf")
```

    ## Saving 7 x 5 in image

    ## Warning: Removed 2 rows containing missing values (geom_errorbar).
