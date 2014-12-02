pdf("slike/grafi.pdf", paper="a4r")
  barplot(r2013$Vrstni.red.rojstva...SKUPAJ, names.arg=r2013$X.1, xlab="imena regij", ylab="št.živorojenih otrok", main="Rodnost v SLO po regijah za leto 2013",col="lightblue")
dev.off()


