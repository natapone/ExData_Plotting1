source("plot_utils.R")

plot1 <- function () {
    data <- read_data()
    png(filename="plot1.png", width=480, height=480, bg="transparent" )
    hist(x= data$Global_active_power,
        main = "Global Active Power",
        xlab="Global Active Power (kilowatts)",
        col="red",
     )
    
    dev.off()
}
