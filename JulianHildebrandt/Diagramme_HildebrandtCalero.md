    ggplot(datensatz) +
     aes(x = gender, weight = kut) +
     geom_bar(fill = "#0c4c8a") +
     labs(x = " ", 
          y = " ", 
          title = " ", 
          subtitle = " ", 
          caption = " ") +
     theme_linedraw()

![](Diagramme_HildebrandtCalero_files/figure-markdown_strict/unnamed-chunk-1-1.png)

Todo:
=====

1. richtige Werte CHECK!
========================

2. Beschriftungen CHECK!
========================

3. Fehlerbalken CHECK!
======================

4. Optik CHECK!
===============

5. y-Achse? CHECK!
==================

6. Abspeichern?
===============

    datensatz %>% 
      filter(gender != "keine Angabe") %>% 
      group_by(gender) %>% 
      summarise(kut_m = mean(kut)-1, kut_sem = std.error(kut)) %>% 
    ggplot() +
      aes(x = gender, weight = kut_m, ymin = kut_m-kut_sem , ymax = kut_m+kut_sem, fill = gender) +
      geom_bar(fill = c(rwthfarben$lightblue, rwthfarben$red), width = 0.4) +
      geom_errorbar(width = 0.2) +
      scale_y_continuous(limits = c(0,5)) +
      labs(x = "Geschlecht", 
           y = "KUT [0-5]", 
           title = "Männer trauen sich bei Technik mehr zu", 
           subtitle = "Geschlechtsunterschiede im Säulendiagramm", 
           caption = "Fehlerindikatoren zeigen Standardfehler des Mittelwerts.") +
      theme_linedraw() +
      NULL

![](Diagramme_HildebrandtCalero_files/figure-markdown_strict/unnamed-chunk-2-1.png)
