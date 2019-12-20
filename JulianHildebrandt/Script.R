library(tidyverse)
library(ggplot2)
library(plotrix)
# install.packages("devtools")
library(devtools)
# devtools::install_github("HCIC/r-tools")
library(ggthemes)


data <- readRDS("JulianHildebrandt/robo_pflege.rds") 


rwthcolor <- hcictools::rwth.colorpalette()


library(ggplot2)


data %>% 
  filter(gender != "keine Angabe") %>% 
  group_by(gender) %>% 
  summarise(mean_kut = mean(kut)-1, sem = std.error(kut)) %>% 
  ggplot() +
  aes(x = gender, weight = mean_kut, ymax = mean_kut + sem, ymin = mean_kut - sem ) +
  geom_bar(fill = c(rwthcolor$lightblue, rwthcolor$red), width = 0.4) +
  geom_errorbar(width = 0.2, color = rwthcolor$black) +
  scale_y_continuous(limits = c(0,5), breaks = c(0:5)) +
  labs(x = "Geschlecht", 
       y = "KUT [0-5]", 
       title = "Männer trauen sich im Umngang mit Technik mehr zu als Frauen", 
       subtitle = "KUT im Boxplot", 
       caption = "") +
  theme_fivethirtyeight()
ggsave()
library(ggplot2)

data %>% 
  filter(gender != "keine Angabe") %>% 
ggplot() +
 aes(x = gender, weight = kut) +
 geom_bar(fill = rwthcolor$lightblue) +
 labs(x = "a ", 
      y = " a", 
      title = " a", 
      subtitle = " a", 
      caption = "a ") +
 theme_fivethirtyeight()



data %>% 
  filter(gender != "keine Angabe") %>% 
  group_by(gender) %>% 
  summarise(mean_kut = mean(kut)-1, sem = std.error(kut)) %>% 
  ggplot() +
  aes(x = gender, weight = mean_kut, ymax = mean_kut + sem, ymin = mean_kut - sem ) +
  geom_bar(fill = c(rwthcolor$lightblue, rwthcolor$red), width = 0.4) +
  geom_errorbar(width = 0.2, color = rwthcolor$black) +
  scale_y_continuous(limits = c(0,5), breaks = c(0:5)) +
  labs(x = "Geschlecht", 
       y = "KUT [0-5]", 
       title = "Männer trauen sich im Umngang mit Technik mehr zu als Frauen", 
       subtitle = "KUT im Boxplot", 
       caption = "") +
  theme_minimal()
ggsave()

data %>% 
  filter(gender != "keine Angabe") %>% 
  group_by(gender) %>% 
  summarise(mean_kut = mean(kut)-1, sem = std.error(kut)) %>% 
  ggplot() +
  aes(x = gender, y = mean_kut, ymax = mean_kut + sem, ymin = mean_kut - sem ) +
  geom_point(color = c(rwthcolor$lightblue, rwthcolor$red), size = 4) +
  geom_errorbar(width = 0.2, color = rwthcolor$black) +
  scale_y_continuous(limits = c(2.5,4)) +
  labs(x = "Geschlecht", 
       y = "KUT [0-5]", 
       title = "Männer trauen sich im Umngang mit Technik mehr zu als Frauen", 
       subtitle = "KUT im Boxplot", 
       caption = "") +
  theme_minimal()




#### HildebrandtCaleroValdezInferenzstatistik.R


# source("install_libraries.R")
library(tidyverse)
library(ggthemes)
library(ggplot2)
library(plotrix)
library(jmv)

## Farben verfügbar machen:
rwthcolor <- hcictools::rwth.colorpalette()

## Daten Laden


## Unverbundener T-Test. Hypothese: Männer und Frauen unterscheiden sich im KUT.

data %>% 
  filter(gender != "keine Angabe") %>% 
  group_by(gender) %>% 
  summarise(mean_kut = mean(kut)-1, sem_kut = std.error(kut)) %>% 
  ggplot() +
  aes(x = gender, weight = mean_kut, fill = gender, ymin = mean_kut-sem_kut, ymax = mean_kut+sem_kut) +
  geom_bar(width = 0.5) +
  scale_fill_manual(values = c(rwthcolor$blue, rwthcolor$red)) +
  geom_errorbar(width = 0.2) +
  theme_minimal() +
  ylim(0,5) +
  labs(title = "Männer glauben eher daran, Technik kontrollieren zu können", 
       subtitle = "Balkendiagramm: KUT im Vergleich zwischen Männern und Frauen ", 
       x = "Geschlecht",
       y = "KUT [0 - 5]",
       fill = "Geschlecht",
       caption = "Fehlerbalken zeigen Standardfehler des Mittelwertes.") +
  NULL
ggsave("HildebrandtCaleroValdesBalkendiagrammTtest.pdf", width = 6, height = 5)


data %>% 
  filter(gender != "keine Angabe") %>% 
  group_by(gender) %>% 
  summarise(mean_kut = mean(kut), sem_kut = std.error(kut)) %>% 
  ggplot() +
  aes(x = gender, y = mean_kut, colour = gender, ymin = mean_kut-sem_kut, ymax = mean_kut+sem_kut) +
  geom_errorbar(width = 0.2, colour = rwthcolor$black) +
  geom_point(size = 3) +
  scale_colour_manual(values = c(rwthcolor$blue, rwthcolor$red)) +
  theme_minimal() +
  ylim(3.5,5) +
  labs(title = "Männer glauben eher daran, Technik kontrollieren zu können", 
       subtitle = "Punktdiagramm: KUT im Vergleich zwischen Männern und Frauen ", 
       x = "Geschlecht",
       y = "KUT [1 - 6]",
       colour = "Geschlecht",
       caption = "Fehlerbalken zeigen Standardfehler des Mittelwertes. Y-Achse ist aus Gründen der Lesbarkeit verschoben.") +
  NULL
#ggsave("HildebrandtCaleroValdesPunktdiagrammTtest.pdf", width = 6, height = 5)



## Zweifaktorielle ANOVA. Hypothese: Geschlecht und Erwerbstätigenstatus haben einen Einfluss auf KUT.
data_robot %>% 
  filter(gender != "keine Angabe") %>%
  filter(job_type == "Arbeitnehmer/in" | job_type == "Studierend/Schüler/in" ) %>% 
  jmv::anova(dep = "kut", 
             factors = c("job_type", "gender") 
  ) -> res

res$main 

data %>% 
  filter(gender != "keine Angabe") %>%
  filter(job_type == "Arbeitnehmer/in" | job_type == "Studierend/Schüler/in" ) %>% 
  group_by(gender, job_type) %>% 
  summarise(mean_kut = mean(kut), sem_kut = std.error(kut)) %>% 
  ggplot() +
  aes(x = job_type, y = mean_kut, colour = gender, ymin = mean_kut-sem_kut, ymax = mean_kut+sem_kut) +
  geom_errorbar(width = 0.2, colour = rwthcolor$black) +
  geom_point(size = 3) +
  geom_line(aes(group = gender)) +
  scale_colour_manual(values = c(rwthcolor$blue, rwthcolor$red)) +
  scale_y_continuous(limits = c(3,5.5), breaks = c(3:5.5)) +
  theme_grey() +
  labs(title = "Männer glauben eher daran, Technik kontrollieren zu können, Schüler und Studierende auch!", 
       subtitle = "Punktdiagramm: KUT im Vergleich zwischen ArbeitnehmerInnen und Studierenden, gruppiert nach Geschlecht", 
       x = "Beruf",
       y = "KUT [1 - 6]",
       colour = "Geschlecht",
       caption = "Fehlerbalken zeigen Standardfehler des Mittelwertes") +
  NULL
#ggsave("HildebrandtCaleroValdesPunktdiagrammANOVA.pdf", width = 6, height = 5)

data %>% 
ANOVA(dep = "kut", factors = c("gender", "job_type"))


data %>% 
  filter(gender != "keine Angabe") %>%
  filter(!is.na(job_type)) %>% 
  ggplot() +
aes(x = age, fill = job_type) +
  geom_histogram(bins = 20) +
  scale_fill_brewer(palette = "Paired") +
  labs(title = "Studentische Stichprobe",
       x = "Alter",
       y = "Häufigkeit (absolut)", 
       fill = "Berufsstatus",
       caption = 'Histogramm mit 20 Bins',
       subtitle = 'Histogramm des Alters nach Geschlecht und Bildung') +
  theme_bw() +
  facet_wrap(vars(gender))
NULL -> p_alter_geschlecht_jobs



