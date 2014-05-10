source("plot_utils.R")

plot2 <- function (data = NULL, save = T) {
    if (is.null(data)) {
        data <- read_data()
    }
    
    if (save) {
        png(filename="plot2.png", width=480, height=480, bg="transparent" )
    }
    plot(
        y=data$Global_active_power, x=data$Time, type="l",
        ylab="Global Active Power (kilowatts)",
        xlab=""
    )
    
    if (save) {
        dev.off()
    }
}