    devtools::install_github("HCIC/r-tools")

    ## WARNING: Rtools is required to build R packages, but is not currently installed.
    ## 
    ## Please download and install Rtools custom from http://cran.r-project.org/bin/windows/Rtools/.

    ## Skipping install of 'hcictools' from a github remote, the SHA1 (7d8e5458) has not changed since last install.
    ##   Use `force = TRUE` to force installation

    rwthfarben <- hcictools::rwth.colorpalette()


    # Balkendiagramm (Jobtyp und robo_toilett)

    datensatz %>% 
    filter(job_type != "keine Angabe") %>% 
    group_by(job_type) %>%   
    summarise(robo_toilett_m = mean(robo_toilett, na.rm = TRUE)-1, robo_toilett_sem = std.error(robo_toilett)) %>% 

      ggplot() +
      aes(x = job_type, weight = robo_toilett_m, ymin = robo_toilett_m-robo_toilett_sem , ymax = robo_toilett_m+robo_toilett_sem, fill = job_type) +
      
      geom_bar(fill = c(rwthfarben$magenta, rwthfarben$petrol, rwthfarben$magenta, rwthfarben$petrol, rwthfarben$magenta)) +
      
      geom_errorbar(width = 0.5) +
      
      scale_y_continuous(limits = c(0,5)) +
     
      
      labs(x = "Jobtyp",
          y = "Anzahl der Zustimmungen",
          title = "Jobtyp nimmt keinen Einfluss auf die Akzeptanz", 
          subtitle = "Balkendiagramm zu den Jobtypen",
          caption = "Fehlerindikatoren zeigen Standardfehler für den Mittelwert an") +
     theme_fivethirtyeight()

![](Diagramm_GaneshabalanStuhlmannKlein_files/figure-markdown_strict/unnamed-chunk-1-1.png)

    NULL

    ## NULL

    ggsave("Diagramm_GaneshabalanStuhlmannKlein.pdf", width = 210, height = 297, units = "mm")
