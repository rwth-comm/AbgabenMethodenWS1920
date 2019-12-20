---
title: "Diagramm_KoerfersNolteBerghahn"
output: md_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

# pakete laden 
install.packages("devtools")
install.packages("plotrix")

library(tidyverse)
library(devtools)
library(plotrix)
library(ggplot2)
library(ggthemes)
library(ggplot2)

datensatz <-readRDS("~/test/robo_pflege.rds")

rwthfarben <- hcictools::rwth.colorpalette()

```

```{r}
datensatz %>% 
  filter(gender != "keine Angabe") %>% 
  group_by(gender) %>% 
  summarise(mittelwert_robo_hair_cut = mean(robo_hair_cut, na.rm = TRUE)-1, sem_robo_hair_cut = std.error(robo_hair_cut)) %>% 
ggplot() +
 aes(x = gender, weight = mittelwert_robo_hair_cut, ymin = mittelwert_robo_hair_cut-sem_robo_hair_cut, ymax = mittelwert_robo_hair_cut+sem_robo_hair_cut, fill = gender) +
 geom_bar(fill = c(rwthfarben$maygreen, rwthfarben$yellow), width = 0.4) +
 geom_errorbar(width = 0.2) +
 scale_y_continuous(limits = c(0,5)) +
 labs(x = "Geschlecht", 
      y = "Mittelwert der Bereitschaft", 
      title = "Männer würden sich eher von Robotern die Haare schneiden lassen", 
      subtitle = "Säulendiagramm zur geschlechtsspezifischen Bereitschaft, sich von einem Roboter die Haare schneiden zu lassen", 
      caption = "Fehlerindikatoren zeigen Standardfehler des Mittelwerts") +
 theme_minimal() +
 NULL
```



