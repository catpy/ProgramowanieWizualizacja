Rozwiązanie:
https://rawgit.com/pbiecek/ProgramowanieWizualizacja/master/MIMUW_2017/Projekty/Projekt1/Faza2/ZbijewskaKranas1/ZbijewskaKranas1-2.html

Rozwiązanie bardzo dobre, zabrałem jeden punkt za poniższe niewielkie usterki.

A. Działanie

* Skrypt kompiluje się bez problemu.
* Spis treści przedstawia czytelnie strukturę,
* brakuje polskich liter w polskich opisach,
* same opisy też mogłyby być bardziej rozbudowane.

B. Modułowość kodu

* Rozwiązanie składa się z funkcji.
* Funkcje są rozsądnej długości, mogłyby być krótsze ale wciąż są czytelne.


C. Elastyczność i czytelność rozwiązania

* Należałoby poprawić nazwy funkcji, obecnie niektóre nie są czytelne dla postronnej osoby (np. 'wyciag_z_konta')
* Z funkcji ifelse zazwyczaj korzysta się gdy pracuje się z wektorami, a Panie korzystają zamiast if() {} else {},
  niby działa ale nie jest bardziej czytelne
 ```
 ifelse(stado_g1[["maly_pies"]] > 0, tabela_zmian[["maly_pies"]] <- -1 ,tabela_zmian[["krolik"]] <- -stado_g1[["krolik"]])
 ```

Inne uwagi:

W funkcji rzuc_i_zareaguj
zamiast robić zagnieżdzonego if'a 

```if ('wilk' %in% kostki)
    if ('lis' %in% kostki) 
```
i później jeszcze jednego ifa, czytelniej by było rozpatrzeć najpierw atak wilka a później lisa, być może dwukrotnie wywołując funkcję 'atak_drapieznika'

 Zresztą, można by cały blok:
```
if ('wilk' %in% kostki){
    if ('lis' %in% kostki) {
      NoweStany <-atak_drapieznika(TRUE,TRUE,NoweStany$Stado,NoweStany$Glowne)
    } else {
      NoweStany <- atak_drapieznika(FALSE,TRUE,NoweStany$Stado,NoweStany$Glowne)
    }
  } else {
    if ('lis' %in% kostki) {
      NoweStany <- atak_drapieznika(TRUE,FALSE,NoweStany$Stado,NoweStany$Glowne)
    }
  }
```

zamienić na

```
czy_wilk <- 'wilk' %in% kostki
  czy_lis <- 'lis' %in% kostki
  if (czy_wilk | czy_lis)
      NoweStany <-atak_drapieznika(czy_wilk,czy_lis,NoweStany$Stado,NoweStany$Glowne)

```

Podobnie, można by 
```
dodaj_lub_odejmij_zwierzeta <- function(co, jak='+',stado,stado_glowne){
  if (jak=='+'){ # dodajemy do stada
    stado <- stado + co
    stado_glowne <- stado_glowne - co
  } else { # odejmujemy ze stada
    stado <- stado - co
    stado_glowne <- stado_glowne + co
  }
  return(list(Stado=stado,Glowne=stado_glowne))
}
```
zastąpić przez (jak = +1 / -1)
```
dodaj_lub_odejmij_zwierzeta <- function(co, jak=1,stado,stado_glowne){
    stado <- stado + jak * co
    stado_glowne <- stado_glowne - jak * co
  return(list(Stado=stado,Glowne=stado_glowne))
}
```
Korzystanie z długich warunków jest źródłem trudnych do wyśledzenia błedów, literówek

```
if(all(stado >= c(0,0,0,0,2,0,0)) | all(stado >= c(0,0,0,2,1,0,0)) | all(stado >= c(0,0,2,1,1,0,0)) | all(stado >= c(0,2,1,1,1,0,0)) | all(stado >= c(0,0,0,1,1,0,1)) | all(stado >= c(0,1,1,1,1,1,0)) | all(stado >= c(1,1,1,1,1,0,0))){
    return(TRUE)
  } else {
    return(FALSE)
  }
```

Punkty:

9/10

