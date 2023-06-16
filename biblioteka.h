#ifndef BIBLIOTEKA_H
#define BIBLIOTEKA_H
#include <vector>
#include "szafa.h"
#include <QObject>
#include <QString>
#include <string>
#include <iostream>
#include <bits/stdc++.h>
#include <algorithm>
using namespace std;
class Biblioteka: public QObject
{
    Q_OBJECT
public:
    explicit Biblioteka(QObject *parent = nullptr);
    vector<Szafa> szafy;
    Q_INVOKABLE QStringList znajdzKsiazkeTag(int tagID);
    Q_INVOKABLE QStringList znajdzKsiazkeTytul(QString tytul);
    Q_INVOKABLE QStringList znajdzKsiazkeWidok3D(int tagID);
    Q_INVOKABLE QString dodajKsiazkiZPlikuu(QString nazwaPliku, QString gatunek);
    Q_INVOKABLE QString dodajKsiazke(QString tytul, QString autor, QString gatunek);
    Q_INVOKABLE QString usunKsiazkeTag(int tagID);
    Q_INVOKABLE QString usunKsiazkeTytul(QString tytul,QString adres);
    Q_INVOKABLE QString usunKsiazkePlik(QString sciezka);
    Q_INVOKABLE QStringList wyswietlZawartosc(int nrS, int nrP, int nrK, int gat);
    Q_INVOKABLE void zapisWszystkich();
    void odczytWszystkich();
    void zapisDoPliku(Gatunek gatunek);
private:
    Szafa& getSzafa(int numerSzafy);
    void dodajSzafe(const Szafa& szafa, int pozycja);
    string zamienNaMaleLitery(const string &wyraz);
    Gatunek convertToGatunek(const QString &qstr);
    string qStringToString(QString z);
    string GatunekToString(Gatunek g);
    QString GatunekToQString(Gatunek g);
    Gatunek intToGatunek(int g);
    void dodajKsiazkiZPliku(string nazwaPliku, Gatunek gatunek);
    void dodajZapis(string nazwaPliku, Gatunek gatunek);
    int tagID= 1001;
    static int nrSzafyWBibliotece;
    static int ileszaf[8];
    static int ilepolek[8];
    static int ileksiazek[8];
    static int ileusunieto[8];
};
#endif // BIBLIOTEKA_H
