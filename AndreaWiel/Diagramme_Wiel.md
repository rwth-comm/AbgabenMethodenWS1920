    library(ggplot2)

    ggplot(datensatz) +
     aes(x = gender, weight = pflege) +
     geom_bar(fill = "#0c4c8a") +
     labs(x = " ", y = " ", title = " ", subtitle = " ", caption = " ") +
     theme_linedraw()

![](Diagramme_Wiel_files/figure-markdown_strict/unnamed-chunk-1-1.png)

    datensatz %>% 
      filter(gender != "keine Angabe") %>%
      group_by(gender) %>%
      summarise(pflege_m = mean(pflege, na.rm = TRUE)-1, pflege_sem = std.error(pflege)) %>%
    ggplot() +
     aes(x = gender, weight = pflege_m, 
         ymin = pflege_m-pflege_sem, 
         ymax = pflege_m+pflege_sem, 
         fill = gender) +
     geom_bar(fill = c(rwthfarben$green, rwthfarben$bordeaux), width = 0.4) +
      geom_errorbar(width = 0.2) +
      scale_y_continuous(limits = c(0,5)) +
     labs(x = "Geschlecht",
          y = "pflege [0-5]",
          title = "Frauen & Männer lassen sich gleich oft pflegen",
          subtitle = "Geschlechtsunterschiede in Säulendiagrammen",
          caption = "Fehlerindikatoren zeigen Standardfehler des Mittelwerts") +
     theme_linedraw() +
      NULL

![](Diagramme_Wiel_files/figure-markdown_strict/unnamed-chunk-2-1.png)

    ggsave("C:/Users/Andrea Kristina/Desktop/RWTH/ws19/Basismodul Seminar Ordner fuer R/AbgabenMethodenWS1920/AndreaWiel/Diagramm_Wiel.pdf", width = 210, height = 297, units = "mm")
