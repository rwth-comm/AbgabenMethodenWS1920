{r setup, include=FALSE} knitr::opts\_chunk$set(echo = TRUE, message =
FALSE) library(tidyverse) library(ggplot2) dataset &lt;-
readRDS(“robo\_pflege.rds”) dataset.short &lt;- dataset\[,c(“age”,
“gender”, “kut”, “robo\_hair\_cut”, “human\_hair\_cut”)\]

Dies sind die desktiptiven Statistiken für den Datensatz.
=========================================================

Man sieht deskriptiv, dass sich die Probanden eher von einem Menschen,
als von einem Roboter die Haare schneiden lassen würden. {r
warning=FALSE} dataset.short %&gt;% psych::describe() %&gt;%
select(vars, mean, sd, median, min, max)

Histogramme.
============

{r} ggplot(robo\_pflege) + aes(x = gender, weight = robo\_hair\_cut) +
geom\_bar(fill = “\#0c4c8a”) + labs(x = “Geschlechter”, y =
“Bereitschaft zum Roboterhaarschnitt”, title = “Frauen lassen sich eher
von einem Roboter die Haare schneiden als Männer”, subtitle =
“Histogramm der geschlechterspezifischen Bereitschaft zum
Roboterhaarschnitt”) + theme\_minimal()

ggplot(robo\_pflege) + aes(x = gender, weight = human\_hair\_cut) +
geom\_bar(fill = “\#0c4c8a”) + labs(x = “Geschlechter”, y =
“Bereitschaft zum Menschenhaarschnitt”, title = “Frauen lassen sich eher
von einem Menschen die Haare schneiden als Männer”, subtitle =
“Histogramm der geschlechterspezifischen Bereitschaft zum
Menschenhaarschnitt”) + theme\_minimal()
