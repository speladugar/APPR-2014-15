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


# pdf("slike/Prvo_rojstvo_regije.pdf")
# #OSREDNJESLOVENSKA
# #pairs(RodnostSLO[3:17])
# osrednjeslovenska <- RodnostSLO[RodnostSLO$Regija == "Osrednjeslovenska",]
# 
# #plot(osr$Leto, osr$Prvo.rojstvo)
# #plot(RodnostSLO$Leto, RodnostSLO$Prvo.rojstvo)
# plot(osr$Leto, osr$Prvo.rojstvo)
# title("Prvo rojstvo-OSREDJESLOVENSKA")
# 
# #POMURSKA
# pomurska<-RodnostSLO[RodnostSLO$Regija=="Pomurska",]
# plot(pomurska$Leto, pomurska$Prvo.rojstvo)
# title("Prvo rojstvo-POMURSKA")
# 
# #PODRAVSKA
# podravska<-RodnostSLO[RodnostSLO$Regija=="Podravska",]
# plot(podravska$Leto, podravska$Prvo.rojstvo)
# title("Prvo rojstvo-PODRAVSKA")
# 
# #KOROŠKA
# koroška<-RodnostSLO[RodnostSLO$Regija=="Koroška",]
# plot(koroška$Leto, koroška$Prvo.rojstvo)
# title("Prvo rojstvo-KOROŠKA")
# 
# #SAVINJSKA
# savinjska<-RodnostSLO[RodnostSLO$Regija=="Savinjska",]
# plot(savinjska$Leto, savinjska$Prvo.rojstvo)
# title("Prvo rojstvo-SAVINJSKA")
# 
# #ZASAVSKA
# zasavska<-RodnostSLO[RodnostSLO$Regija=="Zasavska",]
# plot(zasavska$Leto, zasavska$Prvo.rojstvo)
# title("Prvo rojstvo-ZASAVSKA")
# 
# 
# #SPODNJEPOSAVSKA
# spodnjeposavska<-RodnostSLO[RodnostSLO$Regija=="Spodnjeposavska",]
# plot(spodnjeposavska$Leto, spodnjeposavska$Prvo.rojstvo)
# title("Prvo rojstvo-SPODNJEPOSAVSKA")
# 
# #JUGOVZHODNA SLOVENIJA
# JVslovenija<-RodnostSLO[RodnostSLO$Regija=="Jugovzhodna Slovenija",]
# plot(JVslovenija$Leto, JVslovenija$Prvo.rojstvo)
# title("Prvo rojstvo-JUGOVZHODNA SLOVENIJA")
# 
# #GORENJSKA
# gorenjska<-RodnostSLO[RodnostSLO$Regija=="Gorenjska",]
# plot(gorenjska$Leto, gorenjska$Prvo.rojstvo)
# title("Prvo rojstvo-GORENJSKA")
# 
# #NOTRANJSKO KRAŠKA
# notranjskokraška<-RodnostSLO[RodnostSLO$Regija=="Notranjsko-kraška",]
# plot(notranjskokraška$Leto, notranjskokraška$Prvo.rojstvo)
# title("Prvo rojstvo-NOTRANJSKO KRAŠKA")
# 
# #GORIŠKA
# goriška<-RodnostSLO[RodnostSLO$Regija=="Goriška",]
# plot(goriška$Leto, goriška$Prvo.rojstvo)
# title("Prvo rojstvo-GORIŠKA")
# 
# #OBALNO-KRAŠKA
# obalnokraška<-RodnostSLO[RodnostSLO$Regija=="Obalno-kraška",]
# plot(obalnokraška$Leto, obalnokraška$Prvo.rojstvo)
# title("Prvo rojstvo-OBALNO-KRAŠKA")
# 
# dev.off()

#Graf POPULACIJA
pdf("slike/Populacija.pdf", width=6, height=4)
yp<-Populacija[1:54, 2]
plot(Populacija[1:54, 1], yp, ylab="Stevilo prebivalcev v milijonih",xlab="leto", main="Populacija v EU(28)",col="blue", type="l" )

dev.off()

#Graf SPREMEMBA
pdf("slike/Sprememba.pdf", width=6, height=4)
z<-Sprememba[1:53, 4]
plot(Sprememba[1:53, 1], z,ylim=c(-4,10), type="l", xlab="leta", ylab="celotna sprememba", main="Sprememba populacije EU",col="lightblue")

y<-Sprememba[1:53, 3]
lines(Sprememba[1:53, 1], y,type="l", col="blue")

x<-Sprememba[1:53, 2]
lines(Sprememba[1:53, 1], x, type="l", col="orange")
legend("topright", col = c("orange", "lightblue", "blue"), lty = "solid", cex = 0.5,
       legend = c("Celotna sprememba", "Naravni prirastek", "Neto migracije"))
abline(h = 0, col = "gray", lty = "dashed")

dev.off()

#Graf ROJSTVO_SMRTNOST
pdf("slike/RojstvoSmrtnost.pdf", width=6, height=4)
r<-Rojstvo_smrtnost[1:53,2]
plot(Rojstvo_smrtnost[1:53, 1],ylim=c(3,8), r, type="l", col="orange", xlab="leta", ylab="stevilo v milijonih", main="Rodnost in smrtnost EU(28)")
p<- Rojstvo_smrtnost[1:53, 3]
lines(Rojstvo_smrtnost[1:53,1], p, type="l", col="blue")
legend("topright", col = c("orange", "blue"), lty = "solid", cex = 0.5,
       legend = c("st.rojenih", "st.umrlih"))

dev.off()

#Graf Naravni_prirastek_migracije
pdf("slike/Naravniprirastekmigracije.pdf", width=6, height=4)
# barplot(apply(prirastek_migracije[2:36, 2:3], 1, c), beside = TRUE,
#         names.arg=prirastek_migracije[2:36,1],las=2, ylim=c(-70, 70),
#         xlab="imena držav", ylab="število v tisočih",
#         main="Naravni prirastek in neto migracije za EU",
#         cex.names=0.45, col=c("pink", "yellow"))

o <- order(prirastek_migracije[,3], decreasing = TRUE)
o <- o[o != 1] # izpustimo prvo vrstico
barplot(apply(prirastek_migracije[o, 2:3], 1, c), beside = TRUE,
        names.arg=prirastek_migracije[o,1],las=2, ylim=c(-70, 70),
        sub="imena drzav", ylab="stevilo v 1000",
        main="Naravni prirastek in neto migracije za EU",
        cex.names=0.45, col=c("pink", "yellow"))
legend("bottomright", fill = c("pink", "yellow"), cex = 0.5, legend = c( "Naravni prirastek", "Neto migracije"))

dev.off()


#Graf Naravni_prirastek_migracijeEU:
pdf("slike/NaravniprirastekmigracijeEU.pdf", width=6, height=4)
#o <- order(prirastek_migracije[,3], decreasing = TRUE)
#o <- o[o != 1] # izpustimo prvo vrstico
barplot(apply(prirastek_migracijeEU[2:6, 2:3], 1, c), beside = TRUE,
        names.arg=prirastek_migracijeEU[2:6,1],las=2, ylim=c(-200, 910),
         ylab="Stevilo v 1000",
        main="Naravni prirastek in neto migracije za EU (posebej)",
        cex.names=0.6, col=c("pink", "yellow"))
legend("topright", fill = c("pink", "yellow"), cex = 0.5, legend = c( "Naravni prirastek", "Neto migracije"))



dev.off()

# #SLOVENIJA
# slovenija<-RodnostSLO[RodnostSLO$Regija=="SLOVENIJA",]
# plot(slovenija$Leto, slovenija$Vrstni.red.rojstva...SKUPAJ, xlab="Leto", ylab="število živorojenih v tisočih")
# title("Število živorojenih otrok v Sloveniji po letih od 2002-2013")

#Napoved za Slovenijo
pdf("slike/Stevilozivorojenih.pdf", width=6, height=4)
leto<-Rodnost_smrtnost_SLO$Leto
stzivorojenih<-Rodnost_smrtnost_SLO$stzivorojenih 


plot(leto,stzivorojenih, xlim=c(2002,2020),ylim=c(17000,25000),
     xlab="Leto",ylab="Stevilo zivorojenih otrok",
     main="Napoved za Slovenijo",pch=20,col="lightblue",type="p",lwd=3.5)

#premica
linp<-lm(stzivorojenih~leto)
abline(linp,col="pink")
#parabola
kvp<-lm(stzivorojenih~I(leto^2)+leto)
curve(predict(kvp, data.frame(leto=x)), add = TRUE, col = "purple")
#loess
loep<-loess(stzivorojenih~leto)
curve(predict(loep, data.frame(leto=x)),add=TRUE,col="orange")

#legenda
legend("topleft", c("Linerana metoda", "Kvadratna metoda","Loess"),lty=c(1,1,1), col = c("lightblue","purple","orange"))

#Ocenimo prileganje krivulj tako, da izračunamo vsote kvadratov razdalj od napovedanih do dejanskih vrednosti
ostp<-sapply(list(linp, kvp, loep), function(x) sum(x$residuals^2))

#ocenitev ostanka-manjši ostanek je bolj natančen
sapply(list(linp, kvp, loep), function(x) sum(x$residuals^2))
#8434860.1 5625253.3  590036.3
#min(8434860.1, 5625253.3 , 590036.3)=590036.3
#najbolj natančen je loess

dev.off()
