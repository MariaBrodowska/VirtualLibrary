#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ksiazka.h"
#include "polka.h"
#include "szafa.h"
#include "biblioteka.h"
#include <iostream>
#include <vector>
#include <fstream>
#include <QObject>
#include <QString>
#include <string>
#include <iostream>

using namespace std;
// Funkcja odczytująca dane z pliku i dodająca książki do systemu RFID

//void dodajKsiazkiZPliku(const string& nazwaPliku, const string& gatunek,Biblioteka& biblioteka, Szafa& szafa,Polka& polka, int& tagID){
//    ifstream plik;
//    plik.open(nazwaPliku);
//    if (!plik.is_open()) {
//        cout << "Nie udalo sie otworzyc pliku"<< endl;
//        exit(0);}
//    string tytul, autor;
//    int numerSzafy = szafa.numer;
//    int numerPolki = polka.numer;
//    int iloscKsiazekNaPolce = 0;
//    while (getline(plik,tytul,';')) {
//        getline(plik,autor);
//        if (numerPolki==5 && iloscKsiazekNaPolce==10){
//            numerSzafy++;
//            Szafa szafa(numerSzafy, gatunek);
//            biblioteka.dodajSzafe(szafa);
//            numerPolki = 1;
//            iloscKsiazekNaPolce = 0;
//            Polka polka(numerPolki, gatunek);
//            biblioteka.getSzafa(numerSzafy).dodajPolke(polka);
//        }
//        if (iloscKsiazekNaPolce==10){
//            numerPolki++;
//            Polka polka(numerPolki, gatunek);
//            biblioteka.getSzafa(numerSzafy).dodajPolke(polka);
//            iloscKsiazekNaPolce = 0;
//        }
//        Ksiazka ksiazka(tytul, autor, gatunek, tagID++);
//        biblioteka.getSzafa(numerSzafy).getPolka(numerPolki).dodajKsiazke(ksiazka);
//        iloscKsiazekNaPolce++;
//        // cout << ksiazka.tytul << endl;
//    }
//    plik.close();
//    cout << "Dodano ksiazki z pliku: " << nazwaPliku << ", o gatunku: " << gatunek << endl;
//    cout << "Liczba dodanych ksiazek: " << (numerPolki-1)*10 + (numerSzafy-1)*50 + iloscKsiazekNaPolce << endl;
//    cout << "Liczba stworzonych polek: " << numerPolki + (numerSzafy-1)*5 << endl;
//    cout << "Liczba stworzonych szaf: " << numerSzafy << endl;
//}

//void ileZDanegoGatunku(const string& gatunek){
//    if (gatunek=="fantastyka"){
//        cout << 1+Polka::ilefantastyka/5 << " szafa/szaf" << endl;
//        cout << Polka::ilefantastyka%5 << " polka/polek" << endl;
//        cout << Ksiazka::ilefantastyka << " ksiazka/ksiazek (na polce 10 ksiazek, a w szafie 5 polek)" << endl;
//    }
//}

int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    Biblioteka biblioteka;
    Gatunek gatunek = fantasy;
//    cout << "Podaj gatunek ksiazek jakie chcesz dodac: ";
//    cin >> gatunek;

    Szafa szafa(1, gatunek);
    Polka polka(1);
    biblioteka.dodajSzafe(szafa);
    biblioteka.getSzafa(1).dodajPolke(polka);
    biblioteka.dodajKsiazkiZPliku("C:\\Users\\VivoBook\\Desktop\\ekatalog\\ksiazki.csv",gatunek,biblioteka, szafa, polka);
    string tytul = "Kosiarze";
    //    cout << "Podaj tytul ksiazki: ";
    //    cin.ignore();
    //    getline(cin,tytul);
//        biblioteka.znajdzKsiazkeTytul(tytul);
//    int tag = 1004;
//    cout << "Podaj tag RFID ksiazki: ";
//    cin >> tag;
//    biblioteka.znajdzKsiazkeTag(tag);
//    cout << "Zawartosc 1 polki 3 szafy: ";
//    biblioteka.getSzafa(3).getPolka(1).wyswietlZawartosc();
//    cout << "Zawartosc 2 polki 2 szafy: ";
//    biblioteka.getSzafa(2).getPolka(2).wyswietlZawartosc();
//    cout << "Zawartosc 3 polki 1 szafy: ";
//    biblioteka.getSzafa(1).getPolka(3).wyswietlZawartosc();

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("Main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if(!obj && url == objUrl)
            QCoreApplication::exit(-1);},
        Qt::QueuedConnection);
    engine.load(url);

    QQmlContext * rootContext = engine.rootContext();
    rootContext->setContextProperty("biblioteka", &biblioteka);
    //rootContext->setContextProperty("szafa", &szafa);
    //rootContext->setContextProperty("polka", &polka);
    ////    const QUrl url(QStringLiteral("qrc:/Main.qml"));
////    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
////        &app, [url](QObject *obj, const QUrl &objUrl) {
////            if (!obj && url == objUrl)
////                QCoreApplication::exit(-1);
////        }, Qt::QueuedConnection);
////    engine.load(url);
//    //rejestrowanie klasy c w QML z uzyciem modulu
////    qmlRegisterType<Ksiazka>("zawartosc.biblioteki", 1,0,"Ksiazka");
////    qmlRegisterType<Polka>("zawartosc.biblioteki", 1,0,"Polka");
////    qmlRegisterType<Szafa>("zawartosc.biblioteki", 1,0,"Szafa");
////    qmlRegisterType<Biblioteka>("zawartosc.biblioteki", 1,0,"Biblioteka");
//    QQmlApplicationEngine engine;
//    Biblioteka biblioteka;
//    string gatunek;
//    cout << "Podaj gatunek ksiazek jakie chcesz dodac: ";
//    cin >> gatunek;
//    Szafa szafa(1, gatunek);
//    Polka polka(1, gatunek);
//    biblioteka.dodajSzafe(szafa);
//    biblioteka.getSzafa(1).dodajPolke(polka);
//    int tagID = 1001;
//    dodajKsiazkiZPliku("C:\\Users\\VivoBook\\Desktop\\ekatalog\\ksiazki.csv",gatunek,biblioteka, szafa, polka, tagID);
//    //    string tytul;
//    //    cout << "Podaj tytul ksiazki: ";
//    //    cin.ignore();
//    //    getline(cin,tytul);
//    //    biblioteka.znajdzKsiazkeTytul(tytul);
//    int tag = 1004;
//    cout << "Podaj tag RFID ksiazki: ";
//    //cin >> tag;
//    biblioteka.znajdzKsiazkeTag(tag);
//    cout << "Zawartosc 1 polki 3 szafy: ";
//    biblioteka.getSzafa(3).getPolka(1).wyswietlZawartosc();
//    cout << "Zawartosc 2 polki 2 szafy: ";
//    biblioteka.getSzafa(2).getPolka(2).wyswietlZawartosc();
//    cout << "Zawartosc 3 polki 1 szafy: ";
//    biblioteka.getSzafa(1).getPolka(3).wyswietlZawartosc();

//    engine.rootContext()->setContextProperty("biblioteka", &biblioteka);

//    const QUrl url(QStringLiteral("qrc:/Main.qml"));
//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
//        &app, [url](QObject *obj, const QUrl &objUrl) {
//            if (!obj && url == objUrl)
//                QCoreApplication::exit(-1);
//        }, Qt::QueuedConnection);
//    engine.load(url);
    return app.exec();
}

