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
public:
    int numer;
    string tytul, autor;
    Gatunek gatunek;
//    static int ilefantasy,ilekryminal,ilehistoryczna,ilemlodziezowa,ileprzygodowa,ilehorror,ilebiografia,ileromans;
    int tagID;
    Ksiazka(const string& tytul, const string& autor, Gatunek gatunek, int tagID, int numer)
        : tytul(tytul), autor(autor), gatunek(gatunek), tagID(tagID),numer(numer){
//        switch (gatunek){
//        case fantasy:
//            ilefantasy++;
//            break;
//        case kryminal:
//            ilekryminal++;
//            break;
//        case historyczna:
//            ilehistoryczna++;
//            break;
//        case mlodziezowa:
//            ilemlodziezowa++;
//            break;
//        case przygodowa:
//            ileprzygodowa++;
//            break;
//        case horror:
//            ilehorror++;
//            break;
//        case biografia:
//            ilebiografia++;
//            break;
//        case romans:
//            ileromans++;
//            break;
//            }
    }
    //    Ksiazka(const Ksiazka& other)
    //        : tytul(other.tytul), autor(other.autor), gatunek(other.gatunek), tagID(other.tagID) {
    //        if (gatunek == "fantastyka") ilefantastyka++;
    //        if (gatunek == "horror") ilehorror++;
    //    }

};
#endif // KSIAZKA_H
