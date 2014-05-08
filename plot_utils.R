read_data <- function(directory="data", file_name="household_power_consumption.txt") {
    
    file_name <- paste(directory, file_name, sep = "/")
    print(file_name)
    
    # read data for each symbol
    con <- file(file_name, "r")
    data <- read.csv(con, header=T,sep=";")
    close.connection(con)
    
    # Format date
    data$Date =  as.Date( data$Date, "%d/%m/%Y")
    data
}