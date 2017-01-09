## Function to create the first plotting task for week 1 assignment
## A PNG file containing a histogram of Global Active Power is
## created for two days of metering

plot1 <- function() {

        ## Subset the data immediately after reading so that the entirety is not
        ## stored in a variable, filling memory
        sub_data <- subset(read.table("household_power_consumption.txt",
                               sep=";",
                               header = TRUE,
                               na.strings = "?",
                               stringsAsFactors = FALSE),
                           Date=="1/2/2007" | Date=="2/2/2007")

        ## Create the histogram as a PNG file
        png(filename="plot1.png", width=480, height=480, bg="transparent")
        hist(sub_data$Global_active_power,
             col="red",
             xlab="Global Active Power (kilowatts)",
             ylab="Frequency",
             main="Global Active Power")
        invisible(dev.off())

}