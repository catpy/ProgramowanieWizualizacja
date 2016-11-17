Rozwiązanie:
https://rawgit.com/pbiecek/ProgramowanieWizualizacja/master/MIMUW_2017/Projekty/Projekt1/Faza2/Superfarmer_M_Dzik_P_Radzinski13.html

Rozwiązanie bardzo dobre, zabrałem jeden punkt za poniższe niewielkie usterki.

A. Działanie
	Działa i się odtwarza

B. Modułowość kodu
	Nie jest źle, choć można by ją zwiększyć, np. zamieniając ten zahardkodowany warunek
	if (stado[kon] * stado[krowa] * stado[swinia] * stado[owca] * stado[krolik] != 0) break   
	na użycie funkcji, weryfikującej, czy spełniony jest warunek stopu

C. Elastyczność i czytelność rozwiązania
	Nazwy zmiennych z kropką na końcu są bardzo nieczytelne. Przykładowo stado, stado., stado..


Inne uwagi:

Bardzo dziwne są miejscami argumenty domyślne.
Przykładowo
wilk_i_lis <- function(stado. = stado, kostki = rzut)
Tutaj rzut to zmienna globalna, ale ryzykownym jest używanie jej jako argumentu domyślnego (z uwagi na leniwą ewaluację)


Dobry diagram, lepszy niż morze if'ów

Wielu forów można było sobie oszczędzić,
np.:
 wartosc <- 0
  for(j in 1:7){
    wartosc <- wartosc + stado1[j]*wartosc_w_krolikach1[j]
  }
  return(wartosc)
można zastąpić przez
  return(sum(stado1*wartosc_w_krolikach1))

 
Kod poprawny i dobrze napisany. Zabieram jeden punkt z powodu ww. uwag

Punkty:
9/10

