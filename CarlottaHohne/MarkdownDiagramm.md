    datensatz <- readRDS("robo_pflege.rds")

    library(tidyverse)

    ## -- Attaching packages ------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.2.1     v purrr   0.3.3
    ## v tibble  2.1.3     v dplyr   0.8.3
    ## v tidyr   1.0.0     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.4.0

    ## -- Conflicts ---------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

    library(devtools)

    ## Loading required package: usethis

    library(plotrix)
    library(ggplot2)
    library(ggthemes)

devtools::install\_github(“HCIC/r-tools”)

rwthfarben &lt;- hcictools::rwth.colorpalette()

ggplot(datensatz) + aes(x = gender, weight = pflege) + geom\_bar(fill =
“\#0c4c8a”) + labs(x = " “, y =” “, title =” “, subtitle =” “, caption
=” ") + theme\_linedraw()

\#\#Todo: \# 1. richtige Werte \# 2. Beschriftungen \# 3.
Fehlerindikatoren \# 4. Optik \# 5. Y-Achse \# 6. Abspeichern

datensatz %&gt;% filter(gender != “keine Angabe”) %&gt;%
group\_by(gender) %&gt;% summarise(pflege\_m = mean(pflege)-1,
pflege\_sem = std.error(pflege)) %&gt;%

ggplot() + aes(x = gender, weight = pflege\_m, ymin =
pflege\_m-pflege\_sem , ymax = pflege\_m+pflege\_sem ) + geom\_bar(fill
=
c(rwthfarben*l**i**g**h**t**b**l**u**e*, *r**w**t**h**f**a**r**b**e**n*red),
width = 0.4) + geom\_errorbar(width = 0.2) + scale\_y\_continuous(limits
= c(0,5)) + labs(x = “Geschlecht”, y = “Pflege von einem
Roboter\[0-6\]”, title = “Frauen lassen sich eher von einem Roboter
pflegen”, subtitle = “Geschlechtsunterschiede im Säulendiagramm”,
caption = “Fehlerindikatoren zeigen Standardfehler des Mittelwerts”) +
theme\_linedraw()+ NULL
ggsave(“FokaBenasirWapniarz/Diagramme\_HohneWapniarz.pdf”, width = 210,
height = 297, units = “mm”)
