#ifndef BIBLIOTEKA_H
#define BIBLIOTEKA_H
#include <iostream>
#include <vector>
#include <fstream>
#include "szafa.h"
#include "polka.h"
#include "ksiazka.h"
#include <QObject>
using namespace std;

class Biblioteka :public QObject
{
    Q_OBJECT
public:
    vector<Szafa> szafy;
    Biblioteka(){}
    Szafa& getSzafa(int numerSzafy){
        if (numerSzafy <= szafy.size()) {
            return szafy[numerSzafy - 1];
        }
        else {
            throw std::out_of_range("Niepoprawny numer szafy");
        }
    }
    //Metoda do dodawania szafy do biblioteki
    void dodajSzafe(const Szafa& szafa){
        szafy.push_back(szafa);
        cout << "~dodaje szafe do biblioteki~" <<endl;
    }
    void znajdzKsiazkeTytul(const string& tytul, const Biblioteka& biblioteka) {
        cout << "Wyszukiwanie ksiazki o tytule: "<< tytul<< endl;
        bool znaleziono = false;
        for (const auto& szafa : szafy) {
            for (const auto& polka : szafa.polki) {
                for (const auto& ksiazka : polka.ksiazki) {
                    if (ksiazka.tytul == tytul) {
                        cout << "Znaleziono ksiazke o tytule: " << ksiazka.tytul << endl;
                        cout << "Autor: " << ksiazka.autor << endl;
                        cout << "Tag RFID: " << ksiazka.tagID << endl;
                        cout << "Szafa: " << szafa.numer << ", Polka: " << polka.numer << endl;
                        znaleziono=true;
                    }
                }}}
        if (!znaleziono) {
            cout << "Nie znaleziono książki o podanym tytule." << endl;
        }}
    void znajdzKsiazkeTag(int tagID,const Biblioteka& biblioteka){
        cout << "Wyszukiwanie ksiazki z tagiem: "<< tagID << endl;
        bool znaleziono = false;
        for (const auto& szafa : szafy){
            cout << "petla 1" << endl;
            for (const auto& polka : szafa.polki) {
                cout << "petla 2" << endl;
                for (const auto& ksiazka : polka.ksiazki) {
                    cout << "petla 3" << endl;
                    if (ksiazka.tagID == tagID) {
                        std::cout << "Znaleziono ksiazke z tagiem: " << ksiazka.tagID << endl;
                        cout << "Tytul: " << ksiazka.tytul << " Autor: " << ksiazka.autor << endl;
                        std::cout << "Szafa: " << szafa.numer << ", Polka: " << polka.numer << endl;
                        znaleziono= true;
                        goto exit;
                    }
                }}}
        exit:
        if (!znaleziono) {
            cout << "Nie znaleziono ksiazki o tagu: " << tagID << std::endl;
        }}
};

#endif // BIBLIOTEKA_H
