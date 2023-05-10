#ifndef KSIAZKA_H
#define KSIAZKA_H
#include <iostream>
#include <vector>
#include <fstream>
#include <QObject>
using namespace std;

class Ksiazka: public QObject
{
    Q_OBJECT
public:
    string tytul;
    string autor;
    string gatunek;
    static int ilefantastyka,ilehorror;
    int tagID;
    Ksiazka(const string& tytul, const string& autor, const string & gatunek, int tagID)
        : tytul(tytul), autor(autor), gatunek(gatunek), tagID(tagID){
        if (gatunek=="fantastyka") ilefantastyka++;
        if (gatunek=="horror") ilehorror++;
    }
    Ksiazka(const Ksiazka& other)
        : tytul(other.tytul), autor(other.autor), gatunek(other.gatunek), tagID(other.tagID) {
        if (gatunek == "fantastyka") ilefantastyka++;
        if (gatunek == "horror") ilehorror++;
    }
};
#endif // KSIAZKA_H
