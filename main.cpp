#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
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

    //biblioteka.dodajKsiazkiZPliku("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\ksiazki.csv",fantasy);
    //biblioteka.dodajKsiazkiZPliku("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\ksiazki.csv",horror);

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
    //biblioteka.zapisWszystkich();
    return app.exec();
}
