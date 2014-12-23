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
koordinate1["Spodnjeposavska",1] <- koordinate1["Spodnjeposavska",1]+0.9
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
barve =rgb(1, 1, (n:1)/n)[unlist(1+(n-1)*norm.2013)]
plot(slo, col = barve, bg="pink")

#slo$rodnost2013 <- zRodnostSLO[,4]
#spplot(slo, "rodnost2013", col = topo.colors(100), main = "Rodnost v Sloveniji za leto 2013")

text(coordinates(slo),labels=imena1, cex=0.3)
title("Rodnost v Sloveniji za leto 2013")

