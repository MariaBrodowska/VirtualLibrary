#ifndef KSIAZKA_H
#define KSIAZKA_H
#include <iostream>
#include <vector>
#include <fstream>
#include <QObject>
using namespace std;
enum Gatunek {fantasy=0, kryminal=1, historyczna=2, mlodziezowa=3, przygodowa=4, horror=5, biografia=6, romans=7};

class Ksiazka
{
private:
    int numer;
    string tytul, autor;
    Gatunek gatunek;
    int tagID;
    Ksiazka(const string& tytul, const string& autor, Gatunek gatunek, int tagID, int numer)
        : tytul(tytul), autor(autor), gatunek(gatunek), tagID(tagID),numer(numer){
    }
    friend class Polka;
    friend class Biblioteka;
};
#endif // KSIAZKA_H
