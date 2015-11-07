p1raw <- read.table("./data/pc.txt", sep = ";", header = TRUE)
index1 <- grep("1/2/2007", p1raw$Date)
index2 <- grep("2/2/2007", p1raw$Date)
sub1 <- rbind(p1raw[index1,], p1raw[index2,])
power <- as.numeric(sub1$Global_active_power)/1000
png(filename = "plot2.png", width = 480, height = 480)
plot(1:8640, power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
axis(1, at = c(1,4320, 8640), labels = c("Thu", "Fri", "Sat"))
dev.off()