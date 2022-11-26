# Polecenia:

# who - lista użytkowników aktualnie zalogowanych do systemu
# rmdir - usuwanie pustych katalogów (remove directory)
# diff - porównywanie zawartości dwóch plików tekstowych
# mv - zmiana nazwy pliku (move)
# chmod - zmiana zezwoleń dostępu do pliku
# date - wypisanie na standardowe wyjście bieżącej daty
# touch - zmiana daty modyfikacji lub ostatniego dostępu do pliku
# ln - tworzenie dowiązań twardych i miękkich (link)

# 1. Znajdź pliki z katalogu /usr/include, których nazwy zaczynają się na literę "s" i mają dokładnie osiem znaków długości.
ls /usr/include | grep '^s.\{7\}$'

# 2. Ilu użytkowników jest w tym momencie podłączonych do systemu operacyjnego?
who | awk '{print $1}' | sort | uniq | wc -l

# 3. W katalogu bieżącym utwórz katalog "c3" a następnie w katalogu "c3" utwórz katalogi "bin" oraz "txt".
mkdir ./c3 ./c3/bin ./c3/txt

# 4. Zapisz informacje z manuala do własnego pliku.
man ls > ls.txt

# 5. Dopisz informacje z manuala do własnego pliku.
man ls >> ls.txt

# 6. Utwórz kopię zapasową danego pliku.
cp ls.txt ls.bak

# 7. Wypisz różnice pomiędzy zawartością dwóch danych plików.
diff ls.txt ls.bak

# 8. Skopiuj zawartość plików do bieżącego katalogu.
cp /bin/rm /bin/tar .

# 9. Zmień nazwę pliku "rm".
mv rm mojrm

# 10. Cofnij prawa odczytu właścicielowi indywidualnemu dla pliku "ls.txt".
chmod u-r ls.txt

# 11. Dopisz bieżącą datę do pliku "ls.txt" pomimo braku możliwości jego odczytania.
date >> ls.txt

# 12. Nadaj uprawnienia odczytu właścicielowi indywidualnemu dla pliku "ls.txt".
chmod u+r ls.txt

# 13. Uruchom plik "ls.bak.
./ls.bak

# 14. Utwórz dowiązania miękkie i twarde do plików.
ln -s ../txt/ls.bak mietkie
ln ../txt/plik1 twarde