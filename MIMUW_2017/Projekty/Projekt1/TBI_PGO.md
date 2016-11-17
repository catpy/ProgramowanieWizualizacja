Rozwiązanie:
https://rawgit.com/pbiecek/ProgramowanieWizualizacja/master/MIMUW_2017/Projekty/Projekt1/Faza2/Bielak_Gorniak_Faza1.html

Rozwiązanie dobre,
główne powody ucinania punktów to: długie funkcje, dłuższe niż zalecenia z zajęć, korzystanie ze zmiennych globalnych (to zły nawyk), i poniższe uwagi.
s
A. Działanie
	Skrypt kompiluje się bez problemu.
	Spis treści przedstawia czytelnie strukturę,
	brakuje polskich liter w polskich opisach,
	same opisy też mogłyby być bardziej rozbudowane.

B. Modułowość kodu
    Kod składa się z funkcji, co jest zaletą
    Bardzo złym nawykiem jest przypisywanie wartości do zmiennych globalnych, czy to operatorem <<- czy funkcją assign
    W zaleceniach była jasna informacja, że funkcje powinny być krótkie. a tutaj np. f.update_stanu_stada zajmuje trzy ekrany kodu

C. Elastyczność i czytelność rozwiązania
    W nazwach funkcji można używać i znaku . i znaku _ ale złym nawykiem jest używanie i jednego i drugiego


Inne uwagi:

Zapis w funkcjach taki jak:
wynik<<-c(sample(as.character(kostka1[[1]]),1,TRUE,prob=kostka1[[2]]),sample(as.character(kostka2[[1]]),1,TRUE,prob=kostka2[[2]]))
return(wynik)

jest bardzo błędogenny. W pierwszym kroku zapisuje się do przestrzeni globalnej, a w drugim jako wynik zwraca się symbol z przestrzeni globalnej, nie wiadomo po co jest ta funkcja.

Rozszerzanie wektora przez 
'historia<<-c(historia,runda)' jest bardzo nieefektywne

Punkty:
7/10

