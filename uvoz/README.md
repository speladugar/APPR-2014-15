# Obdelava, uvoz in čiščenje podatkov.

Tukaj bomo imeli program, ki bo obdelal, uvozil in očistil podatke (druga faza
projekta).

uvoziSLO <- function() {
  r <- read.csv("podatki/RodnostSLO.csv", sep = ";", as.is = TRUE,
                    skip = 1,
                    
                    fileEncoding = "Windows-1250")

  r <- r[is.na(r[1]),]
  r[1] <- as.vector(sapply(2002:2013, rep, 13))
  rownames(r) <- NULL
  return(r)
}

