#ifndef SZAFA_H
#define SZAFA_H
#include <iostream>
#include <vector>
#include <fstream>
#include "polka.h"
#include <QObject>
using namespace std;

class Szafa: public QObject
{
    Q_OBJECT
public:
    int numer;
    string gatunek;
    vector<Polka> polki;
    // Konstruktor klasy Szafa
    Szafa(int numer, string gatunek)
    {
        this->numer = numer;
        this->gatunek = gatunek;
    }
    Szafa(const Szafa &other)
        :numer(other.numer),gatunek(other.gatunek){
        this->numer = other.numer;
        this->gatunek = other.gatunek;
    }
    // Metoda do dodawania półek do szafy
    void dodajPolke(const Polka& polka) {
        polki.push_back(polka);
        cout << "~dodaje polke do szafy~" <<endl;
    }
    // Metoda do usuwania półek z szafy na podstawie numeru
//    void usunPolke(int numer) {
//        for (auto it = polki.begin(); it != polki.end(); ++it) {
//            if (it->numer == numer) {
//                polki.erase(it);
//                break;
//            }
//        }
//    }
    Polka& getPolka(int numerPolki)  {
        if (numerPolki <= polki.size()) {
            return polki[numerPolki - 1];
        }
        else {
            throw std::out_of_range("Niepoprawny numer polki");
        }
    }
};

#endif // SZAFA_H
