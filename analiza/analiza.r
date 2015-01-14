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



pairs(RodnostSLO[3:17])
osrednjeslovenska <- RodnostSLO[RodnostSLO$Regija == "Osrednjeslovenska",]

plot(osr$Leto, osr$Prvo.rojstvo)
plot(RodnostSLO$Leto, RodnostSLO$Prvo.rojstvo)
plot(osr$Leto, osr$Prvo.rojstvo)

