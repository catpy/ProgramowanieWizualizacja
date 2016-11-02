library("PogromcyDanych")
head(auta2012)
auta <- auta2012
srednie_ceny<-function(Model = NA, Marka = NA, Paliwo = NA){
  auta <- auta2012
  if (!is.na(Model)){
    auta <- auta[auta$Model %in% Model, ]
  }
  if (!is.na(Marka)){
    auta <- auta[auta$Marka %in% Marka, ]
  }
  if (!is.na(Paliwo)){
    auta <- auta[auta$Rodzaj.paliwa %in% Paliwo, ]
  }
  auta <- filter(auta, Rok.produkcji >=2000)
  statystyki <- tapply(auta$Cena.w.PLN,auta$Rok.produkcji, mean)
  statystyki
}

utrata_wartosci<-function(Model = NA, Marka = NA, Paliwo = NA){
  statystyki <- srednie_ceny(Model, Marka, Paliwo)
  utrata_wartosci <- statystyki[dim(statystyki)]/statystyki[dim(statystyki)-1]
  utrata_wartosci
}

stat_auta <- srednie_ceny(Paliwo = "olej napedowy (diesel)")
stat_auta

stat_auta <- srednie_ceny(Marka = "Volvo")
stat_auta

utrata_wartosci<-utrata_wartosci(Marka = "Volvo")
utrata_wartosci

lapply(head(unique(auta$Marka)), utrata_wartosci(Marka = x))