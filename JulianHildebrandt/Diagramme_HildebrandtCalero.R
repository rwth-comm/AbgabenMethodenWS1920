# 1. Diagrammerstellung
# 2. Überführung in Rmarkdown
# 3. Fehlerindikatoren

# pakete
library(tidyverse)
library(devtools)
library(plotrix)
library(ggplot2)
library(ggthemes)

datensatz <- readRDS("JulianHildebrandt/robo_pflege.rds")

devtools::install_github("HCIC/r-tools")

rwthfarben <- hcictools::rwth.colorpalette()

ggplot(datensatz) +
 aes(x = gender, weight = kut) +
 geom_bar(fill = "#0c4c8a") +
 labs(x = " ", 
      y = " ", 
      title = " ", 
      subtitle = " ", 
      caption = " ") +
 theme_linedraw()

## Todo:
# 1. richtige Werte CHECK!
# 2. Beschriftungen CHECK!
# 3. Fehlerbalken CHECK!
# 4. Optik CHECK!
# 5. y-Achse? CHECK!
# 6. Abspeichern?

datensatz %>% 
  filter(gender != "keine Angabe") %>% 
  group_by(gender) %>% 
  summarise(kut_m = mean(kut)-1, kut_sem = std.error(kut), Varianz = var(kut), SD = sd(kut)) %>% 
ggplot() +
  aes(x = gender, weight = kut_m, ymin = kut_m-kut_sem , ymax = kut_m+kut_sem, fill = gender) +
  geom_bar(fill = c(rwthfarben$lightblue, rwthfarben$red), width = 0.4) +
  geom_errorbar(width = 0.2) +
  scale_y_continuous(limits = c(0,5)) +
  labs(x = "Geschlecht", 
       y = "KUT [0-5]", 
       title = "Männer trauen sich bei Technik mehr zu", 
       subtitle = "Geschlechtsunterschiede im Säulendiagramm (n=322).", 
       caption = "Fehlerindikatoren zeigen Standardfehler des Mittelwerts.") +
  theme_linedraw() +
  NULL
ggsave("JulianHildebrandt/Diagramm_HildebrandtCalero.pdf", width = 210, height = 297, units = "mm")

