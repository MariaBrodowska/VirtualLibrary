#ifndef BIBLIOTEKA_H
#define BIBLIOTEKA_H
#include <vector>
#include "szafa.h"
#include <QObject>
#include <QString>
#include <string>
#include <iostream>
#include <bits/stdc++.h>

using namespace std;
class Biblioteka: public QObject
{
    Q_OBJECT
    //Q_INVOKABLE string getwynik() const { return wynik;}
   // Q_PROPERTY(int wynik MEMBER wynik NOTIFY wynikChanged)
public:
    explicit Biblioteka(QObject *parent = nullptr);
    vector<Szafa> szafy;
    string wynik;
    vector<Polka>& getPolki(Szafa& szafa);
    vector<Ksiazka>& getKsiazki(Polka& polka);
    Q_INVOKABLE QString znajdzKsiazkeTag(int tagID);
    Q_INVOKABLE QString znajdzKsiazkeTytul(QString tytul);
    Q_INVOKABLE QString dodajKsiazkiZPlikuu(QString nazwaPliku, QString gatunek);
    Q_INVOKABLE QString usunKsiazkeTag(int tagID);
    Q_INVOKABLE QString usunKsiazkeTytul(QString tytul,QString adres);
    Q_INVOKABLE QString usunKsiazkePlik(QString sciezka);
signals:
   // void wynikChanged();
public slots:
    Szafa& getSzafa(int numerSzafy);
    //Metoda do dodawania szafy do biblioteki
    void dodajSzafe(const Szafa& szafa);
    string zamienNaMaleLitery(const string &wyraz);
    Gatunek convertToGatunek(const QString &qstr);
    void dodajKsiazkiZPliku(const string& nazwaPliku, Gatunek gatunek,Biblioteka& biblioteka, Szafa& szafa,Polka& polka);
private:
    int tagID= 1001;
    static int ileszaf[7];
    static int ilepolek[7];
    static int ileksiazek[7];
    static int ileusunieto[7];
};
#endif // BIBLIOTEKA_H
