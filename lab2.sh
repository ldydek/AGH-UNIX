# Polecenia:

# mkdir - utworzenie nowego katalogu (make directory)
# cp - kopiowanie plików (copy)
# grep - wyszukiwanie linii zawierających pewien wzorzec
# grep [opcje] wyrażenie_regularne [plik] (domyślnie działa nie na konkretnym pliku, ale na standardowym wyjściu)
# man - podręcznik pomocy systemowej
# passwd - zmiana hasła (domyślnie dla zalogowanego użytkownika) - taka sama nazwa jak pliku konfiguracyjnego /etc/passwd
# cut - wypisywanie na standardowe wyjście tylko fragmentów linii a nie całości
# awk - odczytanie konkretnej kolumny z danego pliku (pomocne w przypadku różnych ilości białych znaków oddzielających kolumny)
# uniq - usuwa powtarzające się linie z posortowanego pliku
# sort - sortuje dane np. napisy wg kodów ASCII (domyślnie rosnąco)

# 1. Utwórz nowy katalog w katalogu domowym o nazwie c5 a następnie zmień ścieżkę dostępu w stosunku do tego katalogu.
mkdir c5
cd c5
# w komendzie cd podaję ścieżkę względną od bieżącego katalogu

# 2. Utwórz kopię pliku stdio.h w katalogu c5 (bieżącym).
cd c5
cp /usr/include/stdio.h .
# Znak . informuje o kopiowaniu pliku do bieżącego katalogu. W innym przypadku należy podać ścieżkę względną bądź bezwzględną do docelowego katalogu lub pliku.

# 3. Wypisz wszystkie linie z pliku stdio.h, które zawierają co najmniej jedno wystąpienie wyrażenia "file"
grep file stdio.h

# 4. Wypisz wszystkie linie z pliku stdio.h, które zawierają co najmniej jedno wystąpienie wyrażenia "file" jako osobne słowo a nie podciąg danego wyrazu.
cat stdio.h | grep -w file
# Mogłaby się w takim przypadku pojawić również linia zawierająca oprócz słowa "file" wyrażenie, w którym "file" jest podciągiem innego słowa.

# 5. Użyj manuala w celu uzyskania pomocy na temat polecenia passwd.
man passwd

# 6. Użyj manuala w celu uzyskania pomocy na temat pliku konfiguracyjnego /etc/passwd.
man 5 passwd
# W tym przypadku specyfikujemy rozdział, do którego chcemy się udać w manualu, a w rozdziale 5 są właśnie informacje na temat plików konfiguracyjnych.

# 7. Ile jest takich linii? (kontynuacja polecenie nr 4)
cat stdio.h | grep -w file | wc -l
(cat stdio.h | grep -wc file)
(grep -wc file stdio.h)
(grep -w file stdio.h | wc -l)
# Argumenty -w oraz -c (dodatkowe zliczanie tych linii jako opcja polecenia grep)

# 8. Ile jest takich linii, które nie zawierają słowa "file" jako oddzielnego słowa w pliku stdio.h?
grep -wcv file stdio.h
(cat stdio.h | grep -wcv file)

# 9. Wypisz ilość linii z pliku stdio.h zawierających ciąg znaków "file", ale dowolnie pisany (wielkie litery również opcjonalne).
grep -ic file stdio.h

# 10. Wypisz ilość linii z pliku stdio.h zawierających przynajmniej jedno słowo "file" dowolnie pisane (wielkie litery również opcjonalne).
grep -icw file stdio.h

# 11. Wypisz z pliku /etc/passwd trzecią i piątą kolumnę.
cat /etc/passwd | cut -d: -f3,5
# Opcje -d (zmiana separatora, ponieważ domyślnym jest tabulator) oraz -f (wyspecyfikowanie konkretnych kolumn)

# 12. Wypisz z pliku /etc/passwd kolumny od trzeciej do piątej.
cat /etc/passwd | cut -d: -f3-5

# 13. Znajdź użytkownika root w systemie.
cat /etc/passwd | cut -d: -f3,5 | grep '^0:' | cut -d: -f2
cat /etc/passwd | awk -F: '{ if($3 == 0) print $5 }'
# Na początku odczytuję trzecią i piątą kolumnę z pliku /etc/passwd, potem sprawdzam, który wiersz w trzeciej kolumnie zawiera tylko '0' (ID użytkownika), a na końcu z wybranego wiersza na standardowe wyjście kieruję tylko opis użytkownika (piąta kolumna).

# 14. Ilu użytkowników w pliku /etc/passwd nie ma zamieszczonego opisu (kolumna piąta)?
cat /etc/passwd | awk -F: '{ if($5 == "") print $5 }' | wc -l
cat /etc/passwd | cut -d: -f5 | grep -c '^$'

# 15. Jakie interpretery poleceń są wykorzystywane przez użytkowników lokalnych tego systemu jako interpretery logujące?
cat /etc/passwd | cut -d: -f7 | sort | uniq

# 16. Jakie dwa interpretery poleceń są najczęściej wykorzystywane przez użytkowników lokalnych tego systemu jako interpretery logujące?
cat /etc/passwd | cut -d: -f7 | sort | uniq -c | sort -nr | head -2 | awk '{print $2}'

# 17. Ile w tym systemie operacyjnym jest grup użytkowników, które nie są grupami dodatkowymi dla żadnego użytkownika?
cat /etc/group | cut -d: -f4 | grep -c '^$'

# 18. Ilu w systemie jest użytkowników, których nazwa składa się z trzech znaków?
cat /etc/passwd | cut -d: -f1 | grep -c '^...$'

# 19. Wypisz nazwy użytkowników systemu operacyjnego zaczynające się na literę 's'.
cat /etc/passwd | cut -d: -f1 | grep '^s'

# 20. Wypisz nazwy użytkowników systemu operacyjnego zaczynające się na literę 's' i zawierające literę 't' przynajmniej jeden raz.
cat /etc/passwd | cut -d: -f1 | grep  '^s.*t'