#' Funkcja tworząca wizytowke w formacie pdf
#'
#' Funkcja  plik pdf z wizytowka zadanej strategii, przy zadanych warunkach gry. Porownuje ja z dwoma strategiami porownawczymi - domyslnie strategia_Jana i strategia_postMDiPR.
#' Warto zauwazyc, ze stworzony plik jest celowo mniejszy niz kartka a4. Przy druku dodawane sa 1cm marginesy.
#'
#' @param strategia_ Strategia, ktora ma grac gracz.
#' @param liczba_prob Ile razy gra ma zostac powtorzona.
#' @param Maksimum_zwierzat Wektor zawierajacy informacje ile maksymalnie mozemy posiadac poszczegolnych zwierzat.
#' @param stan_poczatkowy Poczatkowa ilosc zwierzat gracza - wektor siedmioelementowy, kolejno ilosc krolikow, owiec, swin, krow koni, malych psow, duzych psow.
#' @param funkcja_konca_gry Funkcja przyjmujaca za arrgument stado gracza, zwracajaca TRUE jesli gracz wyral gre. Okresla warunki zakonczenia gry.
#' @param funkcja_lisa Funkcja, ktora okresla co sie dzieje ze stadem po wypadnieciu lisa.
#' @param funkcja_wilka Funkcja, ktora okresla co sie dzieje ze stadem po wypadnieciu wilka.
#' @param kostka_zielona Wektor nazw zwierzat, ktore sa na kostce zielonej. Okresla jakie zwierzeta i z jaka czestotliwoscia wypadaja na kostce zielonej.
#' @param kostka_czerwona Wektor nazw zwierzat, ktore sa na kostce czerwonej. Okresla jakie zwierzeta i z jaka czestotliwoscia wypadaja na kostce czerwonej.
#' @param wartosci_zwierzat Wektor cen odpowiednich zwierzat (kroliki,owce,swinie,krowy,konie,male psy,duze psy). Stosunek tych cen jest uzywany do obliczenia wartosci stada przed i po wymianie.
#' @param strategia_porownawcza1 Funkcja strategii. Podany bedzie procent wygranych z ta strategia.
#' @param strategia_porownawcza2 Funkcja strategii. Podany bedzie procent wygranych z ta strategia.
#' @param nazwa_porownawczej1 Nazwa pierwszej strategii porownawczej.
#' @param nazwa_porownawczej2 Nazwa drugiej strategii porownawczej.
#' @param nazwa_strategii Nazwa testowanej strategii.
#' @param nazwa_pliku Nazwa wyjsciowego pliku pdf.
#' @param limit_gestosci wartosc maksymalna osi x pokazana na wykresie gestosci
#' @param limit_dystrybuanty wartosc maksymalna osi x pokazana na wykresie dystrybuanty
#'
#'
#' @return Zapisuje plik pdf i zwraca wykres
#' @export
wizytowka_PunPun <- function(strategia_, liczba_prob = 10000, Maksimum_zwierzat = c(60,24,20,12,6,4,2), stan_poczatkowy = c(0,0,0,0,0,0,0), funkcja_konca_gry = koniec_gry, funkcja_lisa = lis_zjada, funkcja_wilka = wilk_zjada, kostka_zielona = c("Krolik", "Krolik", "Krolik", "Krolik", "Krolik", "Krolik", "Owca", "Owca", "Owca", "Swinia", "Krowa", "Wilk"), kostka_czerwona = c("Krolik", "Krolik", "Krolik", "Krolik", "Krolik", "Krolik", "Owca", "Owca", "Swinia", "Swinia", "Kon", "Lis"), wartosci_zwierzat = c(1,6,12,36,72,6,36), strategia_porownawcza1 = strategia_Jana, strategia_porownawcza2 = strategia_postMDiPR, nazwa_porownawczej1 = "strategia_Jana", nazwa_porownawczej2 = "strategia_postMDiPR", nazwa_strategii = "test",nazwa_pliku = paste("Wizytowka",".pdf", sep = ""),limit_gestosci = 150,limit_dystrybuanty = 200){



testow10000 <- replicate(liczba_prob,testuj_strategie(strategia_,Maksimum_zwierzat,stan_poczatkowy,funkcja_konca_gry,funkcja_lisa,funkcja_wilka,kostka_zielona,kostka_czerwona,wartosci_zwierzat))

testowana <- replicate(liczba_prob, gra(strategia_, Maksimum_zwierzat, stan_poczatkowy, funkcja_konca_gry, funkcja_lisa, funkcja_wilka, kostka_zielona, kostka_czerwona))
porownawcza1 <- replicate(liczba_prob, gra(strategia_porownawcza1, Maksimum_zwierzat, stan_poczatkowy, funkcja_konca_gry, funkcja_lisa, funkcja_wilka, kostka_zielona, kostka_czerwona))
porownawcza2 <- replicate(liczba_prob, gra(strategia_porownawcza2, Maksimum_zwierzat, stan_poczatkowy, funkcja_konca_gry, funkcja_lisa, funkcja_wilka, kostka_zielona, kostka_czerwona))

#Czy strategia oszukuje
czy_poprawna <- TRUE
if (length(which(is.na(testow10000))) == 0 ){czy_poprawna <- TRUE} else {czy_poprawna <- FALSE}

#wylicza procenty wyranych ze strategiami testowymi
if (length(which(testowana < porownawcza1)) == 0) {
  proc1wygranych <- 0
} else {
  proc1wygranych <- (length(which(testowana < porownawcza1))/liczba_prob)
}
if (length(which(testowana < porownawcza2)) == 0) {
  proc2wygranych <- 0
} else {
  proc2wygranych <- (length(which(testowana < porownawcza2))/liczba_prob)
}



#ramka danych z 3 strategii do wykresow
ramka_danych <- data.frame(testowana,porownawcza1,porownawcza2)

#wyliczenie wykresu dystrybuanty
wykres_dystrybuanty <- ggplot(ramka_danych) +
  stat_ecdf(aes(porownawcza1, color = "strategia porównawcza1"), geom = "step", na.rm = TRUE) +
  stat_ecdf(aes(porownawcza2, color = "strategia porównawcza2"), geom = "step", na.rm = TRUE) +
  stat_ecdf(aes(testowana, color = "badana strategia"), geom = "step", na.rm = TRUE) +
  coord_cartesian(xlim = c(0,limit_dystrybuanty)) +
  labs(title = "Dystrybuanta strategii", x ="Liczba rzutów",y = "Procent zakończonych gier") +
  theme_light() +
  theme(legend.position=c(.8, .5), legend.box="horizontal", legend.key.size = unit(0.5,"cm"))+
  scale_colour_manual("Legenda",values = c("badana strategia"="#d6604d","strategia porównawcza1"="gray37","strategia porównawcza2"="gray78"))


#wyliczenie wykresu gestosci
wykres_gestosci <- ggplot(ramka_danych) +
theme_light() +
geom_density(aes(porownawcza1), size = 0.5, alpha =0.4,color="gray37")+
geom_density(aes(porownawcza2), size = 0.5, alpha =0.4,color="gray78")+
geom_density(aes(testowana), size = 0.5, alpha =0.4,color="#d6604d")+
coord_cartesian(xlim = c(0,limit_gestosci)) +
labs(title = "Rozkład strategii", x = "Liczba rzutów potrzebna do wygranej", y = "gęstość")





# Poczatek wyliczenia ilosci zwierzat w kazdym momencie jednej gry

Stado <- stan_poczatkowy
names(Stado) <- c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies")
MaxZwierzat <- Maksimum_zwierzat
names(MaxZwierzat) <- c("Krolik", "Owca", "Swinia", "Krowa", "Kon", "MalyPies", "DuzyPies")
licznik <- 0

stan_krolikow <- c()
stan_owiec <- c()
stan_swin <- c()
stan_krow <- c()
stan_koni <- c()
stan_mpsow <- c()
stan_dpsow <- c()
czas <- c()

while (!funkcja_konca_gry(Stado)) {

  Stado <- strategia_(Stado)
  names(Stado) <- c("Krolik", "Owca", "Swinia", "Krowa", "Kon", "MalyPies", "DuzyPies")

  stan_krolikow <- c(stan_krolikow,Stado[1])
  stan_owiec <- c(stan_owiec,Stado[2])
  stan_swin <- c(stan_swin,Stado[3])
  stan_krow <- c(stan_krow,Stado[4])
  stan_koni <- c(stan_koni,Stado[5])
  stan_mpsow <- c(stan_mpsow,Stado[6])
  stan_dpsow <- c(stan_dpsow,Stado[7])
  czas <- c(czas,licznik)

  if (funkcja_konca_gry(Stado)) {break}
  Stado <- po_rzucie(Stado, MaxZwierzat,funkcja_lisa,funkcja_wilka,kostka_zielona,kostka_czerwona)

  stan_krolikow <- c(stan_krolikow,Stado[1])
  stan_owiec <- c(stan_owiec,Stado[2])
  stan_swin <- c(stan_swin,Stado[3])
  stan_krow <- c(stan_krow,Stado[4])
  stan_koni <- c(stan_koni,Stado[5])
  stan_mpsow <- c(stan_mpsow,Stado[6])
  stan_dpsow <- c(stan_dpsow,Stado[7])
  licznik <- licznik + 0.5
  czas <- c(czas,licznik)
  if (licznik > 500){break()}
  licznik <- licznik + 0.5
}
# Koniec wyliczenia ilosci zwierzat w kazdym momencie jednej gry



#7 wykresow ribbon dla kazdego ze zwierzat
stan_zwierzat <- data.frame(czas,stan_krolikow,stan_owiec,stan_swin,stan_krow,stan_koni,stan_mpsow,stan_dpsow)
wykres3.1 <- ggplot(stan_zwierzat,aes(czas)) +geom_ribbon(aes(ymin = 0, ymax = stan_krolikow),fill = "#ff7f00") + theme_minimal() + theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank(),plot.margin=unit(c(0,0.1,0,0.1), "cm")) + scale_y_continuous(position = "right",minor_breaks = NULL,breaks = c(0,max(stan_krolikow))) + ylab("Króliki") + ggtitle("Przebieg jednej z gier")
wykres3.2 <- ggplot(stan_zwierzat,aes(czas)) +geom_ribbon(aes(ymin = 0, ymax = stan_owiec),fill = "#999999") + theme_minimal() + theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank(),plot.margin=unit(c(0,0.1,0,0.1), "cm")) + scale_y_continuous(position = "right",minor_breaks = NULL,breaks = c(0,max(stan_owiec))) + ylab("Owce")
wykres3.3 <- ggplot(stan_zwierzat,aes(czas)) +geom_ribbon(aes(ymin = 0, ymax = stan_swin),fill = "#f781bf") + theme_minimal() + theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank(),plot.margin=unit(c(0,0.1,0,0.1), "cm")) + scale_y_continuous(position = "right",minor_breaks = NULL,breaks = c(0,max(stan_swin))) + ylab("Świnie")
wykres3.4 <- ggplot(stan_zwierzat,aes(czas)) +geom_ribbon(aes(ymin = 0, ymax = stan_krow),fill = "black") + theme_minimal() + theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank(),plot.margin=unit(c(0,0.1,0,0.1), "cm")) + scale_y_continuous(position = "right",minor_breaks = NULL,breaks = c(0,max(stan_krow))) + ylab("Krowy")
wykres3.5 <- ggplot(stan_zwierzat,aes(czas)) +geom_ribbon(aes(ymin = 0, ymax = stan_koni),fill = "#a65628") + theme_minimal() + theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank(),plot.margin=unit(c(0,0.1,0,0.1), "cm")) + scale_y_continuous(position = "right",minor_breaks = NULL,breaks = c(0,max(stan_koni))) + ylab("Konie")
wykres3.6 <- ggplot(stan_zwierzat,aes(czas)) +geom_ribbon(aes(ymin = 0, ymax = stan_mpsow),fill = "#4daf4a") + theme_minimal() + theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank(),plot.margin=unit(c(0,0.1,0,0.1), "cm")) + scale_y_continuous(position = "right",minor_breaks = NULL,breaks = c(0,max(stan_mpsow))) + ylab("M Psy")
wykres3.7 <- ggplot(stan_zwierzat,aes(czas)) +geom_ribbon(aes(ymin = 0, ymax = stan_dpsow),fill = "#377eb8") + theme_minimal() + theme(plot.margin=unit(c(0,0.1,0,0.1), "cm")) + scale_y_continuous(position = "right",minor_breaks = NULL,breaks = c(0,max(stan_dpsow))) + ylab("D Psy") + xlab("Tura")

#polaczenie 7 wykresow w 1
wykres3 <- grid.arrange(wykres3.1,wykres3.2,wykres3.3,wykres3.4,wykres3.5,wykres3.6,wykres3.7,layout_matrix = rbind(1,2,3,4,5,6,7))




#podstawowe statystyki sa wyswietlane przed stworzeniem wykresu
print(summary(testowana))
print(c(czy_poprawna, proc1wygranych, proc2wygranych))





#tworzenie części tekstowych pliku pdf

text_tytul <- paste("Strategia",nazwa_strategii)
tytul <- textGrob(text_tytul,gp=gpar(fontsize=30))

srednia <- textGrob("Średnia:", gp=gpar(fontsize=15))
wartosc_sredniej <- textGrob(toString(round(mean(testowana),digits = 1)), gp=gpar(fontsize=25))

mediana <- textGrob("Mediana:", gp=gpar(fontsize=15))
wartosc_mediany <- textGrob(toString(median(testowana)), gp=gpar(fontsize=25))

zgodnosc <- textGrob("Czy oszukuje:", gp=gpar(fontsize=15))
if (czy_poprawna == TRUE) {wartosc_zgodnosci <- textGrob("NIE", gp=gpar(fontsize=25))} else {wartosc_zgodnosci <- textGrob("TAK", gp=gpar(fontsize=30))}

procentwygranych <- textGrob("Procent wygranych ze strategiami:", gp=gpar(fontsize=8))
nazwa1 <- textGrob(paste(nazwa_porownawczej1,":",sep = ""), gp=gpar(fontsize=8))
nazwa2 <- textGrob(paste(nazwa_porownawczej2,":",sep = ""), gp=gpar(fontsize=8))
procent1 <- textGrob(paste(toString(round(proc1wygranych*100,digits = 1)),"%",sep = ""), gp=gpar(fontsize=15))
procent2 <- textGrob(paste(toString(round(proc2wygranych*100,digits = 1)),"%",sep = ""), gp=gpar(fontsize=15))

autorzy <- textGrob("Autorzy: Jan Dmitruk, Piotr Radziński", gp=gpar(fontsize=8))

#połączenie wszystkiego w całość
wykres_ostateczny <- grid.arrange(tytul,wykres_gestosci,srednia,wykres_dystrybuanty,wykres3,procentwygranych,autorzy,wartosc_zgodnosci,wartosc_sredniej,mediana,wartosc_mediany,zgodnosc,nazwa1,nazwa2,procent1,procent2,layout_matrix = rbind(c(1,1,1,1,1,1,1,1),c(2,2,2,2,2,3,3,9),c(2,2,2,2,2,10,10,11),c(2,2,2,2,2,12,12,8),c(4,4,4,4,4,4,4,4),c(4,4,4,4,4,4,4,4),c(4,4,4,4,4,4,4,4),c(4,4,4,4,4,4,4,4),c(5,5,5,5,5,5,5,5),c(5,5,5,5,5,5,5,5),c(5,5,5,5,5,5,5,5),c(5,5,5,5,5,5,5,5),c(5,5,5,5,5,5,5,5),c(5,5,5,5,5,5,5,5),c(5,5,5,5,5,5,5,5),c(5,5,5,5,5,5,5,5),c(5,5,5,5,5,5,5,5),c(5,5,5,5,5,5,5,5),c(6,6,13,13,15,14,14,16),c(7,7,7,7,7,7,7,7)))

#zapis jako pdf
ggsave(nazwa_pliku, wykres_ostateczny, width =7.48, height = 10.90, device = pdf)

#wyświetla wykres, można ręcznie exportować
wykres_ostateczny

}
