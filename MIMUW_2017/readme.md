Programowanie w R i wizualizacja danych
---------------------------------------

Materialy na start
Pogromcy Danych: http://pogromcydanych.icm.edu.pl

Z XKCD o jakości kodu.

![XKCD](http://imgs.xkcd.com/comics/code_quality.png)

Plan spotkań MIM UW:
----------------

* 6 X - Wprowadzenie do R, RStudio i knitr, [Wprowadzenie](http://pbiecek.github.io/Przewodnik/wprowadzenie.html), [Proton](http://smarterpoland.pl/index.php/2015/11/czy-jestes-hakerem-danych/), [Przetwarzanie](https://pbiecek.gitbooks.io/przewodnik/content/Programowanie/czyscic_przetwarzac.html)
* 13 X - Zajęcia się nie odbędą [eRum]
* 20 X - Instrukcje sterujące, pętle, funkcje, [Wykład](https://github.com/pbiecek/ProgramowanieWizualizacja/blob/master/MIMUW_2017/wyklad002.Rmd), [lub rozdział o pętlach](http://biecek.pl/R)
* 27 X - [Projekt 1/1]; Funkcje ++, listy i przetwarzanie potokowe [Wykład](https://github.com/pbiecek/ProgramowanieWizualizacja/blob/master/MIMUW_2017/wyklad003.Rmd), [lub rozdział o funkcjach](http://biecek.pl/R)
* 3 XI - Budowa pakietu [materiały](http://pbiecek.github.io/Przewodnik/Programowanie/pakiety/po_co.html)
* 10 XI - [Projekt 1/2]; Unit testy 
* 17 XI - Profilowanie kodu [materialy](http://pbiecek.github.io/Przewodnik/Programowanie/pazury/profilowanie.html)
* 24 XI - Tidyverse, [czytanie danych](http://pbiecek.github.io/Przewodnik/Programowanie/jak_wczytywac_korpusy_tekstu.html), [shiny](http://pbiecek.github.io/Przewodnik/Programowanie/jak_tworzyc_aplikajce.html)
* 1 XII - (konferencja w Będlewie, zajęcia będą odrobione w innym terminie)
* 8 XII - [Projekt 2/1]; [Shiny ++](http://pbiecek.github.io/Przewodnik/Programowanie/jak_tworzyc_aplikajce3.html)
* 15 XII - Grafika 101, lab: dane `Przewodnik::maratony`
* 22 XII - [Projekt 2/2]; Gramatyka grafiki i ggplot2, [ggplot2](http://pbiecek.github.io/Przewodnik/Wizualizacja/ggplot2/01_pierwszy_wykres.html)
* 12 I - Rbokeh, [ZwyczajeTramwaje](https://www.dropbox.com/s/1egykiaefhmz5v4/wybraneKolumny.rda?dl=0), [ggmap](http://stat405.had.co.nz/ggmap.pdf), [Linie](https://www.dropbox.com/s/oqrduyarze5z4v8/linie.zip?dl=0)
* 19 I - [Projekt 3/1]; googleVis
* 26 I - [Projekt 3/2];


Projekt:
--------

Jeden projekt z 2+2+2 fazami z rotującymi grupami [programowanie, symulacja strategii, wizualizacja].
Rotacyjna analiza kodu opracowanego przez inne grupy.
Symulacja i wizualizacja efektywności strategii w grze SuperFarmer.

Instrukcja http://niewidzeprzeszkodzabrze.pl/wp-content/uploads/2016/02/SUPERFARMER.pdf
Instrukcja oraz podstawowa analiza matematyczna: http://www.rost.com.pl/Gry/Farmer.htm

[Aktualna punktacja](https://docs.google.com/spreadsheets/d/1OQRyr_jIY1CA-3YDpB2l8CHLse-dk38UcxqDI1F-DBk/edit?usp=sharing)

## Faza 1:

W ramach tej fazy należy (zakładamy, że gra jeden gracz):

1. Wymyślić strategię gry w SuperFarmera, która będzie dalej analizowana.
2. Zapisać strategię na zasadzie regułowej: jakie akcje mają być wykonane na początku rundy przy zadanym stanie stada (czy kupić psa, czy zamienić zwierzęta itp).
3. Zbudować system do symulowania rzutów kostką, oraz do wyznaczania efektu rzutów kostką na stan stada.
4. Należy przygotować system, który przeprowadzi całą grę, będzie symulował rzuty kostką i reakcje gracza tak długo, aż uda się zdobyć po jednym zwierzaku każdego rodzaju.
5. Należy powtórzyć ww. symulacje wielokrotnie (10 000 razy) tak by oszacować jak wygląda rozkład czasu gry przy określonej strategii.
6. Cały ww. kod, wraz z komentarzami dotyczącymi jego funkcjonowania, oraz wraz z przykładami wyników, należy umieścić w skrypcie knitrowym. Na zajęciach prezentowany będzie skompilowany do html'a skrypt knitrowy.

Wynikiem pierwszej fazy jest opisana słownie oraz zaimplementowana strategia gry w SuperFarmera, wraz z wynikami symulacji długości gry jednego gracza stosującego ww. strategię.

### Kryteria oceny fazy 1:

A. Działanie

Dobre rozwiązanie powinno:

- dać się uruchomić na innym komputerze (moim),
- poprawnie implementować zasady gry w SuperFarmera,
- zliczać czas gry w liczbie losowań kostką,
- badać rozkład czasu gry przez powtórzenie symulacji 10000 razy.

B. Modułowość kodu 

Dobre rozwiązanie powinno:

- składać się z funkcji,
- nazwy funkcji powinny wyjaśniać co funkcje robią,
- funkcje powinny byc krótkie, max 1 ekran, idealnie 5-10 linii,
- funkcje związane ze strategią powinny być oddzielone od funkcji związanych z mechaniką gry,
- funkcje nie powinny korzystać z globalnych parametrów, powinny przyjmować argumenty których potrzebują i jako wynik zwracać nowy stan zmiennych.

C. Elastyczność i czytelność rozwiązania

Dobre rozwiązanie powinno:

- być parametryzowane, parametry powinny znajdować się na początku rozwiązania,
- zmienne powinny mieć czytelne nazwy,
- wartości tam gdzie można powinny być czytelne (nazywane elementy wektorów),
- kod powinien być czytelnie sformatowany, należy unikać długich cebulek,
- unikać kopiowania podobnych bloków instrukcji, które można zastąpić pętlą.
 
## Faza 2:

Drugą fazę realizujemy w zespołach. Zespoły muszą być inne niż w fazie 1. Zespół może składać się z osób z różnych grup laboratoryjnych. 
W ramach nowego zespołu można wykorzystać kod z pierwszej fazy każdego z członków zespołu.

W ramach tej fazy należy (zakładamy, że gra jeden gracz):

1. Przygotować pakiet zawierający funkcje:
 - jedną lub więcej funkcji o nazwie zgodniej ze wzorcem `strategia_....`. W tych funkcjach powinna zostać zaimplementowana strategia gracza,
 - jedną funkcję o nazwie `gra` implementującą jedną rozgrywkę dla zadanej (jako parametr) strategii. Wynikiem ten funkcji powinna być liczba tur prowadzących do zwycięstwa z zadaną strategią
 - jedną funkcję o nazwie `badaj_gre` powtarzającą funkcje `gra` 10000 razy i wyznaczającą podstawowe statystyki opisowe rozgrywek (srednia, min, max, rozklad)
2. Pakiet każdego zespołu powinien nazywać się `SuperFarmer______`, gdzie `______` to dowolne wybrane przez zespół słowo, słowa lub liczba (jeżeli słowo, to musi być cenzuralne i najlepiej bez polskich znaczków). Każdy zespół musi mieć pakiet o innej nazwie.
3. Pakiet powinien być przygotowany zgodnie z regułami sztuki, funkcje i zbiory danych mają dokumentację, pakiet ma opis i zależności oraz unit testy. Funkcja test() i check() przechodzi bez błędów.
4. Do pakietu dołączony jest skrypt knitr ilustrujący wykonanie pakietu na wybranych strategiach.
5. W pakiecie należy zaimplementować dobre strategie.

### Kryteria oceny fazy 2:

W tej fazie również oceniane będą trzy kryteria:

A. Jakość strategii.

Wyżej punktowane będą rozwiązania, których strategie będą krócej grały. Jeżeli pakiet implementuje kilka strategii pod uwagę brana jest najlepsza z nich. Nie można mieć pakietu wyłącznie z podzbiorem strategii z innego pakietu, ale można mieć nadzbiór.

B. Elastyczność pakietu.

Premiowane będą pakiety, których funkcja `strategia_` zadziała na funkcji `gra` z innego pakietu.
Premiowane będą pakiety, których funkcja `gra` pozwoli na użycie funkcji `strategia_` z innego pakietu.

Aby możliwa była taka współpraca pomiędzy pakietami, muszą Państwo sami uzgodnić pomiędzy sobą protokół komunikacji pomiędzy strategią a grą. To może być wektor, ramka, lista, cokolwiek.

Aby pokazać z iloma innymi pakietami można wykorzystać Państwa strategię proszę przygotować skrypt knitra (to może być ilustracja, patrz punkt C poniżej), w którym będą przykłady wczytania kolejnych pakietów oraz uruchomienia Państwa funkcji `strategia` i `gra` na funkcjach z innych pakietów.

Najbardziej optymistyczny scenariusz jest taki, że wszystkie zespoły będą trzymały się uzgodnionego protokołu, przez co każda strategia zadziała na każdej grze i wszyscy dostaną max punktów za tę część.

```
SuperFarmerZieloneLudki::gra( SuperFarmerMysliciele::strategia_Tylko_Nie_Pies )
## 45
```
Uzgodnienia protokołów nie tworzą się same z siebie. Ktoś musi pierwszy coś zaproponować i to wystarczająco wcześnie.

C. Inżynierska jakość kodu.

Premiowane będą pakiety, których funkcje będą udokumentowane. 
Których zbiory danych będą udokumentowane. 
Który będzie posiadał odpowiednio dużo testów jednostkowych (testthat). 
Który będzie wyposażony w ilustracje (vigniette) pokazującą jak korzystać z funkcji pakietu.

Dodatkowo premiowane będa pakiety umożliwiające parametryzowanie rozgrywek (czy wilk zjada małęgo psa, czy lis pozostawia jednego królika, czy można wymieniać w jednej rundzie wiele zwierząt na wiele).

## Faza 3:

Trzecią fazę realizujemy w zespołach, innych niż w poprzednich fazach. Zespół może składać się z osób z różnych grup laboratoryjnych. W ramach nowego zespołu można wykorzystać dowolny kod zgłoszony w fazie 2.

Celem jest przygotowanie funkcji - wizytówki, dla strategii.
Wizytówka fizycznie jest jednym, jednostronicowym plikiem pdf (najlepiej formatu A4 lub A3, ale nie jest to sztywne wymaganie).
Wizytówka powinna być generowana automatycznie dla wybranej strategii.

Jako rozwiązanie należy:

- do jednego z pakietów dodać funkcję wizytowka_aaa(strategia), gdzie ‘aaa’ to nazwa nowego zespołu. W jednym pakiecie może być kilka takich funkcji, ważne by każdy zespół dodał przynajmniej jedną funkcję do któregoś pakietu.
- na moje repozytorium należy przesłać wizytówki dla przynajmniej dwóch strategii. Pliki z wizytówką proszę zapisać w formacie pdf w pliku o nazwie aaa_wizytowka_bbb.pdf gdzie 'aaa' to nazwa zespołu a 'bbb' to nazwa strategii. Proszę też oczywiście wysłać informację w którym pakiecie jest ta nowa wizytówka.

* Wizytówka powinna być czytelna samoistnie, wszystkie niezbędne wyjaśnienia powinny być na niej. 
* Wizytówka powinna zawierać informację o tym jaka strategia jest przedstawiana i kto wizytówkę wykonał.
* Wizytówka może składać się z jednego lub większej liczby wykresów.
* Wizytówka powinna być generowana całkowicie automatycznie, bez konieczności edycji pliku pdf w jakimś innym zewnętrznym programie.

### Kryteria oceny fazy 3:

W tej fazie również oceniane będą trzy kryteria:

A. Jak wiele możemy się o danej strategii dowiedzieć z wizytówki

Wizytówki pokazujące jedynie proste statystyki (tylko mediana, tylko min/max) będą oceniane niżej,
wizytówki pokazujące wiele ciekawych informacji będą oceniane wyżej (decyle, rozkład).

B. Czy możemy porównać różne strategie

Najlepsze prezentacje danych mają wspólny punkt odniesienia, dzięki czemu można porównać otrzymane wyniki.
Wyżej oceniane będą wizytówki, które można ze sobą porównać. 
Aby to było możliwe wykresy powinny mieć takie same/podobne skale na osiach.
Najlepiej by czas działania strategii był odniesiony do jednego uniwersalnego rozwiązania (np. względem najlepszej lub względem najbardziej naiwnej strategii). Jeżeli każda wizytówka pokazuje o ile analizowana strategia jest lepsza / gorsza niż strategia ABC, wtedy można łatwo porównać wizytówki.
Jeżeli zestawiamy obok siebie obie wizytówki i nie możemy na ich podstawie porównać strategii, to źle.

C. Estetyka

To kryterium najtrudniej sformalizować, ale bardziej estetyczne, lepiej wyglądające wizytówki oceniane będą wyżej.
Elementem estetyki jest czytelność. Aby wizytówka była czytelna wszystkie elementy muszą być wystarczająca duże by móc je przeczytać.

