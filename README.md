# VirtualLibrary
System wirtualnej biblioteki, która umożliwia użytkownikom wyszukiwanie dostępności książek oraz sprawdzanie ich lokalizacji w rzeczywistej bibliotece. 

### Panel użytkownika:
- przeszukiwanie katalogu po tytule <br>
<img src="/readme_images/tytul.png"/>
- przeszukiwanie katalogu po tagu RFID, który jest unikalnym identyfikatorem dla każdej książki
- wyswietlanie zawartości biblioteki w postaci listy, z możliwością filtrowania (wzg. gatunku, numeru szafy/półki/książki)
- wyświetlanie dokładnej lokalizacji książki w bibliotece

### Panel administratora:
- dodawanie książek pojedynczo/z pliku csv z możliwością wybrania gatunku
- usuwanie książek po tytule i autorze/tagu RFID lub z podaniem pliku csv zawierającego listę książek do usunięcia

## Instrukcja pierwszego usuchomienia programu
- Zainstalować czcionkę z pliku "fonts\BrunoAce-Regular.ttf"<br>
- Zmienić ścieżki do zapisu i odczytu plików stanu biblioteki w biblioteka.cpp w funkcjach: odczytWszystkich(), zapisDoPliku()<br>
- Uruchomić wtyczke do obsługi qml: menu główne Qt > pomoc > informacje o wtyczkach > Qt Quick > QmlDesigner<br>
- Skopiować pliki: main.qml, widok3d, font i images do folderu build debug<br>
- Logowanie do admina<br>
    login: admin<br>
    hasło: admin
