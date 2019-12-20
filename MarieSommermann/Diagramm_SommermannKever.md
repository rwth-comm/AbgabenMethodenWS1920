    ggplot(datensatz) +
     aes(x = gender, weight = robo_bath) +
     geom_bar(fill = "#0c4c8a") +
     labs(x = " ",
     y = " ",
     title = " ",
     subtitle = " ",
     caption = " ") +
     theme_linedraw()

![](Diagramm_SommermannKever_files/figure-markdown_strict/unnamed-chunk-1-1.png)

    datensatz %>% 
      filter(gender != "keine Angabe") %>% 
      group_by(gender) %>% 
      summarise(pflege_m = mean(pflege)-1, pflege_sem =std.error(pflege)) %>% 
      
    ggplot() +
     aes(x = gender, weight = pflege_m, ymin = pflege_m-pflege_sem, ymax = pflege_m + pflege_sem, fill = gender) +
     geom_bar(fill= c(rwthfarben$turquois, rwthfarben$bordeaux), width = 0.4) +
      geom_errorbar(width=0.2) +
      scale_y_continuous(limits = c(0,5)) +
     labs(x = "Geschlecht",
     y = "Pflege (0-5)",
     title = "Frauen würden sich eher pflegen lassen",
     subtitle = "Geschlechtsunterschiede im Säulendiagramm",
     caption = "Fehlerindikatoren zeigen den Standardfehler des Mittelwerts.") +
     theme_linedraw()+
      NULL

![](Diagramm_SommermannKever_files/figure-markdown_strict/unnamed-chunk-2-1.png)
