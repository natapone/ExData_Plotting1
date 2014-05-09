read_data <- function(directory="data", file_name="household_power_consumption.txt") {
    
    file_name <- paste(directory, file_name, sep = "/")
    print(file_name)
    
    # read data for each symbol
    con <- file(file_name, "r")
    data <- read.csv(con, header=T,sep=";")
    close.connection(con)
    
    # Format date
    data$Date =  as.Date( data$Date, "%d/%m/%Y")
    
    # filter dates
    data <- data[ data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]
    
    # Format numeric
    data$Global_active_power <- as.numeric(gsub( pattern="?", replacement="",x=data$Global_active_power ))
    data$Global_reactive_power <- as.numeric(gsub( pattern="?", replacement="",x=data$Global_reactive_power ))
    data$Voltage <- as.numeric(gsub( pattern="?", replacement="",x=data$Voltage ))
    data$Global_intensity <- as.numeric(gsub( pattern="?", replacement="",x=data$Global_intensity ))
    data$Sub_metering_1 <- as.numeric(gsub( pattern="?", replacement="",x=data$Sub_metering_1 ))
    data$Sub_metering_2 <- as.numeric(gsub( pattern="?", replacement="",x=data$Sub_metering_2 ))
    data$Sub_metering_3 <- as.numeric(gsub( pattern="?", replacement="",x=data$Sub_metering_3 ))
    
    data <- data[complete.cases(data),]
    
    # Format time
    data$Time <-  strptime( paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S" )
    
    data
    
}
