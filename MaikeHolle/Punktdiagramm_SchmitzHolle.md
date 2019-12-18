    dataset %>%
      filter(gender != "keine Angabe") %>%
      group_by(gender) %>%
      summarise(Mensch = mean(human_food, na.rm = TRUE),
                Roboter = mean(robo_food, na.rm = TRUE)) %>%
      pivot_longer(cols = c(Mensch, Roboter),
                   names_to = "food_by",
                   values_to = "value") %>%
      ggplot() +
      aes(x = gender, y = value, color = food_by, group = food_by) +
      geom_point(size = 3) +
      geom_line() +
      scale_y_continuous(limits = c(1,6), breaks = 1:6) +
      labs(title = "Beide Geschlechter lassen sich lieber von einem Menschen füttern.",
           subtitle = "Geschlechtsunterschiede im Punktdiagramm (n = 322)",
           x = "Geschlecht",
           y = "Bereitschaft, sich füttern zu lassen [1-6]")

![](Punktdiagramm_SchmitzHolle_files/figure-markdown_strict/MANOVA-1.png)
