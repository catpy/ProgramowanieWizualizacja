Rozwiązanie:
https://rawgit.com/pbiecek/ProgramowanieWizualizacja/master/MIMUW_2017/Projekty/Projekt1/Faza2/PK_PM_KP_Faza1.html

Rozwiązanie jest dobre
Dwa największe problemy tego kodu, za które ucinałem punkty to:
- brak formatowania i bardzo długie funkcje (np. strategia)
- korzystanie ze zmiennych globalnych

Szczegółowe uwagi:

A. Działanie
	Skrypt kompiluje się bez problemu.
	Spis treści przedstawia czytelnie strukturę
	opisy są dosyć rozbudowane.

B. Modułowość kodu
    Kod składa się z funkcji, 
    ale bardzo złym nawykiem jest przypisywanie wartości do zmiennych globalnych operatorem <<- 
    Funkcje powinny być krótsze

C. Elastyczność i czytelność rozwiązania
	Najbardziej obniża czytelność brak formatowania.


Inne uwagi:

Kod nie jest sformatowany, przez co się go trudno analizuje.
Proszę zobaczyć poniżej.
W RStudio opcje formatowania kodu można wyklikać z menu, warto to robić za każdym razem gdy kod nie ma wcięć.

kup_kilka_tanszych  <- function(zwierze) {
  wektor_kosztu <<- c(1, 6, 12, 36, 0, 6)
  do_zaplaty <<- -wartosc_w_krolikach[zwierze]
  #droższe zwierzęta to krowa, świnia lub owca
  if (zwierze == krowa) {
  wektor_kosztu_zwierze <<- c(36, 6, 3)
  }
  if (zwierze == swinia) {
  wektor_kosztu_zwierze <<- c(12, 2, 0)
  }
  if (zwierze == owca) {
  wektor_kosztu_zwierze <<- c(6, 0, 0)
  }
  zagroda[zwierze] <<- zagroda[zwierze] + 1
  stado[zwierze] <<- stado[zwierze] - 1
  for (i in c(krolik, owca, swinia)) {
  while (do_zaplaty < 0 && zagroda[i] == 0 && zagroda[zwierze] > 1 && wartosc_w_krolikach[zwierze] > wektor_kosztu[i]) {
  wymiana(zwierze, i, 0, wektor_kosztu_zwierze[i])
  do_zaplaty <<- do_zaplaty + wektor_kosztu_zwierze[i] * wektor_kosztu[i]
  }
  }
  }
Różne funkcje mają różną liczbę wcięć, proszę zobaczyć poniższą
wymiana <- function(co_sprzedaj,
                    co_kup,
                    ile_sprzedaj,
                    ile_kup) {
                    zagroda[co_kup] <<- zagroda[co_kup] + ile_kup
                    zagroda[co_sprzedaj] <<- zagroda[co_sprzedaj] - ile_sprzedaj
                    stado[co_kup] <<- stado[co_kup] - ile_kup
                    stado[co_sprzedaj] <<- stado[co_sprzedaj] + ile_sprzedaj
                    return(zagroda)
                    }


Punkty:
7/10

