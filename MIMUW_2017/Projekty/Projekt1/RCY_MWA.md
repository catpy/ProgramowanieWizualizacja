Rozwiązanie:
https://rawgit.com/pbiecek/ProgramowanieWizualizacja/master/MIMUW_2017/Projekty/Projekt1/Faza2/raport_projekt_11_RC_MW.html

Rozwiązanie bardzo dobre, zabrałem jeden punkt za poniższe niewielkie usterki.

A. Działanie

* Skrypt kompiluje się bez problemu.
* Spis treści przedstawia czytelnie strukturę,
* Opisy są czytelne

B. Modułowość kodu

* Kod składa się z funkcji, co jest zaletą
* Funkcje są krótkie
* Parametry gry mogłyby być argumentami domyślnymi funkcji, np:
 ```
 wektor_gracza <- c(R = 0, S = 0, P = 0, C = 0, H = 0, SD = 0, BD = 0)
		  wektor_stada <- c(R = 60, S = 24, P = 20, C = 12, H = 6, SD = 4, BD = 2)
		  kostki <- c(zielona = 'R', czerwona = 'R')
		  koniec <- FALSE
		  ile <- 0
```

C. Elastyczność i czytelność rozwiązania

* Należy konsekwentnie używać jednego operatora przypisania, czasem jest <- a czasem =
```
wektor_gracza <- wektor_gracza - wektor_wymiany
	  wektor_stada <- wektor_stada + wektor_wymiany
	  wektor_gracza[jakie_zwierze] = wektor_gracza[jakie_zwierze] + 1
	  wektor_stada[jakie_zwierze] = wektor_stada[jakie_zwierze] - 1
```
* Warto też konsekwentnie używać jednego języka w rozwiązaniu, czasem ang i pol miesza się w nazwach funkcji
```
update_stanu_kostka_zielona
```

* większość funkcji jest w języku polskim, ale oznaczenia zwierząt mają skróty angielskie
```
c(R = 0, S = 0, P = 0, C = 0, H = 0, SD = 0, BD = 0)
```
* Sam kod znacznie by się skrócił gdyby uniknąć kilkukrotnego dzielenia stanu gry na gracza i stado
```
laczny_wektor_gry <- ruch_gracz_yolo(wektor_gracza, wektor_stada)
		    wektor_gracza <- laczny_wektor_gry[, 1]
		    wektor_stada <- laczny_wektor_gry[, 2]
```
* Po pierwsze można by każdej funkcji przekazywać oba
* Po drugie te dwa wektory sumują się do stałej, więc w ogóle nie ma potrzeby trzymać ich osobno

Inne uwagi:

Punkty:

9/10

