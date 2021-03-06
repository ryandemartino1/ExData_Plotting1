p1raw <- read.table("./data/pc.txt", sep = ";", header = TRUE)
index1 <- grep("1/2/2007", p1raw$Date)
index2 <- grep("2/2/2007", p1raw$Date)
sub1 <- rbind(p1raw[index1,], p1raw[index2,])
power <- as.numeric(sub1$Global_active_power)/1000
Global_reactive_power <- as.numeric(sub1$Global_reactive_power)/1000
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(1:8640, power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
axis(1, at = c(1,4320, 8640), labels = c("Thu", "Fri", "Sat"))
plot(1:8640, sub1$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt = "n")
axis(1, at = c(1,4320, 8640), labels = c("Thu", "Fri", "Sat"))
plot(1:8640, sub1$Sub_metering_1, type = "l", col = "black", xaxt = "n", ylab = "Energy Sub Metering", xlab = "")
axis(1, at = c(1,4320, 8640), labels = c("Thu", "Fri", "Sat"))
with(sub1, lines(1:8640, sub1$Sub_metering_3, col = "red"))
with(sub1, lines(1:8640, sub1$Sub_metering_2, col = "blue"))
legend("topright", pch = "-", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(1:8640, Global_reactive_power, type = "l", xlab = "datetime", xaxt = "n")
axis(1, at = c(1,4320, 8640), labels = c("Thu", "Fri", "Sat"))
dev.off()