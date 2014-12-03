pdf("slike/grafi.pdf", paper="a4r")
  barplot(r2013$Vrstni.red.rojstva...SKUPAJ, names.arg=r2013$X.1, xlab="imena regij", ylab="št.živorojenih otrok", main="Rodnost v SLO po regijah za leto 2013",col="lightblue")
barplot(as.matrix(RodnostEU[1,1:11]), names.arg = 2002:2012, xlab="leta", ylab="št.živorojenih v EU(28)", main="Število živorojenih otrok v EU(28) po letih 2002-2012", col="pink")
dev.off()

