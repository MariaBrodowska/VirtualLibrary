# VirtualLibrary
System wirtualnej biblioteki, która umożliwia użytkownikom wyszukiwanie dostępności książek oraz sprawdzanie ich lokalizacji w rzeczywistej bibliotece. 

### Panel użytkownika:
- przeszukiwanie katalogu po tytule <br>
<img src="/readme_images/tytul.png"/> <br>
- przeszukiwanie katalogu po tagu RFID, który jest unikalnym identyfikatorem dla każdej książki<br>
  <img src="/readme_images/tag.png"/> <br>
- wyswietlanie zawartości biblioteki w postaci listy, z możliwością filtrowania (wzg. gatunku, numeru szafy/półki/książki)<br>
- <img src="/readme_images/zawartosc.png"/> <br>
- wyświetlanie dokładnej lokalizacji książki w bibliotece<br>
<img src="/readme_images/widok1.png"/> <br>
<img src="/readme_images/widok2.png"/> <br>
<img src="/readme_images/widok3.png"/> <br>
### Panel administratora:
- dodawanie książek pojedynczo/z pliku csv z możliwością wybrania gatunku<br>
<img src="/readme_images/dodaj1.png"/> <br>
<img src="/readme_images/dodaj2.png"/> <br>
- usuwanie książek po tytule i autorze/tagu RFID lub z podaniem pliku csv zawierającego listę książek do usunięcia<br>
<img src="/readme_images/usun.png"/> <br>

## Instrukcja pierwszego usuchomienia programu
- Zainstalować czcionkę z pliku "fonts\BrunoAce-Regular.ttf"<br>
- Zmienić ścieżki do zapisu i odczytu plików stanu biblioteki w biblioteka.cpp w funkcjach: odczytWszystkich(), zapisDoPliku()<br>
- Uruchomić wtyczke do obsługi qml: menu główne Qt > pomoc > informacje o wtyczkach > Qt Quick > QmlDesigner<br>
- Skopiować pliki: main.qml, widok3d, font i images do folderu build debug<br>
- Logowanie do admina<br>
    login: admin<br>
    hasło: admin
