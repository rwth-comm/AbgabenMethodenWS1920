library(tidyverse)
# raw <- read_csv("data/Omni.csv")

source("data/load_qualtrics.R")
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
names(raw.short) [10] <- "Ausbildung?"
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
names(raw.short) [69] <- "Erreichbarkeit"

raw.short$Geschlecht <- as.factor(raw.short$Geschlecht)
raw.short$Familienstand. <- as.factor(raw.short$Familienstand.)
raw.short$Alter <- as.factor(raw.short$Alter)
raw.short$Berufsstatus <- as.factor(raw.short$Berufsstatus)
raw.short$`Ausbildung?` <- as.factor(raw.short$`Ausbildung?`)
raw.short$Studiumsart <- as.factor(raw.short$Studiumsart)
raw.short$Jobbezeichnung <- as.factor(raw.short$Jobbezeichnung)
raw.short$Arbeitsverhältnisart <- as.factor(raw.short$Arbeitsverhältnisart)
raw.short$Berufserfahrung <- as.factor(raw.short$Berufserfahrung)
raw.short$Wochenarbeitsstunden <- as.factor(raw.short$Wochenarbeitsstunden)
raw.short$Urlaubstage <- as.factor(raw.short$Urlaubstage)
raw.short$Überstundenabbau <- as.factor(raw.short$Überstundenabbau)
raw.short$AM.Text <- as.factor(raw.short$AM.Text)
raw.short$AM.Auswahl <- as.factor(raw.short$AM.Auswahl)
raw.short$FG.Auswahl <- as.factor(raw.short$FG.Auswahl)
raw.short$FG.Text <- as.factor(raw.short$FG.Text)

raw.short$Schulabschluss <- ordered(raw.short$Schulabschluss,levels = c("Kein Schulabschluss", "Volks-oder Hauptschulabschluss", "Mittlere Reife/Realschulabschluss", "Fachhochschulreife/Fachabitur", "Allgemeine Hochschulreife/Abitur", "Abgeschlossene Berufsausbildung", "Bachelor", "Master", "Promotion", "Habilitation", "Keiner der hier genanneten"))

scale.zustimmung <- c("Stimme völlig zu", "Stimme zzu", "Stimme eher zu", "Stimme eher nicht zu", "Stimme nicht zu", "Stimme garnicht zu")

raw.short$kut1 <- ordered(raw.short$kut1,levels = scale.zustimmung)
raw.short$kut2 <- ordered(raw.short$kut2,levels = scale.zustimmung)
raw.short$kut3 <- ordered(raw.short$kut3,levels = scale.zustimmung)
raw.short$kut4 <- ordered(raw.short$kut4,levels = scale.zustimmung)
raw.short$kut1 <- ordered(raw.short$kut1,levels = scale.zustimmung)
raw.short$WE.Chancen <- ordered(raw.short$WE.Chancen,levels = scale.zustimmung)
raw.short$WE.Risiken <- ordered(raw.short$WE.Chancen,levels = scale.zustimmung)
raw.short$WE.Jobwechsel <- ordered(raw.short$WE.Jobwechsel,levels = scale.zustimmung)
raw.short$WE.Arbeitssuche <- ordered(raw.short$WE.Arbeitssuche,levels = scale.zustimmung)
raw.short$Arbeitsplatzsicherung <- ordered(raw.short$Arbeitsplatzsicherung,levels = scale.zustimmung)
raw.short$`Vollständigkeit AufgabenBereich` <- ordered(raw.short$`Vollständigkeit AufgabenBereich`,levels = scale.zustimmung)
raw.short$Verpflichtungen <- ordered(raw.short$Verpflichtungen,levels = scale.zustimmung)
raw.short$Selbstständigkeit <- ordered(raw.short$Selbstständigkeit,levels = scale.zustimmung)
raw.short$Offenheit <- ordered(raw.short$Offenheit,levels = scale.zustimmung)
raw.short$AK <- ordered(raw.short$AK,levels = scale.zustimmung)
raw.short$AK.Arbeitsgeber <- ordered(raw.short$AK.Arbeitsgeber,levels = scale.zustimmung)
raw.short$AK.Arbeitskollegen <- ordered(raw.short$AK.Arbeitskollegen,levels = scale.zustimmung)
raw.short$AK.Chefeinschätzung <- ordered(raw.short$AK.Chefeinschätzung,levels = scale.zustimmung)
raw.short$AK.Coachen <- ordered(raw.short$AK.Coachen,levels = scale.zustimmung)
raw.short$AK.Feedback <- ordered(raw.short$AK.Feedback,levels = scale.zustimmung)
raw.short$AK.Inspiration <- ordered(raw.short$AK.Inspiration,levels = scale.zustimmung)
raw.short$AK.Ratfragen <- ordered(raw.short$AK.Ratfragen,levels = scale.zustimmung)
raw.short$AA.Arbeitsplatzsicherung2 <- ordered(raw.short$AA.Arbeitsplatzsicherung2,levels = scale.zustimmung)
raw.short$AA.B.Herausforderung <- ordered(raw.short$AA.B.Herausforderung,levels = scale.zustimmung)
raw.short$AA.Challenge <- ordered(raw.short$AA.Challenge,levels = scale.zustimmung)
raw.short$AA.Entwicklung <- ordered(raw.short$AA.Entwicklung,levels = scale.zustimmung)
raw.short$AA.Herausforderung <- ordered(raw.short$AA.Herausforderung,levels = scale.zustimmung)
raw.short$AA.Proaktiv <- ordered(raw.short$AA.Proaktiv,levels = scale.zustimmung)
raw.short$AA.Projekte <- ordered(raw.short$AA.Projekte,levels = scale.zustimmung)
raw.short$`AA.Stress Herausf.` <- ordered(raw.short$`AA.Stress Herausf.`,levels = scale.zustimmung)
raw.short$AA.Übermotivation <- ordered(raw.short$AA.Übermotivation,levels = scale.zustimmung)
raw.short$AM.Arbeitgeber <- ordered(raw.short$AM.Arbeitgeber,levels = scale.zustimmung)
raw.short$AM.Arbeitskollegen <- ordered(raw.short$AM.Arbeitskollegen,levels = scale.zustimmung)
raw.short$AM.Bekannte <- ordered(raw.short$AM.Bekannte,levels = scale.zustimmung)
raw.short$AM.Selbst <- ordered(raw.short$AM.Selbst,levels = scale.zustimmung)
raw.short$`Leistungsdruck Konkurrenz` <- ordered(raw.short$`Leistungsdruck Konkurrenz`,levels = scale.zustimmung)
raw.short$`Motivation Konkurrenz` <- ordered(raw.short$`Motivation Konkurrenz`,levels = scale.zustimmung)
raw.short$`WLB.Arbeit/PL` <- ordered(raw.short$`WLB.Arbeit/PL`,levels = scale.zustimmung)
raw.short$`WLB.Arbeit nach Feierabend` <- ordered(raw.short$`WLB.Arbeit nach Feierabend`,levels = scale.zustimmung)
raw.short$WLB.Arbeitstier <- ordered(raw.short$WLB.Arbeitstier,levels = scale.zustimmung)
raw.short$`WLB.Emails Feierabend` <- ordered(raw.short$`WLB.Emails Feierabend`,levels = scale.zustimmung)
raw.short$WLB.Familienmensch <- ordered(raw.short$WLB.Familienmensch,levels = scale.zustimmung)
raw.short$`WLB.Gedanken Arbeit` <- ordered(raw.short$`WLB.Gedanken Arbeit`,levels = scale.zustimmung)
raw.short$`WLB.Genug Freizeit` <- ordered(raw.short$`WLB.Genug Freizeit`,levels = scale.zustimmung)
raw.short$WLB.Hobbys <- ordered(raw.short$WLB.Hobbys,levels = scale.zustimmung)
raw.short$WLB.Ruhephasen <- ordered(raw.short$WLB.Ruhephasen,levels = scale.zustimmung)
raw.short$`WLB.Stress/Arbeit` <- ordered(raw.short$`WLB.Stress/Arbeit`,levels = scale.zustimmung)
raw.short$`WLB.Stress/Umgang` <- ordered(raw.short$`WLB.Stress/Umgang`,levels = scale.zustimmung)
raw.short$`WLB.Vereinbarung A/PL` <- ordered(raw.short$`WLB.Vereinbarung A/PL`,levels = scale.zustimmung)
raw.short$WLB.Wunschfreizeit <- ordered(raw.short$WLB.Wunschfreizeit,levels = scale.zustimmung)
raw.short$Erreichbarkeit <- ordered(raw.short$Erreichbarkeit,levels = scale.zustimmung)

scale.zustimmung2 <- c("Ich muss zur Arbeit", "Ich fühle mich Verpflichtet zur Arbeit zu gehen", "Ich möchte ungern zur Arbeit", "Ich möchte eher nicht zur Arbeit", "Ich sollte zur Arbeit", "Neutral", "Ich bin nicht abgeneigt zur Arbeit zu gehen", "Ich möchte eher arbeiten als nicht arbeiten", "Ich möchte zur Arbeit")























