set.seed(22555)


a <- as.numeric(binomialfreq(0.07, 0.10, 1000, simulation = 1, block = 50, 
             min_patient_earlystop = 100)$randomization_ratio)

b <- 1 - a

df <- data.frame(prob = c(a, b), patient = seq(0, 980, 20), 
                 treatment = rep(c("A", "B"), each = 50))
  
ggplot(data = df, aes(x = patient, y = prob, group = treatment, color = treatment)) +
  geom_line() + geom_point()+
  theme_minimal() + 
  theme(
    panel.background = element_rect(fill = "white",
                                    colour = "lightblue",
                                    size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                    colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "white"), 
    plot.background = element_rect(fill = "white")
  ) +
  theme(legend.justification=c(1,0), legend.position=c(0.75,0.75), 
        legend.title=element_text(size=11), 
        legend.text=element_text(size=9), axis.title=element_text(size=12)) +
  scale_x_continuous(name = "Number of Patients Accrued") +
  scale_y_continuous(name = "Probability")
ggsave("line_graph.pdf")



library(ggplot2)
library(gganimate)

set.seed(22555)


a <- as.numeric(binomialfreq(0.07, 0.10, 1000, simulation = 1, block = 50, 
                             min_patient_earlystop = 100)$randomization_ratio)

b <- 1 - a

df <- data.frame(prob = c(a, b), patient = seq(0, 980, 20), 
                 treatment = rep(c("A", "B"), each = 50))

p <- ggplot(df, aes(x = patient, y = prob, group = treatment, color = treatment)) + 
  geom_line() + 
  geom_segment(aes(xend = 1000, yend = prob), linetype = 2) + 
  geom_point(size = 2) + 
  geom_text(aes(x = 31.1, label = treatment), hjust = 0) + 
  transition_reveal(patient) + 
  coord_cartesian(clip = 'off') + 
  theme(panel.background = element_rect(fill = "white",
                                        colour = "lightblue",
                                        size = 0.5, linetype = "solid"),
        panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                        colour = "white"), 
        panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                        colour = "white"), 
        plot.background = element_rect(fill = "white")) +
  theme(legend.justification=c(1,0), legend.position=c(0.75,0.75), 
        legend.title=element_text(size=11), 
        legend.text=element_text(size=9), 
        axis.title=element_text(size=15), 
        axis.text=element_text(size=13)) +
  scale_x_continuous(name = "Number of Patients Accrued") +
  scale_y_continuous(name = "Probability") +
  theme(plot.margin = margin(5.5, 40, 5.5, 5.5))

animate(p, nframes = 20, renderer = gifski_renderer("RAR.png"))