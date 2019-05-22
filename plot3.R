source("dataset-bootstrap.R")

# -----------------------------------------------------------------------------
# Plot 3
# - line graph
#   - `y` is "Energy sub metering"
#     - sub_metring_1 in black
#     - sub_metring_2 in red
#     - sub_metring_3 in blue
#  - `x` is day of the week (from Thu to Sat)

with(
  dataset,
  {
    plot(
      Sub_metering_1 ~ datetime,
      type = "l",
      col = "black",
      ylab = "Energy sub metering",
      xlab = ""
    )
    lines(
      Sub_metering_2 ~ datetime,
      col = "red"
    )
    lines(
      Sub_metering_3 ~ datetime,
      col = "blue"
    )
  }
)
legend(
  "topright",
  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "o"
)

dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()
