#ifndef SZAFA_H
#define SZAFA_H
#include <iostream>
#include <vector>
#include <fstream>
#include "polka.h"
#include <QObject>
using namespace std;

class Szafa
{

public:
    int numer;
    Gatunek gatunek;
    vector<Polka> polki;
    // Konstruktor klasy Szafa
    Szafa(int numer, Gatunek gatunek)
        :numer(numer),gatunek(gatunek)
    {}
    //    Szafa(const Szafa &other)
    //        :numer(other.numer),gatunek(other.gatunek){
    //        this->numer = other.numer;
    //        this->gatunek = other.gatunek;
    //    }

    // Metoda do dodawania półek do szafy
    void dodajPolke(const Polka& polka) {
        polki.push_back(polka);
        cout << "~dodaje polke do szafy~" <<endl;
    }
    // Metoda do usuwania półek z szafy na podstawie numeru
    void usunPolke(int numer) {
        for (auto it = polki.begin(); it != polki.end(); ++it) {
            if (it->numer == numer) {
            polki.erase(it);
            break;
            }
        }
    }
    Polka& getPolka(int numerPolki)  {
        if (numerPolki <= polki.size()) {
            return polki[numerPolki - 1];
        }
        else {
            throw std::out_of_range("Niepoprawny numer polki");
        }
    }
//    void wyswietlZawartosc(const Szafa& szafa) {
//        cout << "Zawartosc szafy: " << numer << ":" << endl;
//        for (const auto& polka : szafa.polki) {
//            cout << "Polka " << polka.numer << ": ";
//            for (const auto& ksiazka : polka.ksiazki){
//            cout << "Tytul: " << ksiazka.tytul << ", Autor: " << ksiazka.autor << endl;
//            }
//        }}
};

#endif // SZAFA_H
