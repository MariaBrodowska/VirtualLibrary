import QtQuick
import QtQuick.Window
import QtQuick.Controls 6.3
import QtQuick.Layouts 6.3
import QtQuick3D.Particles3D 6.4
import QtQuick.Timeline 1.0
import QtQuick.Controls.Windows 6.0
import zawartosc.biblioteki 1.0 //importowanie modulu ktory zawiera klasy c++

Window {
    id: window
    width: 1920
    height: 1080
    visible: true
    color: "#009eadbc"
    flags: Qt.Window
    contentOrientation: Qt.PortraitOrientation
    visibility: Window.Windowed
    title: "Hello World"


//    gatunek = "fantastyka";
//    Szafa szafa(1, gatunek);
//    Polka polka(1, gatunek);
//    biblioteka.dodajSzafe(szafa);
//    biblioteka.getSzafa(1).dodajPolke(polka);
//    int tagID = 1001;
//    dodajKsiazkiZPliku("C:\\Users\\VivoBook\\Desktop\\ekatalog\\ksiazki.csv",gatunek,biblioteka, szafa, polka, tagID);
////    string tytul;
//    cout << "Podaj tytul ksiazki: ";
//    cin.ignore();
//    getline(cin,tytul);
    //biblioteka.znajdzKsiazkeTytul(tytul);

//    int tag;
//    cout << "Podaj tag RFID ksiazki: ";
//    cin >> tag;
//    biblioteka.znajdzKsiazkeTag(tag);

//    Biblioteka{
//        id: biblioteka
//    }
//    Szafa{
//        id: szafa;

//    }

    StateGroup {
        id: stronaGlowna
        state: "mainPage"
        states: [
            State {
                name: "mainPage"

                PropertyChanges {
                    target: name
                    y: 62
                    width: 352
                    height: 48
                    text: qsTr("Virtual Library")
                    font.pixelSize: 35
                    anchors.horizontalCenterOffset: -5
                    Layout.topMargin: 150
                    Layout.minimumHeight: 0
                    Layout.preferredHeight: -1
                    Layout.columnSpan: 1
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                }

                PropertyChanges {
                    target: rectangle1
                    x: 0
                    y: 0
                    width: 640
                    height: 480
                    color: "#aaaaff"
                }

                PropertyChanges {
                    target: window
                    width: 640
                    height: 480
                    maximumHeight: 7080
                    maximumWidth: 42871
                    modality: Qt.ApplicationModal
                    flags: Qt.Window
                }

                PropertyChanges {
                    target: user
                    x: 94
                    y: 195
                    width: 167
                    height: 60
                    text: qsTr("user")
                    font.family: "Bruno Ace"
                    font.pointSize: 25
                }

                PropertyChanges {
                    target: admin
                    x: 356
                    y: 195
                    width: 181
                    height: 60
                    text: qsTr("admin")
                    font.family: "Bruno Ace"
                    font.pointSize: 25
                }

                PropertyChanges {
                    target: haslo
                    visible: false
                }

                PropertyChanges {
                    target: cofinijDoGlownej
                    visible: false
                }

                PropertyChanges {
                    target: login
                    visible: false
                }

                PropertyChanges {
                    target: zaloguj
                    visible: false
                }

                PropertyChanges {
                    target: bladLogowania
                    visible: false
                }

                PropertyChanges {
                    target: wyszukaj
                    visible: false
                }

                PropertyChanges {
                    target: wyszukajTytule
                    visible: false
                }

                PropertyChanges {
                    target: wyszukajTagu
                    visible: false
                }

                PropertyChanges {
                    target: tagRFID
                    visible: false
                }

                PropertyChanges {
                    target: wynik
                    visible: false
                }

                PropertyChanges {
                    target: przyciskSzukaj
                    visible: false
                }
            },
            State {
                name: "loginPage"

                PropertyChanges {
                    target: name
                    y: 62
                    width: 352
                    height: 48
                    text: qsTr("Virtual Library")
                    font.pixelSize: 35
                    Layout.minimumHeight: 0
                    Layout.columnSpan: 1
                    Layout.topMargin: 150
                    Layout.fillWidth: true
                    anchors.horizontalCenterOffset: "-5"
                    Layout.preferredHeight: "-1"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                }

                PropertyChanges {
                    target: rectangle1
                    x: 0
                    y: 0
                    width: 640
                    height: 480
                    color: "#aaaaff"
                }

                PropertyChanges {
                    target: window
                    width: 640
                    height: 480
                    modality: Qt.ApplicationModal
                    maximumHeight: 7080
                    flags: Qt.Window
                    maximumWidth: 42871
                }

                PropertyChanges {
                    target: haslo
                    x: 163
                    y: 252
                    width: 301
                    height: 36
                    visible: true
                    font.pixelSize: 25
                    passwordCharacter: qsTr("●")
                    placeholderText: qsTr("hasło")
                    font.pointSize: 25
                    font.italic: false
                    overwriteMode: true
                    echoMode: TextInput.Password
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: user
                    visible: false
                }

                PropertyChanges {
                    target: admin
                    visible: false
                }

                PropertyChanges {
                    target: textEdit
                    x: 140
                    y: 335
                    width: 296
                    height: 70
                }

                PropertyChanges {
                    target: haslo
                    x: 163
                    y: 268
                    width: 298
                    height: 29
                }

                PropertyChanges {
                    target: login
                    x: 163
                    y: 188
                    width: 301
                    height: 33
                    baselineOffset: 25
                    placeholderText: qsTr("login")
                    font.italic: false
                    font.pointSize: 20
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: zaloguj
                    x: 206
                    y: 363
                    width: 198
                    height: 40
                    visible: true
                    text: qsTr("zaloguj")
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                    highlighted: true
                }

                PropertyChanges {
                    target: cofinijDoGlownej
                    x: 13
                    y: 12
                    width: 76
                    height: 28
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                    font.pointSize: 10
                    flat: false
                }

                PropertyChanges {
                    target: bladLogowania
                    x: 157
                    y: 313
                    width: 275
                    height: 27
                    visible: false
                    color: "#ff0000"
                    text: qsTr("Nieprawidłowy login lub hasło")
                    font.pixelSize: 17
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: bladLogowania
                }

                PropertyChanges {
                    target: timer
                    running: false
                    repeat: false
                }

                PropertyChanges {
                    target: wyszukaj
                    visible: false
                }

                PropertyChanges {
                    target: wyszukajTagu
                    visible: false
                }

                PropertyChanges {
                    target: wyszukajTytule
                    visible: false
                }

                PropertyChanges {
                    target: wynik
                    visible: false
                }

                PropertyChanges {
                    target: tagRFID
                    visible: false
                }

                PropertyChanges {
                    target: przyciskSzukaj
                    visible: false
                }
            },
            State {
                name: "userPage"
                PropertyChanges {
                    target: name
                    y: 62
                    width: 352
                    height: 48
                    text: qsTr("Virtual Library")
                    font.pixelSize: 35
                    anchors.horizontalCenterOffset: "-5"
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    Layout.topMargin: 150
                    Layout.preferredHeight: "-1"
                    Layout.minimumHeight: 0
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                }

                PropertyChanges {
                    target: rectangle1
                    x: 0
                    y: 0
                    width: 640
                    height: 480
                    color: "#aaaaff"
                }

                PropertyChanges {
                    target: window
                    width: 640
                    height: 480
                    maximumHeight: 7080
                    modality: Qt.ApplicationModal
                    maximumWidth: 42871
                    flags: Qt.Window
                }

                PropertyChanges {
                    target: haslo
                    x: 166
                    y: 267
                    width: 307
                    height: 36
                    visible: false
                    font.pixelSize: 25
                    font.italic: false
                    overwriteMode: true
                    font.pointSize: 25
                    placeholderText: qsTr("hasło")
                    passwordCharacter: qsTr("●")
                    echoMode: TextInput.Password
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: user
                    visible: false
                }

                PropertyChanges {
                    target: admin
                    visible: false
                }

                PropertyChanges {
                    target: textEdit
                    x: 140
                    y: 335
                    width: 296
                    height: 70
                }

                PropertyChanges {
                    target: haslo
                    x: 163
                    y: 268
                    width: 298
                    height: 29
                }

                PropertyChanges {
                    target: login
                    x: 166
                    y: 195
                    width: 298
                    height: 29
                    visible: false
                    font.italic: false
                    font.pointSize: 25
                    placeholderText: qsTr("login")
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: cofinijDoGlownej
                    visible: false
                }

                PropertyChanges {
                    target: bladLogowania
                    visible: false
                }

                PropertyChanges {
                    target: zaloguj
                    visible: false
                }

                PropertyChanges {
                    target: wyszukajTagu
                    x: 75
                    y: 238
                    width: 198
                    height: 52
                    text: qsTr("po tagu RFID")
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wyszukajTytule
                    x: 342
                    y: 238
                    width: 198
                    height: 52
                    text: qsTr("po tytule")
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wyszukaj
                    x: 255
                    y: 159
                    width: 131
                    height: 27
                    text: qsTr("Wyszukaj")
                    font.pixelSize: 20
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wynik
                    visible: false
                }

                PropertyChanges {
                    target: przyciskSzukaj
                    visible: false
                }

                PropertyChanges {
                    target: tagRFID
                    visible: false
                }
            },
            State {
                name: "tagRFID"
                PropertyChanges {
                    target: name
                    y: 62
                    width: 352
                    height: 48
                    text: qsTr("Virtual Library")
                    font.pixelSize: 35
                    Layout.columnSpan: 1
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    anchors.horizontalCenterOffset: "-5"
                    Layout.preferredHeight: "-1"
                    Layout.minimumHeight: 0
                    Layout.topMargin: 150
                }

                PropertyChanges {
                    target: rectangle1
                    x: 1
                    y: 0
                    width: 640
                    height: 480
                    color: "#aaaaff"
                }

                PropertyChanges {
                    target: window
                    width: 640
                    height: 480
                    modality: Qt.ApplicationModal
                    maximumWidth: 42871
                    maximumHeight: 7080
                    flags: Qt.Window
                }

                PropertyChanges {
                    target: haslo
                    x: 166
                    y: 267
                    width: 307
                    height: 36
                    visible: false
                    font.pixelSize: 25
                    overwriteMode: true
                    echoMode: TextInput.Password
                    font.family: "Bruno Ace"
                    font.pointSize: 25
                    placeholderText: qsTr("hasło")
                    passwordCharacter: qsTr("●")
                    font.italic: false
                }

                PropertyChanges {
                    target: user
                    visible: false
                }

                PropertyChanges {
                    target: admin
                    visible: false
                }

                PropertyChanges {
                    target: textEdit
                    x: 140
                    y: 335
                    width: 296
                    height: 70
                }

                PropertyChanges {
                    target: haslo
                    x: 163
                    y: 268
                    width: 298
                    height: 29
                }

                PropertyChanges {
                    target: login
                    x: 166
                    y: 195
                    width: 298
                    height: 29
                    visible: false
                    font.family: "Bruno Ace"
                    font.pointSize: 25
                    placeholderText: qsTr("login")
                    font.italic: false
                }

                PropertyChanges {
                    target: cofinijDoGlownej
                    visible: false
                }

                PropertyChanges {
                    target: bladLogowania
                    visible: false
                }

                PropertyChanges {
                    target: zaloguj
                    visible: false
                }

                PropertyChanges {
                    target: wyszukajTagu
                    x: 75
                    y: 238
                    width: 198
                    height: 52
                    visible: false
                    text: qsTr("Button")
                    font.family: "Bruno Ace"
                    font.pointSize: 15
                }

                PropertyChanges {
                    target: wyszukajTytule
                    x: 343
                    y: 238
                    width: 198
                    height: 52
                    visible: false
                    text: qsTr("po tytule")
                    font.family: "Bruno Ace"
                    font.pointSize: 15
                }

                PropertyChanges {
                    target: wyszukaj
                    x: 255
                    y: 159
                    width: 131
                    height: 27
                    text: qsTr("Wyszukaj")
                    font.pixelSize: 20
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: tagRFID
                    x: 151
                    y: 224
                    width: 338
                    height: 45
                    placeholderTextColor: "#aaaaff"
                    placeholderText: qsTr("wprowadź tag RFID")
                    font.pointSize: 20
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wynik
                    x: 152
                    y: 356
                    width: 338
                    height: 38
                    text: qsTr("Text")
                    font.pixelSize: 20
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: przyciskSzukaj
                    x: 237
                    y: 288
                    width: 149
                    height: 38
                    text: qsTr("szukaj")
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                }
            },

            State {
                name: "adminPage"
            }]
    }
    

    Rectangle {
        id: rectangle1
        x: 355
        y: 715
        width: 200
        height: 200
        color: "#ffffff"

        Text {
            id: name
            x: 84
            y: -211
            width: 777
            height: 115
            visible: true
            text: qsTr("Virtual Library")
            font.pixelSize: 80
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Bruno Ace"
            style: Text.Sunken
        }

        Button {
            id: user
            x: 94
            y: 195
            text: qsTr("Button")

            Connections {
                target: user
                onClicked: stronaGlowna.state = "userPage"
            }
        }

        Button {
            id: admin
            x: 356
            y: 195
            text: qsTr("Button")

            Connections {
                target: admin
                onClicked: stronaGlowna.state = "loginPage"
            }
        }

        TextField {
            id: login
            x: 54
            y: 217
            placeholderText: qsTr("login")
            Connections {
                target: login
                onClicked: bladLogowania.visible=false;
            }
        }

        TextField {
            id: haslo
            x: 163
            y: 268
            placeholderText: qsTr("haslo")
            Connections {
                target: haslo
                onClicked: bladLogowania.visible=false;
            }
        }

        Button {
            id: zaloguj
            x: 278
            y: 333
            text: qsTr("zaloguj")
            Connections {
                target: zaloguj
                onClicked:
                    if (login.text==="admin" && haslo.text==="admin"){
                        stronaGlowna.state = "adminPage"}
                    else{
                        bladLogowania.visible=true;
                    }
            }
        }
    }
    Text {
        id: bladLogowania
        x: 174
        y: 318
        text: qsTr("Nieprawidłowy login lub hasło")
        font.pixelSize: 12
    }
    Timer {
        id: timer
    }
    Button {
        id: cofinijDoGlownej
        x: 97
        y: 145
        text: qsTr("cofnij")
        Connections {
            target: cofinijDoGlownej
            onClicked: stronaGlowna.state = "mainPage"
        }
    }

    Button {
        id: wyszukajTagu
        x: 145
        y: 201
        text: qsTr("Button")

        Connections {
            target: wyszukajTagu
            onClicked: stronaGlowna.state = "tagRFID"
        }
    }

    Button {
        id: wyszukajTytule
        x: 391
        y: 201
        text: qsTr("Button")
    }

    Text {
        id: wyszukaj
        x: 216
        y: 142
        text: qsTr("Text")
        font.pixelSize: 12
    }

    TextField {
        id: tagRFID
        x: 164
        y: 229
        placeholderText: qsTr("Text Field")
    }

    Text {
        id: wynik
        x: 151
        y: 305
        text: qsTr("Text")
        font.pixelSize: 12
    }

    Button {
        id: przyciskSzukaj
        x: 227
        y: 296
        text: qsTr("Button")
        onClicked: biblioteka.znajdzKsiazkeTag(tagRFID.text)
    }




}

