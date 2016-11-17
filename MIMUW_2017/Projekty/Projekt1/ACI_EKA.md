Rozwiązanie:
https://rawgit.com/pbiecek/ProgramowanieWizualizacja/master/MIMUW_2017/Projekty/Projekt1/Faza2/superfarmer_ostateczny.html

A. Działanie
	Sktyptu nie można wykonać bez żadnych modyfikacji, ponieważ są w nich globalne ścieżki 'C:/Users/Key/Downloads/'
	Znacznie lepiej używać ścieżek względnych.

B. Modułowość kodu
	Kod jest elastyczny, bardzo podoba mi się wyróżnienie funkcji 'win'

C. Elastyczność i czytelność rozwiązania
	W funkcji 'choose.move' czytelniej byłoby użyć funkcji switch zamiast if/else
	Długie pozagnieżdżane funkcje, takiej jak 'reproduction' warto by podzielić na małe podfunkcje dla zwiększenia czytelności


Inne uwagi:

Zabrało mi porównania lasów do strategii I i strategii II - rozwiązań kolegów. 
Widzimy, że wyniki są lepsze niż losowe, ale czy są lepsze niż te dwie strategie?

Zamiast
names(podsumowanie.faza1)[1]<-paste("Wariant_losowy")
names(podsumowanie.faza1)[2]<-paste("Iprzetrenowanie")
names(podsumowanie.faza1)[3]<-paste("IIprzetrenowania")
names(podsumowanie.faza1)[4]<-paste("IIIprzetrenowania")

można napisać
names(podsumowanie.faza1)<-c("Wariant_losowy","Iprzetrenowania","IIprzetrenowania","IIIprzetrenowania")

Pętle takie jak
for(i in 0:ratio)
są bardzo nie w stylu R

Dodawanie wierszy z użyciem funkcji `rbind` jest kosztowne obliczeniowo.


Powinienem być może zabrać jakiś punkt lub dwa za uwagi w punktach A i C. 
Ale dodaję bonus za unikalne podejście związane z lasami losowymi

Punkty:
10/10

