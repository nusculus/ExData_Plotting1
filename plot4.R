## Function to create the second plotting task for week 1 assignment
## A PNG file containing a line graph of Global Active Power is
## created for two days of metering

plot4 <- function() {

        ## Subset the data immediately after reading so that the entirety is not
        ## stored in a variable, filling memory
        sub_data <- subset(read.table("household_power_consumption.txt",
                                      sep=";",
                                      header = TRUE,
                                      na.strings = "?",
                                      stringsAsFactors = FALSE),
                           Date=="1/2/2007" | Date=="2/2/2007")

        ##Convert 'Date' and 'Time' character fields into a time field
        datetime <- strptime(paste(sub_data$Date,sub_data$Time),
                                 "%d/%m/%Y %H:%M:%S")

        ## Set up for a page for 2 by 2 graphs
        png(filename="plot4.png", width=480, height=480)
        par(mfcol=c(2,2), mar=c(4, 4, 2, 2))

        ## Create the first upper left graph
        plot(datetime,
             sub_data$Global_active_power,
             type="l",
             xlab="",
             ylab="Global Active Power")

        ## Create the lower left graph
        plot(datetime,
             sub_data$Sub_metering_1,
             type="n",
             xlab="",
             ylab="Energy sub metering")
        lines(datetime, sub_data$Sub_metering_1, col="black")
        lines(datetime, sub_data$Sub_metering_2, col="red")
        lines(datetime, sub_data$Sub_metering_3, col="blue")
        legend("topright",
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               bty="n",
               lty=c(1, 1, 1),
               col=c("black", "red", "blue"))

        ## Create the upper right with voltage vs time
        with(sub_data, plot(datetime,
             Voltage,
             type="l"))

        ## Create the lower right with reactive power vs time
        with(sub_data, plot(datetime,
             Global_reactive_power,
             type="l"))

        invisible(dev.off())

}