#---
#title: "Diagramm_Huang"
#output: html_document
#---
# pakete 

library(tidyverse)
library(devtools)
library(plotrix)
library(ggplot2)
library(ggthemes)

#install.packages("hcictools")
#install.packages("plotrix")

#install.packages("devtools")
#library(devtools)
rwthfarben <- hcictools::rwth.colorpalette()

datensatz <- dataforsocialscience::robo_care
ggplot(datensatz) +
  aes(x = gender, weight = robo_hair_wash) +
  geom_bar(fill = "#0c4c8a") +
  labs(x = " ", 
       y = " ", 
       title = " ", 
       subtitle = " ", 
       caption = " ") +
  theme_linedraw()

#datensatz <- readRDS("JianiHuang_ohneLeerzeichen/robo_pflege.rds")

## Todo: 
# 1. richitge Werte 
# 2. Beschriftungen
# 3. Fehlerbalken
# 4. Optik
# 5. y-Achse?
# 6. Abspeichern 

datensatz %>% 
 filter(gender !="rather not say") %>%  
 group_by(gender) %>% 
 summarise(robo_hair_wash_m = mean(robo_hair_wash, na.rm= TRUE)-1, 
           robo_hair_wash_sem = std.error(robo_hair_wash)) %>%
 ggplot() +
 aes(x = gender, weight = robo_hair_wash_m, ymin = robo_hair_wash_m-robo_hair_wash_sem, 
     ymax = robo_hair_wash_m+robo_hair_wash_sem, fill = gender) + 
 geom_bar(fill = c(rwthfarben$lightblue, rwthfarben$red), width = 0.4) +
  geom_errorbar(width = 0.2) + 
  scale_y_continuous(limits = c(0,5)) + 
 labs(x = "Geschlecht", 
      y = "robo_hair_wash [0-5]", 
      title = "Männer lassen lieber Haare Roboter waschen", 
      subtitle = "Geschlechtsunterschiede im Säulendiagramm", 
      caption = "Fehlerindikatoren zeigen Standardfehler des Mittelwerts.") +
 theme_linedraw() + 
 NULL

ggsave("JianiHuang_ohneLeerzeichen/Diagramm_Huang.pdf")




