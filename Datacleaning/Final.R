library(tidyverse)
library (lubridate)
library (psych)
# raw <- read_csv("data/Omni.csv")

source("data/qualtricshelpers.R")
filename <- "data/Omni.csv"

raw <- load_qualtrics_csv(filename)
raw.short <- raw[, c(-1:-17, -42: -96, -142: -174)]

names(raw.short) [1] <- "Geschlecht"
names(raw.short) [2] <- "Familienstand."
names(raw.short) [3] <- "Alter"
names(raw.short) [4] <-"Schulabschluss"
names(raw.short) [5] <- "Berufsstatus"
names(raw.short) [6] <- "kut1"
names(raw.short) [7] <-"kut2"
names(raw.short) [8] <-"kut3"
names(raw.short) [9] <- "kut4"
names(raw.short) [10] <- "Ausbildung"
names(raw.short) [11] <- "Studiumsart"
names(raw.short) [12] <- "Jobbezeichnung"
names(raw.short) [13] <- "Arbeitsverhältnisart"
names(raw.short) [14] <- "Berufserfahrung"
names(raw.short) [15] <- "Wochenarbeitsstunden"
names(raw.short) [16] <- "WE.Chancen"
names(raw.short) [17] <- "WE.Risiken"
names(raw.short) [18] <- "WE.Jobwechsel"
names(raw.short) [19] <- "WE.Arbeitssuche"
names(raw.short) [20] <-"Arbeitsplatzsicherung"
names(raw.short) [21] <-"Vollständigkeit AufgabenBereich"
names(raw.short) [22] <- "Verpflichtungen"
names(raw.short) [23] <- "Selbstständigkeit"
names(raw.short) [24] <- "Offenheit"
names(raw.short) [25] <-"Urlaubstage"
names(raw.short) [26] <- "Überstundenabbau"
names(raw.short) [27] <- "AK"
names(raw.short) [28] <-"AK.Arbeitskollegen"
names(raw.short) [29] <-"AK.Arbeitsgeber"
names(raw.short) [30] <- "AK.Ratfragen"
names(raw.short) [31] <- "AK.Chefeinschätzung"
names(raw.short) [32] <- "AK.Feedback"
names(raw.short) [33] <- "AK.Coachen"
names(raw.short) [34] <- "AK.Inspiration"
names(raw.short) [35] <- "AA.Entwicklung"
names(raw.short) [36] <- "AA.Übermotivation"
names(raw.short) [37] <- "AA.Projekte"
names(raw.short) [38] <- "AA.Herausforderung"
names(raw.short) [39] <- "AA.Proaktiv"
names(raw.short) [40] <- "AA.Challenge"
names(raw.short) [41] <-"AA.B.Herausforderung" 
names(raw.short) [42] <-"AA.Stress Herausf."
names(raw.short) [43] <-"AA.Arbeitsplatzsicherung2"
names(raw.short) [44] <- "AM.Arbeitgeber"
names(raw.short) [45] <- "AM.Arbeitskollegen"
names(raw.short) [46] <- "AM.Bekannte"
names(raw.short) [47] <- "AM.Selbst"
names(raw.short) [48] <- "AM.Auswahl"
names(raw.short) [49] <- "AM.Text"
names(raw.short) [50] <-"Q131.Zusatz"
names(raw.short) [51] <- "Motivation morgens"
names(raw.short) [52] <- "Leistungsdruck Konkurrenz"
names(raw.short) [53] <-"Motivation Konkurrenz"
names(raw.short) [54] <-"WLB.Arbeit/PL"
names(raw.short) [55] <- "WLB.Arbeit nach Feierabend"
names(raw.short) [56] <- "WLB.Emails Feierabend"
names(raw.short) [57] <- "WLB.Ruhephasen"
names(raw.short) [58] <- "WLB.Genug Freizeit"
names(raw.short) [59] <- "WLB.Wunschfreizeit"
names(raw.short) [60] <- "WLB.Stress/Arbeit"
names(raw.short) [61] <- "WLB.Stress/Umgang"
names(raw.short) [62] <- "WLB.Arbeitstier"
names(raw.short) [63] <- "WLB.Familienmensch"
names(raw.short) [64] <- "WLB.Vereinbarung A/PL"
names(raw.short) [65] <- "WLB.Hobbys"
names(raw.short) [66] <-"WLB.Gedanken Arbeit" 
names(raw.short) [67] <-"FG.Auswahl"
names(raw.short) [68] <-"FG.Text"
names(raw.short) [69] <- "WLB.Erreichbarkeit"

raw.short$dd.Geschlecht <- as.factor(raw.short$Geschlecht)
raw.short$dd.Familienstand. <- as.factor(raw.short$Familienstand.)
raw.short$dd.Alter <- as.factor(raw.short$Alter)
raw.short$dd.Berufsstatus <- as.factor(raw.short$Berufsstatus)
raw.short$dd.Ausbildung <- as.factor(raw.short$Ausbildung)
raw.short$dd.Studiumsart <- as.factor(raw.short$Studiumsart)
raw.short$dd.Jobbezeichnung <- as.factor(raw.short$Jobbezeichnung)
raw.short$dd.Arbeitsverhältnisart <- as.factor(raw.short$Arbeitsverhältnisart)
raw.short$dd.Berufserfahrung <- as.factor(raw.short$Berufserfahrung)
raw.short$dd.Wochenarbeitsstunden <- as.factor(raw.short$Wochenarbeitsstunden)
raw.short$dd.Urlaubstage <- as.factor(raw.short$Urlaubstage)
raw.short$dd.Überstundenabbau <- as.factor(raw.short$Überstundenabbau)
raw.short$am.Text <- as.factor(raw.short$AM.Text)
raw.short$am.Auswahl <- as.factor(raw.short$AM.Auswahl)
raw.short$fg.Auswahl <- as.factor(raw.short$FG.Auswahl)
raw.short$fg.Text <- as.factor(raw.short$FG.Text)

raw.short$Schulabschluss <- ordered(raw.short$Schulabschluss,levels = c("Kein Schulabschluss", "Volks-oder Hauptschulabschluss", "Mittlere Reife/Realschulabschluss", "Fachhochschulreife/Fachabitur", "Allgemeine Hochschulreife/Abitur", "Abgeschlossene Berufsausbildung", "Bachelor", "Master", "Promotion", "Habilitation", "Keiner der hier genanneten"))

scale.zustimmung <- c("Stimme völlig zu", 2, 3, 4, 5, "Stimme gar nicht zu")

raw.short$k.kut1 <- ordered(raw.short$kut1,levels = scale.zustimmung)
raw.short$k.kut2 <- ordered(raw.short$kut2,levels = scale.zustimmung)
raw.short$k.kut3 <- ordered(raw.short$kut3,levels = scale.zustimmung)
raw.short$k.kut4 <- ordered(raw.short$kut4,levels = scale.zustimmung)
raw.short$we.Chancen <- ordered(raw.short$WE.Chancen,levels = scale.zustimmung)
raw.short$we.Risiken <- ordered(raw.short$WE.Chancen,levels = scale.zustimmung)
raw.short$we.Jobwechsel <- ordered(raw.short$WE.Jobwechsel,levels = scale.zustimmung)
raw.short$we.Arbeitssuche <- ordered(raw.short$WE.Arbeitssuche,levels = scale.zustimmung)
raw.short$as.Arbeitsplatzsicherung <- ordered(raw.short$Arbeitsplatzsicherung,levels = scale.zustimmung)
raw.short$`as.Vollständigkeit AufgabenBereich` <- ordered(raw.short$`Vollständigkeit AufgabenBereich`,levels = scale.zustimmung)
raw.short$as.Verpflichtungen <- ordered(raw.short$Verpflichtungen,levels = scale.zustimmung)
raw.short$as.Selbstständigkeit <- ordered(raw.short$Selbstständigkeit,levels = scale.zustimmung)
raw.short$as.Offenheit <- ordered(raw.short$Offenheit,levels = scale.zustimmung)
raw.short$ak <- ordered(raw.short$AK,levels = scale.zustimmung)
raw.short$ak.Arbeitsgeber <- ordered(raw.short$AK.Arbeitsgeber,levels = scale.zustimmung)
raw.short$ak.Arbeitskollegen <- ordered(raw.short$AK.Arbeitskollegen,levels = scale.zustimmung)
raw.short$ak.Chefeinschätzung <- ordered(raw.short$AK.Chefeinschätzung,levels = scale.zustimmung)
raw.short$ak.Coachen <- ordered(raw.short$AK.Coachen,levels = scale.zustimmung)
raw.short$ak.Feedback <- ordered(raw.short$AK.Feedback,levels = scale.zustimmung)
raw.short$ak.Inspiration <- ordered(raw.short$AK.Inspiration,levels = scale.zustimmung)
raw.short$ak.Ratfragen <- ordered(raw.short$AK.Ratfragen,levels = scale.zustimmung)
raw.short$aa.Arbeitsplatzsicherung2 <- ordered(raw.short$AA.Arbeitsplatzsicherung2,levels = scale.zustimmung)
raw.short$aa.B.Herausforderung <- ordered(raw.short$AA.B.Herausforderung,levels = scale.zustimmung)
raw.short$aa.Challenge <- ordered(raw.short$AA.Challenge,levels = scale.zustimmung)
raw.short$aa.Entwicklung <- ordered(raw.short$AA.Entwicklung,levels = scale.zustimmung)
raw.short$aa.Herausforderung <- ordered(raw.short$AA.Herausforderung,levels = scale.zustimmung)
raw.short$aa.Proaktiv <- ordered(raw.short$AA.Proaktiv,levels = scale.zustimmung)
raw.short$aa.Projekte <- ordered(raw.short$AA.Projekte,levels = scale.zustimmung)
raw.short$`aa.Stress Herausf.` <- ordered(raw.short$`AA.Stress Herausf.`,levels = scale.zustimmung)
raw.short$aa.Übermotivation <- ordered(raw.short$AA.Übermotivation,levels = scale.zustimmung)
raw.short$am.Arbeitgeber <- ordered(raw.short$AM.Arbeitgeber,levels = scale.zustimmung)
raw.short$am.Arbeitskollegen <- ordered(raw.short$AM.Arbeitskollegen,levels = scale.zustimmung)
raw.short$am.Bekannte <- ordered(raw.short$AM.Bekannte,levels = scale.zustimmung)
raw.short$am.Selbst <- ordered(raw.short$AM.Selbst,levels = scale.zustimmung)
raw.short$`ko.Leistungsdruck Konkurrenz` <- ordered(raw.short$`Leistungsdruck Konkurrenz`,levels = scale.zustimmung)
raw.short$`ko.Motivation Konkurrenz` <- ordered(raw.short$`Motivation Konkurrenz`,levels = scale.zustimmung)
raw.short$`wlb.Arbeit/PL` <- ordered(raw.short$`WLB.Arbeit/PL`,levels = scale.zustimmung)
raw.short$`wlb.Arbeit nach Feierabend` <- ordered(raw.short$`WLB.Arbeit nach Feierabend`,levels = scale.zustimmung)
raw.short$wlb.Arbeitstier <- ordered(raw.short$WLB.Arbeitstier,levels = scale.zustimmung)
raw.short$`wlb.Emails Feierabend` <- ordered(raw.short$`WLB.Emails Feierabend`,levels = scale.zustimmung)
raw.short$wlb.Familienmensch <- ordered(raw.short$WLB.Familienmensch,levels = scale.zustimmung)
raw.short$`wlb.Gedanken Arbeit` <- ordered(raw.short$`WLB.Gedanken Arbeit`,levels = scale.zustimmung)
raw.short$`wlb.Genug Freizeit` <- ordered(raw.short$`WLB.Genug Freizeit`,levels = scale.zustimmung)
raw.short$wlb.Hobbys <- ordered(raw.short$WLB.Hobbys,levels = scale.zustimmung)
raw.short$wlb.Ruhephasen <- ordered(raw.short$WLB.Ruhephasen,levels = scale.zustimmung)
raw.short$`wlb.Stress/Arbeit` <- ordered(raw.short$`WLB.Stress/Arbeit`,levels = scale.zustimmung)
raw.short$`wlb.Stress/Umgang` <- ordered(raw.short$`WLB.Stress/Umgang`,levels = scale.zustimmung)
raw.short$`wlb.Vereinbarung A/PL` <- ordered(raw.short$`WLB.Vereinbarung A/PL`,levels = scale.zustimmung)
raw.short$wlb.Wunschfreizeit <- ordered(raw.short$WLB.Wunschfreizeit,levels = scale.zustimmung)
raw.short$wlb.Erreichbarkeit <- ordered(raw.short$WLB.Erreichbarkeit,levels = scale.zustimmung)

scale.zustimmung2 <- c("Ich muss zur Arbeit", "Ich fühle mich Verpflichtet zur Arbeit zu gehen", "Ich möchte ungern zur Arbeit", "Ich möchte eher nicht zur Arbeit", "Ich sollte zur Arbeit", "Neutral", "Ich bin nicht abgeneigt zur Arbeit zu gehen", "Ich möchte eher arbeiten als nicht arbeiten", "Ich möchte zur Arbeit")


schluesselliste <- list(DD= c("dd.Geschlecht","dd.Familienstand.", "dd.Alter","dd.Berufsstatus","dd.Ausbildung",
                              "dd.Studiumsart", "dd.Jobbezeichnung", "dd.Arbeitsverhältnisart", "dd.Berufserfahrung", 
                              "dd.Wochenarbeitsstunden", "dd.Urlaubstage", "dd.Überstundenabbau"),
                            
                            AM= c("am.Text", "am.Auswahl"),
                            FG= c("fg.Auswahl", "fg.Text"),
                            K= c("k.kut1", "k.kut2", "k.kut3", "k.kut4"),
                            WE= c("we.Chancen", "we.Risiken", "we.Jobwechsel", "we.Arbeitssuche"),
                            AS= c("as.Arbeitsplatzsicherung", "as.Vollständigkeit AufgabenBereich", "as.Verpflichtungen", "as.Selbstständigkeit", "as.Offenheit"),
                            AK= c( "ak", "ak.Arbeitsgeber", "ak.Arbeitskollegen", "ak.Chefeinschätzung", "ak.Coachen", "ak.Feedback", "ak.Inspiration", "ak.Ratfragen"),
                            AA= c("aa.Arbeitsplatzsicherung2", "aa.B.Herausforderung", "aa.Challenge", "aa.Entwicklung","aa.Herausforderung","aa.Proaktiv","aa.Projekte",
                                  "aa.Stress Herausf.", "aa.Übermotivation"),
                            AM= c("am.Arbeitgeber","am.Arbeitskollegen", "am.Bekannte","am.Selbst"),
                            KO= c("ko.Leistungsdruck Konkurrenz", "ko.Motivation Konkurrenz"),
                            WLB= c("wlb.Arbeit/PL", "wlb.Arbeit nach Feierabend", "wlb.Arbeitstier", "wlb.Emails Feierabend",
                                   "wlb.Familienmensch", "wlb.Gedanken Arbeit", "wlb.Genug Freizeit", "wlb.Hobbys", "wlb.Ruhephasen",
                                   "wlb.Stress/Arbeit", "wlb.Stress/Umgang", "wlb.Vereinbarung A/PL", "wlb.Wunschfreizeit", "wlb.Erreichbarkeit")
                                                    )

scores<- scoreItems(schluesselliste, raw.short, missing=TRUE, min=1, max=6)

data <- bind_cols(raw.short, as_tibble(scores$scores))

data<- data%>%
  select(-starts_with("dd",ignore.case = F)) %>%
  select(-starts_with("am",ignore.case = F)) %>%
  select(-starts_with("k",ignore.case = F)) %>%
  select(-starts_with("we",ignore.case = F)) %>%
  select(-starts_with("as",ignore.case = F)) %>%
  select(-starts_with("ak",ignore.case = F)) %>%
  select(-starts_with("aa",ignore.case = F)) %>%
  select(-starts_with("am",ignore.case = F)) %>%
  select(-starts_with("ko",ignore.case = F)) %>%
  select(-starts_with("wlb",ignore.case = F)) 
  
  
saveRDS(data, "data/data.rds")
  




















