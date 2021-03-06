Diagramm\_Steinke
================
Lukas Steinke
12 12 2019

``` r
path <- "robo_pflege.rds"

path %>%
readRDS() -> data


data %>% 
  filter(gender != "keine Angabe") %>% 
  group_by(gender) %>% 
  summarise(Mean = mean(robo_wash, na.rm = TRUE)-1, Sem = std.error(robo_wash), Varianz = var(robo_wash), SD = sd(robo_wash)) %>% 
ggplot() +
  aes(x = gender, weight = Mean, ymin = Mean-Sem , ymax = Mean+Sem, fill = gender) +
  geom_bar(fill = c("red", "blue"), width = 0.4)  +
  geom_errorbar(width = 0.2) +
  scale_y_continuous(limits = c(0,5)) +
  labs(x = "Geschlecht", 
       y = "Zustimmung zum Waschen durch einen Roboter", 
       title = "Männer würden sich eher von einem Roboter waschen lassen als Frauen", 
       subtitle = "Geschlechtsunterschiede im Säulendiagramm.", 
       caption = "Fehlerindikatoren zeigen Standardfehler des Mittelwerts.") +
  theme_solarized_2() +
  NULL
```

![](Diagramm_Steinke_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

``` r
ggsave("Diagramm_Steinke.pdf", width = 210, height = 297, units = "mm")
```
