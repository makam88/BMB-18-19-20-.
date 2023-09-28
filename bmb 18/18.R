# Load necessary packages
install.packages("ggplot2")
library(ggplot2)

# Create a data frame with your data
data <- data.frame(
  Time = c(48, 72, 96),
  Enzyme = rep(c("Cellulase", "Xylanase", "Pectinase", "Lignin Peroxidase"), each = 3),
  Mean = c(44, 55, 78, 35, 48, 76, 48, 68, 82, 32, 48, 75),
  SE = c(2.45, 2.2, 2.6, 2.5, 2, 1.6, 2.35, 2, 2.3, 1.8, 2.35, 2.6)
)

# Create the grouped bar plot with error bars
p <- ggplot(data, aes(x = Time, y = Mean, fill = Enzyme)) +
  geom_bar(stat = "identity", position = position_dodge(width = 20), width = 17) +
  geom_errorbar(aes(ymin = Mean - SE, ymax = Mean + SE), position = position_dodge(width =20), width = 17) +
  labs(x = "Time (Hour)", y = "Activity(U/mL)", title = "HSTU-bmb18") +
  scale_fill_manual(values = c("blue", "green", "orange", "red")) +
  theme_classic() +
  scale_x_continuous(breaks = c(48, 72, 96))

# Show the plot
print(p)

