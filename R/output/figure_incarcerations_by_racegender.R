# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.
# my theme 
my_theme = theme_minimal(base_family = "Arial Narrow", base_size = 12) +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        plot.title = element_text(face = "bold", size = rel(1.7)),
        plot.subtitle = element_text(face = "plain", size = rel(1.3), color = "grey70"),
        plot.caption = element_text(face = "italic", size = rel(0.7), 
                                    color = "grey70", hjust = 0),
        legend.title = element_text(face = "bold"),
        strip.text = element_text(face = "bold", size = rel(1.1), hjust = 0),
        axis.title = element_text(face = "bold"),
        axis.title.x = element_blank(),
        axis.title.y = element_text(margin = margin(r = 10), hjust = 1))

read_csv(here("data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(incarceration_length = mean(incarceration_length)) %>%
  ggplot(aes(race, incarceration_length, fill = gender)) +
    geom_bar(stat = "identity", position = position_dodge(preserve = "single")) +
    labs(
      x = "", 
      y = "Mean Incarceration Length (mo)", 
      fill = "Gender",
      title = "Mean Length of Incarceration (months) in 2002 by Race and Gender") +
    my_theme +
    scale_fill_manual(values = c("steelblue4", "steelblue2"))

ggsave(here("figures/incarcerations_by_racegender.png"), width=8, height=4.5)
