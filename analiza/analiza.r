# # 4. faza: Analiza podatkov
# 
# # Uvozimo funkcijo za uvoz spletne strani.
# source("lib/xml.r")
# 
# # Preberemo spletno stran v razpredelnico.
# cat("Uvažam spletno stran...\n")
# tabela <- preuredi(uvozi.obcine(), obcine)
# 
# # Narišemo graf v datoteko PDF.
# cat("Rišem graf...\n")
# pdf("slike/naselja.pdf", width=6, height=4)
# plot(tabela[[1]], tabela[[4]],
#      main = "Število naselij glede na površino občine",
#      xlab = "Površina (km^2)",
#      ylab = "Št. naselij")
# dev.off()


pdf("slike/Prvo_rojstvo_regije.pdf")
#OSREDNJESLOVENSKA
#pairs(RodnostSLO[3:17])
osrednjeslovenska <- RodnostSLO[RodnostSLO$Regija == "Osrednjeslovenska",]

#plot(osr$Leto, osr$Prvo.rojstvo)
#plot(RodnostSLO$Leto, RodnostSLO$Prvo.rojstvo)
plot(osr$Leto, osr$Prvo.rojstvo)
title("Prvo rojstvo-OSREDJESLOVENSKA")

#POMURSKA
pomurska<-RodnostSLO[RodnostSLO$Regija=="Pomurska",]
plot(pomurska$Leto, pomurska$Prvo.rojstvo)
title("Prvo rojstvo-POMURSKA")

#PODRAVSKA
podravska<-RodnostSLO[RodnostSLO$Regija=="Podravska",]
plot(podravska$Leto, podravska$Prvo.rojstvo)
title("Prvo rojstvo-PODRAVSKA")

#KOROŠKA
koroška<-RodnostSLO[RodnostSLO$Regija=="Koroška",]
plot(koroška$Leto, koroška$Prvo.rojstvo)
title("Prvo rojstvo-KOROŠKA")

#SAVINJSKA
savinjska<-RodnostSLO[RodnostSLO$Regija=="Savinjska",]
plot(savinjska$Leto, savinjska$Prvo.rojstvo)
title("Prvo rojstvo-SAVINJSKA")

#ZASAVSKA
zasavska<-RodnostSLO[RodnostSLO$Regija=="Zasavska",]
plot(zasavska$Leto, zasavska$Prvo.rojstvo)
title("Prvo rojstvo-ZASAVSKA")


#SPODNJEPOSAVSKA
spodnjeposavska<-RodnostSLO[RodnostSLO$Regija=="Spodnjeposavska",]
plot(spodnjeposavska$Leto, spodnjeposavska$Prvo.rojstvo)
title("Prvo rojstvo-SPODNJEPOSAVSKA")

#JUGOVZHODNA SLOVENIJA
JVslovenija<-RodnostSLO[RodnostSLO$Regija=="Jugovzhodna Slovenija",]
plot(JVslovenija$Leto, JVslovenija$Prvo.rojstvo)
title("Prvo rojstvo-JUGOVZHODNA SLOVENIJA")

#GORENJSKA
gorenjska<-RodnostSLO[RodnostSLO$Regija=="Gorenjska",]
plot(gorenjska$Leto, gorenjska$Prvo.rojstvo)
title("Prvo rojstvo-GORENJSKA")

#NOTRANJSKO KRAŠKA
notranjskokraška<-RodnostSLO[RodnostSLO$Regija=="Notranjsko-kraška",]
plot(notranjskokraška$Leto, notranjskokraška$Prvo.rojstvo)
title("Prvo rojstvo-NOTRANJSKO KRAŠKA")

#GORIŠKA
goriška<-RodnostSLO[RodnostSLO$Regija=="Goriška",]
plot(goriška$Leto, goriška$Prvo.rojstvo)
title("Prvo rojstvo-GORIŠKA")

#OBALNO-KRAŠKA
obalnokraška<-RodnostSLO[RodnostSLO$Regija=="Obalno-kraška",]
plot(obalnokraška$Leto, obalnokraška$Prvo.rojstvo)
title("Prvo rojstvo-OBALNO-KRAŠKA")

dev.off()