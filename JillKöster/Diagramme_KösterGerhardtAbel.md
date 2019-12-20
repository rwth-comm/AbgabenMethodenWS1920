    library(ggplot2)

    ggplot(datensatz) +
     aes(x = gender, weight = pflege) +
     geom_bar(fill = "#0c4c8a") +
     labs(x = " ", y = " ", title = " ", subtitle = " ", caption = " ") +
     theme_linedraw()

![](Diagramme_KösterGerhardtAbel_files/figure-markdown_strict/unnamed-chunk-1-1.png)

    library(ggplot2)

    datensatz %>%
      filter(gender != "keine Angabe") %>%
      group_by(gender) %>%
      summarise(pflege_m = mean(pflege), pflege_sem = std.error(pflege)) %>%

    ggplot() +
     aes(x = gender, weight = pflege_m, ymin = pflege_m-pflege_sem ,ymax = pflege_m+pflege_sem, fill = gender) +
     geom_bar(fill = c(rwthfarben$lightblue, rwthfarben$violet), width = 0.4) +
     geom_errorbar(width = 0.2) +
     labs(x = "Geschlecht", 
          y = "Pflege [0-3]", 
          title = "Frauen würden sich eher pflegen lassen", 
          subtitle = "Geschlechtsunterschiede im Säulendiagramm", 
          caption = "Fehlerindikatoren zeigen Standardfehler des Mittelwerts.") +
     theme_linedraw()

![](Diagramme_KösterGerhardtAbel_files/figure-markdown_strict/unnamed-chunk-2-1.png)
