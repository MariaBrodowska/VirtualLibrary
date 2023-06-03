#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ksiazka.h"
#include "polka.h"
#include "szafa.h"
#include "biblioteka.h"
#include <iostream>
#include <vector>
#include <fstream>
#include <QObject>
#include <QString>
#include <string>
#include <iostream>
using namespace std;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    Biblioteka biblioteka;

    biblioteka.odczytWszystkich();

    //biblioteka.dodajKsiazkiZPliku("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\ksiazki.csv",kryminal);
    //biblioteka.dodajKsiazkiZPliku("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\ksiazki.csv",fantasy);

    string tytul = "Kosiarze";
    int tagID = 1280;
    biblioteka.znajdzKsiazkeT(tagID);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("Main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if(!obj && url == objUrl)
            QCoreApplication::exit(-1);},
        Qt::QueuedConnection);
    engine.load(url);

    QQmlContext * rootContext = engine.rootContext();
    rootContext->setContextProperty("biblioteka", &biblioteka);

    //zapisWszystkich(biblioteka);
    return app.exec();
}

