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

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
zRodnostSLO <- preuredi(RodnostSLO[145:156,], slo)

# Izračunamo povprečno velikost družine.
min.2013 <- min(zRodnostSLO[4], na.rm=TRUE)
max.2013 <- max(zRodnostSLO[4], na.rm=TRUE)
norm.2013 <- (zRodnostSLO[4]-min.2013)/(max.2013-min.2013)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/povprecna_druzina.pdf", width=6, height=4)

n = 100
barve =topo.colors(n)[unlist(1+(n-1)*norm.2013)]
plot(slo, col = barve)

dev.off()