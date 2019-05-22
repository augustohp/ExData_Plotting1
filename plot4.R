source("dataset-bootstrap.R")

# -----------------------------------------------------------------------------
# Plot 4
# - 4 line graphs
# - Plot 1 at (1,1)
#   - `y` is "Global Active Power"
#   - `x` is day of the week (from Thu to Fri)
# - Plot 2 at (1,2)
#   - `y` is "Voltage"
#   - `x` is day of the week (from Thu to Fri)
#     - datetime label
# - Plot 3 at (2,1)
#   - `y` is "Energy sub metering"
#     - sub_metring_1 in black
#     - sub_metring_2 in red
#     - sub_metring_3 in blue
#   - `x` is day of the week (from Thu to Fri)
# - Plot 4 at (2,2)
#   - `y` is "Global Reactive Power"
#   - `x` is day of the week (from Thu to Fri)
#     - datetime label

par(mfrow = c(2,2))

plot(
  dataset$Global_active_power ~ dataset$datetime,
  type = "l",
  col = "black",
  ylab = "Global Active Power",
  xlab = ""
)

plot(
  dataset$Voltage ~ dataset$datetime,
  type = "l",
  col = "black",
  ylab = "Voltage",
  xlab = "datetime"
)

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
    legend(
      "topright",
      c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      col = c("black", "red", "blue"),
      lty = 1,
      bty = "n"
    )
  }
)

plot(
  dataset$Global_reactive_power ~ dataset$datetime,
  type = "l",
  col = "black",
  ylab = "Global_reactive_power",
  xlab = "datetime"
)

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()