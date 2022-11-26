# Komendy:
# 
# echo - wypisywanie znaków na standardowe wyjście
# pwd - wypisywanie ścieżki bezwględnej do bieżącego katalogu (print working directory)
# cat - wypisywanie pliku (od słowa concatenate)
# file - informacja jakie dane w pliku się znajdują (jaki jest jego format)
# more, less - sekwencyjne przeglądanie pliku np. linijka po linijce
# /file -wyszukiwanie nazw "file" w danym pliku (wraz z użyciem komendy less lub more)
# head, tail - wypisywanie pewnej ilości linii z danego pliku (bez podania opcji domyślnie jest to 10)
# | - komenda przekierowująca dane wygenerowane ze standardowego wyjścia (polecenia po lewej stronie) na standardowe wejście (polecenia po prawej stronie)
# wc - komenda wypisująca dla danego pliku ilość linii, słów i znaków (domyślnie pracuje na standardowym wejściu)
# ctrl+d, ctrl+c, ctrl+z - sposoby na zakończenie procesu na nasze życzenie
# cal - wyświetlenie kalendarza (calendar)
# bc - uniksowy kalkulator
# cd - polecenie umożliwiające wędrówkę po drzewie katalogów (change directory)
# ls - listowanie zawartości katalogu, domyślnie wypisuje nazwy plików z bieżącego katalegu uporządkowane alfabetycznie (list)


# 1. Wypisz tekst na standardowe wyjście.
echo tekst

# 2. Wypisz bezwględną ścieżkę do bieżącego katalogu.
pwd

# 3. Wypisz zawartość pliku stdio.h.
cat /usr/include/stdio.h

# 4. Co znajduje się w pliku /etc/passwd bez wyświetlania go?
 file /etc/passwd

# 5. Przeglądnij plik /etc/passwd.
less /etc/passwd

# 6. Wypisz: a) trzy pierwsze linie z pliku /etc/passwd, b) ostatnią linię z pliku /etc/passwd, c) siedemnastą linię z pliku /etc/passwd.
head -3 /etc/passwd
tail -1 /etc/passwd
head -17 /etc/passwd | tail -1
(cat /etc/passwd | head -17 | tail -1
 more /etc/passwd | head -17 | tail -1
 less /etc/passwd | head -17 | tail -1)
#Polecenie tail działa tutaj na argumencie domyślnym, którym są dane wynikowe polecenia head -17 /etc/passwd.

# 7. Wypisz linie z pliku /etc/passwd od 17 do końca.
cat /etc/passwd | tail -n+17

# 8. Wypisz ilość linii, słów i znaków z pliku /etc/passwd.
wc /etc/passwd

#9. Wypisz ilość linii i słów z pliku /etc/passwd.
wc -lw /etc/passwd

# 10. Wypisz ilość linii, słów i znaków pierwszej linii pliku /etc/passwd.
cat /etc/passwd | head -1 | wc

# 11. Wypisz zawartość katalogu /usr/include.
ls /usr/include