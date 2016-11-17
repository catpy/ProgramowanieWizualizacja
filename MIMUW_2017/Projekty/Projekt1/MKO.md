Rozwiązanie:
https://rawgit.com/pbiecek/ProgramowanieWizualizacja/master/MIMUW_2017/Projekty/Projekt1/Faza2/FarmerRaportMichalKotlewski.html

Rozwiązanie bardzo dobre, zabrałem jeden punkt za poniższe niewielkie usterki.

A. Działanie
	Kod działa poprawnie

B. Modułowość kodu
	Funkcje są krótkie, w większości czytelne.
	Rozwiązanie jes opisane w sposób elastyczny, wyróżnione są elementy rozgrywki i weryfikacji warunków zakończenia.

C. Elastyczność i czytelność rozwiązania
	Brakuje komentarzy, zmienne są czytelne i funkcje są raczej krótkie, ale bez komentarzy dłużej trwa rozszyfrowanie co się gdzie dzieje.	


Inne uwagi:

MAkarony typu
  if (stanGry[["stanZagrody"]]["krolik"] > 1 &
      stanGry[["stanZagrody"]]["owca"] > 1 &
      stanGry[["stanZagrody"]]["swinia"] > 1 &
      stanGry[["stanZagrody"]]["krowa"] > 1 &
      stanGry[["stanZagrody"]]["kon"] > 1) 
  {
    return (1)
  }
  else
  {
    return (0)
  }
To nie jest R'owy sposób pisania kodu oparty o wektoryzowane funkcje
To nawet nie jest poprawne zaimplementowanie warunków gry.
Można go zastąpić przez all(stanGry[["stanZagrody"]] > 0)

Punkty:
9/10

