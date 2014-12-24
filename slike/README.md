# Mapa s slikami

V to mapo bomo dajali vse slike (grafe, zemljevide), ki jih bo naš program
naredil in jih bomo vključili v končno poročilo.

barplot(RodnostSLO[145:156, 3], names.arg=RodnostSLO[145:156, 2], xlab="imena regij", ylab="št.živorojenih otrok", main="Rodnost v SLO po regijah za leto 2013",col="lightblue")


barplot(as.matrix(RodnostEU[1,1:11]), names.arg = 2002:2012, xlab="leta", ylab="št.živorojenih v EU(28)", main="Število živorojenih otrok v EU(28) po letih 2002-2012", col="pink")