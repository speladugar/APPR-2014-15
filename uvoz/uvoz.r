# 2. faza: Uvoz podatkov

# # Funkcija, ki uvozi podatke iz datoteke druzine.csv
# uvoziDruzine <- function() {
#   return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
#                       row.names = 1,
#                       col.names = c("obcina", "en", "dva", "tri", "stiri"),
#                       fileEncoding = "Windows-1250"))
# }
# 
# # Zapišimo podatke v razpredelnico druzine.
# cat("Uvažam podatke o družinah...\n")
# druzine <- uvoziDruzine()
# 
# # Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# # potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# # datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# # 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# # fazah.

source("lib/xml.r")

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvoziSLO <- function() {
  r <- read.csv("podatki/RodnostSLO.csv", sep = ";", as.is = TRUE,
                    skip = 1,
                    
                    fileEncoding = "Windows-1250")

  r <- r[is.na(r[1]),]
  r[1] <- as.vector(sapply(2002:2013, rep, 13))
  rownames(r) <- NULL
  return(r)
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o RodnostiSLO...\n")
RodnostSLO <- uvoziSLO()

cat("Uvažam podatke o RodnostiEU...\n")
RodnostEU <- uvozi.rodnostEU()

# #UVOZ tabele StopnjaRodnosti
# source("lib/xml.r")
# 
# uvoziSLO1 <- function() {
#   return(read.table("podatki/StopnjaRodnosti.csv", sep = ";", as.is = TRUE, header = TRUE,
#                     
#                     fileEncoding = "Windows-1250"))
# }
# 
# cat("Uvažam podatke o StopnjaRodnosti...\n")
# StopnjaRodnosti<-uvoziSLO1()

#Uvoz tabele POPULACIJA
source("lib/xml.r")
 
uvoziPopulacija <- function() {
   return(read.table("podatki/PopulacijaEU.csv", sep = ";", as.is = TRUE, header = TRUE,
                     
                     fileEncoding = "Windows-1250"))
 }
 
 cat("Uvažam podatke o Populacija...\n")
Populacija<-uvoziPopulacija()

#Uvoz tabele SPREMEMBA
source("lib/xml.r")

uvoziSprememba <- function() {
  return(read.table("podatki/Sprememba.csv", sep = ";", as.is = TRUE, header = TRUE,
                    
                    fileEncoding = "Windows-1250"))
}

cat("Uvažam podatke o Sprememba...\n")
Sprememba<-uvoziSprememba()

#Uvoz tablele ROJSTVO_SMRTNOST
source("lib/xml.r")

uvoziRojstvo_smrtnost <- function() {
  return(read.table("podatki/Rojstvo_smrtnost.csv", sep = ";", as.is = TRUE, header = TRUE,
                    
                    fileEncoding = "Windows-1250"))
}

cat("Uvažam podatke o Rojstvo_smrtnost...\n")
Rojstvo_smrtnost<-uvoziRojstvo_smrtnost()

#Uvoz tabele NARAVNI_PRIRASTEK_MIGRACIJE:
source("lib/xml.r")

uvoziprirastek_migracije <- function() {
  return(read.table("podatki/Naravni_prirastek_migracije.csv", sep = ";", as.is = TRUE, header = TRUE,
                    
                    fileEncoding = "Windows-1250"))
}

cat("Uvažam podatke o prirastek_migracije...\n")
prirastek_migracije<-uvoziprirastek_migracije()

#Uvoz RODNOST_SMRTNOST_SLO
source("lib/xml.r")

uvoziRodnost_smrtnost_SLO <- function() {
  return(read.table("podatki/Rodnost_smrtnost_SLO.csv", sep = ";", as.is = TRUE, header = TRUE,
                    
                    fileEncoding = "Windows-1250"))
}

cat("Uvažam podatke o Rodnost_smrtnost_SLO...\n")
Rodnost_smrtnost_SLO<-uvoziRodnost_smrtnost_SLO()
