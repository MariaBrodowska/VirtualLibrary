#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "ksiazka.h"
#include "polka.h"
#include "szafa.h"
#include "biblioteka.h"
#include <iostream>
#include <vector>
#include <fstream>

// Funkcja odczytująca dane z pliku i dodająca książki do systemu RFID
void dodajKsiazkiZPliku(const string& nazwaPliku, const string& gatunek,Biblioteka& biblioteka, Szafa& szafa,Polka& polka, int& tagID){
    ifstream plik;
    plik.open(nazwaPliku);
    if (!plik.is_open()) {
        cout << "Nie udalo sie otworzyc pliku"<< endl;
        exit(0);}
    string tytul, autor;
    int numerSzafy = szafa.numer;
    int numerPolki = polka.numer;
    int iloscKsiazekNaPolce = 0;
    while (getline(plik,tytul,';')) {
        getline(plik,autor);
        if (numerPolki==5 && iloscKsiazekNaPolce==10){
            numerSzafy++;
            Szafa szafa(numerSzafy, gatunek);
            biblioteka.dodajSzafe(szafa);
            numerPolki = 1;
            iloscKsiazekNaPolce = 0;
            Polka polka(numerPolki, gatunek);
            biblioteka.getSzafa(numerSzafy).dodajPolke(polka);
        }
        if (iloscKsiazekNaPolce==10){
            numerPolki++;
            Polka polka(numerPolki, gatunek);
            biblioteka.getSzafa(numerSzafy).dodajPolke(polka);
            iloscKsiazekNaPolce = 0;
        }
        Ksiazka ksiazka(tytul, autor, gatunek, tagID++);
        biblioteka.getSzafa(numerSzafy).getPolka(numerPolki).dodajKsiazke(ksiazka);
        iloscKsiazekNaPolce++;
        //cout << ksiazka.tytul << " " << biblioteka.getSzafa(numerSzafy).getPolka(numerPolki).numer << endl;
    }
    plik.close();
    cout << "Dodano ksiazki z pliku: " << nazwaPliku << ", o gatunku: " << gatunek << endl;
    cout << "Liczba dodanych ksiazek: " << (numerPolki-1)*10 + (numerSzafy-1)*50 + iloscKsiazekNaPolce << endl;
    cout << "Liczba stworzonych polek: " << numerPolki + (numerSzafy-1)*5 << endl;
    cout << "Liczba stworzonych szaf: " << numerSzafy << endl;
}
void ileZDanegoGatunku(const string& gatunek){
    if (gatunek=="fantastyka"){
        cout << 1+Polka::ilefantastyka/5 << " szafa/szaf" << endl;
        cout << Polka::ilefantastyka%5 << " polka/polek" << endl;
        cout << Ksiazka::ilefantastyka << " ksiazka/ksiazek (na polce 10 ksiazek, a w szafie 5 polek)" << endl;
    }
}
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/vlibrary/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);
    //rejestrowanie klasy c w QML z uzyciem modulu
    qmlRegisterType<Ksiazka>("zawartosc.biblioteki", 1,0,"Ksiazka");
    qmlRegisterType<Polka>("zawartosc.biblioteki", 1,0,"Polka");
    qmlRegisterType<Szafa>("zawartosc.biblioteki", 1,0,"Szafa");
    qmlRegisterType<Biblioteka>("zawartosc.biblioteki", 1,0,"Biblioteka");
    Biblioteka biblioteka;
    string gatunek;
    //cout << "Podaj gatunek ksiazek jakie chcesz dodac: ";
    //cin >> gatunek;
    gatunek = "fantastyka";
    Szafa szafa(1, gatunek);
    Polka polka(1, gatunek);
    biblioteka.dodajSzafe(szafa);
    biblioteka.getSzafa(1).dodajPolke(polka);
    int tagID = 1001;
    dodajKsiazkiZPliku("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\ksiazki.csv",gatunek,biblioteka, szafa, polka, tagID);
    string tytul = "Kosiarze";
    //cout << "Podaj tytul ksiazki: ";
    //cin.ignore();
    //getline(cin,tytul);
    biblioteka.znajdzKsiazkeTytul(tytul,biblioteka);

    int tag = 1004;
    cout << "Podaj tag RFID ksiazki: ";
    //cin >> tag;
    biblioteka.znajdzKsiazkeTag(tag,biblioteka);

    //cout << "Zawartosc 1 polki 3 szafy: ";
    biblioteka.getSzafa(2).getPolka(1).wyswietlZawartosc();
    return app.exec();
}

