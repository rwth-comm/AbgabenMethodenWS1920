## Datacleaning
library(tidyverse)
# raw <- read_csv("data/Omni.csv")

source("data/qualtricshelpers.R")
filename <- "data/Omni.csv"

#Rohdaten laden

raw <- load_qualtrics_csv(filename)
raw.short <- raw[, c(-1:-17, -19, -20:-92, -141:-174)]


# Names
names(raw.short) [1] <- "Geschlecht" 
names(raw.short) [2] <- "k.A."
names(raw.short) [3] <- "Urlaub in Tagen"
names(raw.short) [4] <-"Wie Überstunden"
names(raw.short) [5] <- "Wohlfühlen Arbeitsplatz"
names(raw.short) [6] <- "Verhältnis Kollegen"
names(raw.short) [7] <-"Verhältnis Arbeitgeber"
names(raw.short) [8] <-"Rat fragen"
names(raw.short) [9] <- "Vorgesetzter zufrieden?"
names(raw.short) [10] <- "Feedback"
names(raw.short) [11] <- "Coachen"
names(raw.short) [12] <- "Inspiration"
names(raw.short) [13] <- "neue Arbeitsweisen"
names(raw.short) [14] <- "Zusatzaufgaben"
names(raw.short) [15] <- "neue Projekte"
names(raw.short) [16] <- "Heruasforderungen"
names(raw.short) [17] <- "Proaktiv"
names(raw.short) [18] <- "herausgefordert"
names(raw.short) [19] <- "gerne herausgefordert"
names(raw.short) [20] <-"gestresst"
names(raw.short) [21] <-"Risiko für Erfolg"
names(raw.short) [22] <- "Arbeitsplatz sichern"
names(raw.short) [23] <- "Aufgaben erfüllen"
names(raw.short) [24] <- "Verpflichtungen"
names(raw.short) [25] <-"Arbetsplatz sichern"
names(raw.short) [26] <- "Motivation Arbeitgeber"
names(raw.short) [27] <- "Motivation Kollegen"
names(raw.short) [28] <-"Motivation Familie"
names(raw.short) [29] <-"Motivation selbst"
names(raw.short) [30] <- "Motivation"
names(raw.short) [31] <- "Motivation"
names(raw.short) [32] <- "morgens aufstehen"
names(raw.short) [33] <- "morgens aufstehen"
names(raw.short) [34] <- "Leistungsdruck"
names(raw.short) [35] <- "höhere Motivation"
names(raw.short) [36] <- "Arbeit/ Privatleben"
names(raw.short) [37] <- "Feierabend weiterarbeiten"
names(raw.short) [38] <- "Feierabend Emails"
names(raw.short) [39] <- "Ruhephasen"
names(raw.short) [40] <- "Freizeit"
names(raw.short) [41] <-"mehr Freizeit" 
names(raw.short) [42] <-"aktuell gestresst"
names(raw.short) [43] <-"Stressumgang"
names(raw.short) [44] <- "Arbeitstier"
names(raw.short) [45] <- "Familienmensch"
names(raw.short) [46] <- "Arbeit & Privat"
names(raw.short) [47] <- "Hobbies"
names(raw.short) [48] <- "Freizeit Arbeit"
names(raw.short) [49] <- "Freizeitgestaltung"





  # unsere Fragen: Q124-136 + gender, age, marital status, eucation, activity, Q17, Q21, Q33, Q25, Q27, Q80, regfoc
