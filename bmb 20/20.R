# Load necessary packages
install.packages("ggplot2")
library(ggplot2)

# Create a data frame with your data
data <- data.frame(
  Time = c(48, 72, 96),
  Enzyme = rep(c("Cellulase", "Xylanase", "Pectinase", "Lignin Peroxidase"), each = 3),
  Mean = c(40, 64, 85, 29, 55, 80, 25, 55, 75, 30, 47, 65),
  SE = c(2.7, 2.4, 2.1, 2.1, 1.55, 1.94, 2.85, 3.5, 2.6, 1.2, 1.5, 3.5)
)

# Create the grouped bar plot with error bars
p <- ggplot(data, aes(x = Time, y = Mean, fill = Enzyme)) +
  geom_bar(stat = "identity", position = position_dodge(width = 20), width = 17) +
  geom_errorbar(aes(ymin = Mean - SE, ymax = Mean + SE), position = position_dodge(width =20), width = 17) +
  labs(x = "Time (Hour)", y = "Activity(U/mL)", title = "HSTU-bmb20") +
  scale_fill_manual(values = c("blue", "green", "orange", "red")) +
  theme_classic() +
  scale_x_continuous(breaks = c(48, 72, 96))+
  scale_y_continuous(breaks = c(20, 40, 60, 80))

# Show the plot
print(p)

