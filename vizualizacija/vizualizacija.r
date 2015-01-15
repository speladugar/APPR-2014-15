# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
slo <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2/shp/SVN_adm.zip",
                       "slovenija", "SVN_adm1.shp", mapa = "zemljevid",
                       encoding = "Windows-1250")

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
preuredi <- function(podatki, zemljevid) {
  nove.slo <- c()
  manjkajo <- ! nove.slo %in% rownames(podatki)
  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
  names(M) <- names(podatki)
  row.names(M) <- nove.slo[manjkajo]
  podatki <- rbind(podatki, M)
  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$NAME_1)[rank(zemljevid$NAME_1)]), ]
  if (ncol(podatki) == 1) {
    out <- data.frame(out)
    names(out) <- names(podatki)
    rownames(out) <- rownames(podatki)
  }
  return(out)
}




# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/Slovenija.pdf", width=6, height=4)


# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
rodnost2013 <- RodnostSLO[145:156,]
rownames(rodnost2013) <- rodnost2013[,2]
zRodnostSLO <- preuredi(rodnost2013, slo)



#Spreminjanje koordinat in imen za Slovenijo
koordinate1 <- coordinates(slo)
imena1 <- as.character(slo$NAME_1)
rownames(koordinate1) <- imena1
names(imena1) <- imena1

koordinate1["Obalno-kraška",1] <- koordinate1["Obalno-kraška",1]+0.1 #levo,desno
koordinate1["Obalno-kraška",2] <- koordinate1["Obalno-kraška",2]+0.025 #dol,gor
koordinate1["Zasavska",2] <- koordinate1["Zasavska",2]+0.01
koordinate1["Spodnjeposavska",1] <- koordinate1["Spodnjeposavska",1]
koordinate1["Spodnjeposavska",2] <- koordinate1["Spodnjeposavska",2]
imena1["Jugovzhodna Slovenija"] <- "Jugovzhodna\nSlovenija"
imena1["Notranjsko-kraška"] <- "Notranjsko-\nkraška"
imena1["Obalno-kraška"] <- "Obalno-\nkraška"
imena1["Spodnjeposavska"]<- "Spodnje-\nposavska"


#Zemljevid povprečja
min.2013 <- min(zRodnostSLO[4], na.rm=TRUE)
max.2013 <- max(zRodnostSLO[4], na.rm=TRUE)
norm.2013 <- (zRodnostSLO[,4]-min.2013)/(max.2013-min.2013)



n = 100
#barve =rgb(1, 0, 0, norm.2013)
# barve =rgb(1, 1, (n:1)/n)[unlist(1+(n-1)*norm.2013)]
# plot(slo, col = barve, bg="pink")

#slo$rodnost2013 <- zRodnostSLO[,4]
#spplot(slo, "rodnost2013", col = topo.colors(100), main = "Rodnost v Sloveniji za leto 2013")


n <- 100
barve <- rgb(1, 1, (n:1)/n)
plot(slo, col = barve[unlist(1+(n-1)*norm.2013)], bg="pink", main="ROdnost v Sloveniji za leto 2013")

k <- 5 # število stopenj v legendi
stopnje <- seq(min.2013, max.2013, (max.2013-min.2013)/(k-1))
legend("bottomright", legend = round(stopnje),
       fill = barve[seq(1, n, (n-1)/(k-1))], bg = "white")

text(koordinate1,labels=imena1, cex=0.3)
title("Rodnost v Sloveniji za leto 2013")

dev.off()

#2ZEMLJEVID Evropa
# Uvozimo zemljevid.
cat("Uvažam zemljevid sveta...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "Europa", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")
#EU <- svet[svet$name %in% rownames(RodnostEU),]

#Dodamo mankajoče države
rownames(RodnostEU)[39] <- "Macedonia"
rownames(RodnostEU)[46] <- "Kosovo"
rownames(RodnostEU)[49] <- "Russian Federation"
manjkajoce.drzave <- c() #c("Albania", "Belarus", "Moldova", "Russian Federation", "Ukraine")
drzave <- c(rownames(RodnostEU), manjkajoce.drzave)
drzave <- drzave[drzave %in% svet$name_long]
EU <- svet[svet$name_long %in% drzave,]

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
manjkajo <- ! manjkajoce.drzave %in% rownames(RodnostEU)
M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(RodnostEU)))
names(M) <- names(RodnostEU)
row.names(M) <- manjkajoce.drzave[manjkajo]
eRodnostEU <- rbind(RodnostEU, M)[as.character(EU$name_long),]


koordinate <- coordinates(EU[!is.na(eRodnostEU[, 12]),])
imena.drzav <- as.character(EU$name[!is.na(eRodnostEU[, 12])])

names(imena.drzav) <- imena.drzav
rownames(koordinate) <- imena.drzav
koordinate["Norway",1] <- koordinate["Norway",1]-1.8
koordinate["Croatia", 2]<- koordinate["Croatia",2]+0.7
koordinate["Croatia", 1]<- koordinate["Croatia",1]+0.2

koordinate["Greece", 1]<- koordinate["Greece", 1]-0.4
koordinate["Sweden",1]<-koordinate["Sweden", 1]-1
koordinate["Austria",1]<-koordinate["Austria", 1]+0.8
koordinate["United Kingdom",2]<-koordinate["United Kingdom",2]-1
koordinate["United Kingdom",1]<-koordinate["United Kingdom",1]+0.5

imena.drzav["Bosnia and Herz."] <- "BiH"
imena.drzav["Luxembourg"]<- "Lux"
imena.drzav["Montenegro"]<-"Mont"


pdf("slike/EU.pdf")

EU$Rodnost2013 <- eRodnostEU[, 12]


rot <- ifelse(imena.drzav %in% c("Albania", "Portugal"), 90, 0)
print(spplot(EU, "Rodnost2013", xlim=c(-25, 40), ylim=c(33, 73),
             main = "Rodnost v EU za leto 2013",
             col.regions = topo.colors(100),
             sp.layout = (list(list("sp.text", koordinate, imena.drzav,
                                    cex = 0.3, srt = rot)))))




dev.off()
