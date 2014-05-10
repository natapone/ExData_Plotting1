source("plot2.R")
source("plot3.R")

plot4 <- function (data = NULL) {
    if (is.null(data)) {
        data <- read_data()
    }
    png(filename="plot4.png", width=480, height=480, bg="transparent" )
    
    # setup layout
    par(mfcol=c(2,2))
    
    # plot upper left 1-1
    plot2(data, save=F)
    
    # plot lower left 2-1
    plot3(data, save=F)
    
    # overwrite legend box color
    legend("topright", inset=0, 
           c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           lty=c(1,1,1),
           lwd=c(2.5,2.5,2.5),
           col=c("black","blue","red"),
           box.col=NA,
           horiz=F
    )
    
    # plot upper right 1-2
    plot_vol_datetime(data)
    
    # plot lower left 2-2
    plot_reactive_datetime(data)
    
    dev.off()
}

plot_vol_datetime <- function (data = NULL) {
    if (is.null(data)) {
        data <- read_data()
    }
    
    plot(
        y=data$Voltage, x=data$Time, type="l",
        ylab="Voltage",
        xlab="datetime"
    )
}

plot_reactive_datetime <- function (data = NULL) {
    if (is.null(data)) {
        data <- read_data()
    }
    
    plot(
        y=data$Global_reactive_power, x=data$Time, type="l",
        ylab="Global_reactive_power",
        xlab="datetime"
    )
    
    
}
