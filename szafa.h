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

private:
    int numer, numerWBibliotece;
    Gatunek gatunek;
    vector<Polka> polki;
    Szafa(int numer,int numerWBibliotece, Gatunek gatunek)
        :numer(numer),numerWBibliotece(numerWBibliotece),gatunek(gatunek)
    {}
    void dodajPolke(const Polka& polka, int pozycja) {
        polki.insert(polki.begin()+pozycja-1, polka);
        //polki.resize(pozycja,polka);
        //polki.push_back(polka);
        cout << "~dodaje polke do szafy~" <<endl;
    }
    void usunPolke(int numer) {
        for (auto it = polki.begin(); it != polki.end(); it++) {
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
            throw out_of_range("Niepoprawny numer polki");
        }
    }
    friend class Biblioteka;
};

#endif // SZAFA_H
