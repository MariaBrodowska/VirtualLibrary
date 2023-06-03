#ifndef POLKA_H
#define POLKA_H
#include <iostream>
#include <vector>
#include <fstream>
#include "ksiazka.h"
#include <QObject>
using namespace std;

class Polka
{

public:
    int numer;
    //string gatunek;
    static int ilefantastyka,ilehorror;
    vector<Ksiazka> ksiazki;
    Polka(int numer)
        :numer(numer) {
        //        if (gatunek=="fantastyka") ilefantastyka++;
        //        if (gatunek=="horror") ilehorror++;
    }
    //    Polka(const Polka& other)
    //        : numer(other.numer), gatunek(other.gatunek), ksiazki(other.ksiazki)
    //    {
    //        if (gatunek == "fantastyka") ilefantastyka++;
    //        if (gatunek == "horror") ilehorror++;
    //    }
    // Dodanie książki na półkę
    void dodajKsiazke(const Ksiazka& ksiazka, int pozycja) {
        ksiazki.insert(ksiazki.begin()+pozycja-1, ksiazka);
        //ksiazki.resize(pozycja, ksiazka);
        //ksiazki.push_back(ksiazka);
        cout << "~dodaje ksiazke do polki~" << endl;
    }

    // Metoda do usuwania książek z półki na podstawie tytułu
    void usunKsiazke(const string& tytul) {
        for (auto it = ksiazki.begin(); it != ksiazki.end(); ++it) {
            if (it->tytul == tytul) {
                ksiazki.erase(it);
                break;
            }
        }
    }
    vector<Ksiazka>& getKsiazki()
    {
        return ksiazki;
    }
    // Metoda do wyświetlania zawartości półki
    void wyswietlZawartosc() {
        cout << "Zawartosc polki " << numer << ":" << endl;
        for (const auto& ksiazka : ksiazki) {
            cout << "- Tytul: " << ksiazka.tytul << ", Autor: " << ksiazka.autor << endl;
        }
    }
};

#endif // POLKA_H
