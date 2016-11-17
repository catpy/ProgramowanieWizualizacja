Rozwiązanie:
https://rawgit.com/pbiecek/ProgramowanieWizualizacja/master/MIMUW_2017/Projekty/Projekt1/Faza2/Dycha_Siwiec_1_2.html

Rozwiązanie bardzo dobre, zabrałem jeden punkt za poniższe niewielkie usterki.

A. Działanie
	Skrypt się kompiluje.

B. Modułowość kodu
	Funkcje są krótkie, czytelne dobrze dobrane.

C. Elastyczność i czytelność rozwiązania
	Zmienna ROUNDS jest pisana z dużej litery, pozostałe z małej. 

	Cześć argumentów jest zmiennymi globalnymi, a cześć jest przekazywana jako argumenty domyślne funkcji
	np.
exchange.animals.for.rabbits <- function(game, farm = c("small_dog","sheep","pig","big_dog","cow"))

	Większość funkcji robi jedną konkretną rzecz, z wyjątkiem 
	throw.dice <- function(game, die1, die2)
	tóra robi dwie (rzut kostką i sprawdza jego konsekwencje)

Inne uwagi:

Na początku skryptu knitrowego nie ma potrzeby używania
rm(list = ls())
ponieważ cały skrypt jest wykonywany w nowym środowisku R.

Punkty:
9/10

