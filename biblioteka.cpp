#include "biblioteka.h"
#include <QDebug>
#include <vector>
Biblioteka::Biblioteka(QObject *parent)
{

}

int Biblioteka :: ileszaf[7] = {};
int Biblioteka :: ilepolek[7] = {};
int Biblioteka :: ileksiazek[7] = {};
int Biblioteka :: ileusunieto[7] = {};

Szafa &Biblioteka::getSzafa(int numerSzafy){
    if (numerSzafy <= szafy.size()) {
        return szafy[numerSzafy - 1];
    }
    else {
        throw std::out_of_range("Niepoprawny numer szafy");
    }
}

void Biblioteka::dodajSzafe(const Szafa &szafa){
    szafy.push_back(szafa);
    cout << "~dodaje szafe do biblioteki~" <<endl;
}

Q_INVOKABLE QString  Biblioteka::znajdzKsiazkeTag(int tagID){
    cout << "Wyszukiwanie ksiazki z tagiem: "<< tagID << endl;
    bool znaleziono = false;
    for (const auto& szafa : szafy) {
        for (const auto& polka : szafa.polki) {
            for (const auto& ksiazka : polka.ksiazki) {
                if (ksiazka.tagID == tagID) {
                    wynik = "Znaleziono ksiazke z tagiem: " + to_string(ksiazka.tagID) + "\nTytul: " + ksiazka.tytul + "\nAutor: " + ksiazka.autor + "\nSzafa: " + to_string(szafa.numer) + ", Polka: " + to_string(polka.numer) + ", Książka: " +to_string(ksiazka.numer);
                    znaleziono= true;
                    goto exit;
                }
            }}}
    if (!znaleziono) {
        wynik = "Nie znaleziono ksiazki o tagu: " + to_string(tagID);
    }
    exit:
    cout << wynik << endl;
    QString wyn = QString::fromStdString(wynik);
    return wyn;
}

string Biblioteka::zamienNaMaleLitery(const string &wyraz) {
    string wynik = wyraz;
    for (char &znak : wynik){
        znak = tolower(znak);
    }
    return wynik;
}

Q_INVOKABLE QString Biblioteka::znajdzKsiazkeTytul(QString tytul){
    cout << "Wyszukiwanie ksiazki o tytule: "<< tytul.toStdString() << endl;
    string wyszukiwana, znaleziona;
    wyszukiwana = zamienNaMaleLitery(tytul.toStdString());
    bool znaleziono = false;
    for (const auto& szafa : szafy) {
        for (const auto& polka : szafa.polki) {
            for (const auto& ksiazka : polka.ksiazki) {
                znaleziona = zamienNaMaleLitery(ksiazka.tytul);
                if (znaleziona == wyszukiwana) {
                    wynik = "Znaleziono ksiazke o tytule: " + ksiazka.tytul + "\nAutor: " + ksiazka.autor + "\nTag RFID: " + to_string(ksiazka.tagID) + "\nSzafa: " + to_string(szafa.numer) + ", Polka: " + to_string(polka.numer) + ", Książka: " +to_string(ksiazka.numer);
                    znaleziono=true;
                    goto exit;
                }
            }}}
    if (!znaleziono) {
        wynik = "Nie znaleziono książki o tytule: " + tytul.toStdString();
    }
    exit:
    cout << wynik << endl;
    QString wyn = QString::fromStdString(wynik);
    return wyn;
}

void Biblioteka::dodajKsiazkiZPliku(const string& nazwaPliku, Gatunek gatunek,Biblioteka& biblioteka, Szafa& szafa,Polka& polka){
    ifstream plik;
    plik.open(nazwaPliku);
    if (!plik.is_open()) {
        cout << "Nie udalo sie otworzyc pliku"<< endl;
        exit(0);}
    string tytul, autor;
    int iloscKsiazekNaPolce;
    int numerSzafy = ileszaf[gatunek]+1;
    int numerPolki = ilepolek[gatunek]%5+1;
    if (ileksiazek[gatunek]%10 == 0 && ileksiazek[gatunek] != 0){
        iloscKsiazekNaPolce = 10;
    }
    else {iloscKsiazekNaPolce = ileksiazek[gatunek]%10;}

    cout << ileszaf[gatunek]+1 << endl;
    cout << ilepolek[gatunek]+1 << endl;
    cout << ileksiazek[gatunek] << endl;
    cout << numerSzafy << endl;
    cout << numerPolki << endl;
    cout << iloscKsiazekNaPolce << endl;

    while (getline(plik,tytul,';')) {
        getline(plik,autor);
        if (numerPolki==5 && iloscKsiazekNaPolce==10){
            numerSzafy++;
            ileszaf[gatunek]++;
            Szafa szafa(numerSzafy, gatunek);
            biblioteka.dodajSzafe(szafa);
            numerPolki = 1;
            ilepolek[gatunek]++;
            iloscKsiazekNaPolce = 0;
            Polka polka(numerPolki);
            biblioteka.getSzafa(numerSzafy).dodajPolke(polka);
        }
        if (iloscKsiazekNaPolce==10){
            numerPolki++;
            ilepolek[gatunek]++;
            Polka polka(numerPolki);
            biblioteka.getSzafa(numerSzafy).dodajPolke(polka);
            iloscKsiazekNaPolce = 0;
        }
        iloscKsiazekNaPolce++;
        ileksiazek[gatunek]++;
        Ksiazka ksiazka(tytul, autor, gatunek, tagID++,iloscKsiazekNaPolce);
        biblioteka.getSzafa(numerSzafy).getPolka(numerPolki).dodajKsiazke(ksiazka);
        // cout << ksiazka.tytul << endl;
    }
    plik.close();
    cout << "Dodano ksiazki z pliku: " << nazwaPliku << ", o gatunku: " << gatunek << endl;
    cout << "Liczba dodanych ksiazek: " << (numerPolki-1)*10 + (numerSzafy-1)*50 + iloscKsiazekNaPolce << endl;
    cout << "Liczba stworzonych polek: " << numerPolki + (numerSzafy-1)*5 << endl;
    cout << "Liczba stworzonych szaf: " << numerSzafy << endl;
    cout << ileszaf[gatunek]+1 << endl;
    cout << ilepolek[gatunek]+1 << endl;
    cout << ileksiazek[gatunek] << endl;
    cout << numerSzafy << endl;
    cout << numerPolki << endl;
    cout << iloscKsiazekNaPolce << endl;
}

vector<Polka>& Biblioteka :: getPolki(Szafa& szafa)
{
    return szafa.polki;
}
Gatunek Biblioteka :: convertToGatunek(const QString& qstr){
    if (qstr == "fantasy"){return fantasy;}
    else if (qstr == "historyczna"){return historyczna;}
    else if (qstr == "mlodziezowa"){return mlodziezowa;}
    else if (qstr == "przygodowa"){return przygodowa;}
    else if (qstr == "kryminal"){return kryminal;}
    else if (qstr == "horror"){return horror;}
    else if (qstr == "biografia"){return biografia;}
    else {return romans;}
}
Q_INVOKABLE QString Biblioteka :: dodajKsiazkiZPlikuu(QString nazwaPliku, QString gat){
    Gatunek gatunek;
    gatunek = convertToGatunek(gat);
    ifstream plik;
    string wynik;
    plik.open(nazwaPliku.toStdString());

    cout << ileszaf[gatunek]+1 << endl;
    cout << ilepolek[gatunek]+1 << endl;
    cout << ileksiazek[gatunek] << endl;

    if (!plik.is_open()) {
        cout << "Nie udało się otworzyć pliku: " << nazwaPliku.toStdString() << "\no gatunku " << gat.toStdString() << endl;
        QString wyn = "Nie udało się otworzyć pliku:\n" + nazwaPliku + "\no gatunku ";
        return wyn;
        exit(0);}
    string tytul, autor;
    //-1%5+1
    int iloscKsiazekNaPolce;
    int numerSzafy = ileszaf[gatunek]+1;
    int numerPolki = ilepolek[gatunek]%5+1;
    if (ileksiazek[gatunek]%10 == 0 && ileksiazek[gatunek] != 0){
        iloscKsiazekNaPolce = 10;
    }
    else {iloscKsiazekNaPolce = ileksiazek[gatunek]%10;}

    cout << ileszaf[gatunek]+1 << endl;
    cout << ilepolek[gatunek]+1 << endl;
    cout << ileksiazek[gatunek] << endl;
    cout << numerSzafy << endl;
    cout << numerPolki << endl;
    cout << iloscKsiazekNaPolce << endl;

    while (getline(plik,tytul,';')) {
        getline(plik,autor);
        if (numerPolki==5 && iloscKsiazekNaPolce==10){
            numerSzafy++;
            ileszaf[gatunek]++;
            Szafa szafa(numerSzafy, gatunek);
            dodajSzafe(szafa);
            numerPolki = 1;
            ilepolek[gatunek]++;
            iloscKsiazekNaPolce = 0;
            Polka polka(numerPolki);
            getSzafa(numerSzafy).dodajPolke(polka);
        }
        if (iloscKsiazekNaPolce==10){
            numerPolki++;
            ilepolek[gatunek]++;
            Polka polka(numerPolki);
            getSzafa(numerSzafy).dodajPolke(polka);
            iloscKsiazekNaPolce = 0;
        }
        iloscKsiazekNaPolce++;
        ileksiazek[gatunek]++;
        Ksiazka ksiazka(tytul, autor, gatunek, tagID++,iloscKsiazekNaPolce);
        getSzafa(numerSzafy).getPolka(numerPolki).dodajKsiazke(ksiazka);
        // cout << ksiazka.tytul << endl;
    }
    plik.close();
    QString wyn = "Dodano książki z pliku:\n" + nazwaPliku + "\no gatunku ";
    cout << "Dodano ksiazki z pliku: " << nazwaPliku.toStdString() << "\no gatunku " << gat.toStdString() << endl;
//            "\nLiczba dodanych ksiazek: " + ((numerPolki-1)*10 + (numerSzafy-1)*50 + iloscKsiazekNaPolce) +
//            "\nLiczba stworzonych polek: " + numerPolki + (numerSzafy-1)*5 +
//             "\nLiczba stworzonych szaf: " + numerSzafy;
    cout << ileszaf[gatunek]+1 << endl;
    cout << ilepolek[gatunek]+1 << endl;
    cout << ileksiazek[gatunek] << endl;
    cout << numerSzafy << endl;
    cout << numerPolki << endl;
    cout << iloscKsiazekNaPolce << endl;
    return wyn;
}

Q_INVOKABLE QString Biblioteka::usunKsiazkeTag(int tagID){
    cout << "Usowanie ksiazki z tagiem: "<< tagID << endl;
    string wynik;
    for (auto& szafa : szafy) {
        for (auto& polka : szafa.polki) {
                auto it = polka.ksiazki.begin();
            while(it != polka.ksiazki.end()) {
                    if (it->tagID == tagID) {
                        wynik = "Usunięto książkę z tagiem: "+to_string(it->tagID)+"\nTytul: "+it->tytul+"\nAutor: " + it->autor + "\nSzafa: " + to_string(szafa.numer) + ", Polka: " + to_string(polka.numer) + ", Książka: " +to_string(it->numer);
                        ileusunieto[it->gatunek]++;
                        polka.ksiazki.erase(it);
                        while(it != polka.ksiazki.end()){
                            it->numer--;
                            ++it;
                        }
                        QString wyn = QString::fromStdString(wynik);
                        return wyn;
                    }
                    else{
                        ++it;}
                }
            }}
    wynik = "Nie znaleziono ksiązki o tagu " + to_string(tagID);
    QString wyn = QString::fromStdString(wynik);
    return wyn;
}
Q_INVOKABLE QString Biblioteka::usunKsiazkeTytul(QString tytul,QString autor){
    cout << "Usowanie ksiazki o tytule: "<< tytul.toStdString() << "autorze: " << autor.toStdString() << endl;
    string wynik, tytull, autorr;
    tytull = zamienNaMaleLitery(tytul.toStdString());
    autorr = zamienNaMaleLitery(autor.toStdString());
    for (auto& szafa : szafy) {
        for (auto& polka : szafa.polki) {
                auto it = polka.ksiazki.begin();
                while(it != polka.ksiazki.end()){
                    if (zamienNaMaleLitery(it->tytul) == tytull && zamienNaMaleLitery(it->autor) == autorr) {
                        wynik = "Usunięto książkę z tagiem: "+to_string(it->tagID)+"\nTytul: "+it->tytul+"\nAutor: " +  it->autor + "\nSzafa: " + to_string(szafa.numer) + ", Polka: " + to_string(polka.numer) + ", Książka: " +to_string(it->numer);
                        ileusunieto[it->gatunek]++;
                        polka.ksiazki.erase(it);
                        while(it != polka.ksiazki.end()){
                            it->numer--;
                            ++it;
                        }
                        QString wyn = QString::fromStdString(wynik);
                        return wyn;
                    }
                    else{
                        ++it;}
                }}}
    wynik = "Nie znaleziono ksiazki o tytule: " + tytul.toStdString();
    cout << wynik << endl;
    QString wyn = QString::fromStdString(wynik);
    return wyn;
}
