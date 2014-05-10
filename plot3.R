source("plot_utils.R")

plot3 <- function (data = NULL, save = T) {
    if (is.null(data)) {
        data <- read_data()
    }
    
    if (save) {
        png(filename="plot3.png", width=480, height=480, bg="transparent" )
    }
    plot(y=data$Sub_metering_1, 
         x=data$Time,
         type="l", 
        ylab="Energy sub metering", 
        xlab="",
        col="black",
    )
    
    lines(y=data$Sub_metering_2, x=data$Time, col="red")
    lines(y=data$Sub_metering_3, x=data$Time, col="blue")
    
    if (save) {
        legend("topright", inset=0, 
               c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
               lty=c(1,1,1),
               lwd=c(2.5,2.5,2.5),
               col=c("black","blue","red"),
               horiz=F
        )
        
        dev.off()
    }
}