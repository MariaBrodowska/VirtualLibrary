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
private:
    int numer;
    static int ilefantastyka,ilehorror;
    vector<Ksiazka> ksiazki;
    Polka(int numer)
        :numer(numer) {}
    void dodajKsiazke(const Ksiazka& ksiazka, int pozycja) {
        ksiazki.insert(ksiazki.begin()+pozycja-1, ksiazka);
        //ksiazki.resize(pozycja, ksiazka);
        //ksiazki.push_back(ksiazka);
        cout << "~dodaje ksiazke do polki~" << endl;
    }
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
    void wyswietlZawartosc() {
        cout << "Zawartosc polki " << numer << ":" << endl;
        for (const auto& ksiazka : ksiazki) {
            cout << "- Tytul: " << ksiazka.tytul << ", Autor: " << ksiazka.autor << endl;
        }
    }
    friend class Szafa;
    friend class Biblioteka;
};

#endif // POLKA_H
