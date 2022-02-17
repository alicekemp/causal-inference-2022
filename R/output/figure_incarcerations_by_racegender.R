# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.

tb = read_csv(here("data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(incarceration_length = mean(incarceration_length), 
            count = n())

ggplot(tb, aes(race, incarceration_length, fill = gender)) +
    geom_bar(stat = "identity", position = position_dodge(preserve = "single")) +
    labs(
      x = "", 
      y = "Mean Incarceration Length (mo)", 
      fill = "Gender",
      title = "Mean Length of Incarceration (months) in 2002 by Race and Gender") +
    theme_minimal() +
    scale_fill_manual(values = c("steelblue4", "steelblue2"))

ggsave(here("figures/incarcerations_by_racegender.png"), width=8, height=4.5)
