Rozwiązanie:
https://rawgit.com/pbiecek/ProgramowanieWizualizacja/master/MIMUW_2017/Projekty/Projekt1/Faza2/Dabrowska_Gosiewska_faza2/Dabrowska_Gosiewska2.html

A. Działanie
	Skrypt kompiluje się bez problemu (po wyłączeniu biblioteki plotly).
	Spis treści i opisy powodują że całość jest czytelna.

B. Modułowość kodu
	Rozwiązanie składa się z funkcji.
	Jest w miarę czytelne co która robi.

C. Elastyczność i czytelność rozwiązania
	Należałoby poprawić nazwy funkcji, obecnie niektóre nie są czytelne dla postronnej osoby (np. 'wyciag_z_konta')
	Z funkcji ifelse zazwyczaj korzysta się gdy pracuje się z wektorami, a Panie korzystają zamiast if() {} else {},
	niby działa ale nie jest bardziej czytelne
	ifelse(stado_g1[["maly_pies"]] > 0, tabela_zmian[["maly_pies"]] <- -1 ,tabela_zmian[["krolik"]] <- -stado_g1[["krolik"]])

Inne uwagi:

W funkcji 'strategia_wymian' można unikać długich wektorów wartości takich jak:
c("krolik","owca","swinia", "krowa", "kon", "maly_pies","duzy_pies")
c("kon","maly_pies","duzy_pies","owca")

To mogłyby być parametry na początku skryptu. 

Miejscami przypisanie jest operatorem = a czasem <-

Indeksowanie funkcji w ten sposób:
 for(i in 1:length(tabela))
może być źródłem błędów (lepiej używać seq_along())

btw. funkcję wartość (i kilka innych) można np. tak skrócić używając nazw wektora jako indeksów:
hash <- c("krolik" = 1,
        "owca" = 6,
        "swinia" = 12,
        "krowa" =  36,
        "kon" = 72,
        "maly_pies" = 6,
        "duzy_pies" = 36)

wartosc <- function(zwierze){
	hash[zwierze]
}


Punkty:
10/10

