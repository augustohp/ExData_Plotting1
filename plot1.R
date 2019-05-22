source("dataset-bootstrap.R")

# -----------------------------------------------------------------------------
# Plot "Global Active Power"
# - histogram
#   - `y` is Frequency
#   - `x` is GAP (kilowatts)
#   - red bars

hist(
  dataset$Global_active_power, 
  col="red",
  main="Global Active Power", 
  xlab = "Global Active Power (kilowatts)"
)

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()