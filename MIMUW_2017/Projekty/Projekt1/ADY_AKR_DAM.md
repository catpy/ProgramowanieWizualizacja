Rozwiązanie:
https://rawgit.com/pbiecek/ProgramowanieWizualizacja/master/MIMUW_2017/Projekty/Projekt1/Faza2/Projekt1-Amb%2CDym%2CKro%CC%81l.html

Rozwiązanie bardzo dobre.
Ale zabrałem punkty za rzeczy obniżające czytelność kodu.

- Używanie tajemniczych indeksów liczbowych (1:4,7) 
- nadużywanie instrukcji break
- brak spacji 
- duplikowanie kodu

A. Działanie

* Skrypt się kompiluje.

B. Modułowość kodu

* Funkcje są krótkie, czytelne dobrze dobrane. Nazwy funkcji mogłyby być bardziej oddające to co funkcja robi.
Przykładowo funkcja `resetuj_tablice()` wcale nie resetuje tablicy, tylko zwraca pustą tablicę. A dopiero przypisanie jej do symbolu `zwierzeta` powoduje reset.

* Używając za każdym razem indeksów liczbowych, takich jak 6:2 łatwo zapomnieć który indeks to które zwierzę. Czytelniej by było używać nazw. 

C. Elastyczność i czytelność rozwiązania

* Zbyt wiele zmiennych o dziwnych nazwach. Takich jak a, tmp_zwierzeta.

* Czasem nazwy funkcji są rozdzielane _ a czasem nie. Np. wektor_kostek / nakostkach

* Właściwy program tez mógłby być funkcją.

* Warunek stopu
```
prod(zwierzeta[1, c(1:4, 6)])
```
mógłby być osobną funkcją. Byłoby to czytelniejsze. 
A teraz mają państwo ten warunek 2x powtórzony

Inne uwagi:

Zamiast pętli for (ostatniej, tej bez funkcji), wygodniej by było jednak użyć pętli replicate. 

W zasadach gry w jednej turze można wymienić zwierzęta tylko raz (na mniejsze lub większe).
W państwa kodzie jest jedna wymiana na droższe i druga na tańsze.

Z instrukcji `break` należy korzystać bardzo ostrożnie. U państwa jest ona stanowczo zbyt często używana.

Przy operatorze <- należy przed i po umieszczać spacje - dla czytelności.

Raz używają państwo <- a raz =.

Na początku dwukrotnie państwo powtarzają fragment
```
  data.frame(
  krolik = c(kroliki_start, kroliki_krolikowartosc, kroliki_stado),
  owca = c(owce_start, owce_krolikowartosc, owce_stado),
  swinia = c(swinie_start, swinie_krolikowartosc, swinie_stado),
  krowa = c(krowy_start, krowy_krolikowartosc, krowy_stado),
  duzy.pies = c(d_psy_start, d_psy_krolikowartosc, d_psy_stado),
  kon = c(konie_start, konie_krolikowartosc, konie_stado),
  maly.pies = c(m_psy_start, m_psy_krolikowartosc, m_psy_stado),
  row.names = c("w_zagrodzie", "krolikowartosc", "w_stadzie")
  )
```
A można zrobić to tylko raz w funkcji `resetuj_tablice` i użyć jej do inicjacji `zwierzeta`

Punkty:

8/10


