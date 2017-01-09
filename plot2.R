## Function to create the second plotting task for week 1 assignment
## A PNG file containing a line graph of Global Active Power is
## created for two days of metering

plot2 <- function() {

        ## Subset the data immediately after reading so that the entirety is not
        ## stored in a variable, filling memory
        sub_data <- subset(read.table("household_power_consumption.txt",
                                      sep=";",
                                      header = TRUE,
                                      na.strings = "?",
                                      stringsAsFactors = FALSE),
                           Date=="1/2/2007" | Date=="2/2/2007")

        ##Convert 'Date' and 'Time' character fields into a time field
        reading_time <- strptime(paste(sub_data$Date,sub_data$Time),
                                 "%d/%m/%Y %H:%M:%S")

        ## Create the line graph as a PNG file
        png(filename="plot2.png", width=480, height=480)
        plot(reading_time,
             sub_data$Global_active_power,
             type="l",
             xlab="",
             ylab="Global Active Power (kilowatts)")

        invisible(dev.off())

}