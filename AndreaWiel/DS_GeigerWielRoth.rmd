---
title: "DS_GeigerWielRoth"
output: md_document
---

# Dies sind die desktiptiven Statistiken für den Datensatz.
Man sieht deskriptiv, dass die Probanden sich eher von einem Roboter, als von einem Menschen beim Toilettengang helfen lassen würden.

```{r}
library(tidyverse)

datensatz <- readRDS("robo_pflege.rds")

datensatz_kurz <- datensatz[,c("age", "gender", "kut", "human_toilett", "robo_toilett")]

datensatz_kurz %>% psych::describe() %>% select(vars, mean, sd, median, min, max)


```



# Histogramme

```{r}
datensatz %>% select(robo_toilett) %>% ggplot() + aes(x = robo_toilett) + geom_histogram(bins = 30, fill="red")
```



```{r}
datensatz %>% select(human_toilett) %>% ggplot() + aes(x = human_toilett) + geom_histogram(bins = 30, fill="blue")

```

## mit Pipe
```{r}
datensatz_kurz %>% psych::describe() %>% select()
```


## ohne Pipe
```{r}
psych::describe(select(datensatz)human_toilett)
```


