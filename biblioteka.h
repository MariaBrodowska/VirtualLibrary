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
    Q_INVOKABLE QStringList wyswietlZawartosc(int nrS, int nrP, int nrK, int gat); //z
    int tagID= 1001;
    static int ileszaf[8];
    static int ilepolek[8];
    static int ileksiazek[8];
    static int ileusunieto[8];
signals:
   // void wynikChanged();
public slots:
    Szafa& getSzafa(int numerSzafy);
    //Metoda do dodawania szafy do biblioteki
    void dodajSzafe(const Szafa& szafa, int pozycja);
    string zamienNaMaleLitery(const string &wyraz);
    Gatunek convertToGatunek(const QString &qstr);
    string qStringToString(QString z);
    string GatunekToString(Gatunek g);
    QString GatunekToQString(Gatunek g);
    void dodajKsiazkiZPliku(string nazwaPliku, Gatunek gatunek);
    void dodajZapis(string nazwaPliku, Gatunek gatunek);
    void znajdzKsiazkeT(int tagID);
    Gatunek intToGatunek(int g);
    string wyswietlZawartoscDoZapisu(Gatunek gatunek);
    void zapisWszystkich();
    void zapisDoPliku(Gatunek gatunek);
    void odczytWszystkich();
//private:
//    int tagID= 1001;
//    static int ileszaf[8];
//    static int ilepolek[8];
//    static int ileksiazek[8];
//    static int ileusunieto[8];
};
#endif // BIBLIOTEKA_H
