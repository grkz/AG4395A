foldery data oraz results muszą istnieć!


PYTHON:

get_data.py
			-> po wybraniu ustawień na analizatorze, przełącza trigger na SINGLE 
			(pojedynczy pomiar, niezaleznie od wcześniejszych ustawień na urządzeniu!) 
			format - ASCII. Pyta o nazwę pliku, który zostanie zapisany w folderze DATA.
			-> dodatkowo zostanie utworzony plik nazwa_pliku_freq zawierający pionowy wektor częstotliwości
			W trybie network N - zgrywa dane również do pionowego wektora.
			W trybie spectrum - jeden pomiar to jeden wiersz; częstotliwościom odpowiadają poszczególne kolumny.
			Program pyta o liczbę pomiarów do wykonania.
get_spectrum_screen.py
			-> działa analogicznie, jednak nie zmienia ustawień triggera i nie wyzwala pomiaru.
			Ustawia HOLD i odczytuje dane z analizatora.
			Ściąganie danych w trybie Spectrum po użyciu np. uśrednienia w urzadzeniu.
			
Matlab:
parse_spect(filename)
			-> filename musi być nazwą z pomiaru spektrum (szumu)
			-> tworzy w folderze RESULTS plik nazwa_pliku_averaged -> WYNIK UŚREDNIENIA w kwadratach (dwukolumnowy plik finalny f | dane)
			-> rysuje w tym samym folderze w skali logarytmicznej: nazwa_pliku.eps
parse_tf(filename)
			-> filename musi być nazwą z pomiaru odpowiedzi częstotl.
			-> tworzy w folderze RESULTS dwukolumnowy plik (o tej samej nazwie!) (f | dane)
			-> rysuje do pliku RESULTS/filename.eps
