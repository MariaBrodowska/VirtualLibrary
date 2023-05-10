#ifndef POLKA_H
#define POLKA_H
#include <iostream>
#include <vector>
#include <fstream>
#include "ksiazka.h"
#include <QObject>
using namespace std;

class Polka: public QObject
 {
    Q_OBJECT
public:
    int numer;
    string gatunek;
    static int ilefantastyka,ilehorror;
    vector<Ksiazka> ksiazki;
    Polka(int numer, const string &gatunek)
        :numer(numer),gatunek(gatunek) {
        if (gatunek=="fantastyka") ilefantastyka++;
        if (gatunek=="horror") ilehorror++;
    }
    Polka(const Polka& other)
        : numer(other.numer), gatunek(other.gatunek), ksiazki(other.ksiazki)
    {
        if (gatunek == "fantastyka") ilefantastyka++;
        if (gatunek == "horror") ilehorror++;
    }
    // Dodanie książki na półkę
    void dodajKsiazke(const Ksiazka& ksiazka) {
        ksiazki.push_back(ksiazka);
    }
    // Metoda do usuwania książek z półki na podstawie tytułu
//    void usunKsiazke(const string& tytul) {
//        for (auto it = ksiazki.begin(); it != ksiazki.end(); ++it) {
//            if (it->tytul == tytul) {
//                ksiazki.erase(it);
//                break;
//            }
//        }
//    }
    // Metoda do wyświetlania zawartości półki
    void wyswietlZawartosc() {
        cout << "Zawartosc polki " << numer << ":" << endl;
        for (const auto& ksiazka : ksiazki) {
            cout << "- Tytul: " << ksiazka.tytul << ", Autor: " << ksiazka.autor << endl;
        }
    }
};

#endif // POLKA_H
