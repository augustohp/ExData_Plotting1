source("dataset-bootstrap.R")

# -----------------------------------------------------------------------------
# Plot 2
# - line graph
#   - `y` is Global Active power
#   - `x` is day of the week (from Thu to Sat)
plot(
  dataset$Global_active_power ~ dataset$datetime,
  type = "l",
  ylab="Global Active Power (kilowatts)",
  xlab=""
)

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()