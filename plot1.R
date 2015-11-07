p1raw <- read.table("./data/pc.txt", sep = ";", header = TRUE)
index1 <- grep("1/2/2007", p1raw$Date)
index2 <- grep("2/2/2007", p1raw$Date)
sub1 <- rbind(p1raw[index1,], p1raw[index2,])
power <- as.numeric(sub1$Global_active_power)/1000
png(filename = "plot1.png", width = 480, height = 480)
hist(power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()