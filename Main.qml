﻿import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.12
import QtQuick.Controls 6.3
import QtQuick.Layouts 6.3
import QtQuick3D.Particles3D 6.4
import QtQuick.Timeline 1.0
import QtQuick.Controls.Windows 6.0
import QtQuick3D 6.5

Window {
    id: window
    width: 1920
    height: 1080
    visible: true
    color: "#009eadbc"
    property alias nameFontfamily: name.font.family
    flags: Qt.Window
    contentOrientation: Qt.PortraitOrientation
    visibility: Window.Windowed
    title: "Hello World"

    StateGroup {
        id: stronaGlowna
        state: "userPage"
        states: [
            State {
                name: "mainPage"

                PropertyChanges {
                    target: name
                    y: 62
                    width: 352
                    height: 48
                    font.pixelSize: 35
                    textFormat: Text.RichText
                    font.family: "Bruno Ace"
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
                    target: loginPage
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
                    target: przyciskSzukaj
                    visible: false
                }

                PropertyChanges {
                    target: userPageMainPage
                    x: 12
                    y: 16
                    width: 81
                    height: 32
                    visible: false
                }

                PropertyChanges {
                    target: text1
                    visible: false
                    text: " "
                }

                PropertyChanges {
                    target: cofinijDoGlownej1
                    x: 97
                    y: 145
                    width: 106
                    height: 24
                    visible: false
                }

                PropertyChanges {
                    target: tytul
                    visible: false
                }

                PropertyChanges {
                    target: przyciskSzukaj1
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoWyszukajPage
                    visible: false
                }

                PropertyChanges {
                    target: text2
                    visible: false
                }

                PropertyChanges {
                    target: fantasy
                    visible: false
                }

                PropertyChanges {
                    target: kryminal
                    visible: false
                }

                PropertyChanges {
                    target: romans
                    visible: false
                }

                PropertyChanges {
                    target: przygodowa
                    visible: false
                }

                PropertyChanges {
                    target: horror
                    visible: false
                }

                PropertyChanges {
                    target: biografia
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsun
                    visible: false
                }

                PropertyChanges {
                    target: mlodziezowa
                    visible: false
                }

                PropertyChanges {
                    target: historyczna
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodaj
                    visible: false
                }

                PropertyChanges {
                    target: gatunki
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyswietl
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyszukaj
                    visible: false
                }

                PropertyChanges {
                    target: swipeView
                    visible: false
                }

                PropertyChanges {
                    target: text3
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: dodaj
                    visible: false
                }

                PropertyChanges {
                    target: text4
                    visible: false
                }

                PropertyChanges {
                    target: sciezka
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie1
                    x: 8
                    y: 6
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie
                    x: -46
                    y: 8
                    visible: true
                }

                PropertyChanges {
                    target: komunikatUsunieto
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunPlik
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBlad
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBladPliku
                    visible: false
                }

                PropertyChanges {
                    target: comboBox
                    visible: false
                }

                PropertyChanges {
                    target: usunPage
                    visible: false
                }

                PropertyChanges {
                    target: userPageAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: bladDodajPage1
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTytul
                    visible: false
                }

                PropertyChanges {
                    target: usunPlik
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeAutor
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTag
                    visible: false
                }

                PropertyChanges {
                    target: lub
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: textPlik
                    visible: false
                }

                PropertyChanges {
                    target: tagRF
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
                    smooth: true
                    activeFocusOnTab: true
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                    highlighted: true
                }

                PropertyChanges {
                    target: loginPage
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

                PropertyChanges {
                    target: cofinijDoGlownej1
                    x: 13
                    y: 52
                    width: 76
                    height: 30
                    visible: false
                    text: qsTr("cofnij")
                }

                PropertyChanges {
                    target: userPageMainPage
                    visible: false
                }

                PropertyChanges {
                    target: text1
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoWyszukajPage
                    x: 451
                    y: 358
                    width: 145
                    height: 37
                    visible: false
                }

                PropertyChanges {
                    target: tytul
                    visible: false
                }

                PropertyChanges {
                    target: przyciskSzukaj1
                    visible: false
                }

                PropertyChanges {
                    target: text2
                    visible: false
                }

                PropertyChanges {
                    target: fantasy
                    visible: false
                }

                PropertyChanges {
                    target: romans
                    x: 308
                    y: 411
                    visible: false
                }

                PropertyChanges {
                    target: horror
                    visible: false
                }

                PropertyChanges {
                    target: biografia
                    visible: false
                }

                PropertyChanges {
                    target: kryminal
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsun
                    visible: false
                }

                PropertyChanges {
                    target: mlodziezowa
                    visible: false
                }

                PropertyChanges {
                    target: historyczna
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodaj
                    visible: false
                }

                PropertyChanges {
                    target: przygodowa
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyswietl
                    visible: false
                }

                PropertyChanges {
                    target: gatunki
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyszukaj
                    visible: false
                }

                PropertyChanges {
                    target: swipeView
                    visible: false
                }

                PropertyChanges {
                    target: text3
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: dodaj
                    visible: false
                }

                PropertyChanges {
                    target: text4
                    visible: false
                }

                PropertyChanges {
                    target: sciezka
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie1
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie
                    visible: false
                }

                PropertyChanges {
                    target: komunikatUsunieto
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunPlik
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBlad
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBladPliku
                    visible: false
                }

                PropertyChanges {
                    target: comboBox
                    visible: false
                }

                PropertyChanges {
                    target: usunPage
                    visible: false
                }

                PropertyChanges {
                    target: userPageAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: bladDodajPage1
                    visible: false
                }

                PropertyChanges {
                    target: lub
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: textPlik
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTag
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeAutor
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTytul
                    visible: false
                }

                PropertyChanges {
                    target: usunPlik
                    visible: false
                }

                PropertyChanges {
                    target: tagRF
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
                    target: loginPage
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
                    y: 157
                    width: 131
                    height: 27
                    text: qsTr("Wyszukaj")
                    font.pixelSize: 23
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

                PropertyChanges {
                    target: cofinijDoGlownej1
                    x: 12
                    y: 12
                    width: 80
                    height: 28
                    visible: false
                }

                PropertyChanges {
                    target: userPageMainPage
                    x: 14
                    y: 13
                    width: 81
                    height: 29
                    visible: true
                }

                PropertyChanges {
                    target: text1
                    visible: false
                }

                PropertyChanges {
                    target: tytul
                    visible: false
                }

                PropertyChanges {
                    target: przyciskSzukaj1
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoWyszukajPage
                    visible: false
                }

                PropertyChanges {
                    target: text2
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyswietl
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodaj
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsun
                    visible: false
                }

                PropertyChanges {
                    target: gatunki
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyszukaj
                    visible: false
                }

                PropertyChanges {
                    target: przygodowa
                    visible: false
                }

                PropertyChanges {
                    target: fantasy
                    visible: false
                }

                PropertyChanges {
                    target: kryminal
                    visible: false
                }

                PropertyChanges {
                    target: biografia
                    visible: false
                }

                PropertyChanges {
                    target: mlodziezowa
                    visible: false
                }

                PropertyChanges {
                    target: horror
                    visible: false
                }

                PropertyChanges {
                    target: historyczna
                    visible: false
                }

                PropertyChanges {
                    target: romans
                    visible: false
                }

                PropertyChanges {
                    target: swipeView
                    visible: false
                }

                PropertyChanges {
                    target: text3
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: dodaj
                    visible: false
                }

                PropertyChanges {
                    target: text4
                    visible: false
                }

                PropertyChanges {
                    target: sciezka
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie1
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie
                    visible: false
                }

                PropertyChanges {
                    target: userPageAdminPage
                    x: 12
                    y: 12
                    width: 83
                    height: 24
                    visible: false
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: usunKsiazkeTytul
                    visible: false
                }

                PropertyChanges {
                    target: usunPlik
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeAutor
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTag
                    visible: false
                }

                PropertyChanges {
                    target: lub
                    visible: false
                }

                PropertyChanges {
                    target: komunikatUsunieto
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunPlik
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBlad
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBladPliku
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: comboBox
                    visible: false
                }

                PropertyChanges {
                    target: bladDodajPage1
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: textPlik
                    visible: false
                }

                PropertyChanges {
                    target: usunPage
                    x: 12
                    y: 87
                    width: 77
                    height: 28
                    visible: false
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: tagRF
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
                    target: loginPage
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
                    x: 251
                    y: 152
                    width: 141
                    height: 27
                    font.pixelSize: 23
                    horizontalAlignment: Text.AlignHCenter
                    textFormat: Text.RichText
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: tagRFID
                    x: 151
                    y: 212
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
                    width: 144
                    height: 40
                    text: qsTr("szukaj")
                    anchors.verticalCenterOffset: 63
                    anchors.horizontalCenterOffset: 0
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: userPageMainPage
                    x: 16
                    y: 14
                    width: 77
                    height: 27
                    visible: false
                }

                PropertyChanges {
                    target: cofinijDoGlownej1
                    visible: false
                }

                PropertyChanges {
                    target: text1
                    x: 44
                    y: 340
                    width: 552
                    height: 107
                    color: "#000000"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: false
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: label
                    x: 85
                    y: 386
                    width: 454
                    height: 62
                }

                PropertyChanges {
                    target: tytul
                    visible: false
                }

                PropertyChanges {
                    target: przyciskSzukaj1
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoWyszukajPage
                    visible: false
                }

                PropertyChanges {
                    target: text2
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyswietl
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodaj
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsun
                    visible: false
                }

                PropertyChanges {
                    target: gatunki
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyszukaj
                    visible: false
                }

                PropertyChanges {
                    target: przygodowa
                    visible: false
                }

                PropertyChanges {
                    target: fantasy
                    visible: false
                }

                PropertyChanges {
                    target: kryminal
                    visible: false
                }

                PropertyChanges {
                    target: biografia
                    visible: false
                }

                PropertyChanges {
                    target: mlodziezowa
                    visible: false
                }

                PropertyChanges {
                    target: horror
                    visible: false
                }

                PropertyChanges {
                    target: historyczna
                    visible: false
                }

                PropertyChanges {
                    target: romans
                    visible: false
                }

                PropertyChanges {
                    target: swipeView
                    visible: false
                }

                PropertyChanges {
                    target: text3
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: dodaj
                    visible: false
                }

                PropertyChanges {
                    target: text4
                    visible: false
                }

                PropertyChanges {
                    target: sciezka
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie1
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTytul
                    visible: false
                }

                PropertyChanges {
                    target: usunPlik
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeAutor
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTag
                    visible: false
                }

                PropertyChanges {
                    target: lub
                    visible: false
                }

                PropertyChanges {
                    target: komunikatUsunieto
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunPlik
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBlad
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBladPliku
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: comboBox
                    visible: false
                }

                PropertyChanges {
                    target: bladDodajPage1
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: usunPage
                    visible: false
                }

                PropertyChanges {
                    target: userPageAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: tagRF
                    x: 18
                    y: 14
                    width: 83
                    height: 29
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                }
            },

            State {
                name: "tytul"
                PropertyChanges {
                    target: name
                    y: 62
                    width: 352
                    height: 48
                    text: qsTr("Virtual Library")
                    font.pixelSize: 35
                    anchors.horizontalCenterOffset: "-5"
                    Layout.minimumHeight: 0
                    Layout.topMargin: 150
                    Layout.fillWidth: true
                    Layout.preferredHeight: "-1"
                    Layout.columnSpan: 1
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
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
                    flags: Qt.Window
                    maximumHeight: 7080
                    maximumWidth: 42871
                }

                PropertyChanges {
                    target: haslo
                    x: 166
                    y: 267
                    width: 307
                    height: 36
                    visible: false
                    font.pixelSize: 25
                    font.pointSize: 25
                    font.italic: false
                    font.family: "Bruno Ace"
                    passwordCharacter: qsTr("●")
                    echoMode: TextInput.Password
                    overwriteMode: true
                    placeholderText: qsTr("hasło")
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
                    font.pointSize: 25
                    font.italic: false
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("login")
                }

                PropertyChanges {
                    target: loginPage
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
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wyszukajTytule
                    x: 343
                    y: 238
                    width: 198
                    height: 52
                    visible: false
                    text: qsTr("po tytule")
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wyszukaj
                    x: 251
                    y: 152
                    width: 141
                    height: 27
                    font.pixelSize: 23
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                    textFormat: Text.RichText
                }

                PropertyChanges {
                    target: tagRFID
                    x: 151
                    y: 212
                    width: 338
                    height: 45
                    visible: false
                    placeholderTextColor: "#aaaaff"
                    font.pointSize: 20
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("wprowadź tag RFID")
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
                    width: 56
                    height: 34
                    visible: false
                    text: qsTr("szukaj")
                    anchors.verticalCenterOffset: 63
                    anchors.horizontalCenterOffset: 0
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: userPageMainPage
                    x: 16
                    y: 14
                    width: 77
                    height: 27
                    visible: false
                }

                PropertyChanges {
                    target: cofinijDoGlownej1
                    visible: false
                }

                PropertyChanges {
                    target: text1
                    x: 44
                    y: 340
                    width: 552
                    height: 107
                    visible: false
                    color: "#000000"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                    font.bold: false
                }

                PropertyChanges {
                    target: label
                    x: 85
                    y: 386
                    width: 454
                    height: 62
                }

                PropertyChanges {
                    target: tytul
                    x: 151
                    y: 212
                    width: 338
                    height: 45
                    font.letterSpacing: 0.1
                    font.italic: false
                    font.wordSpacing: 0.1
                    font.family: "Bruno Ace"
                    font.pointSize: 20
                    baselineOffset: 21
                    placeholderTextColor: "#aaaaff"
                }

                PropertyChanges {
                    target: przyciskSzukaj1
                    width: 134
                    height: 36
                    font.pointSize: 15
                    anchors.verticalCenterOffset: 54
                    anchors.horizontalCenterOffset: 0
                }

                PropertyChanges {
                    target: cofnijDoWyszukajPage
                    x: 16
                    y: 14
                    width: 77
                    height: 27
                    visible: true
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: text2
                    x: 44
                    y: 340
                    width: 552
                    height: 107
                    horizontalAlignment: Text.AlignHCenter
                }

                PropertyChanges {
                    target: kryminal
                    visible: false
                }

                PropertyChanges {
                    target: horror
                    visible: false
                }

                PropertyChanges {
                    target: biografia
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsun
                    visible: false
                }

                PropertyChanges {
                    target: historyczna
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodaj
                    visible: false
                }

                PropertyChanges {
                    target: romans
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyswietl
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyszukaj
                    visible: false
                }

                PropertyChanges {
                    target: przygodowa
                    visible: false
                }

                PropertyChanges {
                    target: fantasy
                    visible: false
                }

                PropertyChanges {
                    target: mlodziezowa
                    visible: false
                }

                PropertyChanges {
                    target: gatunki
                    visible: false
                }

                PropertyChanges {
                    target: swipeView
                    visible: false
                }

                PropertyChanges {
                    target: text3
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: dodaj
                    visible: false
                }

                PropertyChanges {
                    target: text4
                    visible: false
                }

                PropertyChanges {
                    target: sciezka
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie1
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTytul
                    visible: false
                }

                PropertyChanges {
                    target: usunPlik
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeAutor
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTag
                    visible: false
                }

                PropertyChanges {
                    target: lub
                    visible: false
                }

                PropertyChanges {
                    target: komunikatUsunieto
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunPlik
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBlad
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBladPliku
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: comboBox
                    visible: false
                }

                PropertyChanges {
                    target: usunPage
                    visible: false
                }

                PropertyChanges {
                    target: userPageAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: bladDodajPage1
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: tagRF
                    visible: false
                }
            },

            State {
                name: "adminPage"
                PropertyChanges {
                    target: name
                    y: 62
                    width: 352
                    height: 48
                    text: qsTr("Virtual Library")
                    font.pixelSize: 35
                    anchors.horizontalCenterOffset: "-5"
                    Layout.minimumHeight: 0
                    Layout.topMargin: 150
                    Layout.fillWidth: true
                    Layout.preferredHeight: "-1"
                    Layout.columnSpan: 1
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
                    flags: Qt.Window
                    maximumHeight: 7080
                    maximumWidth: 42871
                }

                PropertyChanges {
                    target: haslo
                    x: 166
                    y: 267
                    width: 307
                    height: 36
                    visible: false
                    font.pixelSize: 25
                    font.pointSize: 25
                    font.italic: false
                    font.family: "Bruno Ace"
                    passwordCharacter: qsTr("●")
                    echoMode: TextInput.Password
                    overwriteMode: true
                    placeholderText: qsTr("hasło")
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
                    font.pointSize: 25
                    font.italic: false
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("login")
                }

                PropertyChanges {
                    target: loginPage
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
                    visible: false
                    text: qsTr("po tytule")
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wyszukaj
                    x: 255
                    y: 157
                    width: 131
                    height: 27
                    visible: false
                    text: qsTr("Wyszukaj")
                    font.pixelSize: 23
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

                PropertyChanges {
                    target: cofinijDoGlownej1
                    x: 12
                    y: 12
                    width: 80
                    height: 28
                }

                PropertyChanges {
                    target: userPageMainPage
                    visible: false
                }

                PropertyChanges {
                    target: text1
                    visible: false
                }

                PropertyChanges {
                    target: tytul
                    visible: false
                }

                PropertyChanges {
                    target: przyciskSzukaj1
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoWyszukajPage
                    visible: false
                }

                PropertyChanges {
                    target: text2
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyszukaj
                    x: 75
                    y: 168
                    width: 209
                    height: 55
                    text: qsTr("wyszukaj")
                    font.family: "Bruno Ace"
                    font.pointSize: 16
                }

                PropertyChanges {
                    target: buttonWyswietl
                    x: 342
                    y: 168
                    width: 209
                    height: 55
                    text: qsTr("wyświetl zawartość")
                    font.family: "Bruno Ace"
                    font.pointSize: 12
                }

                PropertyChanges {
                    target: buttonDodaj
                    x: 75
                    y: 266
                    width: 209
                    height: 55
                    text: qsTr("dodaj")
                    font.family: "Bruno Ace"
                    font.pointSize: 16
                }

                PropertyChanges {
                    target: buttonUsun
                    x: 342
                    y: 266
                    width: 209
                    height: 55
                    text: qsTr("usuń")
                    font.pointSize: 16
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: gatunki
                    visible: false
                }

                PropertyChanges {
                    target: biografia
                    visible: false
                }

                PropertyChanges {
                    target: horror
                    visible: false
                }

                PropertyChanges {
                    target: przygodowa
                    visible: false
                }

                PropertyChanges {
                    target: romans
                    visible: false
                }

                PropertyChanges {
                    target: fantasy
                    visible: false
                }

                PropertyChanges {
                    target: kryminal
                    visible: false
                }

                PropertyChanges {
                    target: historyczna
                    visible: false
                }

                PropertyChanges {
                    target: mlodziezowa
                    visible: false
                }

                PropertyChanges {
                    target: swipeView
                    visible: false
                }

                PropertyChanges {
                    target: text3
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: dodaj
                    visible: false
                }

                PropertyChanges {
                    target: text4
                    visible: false
                }

                PropertyChanges {
                    target: sciezka
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie1
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTytul
                    visible: false
                }

                PropertyChanges {
                    target: usunPlik
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeAutor
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTag
                    visible: false
                }

                PropertyChanges {
                    target: lub
                    visible: false
                }

                PropertyChanges {
                    target: komunikatUsunieto
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunPlik
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBlad
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBladPliku
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: comboBox
                    visible: false
                }

                PropertyChanges {
                    target: usunPage
                    visible: false
                }

                PropertyChanges {
                    target: userPageAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: bladDodajPage1
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: textPlik
                    visible: false
                }

                PropertyChanges {
                    target: tagRF
                    visible: false
                }
            },

            State {
                name: "usunPage"
                PropertyChanges {
                    target: name
                    y: 62
                    width: 352
                    height: 48
                    text: qsTr("Virtual Library")
                    font.pixelSize: 35
                    anchors.horizontalCenterOffset: "-5"
                    Layout.columnSpan: 1
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    Layout.topMargin: 150
                    Layout.minimumHeight: 0
                    Layout.preferredHeight: "-1"
                    Layout.fillWidth: true
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
                    maximumWidth: 42871
                    modality: Qt.ApplicationModal
                    flags: Qt.Window
                    maximumHeight: 7080
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
                    passwordCharacter: qsTr("●")
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("hasło")
                    font.pointSize: 25
                    overwriteMode: true
                    echoMode: TextInput.Password
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
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("login")
                    font.pointSize: 25
                }

                PropertyChanges {
                    target: loginPage
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
                    text: qsTr("po tagu RFID")
                    font.family: "Bruno Ace"
                    font.pointSize: 15
                }

                PropertyChanges {
                    target: wyszukajTytule
                    x: 342
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
                    y: 157
                    width: 131
                    height: 27
                    visible: false
                    text: qsTr("Wyszukaj")
                    font.pixelSize: 23
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

                PropertyChanges {
                    target: cofinijDoGlownej1
                    x: 12
                    y: 12
                    width: 80
                    height: 28
                    visible: false
                }

                PropertyChanges {
                    target: userPageMainPage
                    visible: false
                }

                PropertyChanges {
                    target: text1
                    visible: false
                }

                PropertyChanges {
                    target: tytul
                    visible: false
                }

                PropertyChanges {
                    target: przyciskSzukaj1
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoWyszukajPage
                    visible: false
                }

                PropertyChanges {
                    target: text2
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyszukaj
                    x: 75
                    y: 168
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("wyszukaj")
                    font.family: "Bruno Ace"
                    font.pointSize: 16
                }

                PropertyChanges {
                    target: buttonWyswietl
                    x: 342
                    y: 168
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("wyświetl zawartość")
                    font.family: "Bruno Ace"
                    font.pointSize: 12
                }

                PropertyChanges {
                    target: buttonDodaj
                    x: 75
                    y: 266
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("Button")
                    font.family: "Bruno Ace"
                    font.pointSize: 16
                }

                PropertyChanges {
                    target: buttonUsun
                    x: 342
                    y: 266
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("usuń")
                    font.family: "Bruno Ace"
                    font.pointSize: 16
                }

                PropertyChanges {
                    target: gatunki
                    visible: false
                }

                PropertyChanges {
                    target: biografia
                    visible: false
                }

                PropertyChanges {
                    target: horror
                    visible: false
                }

                PropertyChanges {
                    target: przygodowa
                    visible: false
                }

                PropertyChanges {
                    target: romans
                    visible: false
                }

                PropertyChanges {
                    target: fantasy
                    visible: false
                }

                PropertyChanges {
                    target: kryminal
                    visible: false
                }

                PropertyChanges {
                    target: historyczna
                    visible: false
                }

                PropertyChanges {
                    target: mlodziezowa
                    visible: false
                }

                PropertyChanges {
                    target: swipeView
                    visible: false
                }

                PropertyChanges {
                    target: text3
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: dodaj
                    visible: false
                }

                PropertyChanges {
                    target: text4
                    visible: false
                }

                PropertyChanges {
                    target: sciezka
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie1
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie
                    x: 407
                    y: 411
                    visible: false
                    scale: 1.4
                }

                PropertyChanges {
                    target: usunKsiazkeTytul
                    x: 186
                    y: 202
                    width: 253
                    height: 37
                    visible: false
                    placeholderText: qsTr("tytuł")
                    placeholderTextColor: "#aaaaff"
                    font.family: "Bruno Ace"
                    font.pointSize: 18
                }

                PropertyChanges {
                    target: usunPlik
                    x: 83
                    y: 252
                    width: 475
                    height: 38
                    visible: false
                    placeholderText: qsTr("ścieżka do pliku")
                    placeholderTextColor: "#aaaaff"
                    font.pointSize: 18
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: textPlik
                    x: 345
                    y: 143
                    width: 226
                    height: 35
                    visible: false
                    text: qsTr("usuń plik z książkami (.csv)")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: textKsiazke
                    x: 439
                    y: 308
                    width: 252
                    height: 35
                    visible: false
                    text: qsTr("usuń ksiażkę")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: usunKsiazkeAutor
                    x: 186
                    y: 252
                    width: 253
                    height: 36
                    visible: false
                    placeholderText: qsTr("autor")
                    font.pointSize: 18
                    font.family: "Bruno Ace"
                    placeholderTextColor: "#aaaaff"
                }

                PropertyChanges {
                    target: usunKsiazkeTag
                    x: 186
                    y: 348
                    width: 253
                    height: 36
                    visible: false
                    placeholderText: qsTr("tag RFID")
                    placeholderTextColor: "#aaaaff"
                    font.pointSize: 18
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: lub
                    x: 247
                    y: 318
                    width: 127
                    height: 17
                    visible: false
                    text: qsTr("lub")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: comboBox
                    x: 143
                    y: 143
                    width: 355
                    height: 40
                    font.pointSize: 14
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: komunikatUsunieto
                    x: 73
                    y: 424
                    width: 476
                    height: 32
                    visible: false
                    text: qsTr("text")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: buttonUsunPlik
                    x: 247
                    y: 352
                    width: 134
                    height: 32
                    visible: false
                    text: qsTr("usuń")
                    font.pointSize: 12
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: buttonUsunKsiazke
                    x: 247
                    y: 393
                    width: 127
                    height: 31
                    visible: false
                    text: qsTr("usuń")
                    font.pointSize: 12
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: komunikatBlad
                    x: 189
                    y: 296
                    width: 250
                    height: 16
                    visible: false
                    color: "#ff0000"
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: komunikatBladPliku
                    x: 86
                    y: 304
                    width: 457
                    height: 17
                    visible: false
                    color: "#ff0404"
                    text: qsTr("")
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: usunPage
                    x: 12
                    y: 12
                    width: 80
                    height: 28
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: tagRF
                    visible: false
                }
            },

            State {
                name: "dodajPage"
                PropertyChanges {
                    target: name
                    y: 62
                    width: 352
                    height: 48
                    text: qsTr("Virtual Library")
                    font.pixelSize: 35
                    anchors.horizontalCenterOffset: "-5"
                    Layout.minimumHeight: 0
                    Layout.topMargin: 150
                    Layout.fillWidth: true
                    Layout.preferredHeight: "-1"
                    Layout.columnSpan: 1
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
                    flags: Qt.Window
                    maximumHeight: 7080
                    maximumWidth: 42871
                }

                PropertyChanges {
                    target: haslo
                    x: 166
                    y: 267
                    width: 307
                    height: 36
                    visible: false
                    font.pixelSize: 25
                    font.pointSize: 25
                    font.italic: false
                    font.family: "Bruno Ace"
                    passwordCharacter: qsTr("●")
                    echoMode: TextInput.Password
                    overwriteMode: true
                    placeholderText: qsTr("hasło")
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
                    font.pointSize: 25
                    font.italic: false
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("login")
                }

                PropertyChanges {
                    target: loginPage
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
                    visible: false
                    text: qsTr("po tytule")
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wyszukaj
                    x: 255
                    y: 157
                    width: 131
                    height: 27
                    visible: false
                    text: qsTr("Wyszukaj")
                    font.pixelSize: 23
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

                PropertyChanges {
                    target: cofinijDoGlownej1
                    x: 12
                    y: 12
                    width: 80
                    height: 28
                    visible: false
                }

                PropertyChanges {
                    target: userPageMainPage
                    visible: false
                }

                PropertyChanges {
                    target: text1
                    visible: false
                }

                PropertyChanges {
                    target: tytul
                    visible: false
                }

                PropertyChanges {
                    target: przyciskSzukaj1
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoWyszukajPage
                    visible: false
                }

                PropertyChanges {
                    target: text2
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyszukaj
                    x: 75
                    y: 168
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("wyszukaj")
                    font.pointSize: 16
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: buttonWyswietl
                    x: 342
                    y: 168
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("wyświetl zawartość")
                    font.pointSize: 12
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: buttonDodaj
                    x: 75
                    y: 266
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("dodaj")
                    font.pointSize: 16
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: buttonUsun
                    x: 342
                    y: 266
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("usuń")
                    font.pointSize: 16
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: gatunki
                    x: 76
                    y: 124
                    width: 488
                    height: 53
                    text: qsTr("Wybierz gatunek jaki chcesz dodać")
                    font.pixelSize: 22
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: przygodowa
                    x: 331
                    y: 168
                    width: 274
                    height: 55
                    text: qsTr("Powieść przygodowa")
                    font.family: "Bruno Ace"
                    font.pointSize: 14
                }

                PropertyChanges {
                    target: fantasy
                    x: 30
                    y: 168
                    width: 267
                    height: 55
                    text: qsTr("Fantasy, science fiction")
                    font.pointSize: 13
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: kryminal
                    x: 30
                    y: 241
                    width: 267
                    height: 55
                    text: qsTr("Kryminał, sensacja, thriller")
                    font.pointSize: 12
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: biografia
                    x: 331
                    y: 314
                    width: 274
                    height: 55
                    text: qsTr("Biografia i reportaż")
                    font.pointSize: 12
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: mlodziezowa
                    x: 30
                    y: 389
                    width: 267
                    height: 55
                    text: qsTr("Powieść młodzieżowa")
                    font.pointSize: 11
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: horror
                    x: 331
                    y: 241
                    width: 274
                    height: 55
                    text: qsTr("Horror")
                    font.family: "Bruno Ace"
                    font.pointSize: 15
                }

                PropertyChanges {
                    target: historyczna
                    x: 30
                    y: 314
                    width: 267
                    height: 55
                    text: qsTr("Powieść historyczna")
                    font.pointSize: 11
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: romans
                    x: 331
                    y: 389
                    width: 274
                    height: 55
                    text: qsTr("literatura obyczajowa, romans")
                    font.pointSize: 10
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: swipeView
                    x: 159
                    y: 194
                    width: 279
                    height: 160
                    layer.smooth: true
                    layer.effect: swipeView
                    font.hintingPreference: Font.PreferDefaultHinting
                    antialiasing: false
                    focus: true
                    scale: 1
                }

                PropertyChanges {
                    target: dodaj
                    visible: false
                }

                PropertyChanges {
                    target: text4
                    visible: false
                }

                PropertyChanges {
                    target: text3
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: sciezka
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie1
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodajPage
                    x: 12
                    y: 12
                    width: 80
                    height: 28
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: usunKsiazkeTytul
                    visible: false
                }

                PropertyChanges {
                    target: usunPlik
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeAutor
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTag
                    visible: false
                }

                PropertyChanges {
                    target: lub
                    visible: false
                }

                PropertyChanges {
                    target: komunikatUsunieto
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunPlik
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBlad
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBladPliku
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: comboBox
                    visible: false
                }

                PropertyChanges {
                    target: usunPage
                    visible: false
                }

                PropertyChanges {
                    target: userPageAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: bladDodajPage1
                    visible: false
                }

                PropertyChanges {
                    target: tagRF
                    visible: false
                }
            },

            State {
                name: "dodajPage1"
                PropertyChanges {
                    target: name
                    y: 62
                    width: 352
                    height: 48
                    text: qsTr("Virtual Library")
                    font.pixelSize: 35
                    anchors.horizontalCenterOffset: "-5"
                    Layout.minimumHeight: 0
                    Layout.topMargin: 150
                    Layout.fillWidth: true
                    Layout.preferredHeight: "-1"
                    Layout.columnSpan: 1
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
                    flags: Qt.Window
                    maximumHeight: 7080
                    maximumWidth: 42871
                }

                PropertyChanges {
                    target: haslo
                    x: 166
                    y: 267
                    width: 307
                    height: 36
                    visible: false
                    font.pixelSize: 25
                    font.pointSize: 25
                    font.italic: false
                    font.family: "Bruno Ace"
                    passwordCharacter: qsTr("●")
                    echoMode: TextInput.Password
                    overwriteMode: true
                    placeholderText: qsTr("hasło")
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
                    font.pointSize: 25
                    font.italic: false
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("login")
                }

                PropertyChanges {
                    target: loginPage
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
                    visible: false
                    text: qsTr("po tytule")
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wyszukaj
                    x: 255
                    y: 157
                    width: 131
                    height: 27
                    visible: false
                    text: qsTr("Wyszukaj")
                    font.pixelSize: 23
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

                PropertyChanges {
                    target: cofinijDoGlownej1
                    x: 12
                    y: 12
                    width: 80
                    height: 28
                    visible: false
                }

                PropertyChanges {
                    target: userPageMainPage
                    visible: false
                }

                PropertyChanges {
                    target: text1
                    visible: false
                }

                PropertyChanges {
                    target: tytul
                    visible: false
                }

                PropertyChanges {
                    target: przyciskSzukaj1
                    visible: false
                }

                PropertyChanges {
                    target: cofnijDoWyszukajPage
                    visible: false
                }

                PropertyChanges {
                    target: text2
                    visible: false
                }

                PropertyChanges {
                    target: buttonWyszukaj
                    x: 75
                    y: 168
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("wyszukaj")
                    font.pointSize: 16
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: buttonWyswietl
                    x: 342
                    y: 168
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("wyświetl zawartość")
                    font.pointSize: 12
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: buttonDodaj
                    x: 75
                    y: 266
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("dodaj")
                    font.pointSize: 16
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: buttonUsun
                    x: 342
                    y: 266
                    width: 209
                    height: 55
                    visible: false
                    text: qsTr("usuń")
                    font.pointSize: 16
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: gatunki
                    x: 76
                    y: 124
                    width: 488
                    height: 53
                    visible: false
                    text: qsTr("Wybierz gatunek jaki chcesz dodać")
                    font.pixelSize: 22
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: przygodowa
                    x: 331
                    y: 168
                    width: 274
                    height: 55
                    text: qsTr("Powieść przygodowa")
                    font.pointSize: 14
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: fantasy
                    x: 30
                    y: 168
                    width: 267
                    height: 55
                    text: qsTr("Fantasy, science fiction")
                    font.pointSize: 13
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: kryminal
                    x: 30
                    y: 241
                    width: 267
                    height: 55
                    text: qsTr("Kryminał, sensacja, thriller")
                    font.pointSize: 12
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: biografia
                    x: 331
                    y: 314
                    width: 274
                    height: 55
                    text: qsTr("Biografia i reportaż")
                    font.pointSize: 12
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: mlodziezowa
                    x: 30
                    y: 389
                    width: 267
                    height: 55
                    text: qsTr("Powieść młodzieżowa")
                    font.pointSize: 11
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: horror
                    x: 331
                    y: 241
                    width: 274
                    height: 55
                    text: qsTr("Horror")
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: historyczna
                    x: 30
                    y: 314
                    width: 267
                    height: 55
                    text: qsTr("Powieść historyczna")
                    font.pointSize: 11
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: romans
                    x: 331
                    y: 389
                    width: 274
                    height: 55
                    text: qsTr("literatura obyczajowa, romans")
                    font.pointSize: 10
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: swipeView
                    visible: false
                }

                PropertyChanges {
                    target: text3
                    x: 15
                    y: 147
                    width: 611
                    height: 48
                    text: ""
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: cofnijDoDodajPage
                    x: 12
                    y: 12
                    width: 80
                    height: 28
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: sciezka
                    x: 80
                    y: 211
                    width: 470
                    height: 40
                    font.pointSize: 18
                    font.family: "Bruno Ace"
                    placeholderTextColor: "#aaaaff"
                    placeholderText: qsTr("podaj ścieżkę do listy (.csv)")
                }

                PropertyChanges {
                    target: dodaj
                    x: 241
                    y: 283
                    width: 159
                    height: 38
                    text: qsTr("dodaj")
                    font.pointSize: 13
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: text4
                    x: 46
                    y: 344
                    width: 548
                    height: 108
                    text: qsTr(" ")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    lineHeight: 1.3
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: lodowanie1
                    x: 69
                    y: 64
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie1
                    x: 300
                    y: 375
                    width: 41
                    visible: false
                }

                PropertyChanges {
                    target: ladowanie
                    x: 301
                    y: 403
                    visible: false
                    scale: 1.8
                }

                PropertyChanges {
                    target: bladDodajPage1
                    x: 295
                    y: 256
                    width: 51
                    height: 17
                    visible: false
                    color: "#ff0000"
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: usunKsiazkeTytul
                    visible: false
                }

                PropertyChanges {
                    target: usunPlik
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeAutor
                    visible: false
                }

                PropertyChanges {
                    target: usunKsiazkeTag
                    visible: false
                }

                PropertyChanges {
                    target: lub
                    visible: false
                }

                PropertyChanges {
                    target: komunikatUsunieto
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunPlik
                    visible: false
                }

                PropertyChanges {
                    target: buttonUsunKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBlad
                    visible: false
                }

                PropertyChanges {
                    target: komunikatBladPliku
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: comboBox
                    visible: false
                }

                PropertyChanges {
                    target: usunPage
                    visible: false
                }

                PropertyChanges {
                    target: userPageAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodajPage
                    visible: false
                }

                PropertyChanges {
                    target: tagRF
                    visible: false
                }
            },

            State {
                name: "dffg"
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
                onClicked: {
                    stronaGlowna.state = "userPage"
                    userPageAdminPage.visible = false
                    userPageMainPage.visible = true
                }
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
            Keys.onPressed: {
                bladLogowania.visible=false;
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter){
                    zaloguj.clicked()
                }
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
            Keys.onPressed: {
                bladLogowania.visible=false;
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter){
                    zaloguj.clicked()
                }
            }}

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
        id: loginPage
        x: 97
        y: 145
        text: qsTr("cofnij")
        Connections {
            target: loginPage
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

        Connections {
            target: wyszukajTytule
            onClicked: stronaGlowna.state = "tytul"
        }
    }///////////////////////////////////////////////////////////////////////////////////////////
    Button {
        id: przyciskSzukaj
        x: 227
        y: 296
        font.family: "Bruno Ace"
        anchors.centerIn: parent
        text: qsTr("szukaj")
        onClicked:
        {
            enter()
        }
    }
    TextField {
        id: tagRFID
        x: 164
        y: 229
        font.family: "Bruno Ace"
        placeholderText: qsTr("Text Field")
        Keys.onPressed: {
            text1.visible = false
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                enter()
            }
        }}

    Text {
        id: text1
        x: 255
        y: 380
        font.family: "Bruno Ace"
        text: " "
        font.pixelSize: 18
    }
    function enter(){
        var result = biblioteka.znajdzKsiazkeTag(tagRFID.text) // Wywołujemy metodę z klasy C++
        text1.text = result
        text1.visible = true
        // Możesz tutaj dodać kod, który wyświetli zwrócony string na ekranie
    }

    Text {
        id: wyszukaj
        x: 216
        y: 142
        font.family: "Bruno Ace"
        text: qsTr("Wyszukaj")
        font.pixelSize: 20
    }
    Button {
        id: cofinijDoGlownej1
        x: 97
        y: 145
        text: qsTr("cofnij")
        font.family: "Bruno Ace"
        Connections {
            target: cofinijDoGlownej1
            onClicked: stronaGlowna.state = "mainPage"
        }
    }
    Button {
        id: userPageMainPage
        x: 97
        y: 145
        visible: false
        text: qsTr("cofnij")
        font.family: "Bruno Ace"
        Connections {
            target: userPageMainPage
            onClicked: stronaGlowna.state = "mainPage"
        }
    }

    Button {
        id: przyciskSzukaj1
        x: 227
        y: 296
        font.family: "Bruno Ace"
        anchors.centerIn: parent
        text: qsTr("szukaj")
        onClicked:
        {
            entertytul()
        }
    }
    TextField {
        id: tytul
        x: 164
        y: 229
        font.family: "Bruno Ace"
        placeholderText: "wprowadź tytuł"
        Keys.onPressed: {
            text2.visible = false
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                entertytul()
            }
        }
    }
    Text {
        id: text2
        x: 224
        y: 375
        font.family: "Bruno Ace"
        text: " "
        font.pixelSize: 18
    }


    function entertytul(){
        var result = biblioteka.znajdzKsiazkeTytul(tytul.text) // Wywołujemy metodę z klasy C++
        text2.text = result
        text2.visible = true
        // Możesz tutaj dodać kod, który wyświetli zwrócony string na ekranie
    }
    Button {
        id: cofnijDoWyszukajPage
        x: 69
        y: 110
        text: qsTr("Button")

        Connections {
            target: cofnijDoWyszukajPage
            onClicked: stronaGlowna.state = "userPage"
        }
    }

    Button {
        id: buttonWyszukaj
        x: 75
        y: 329
        text: qsTr("Button")
        onClicked:
        {
            stronaGlowna.state = "userPage"
            userPageAdminPage.visible = true
            userPageMainPage.visible = false
        }
    }

    Button {
        id: buttonWyswietl
        x: 78
        y: 332
        text: qsTr("Button")
    }

    Button {
        id: buttonDodaj
        x: 79
        y: 333
        text: qsTr("Button")

        Connections {
            target: buttonDodaj
            onClicked: stronaGlowna.state = "dodajPage"
        }
    }

    Button {
        id: buttonUsun
        x: 75
        y: 329
        text: qsTr("Button")

        Connections {
            target: buttonUsun
            onClicked: stronaGlowna.state = "usunPage"
        }
    }
    Text {
        id: gatunki
        x: 217
        y: 358
        text: qsTr("Text")
        font.pixelSize: 12
    }
    property string wybor
    property string id
    SwipeView {
        id: swipeView
        x: 195
        y: 169
        width: 200
        height: 200

        Button {
            id: fantasy
            x: -165
            y: -1
            text: qsTr("Button")
            onClicked:{
                dodawanie("fantasy, science fiction","fantasy")
            }
        }

        Button {
            id: przygodowa
            x: 136
            y: -1
            text: qsTr("Button")
            onClicked:{
                dodawanie("powieść przygodowa","przygodowa")
            }}

        Button {
            id: kryminal
            x: -165
            y: 72
            text: qsTr("Button")
            onClicked:{
                dodawanie("kryminał, sensacja, thriller","kryminal")
            }}

        Button {
            id: biografia
            x: 136
            y: 145
            text: qsTr("Button")
            onClicked:{
                dodawanie("biografia, reportaż", "biografia")
            }

        }

        Button {
            id: mlodziezowa
            x: -165
            y: 220
            text: qsTr("Button")
            onClicked: {
                dodawanie("powieść młodzieżowa", "mlodziezowa")
            }}

        Button {
            id: horror
            x: 136
            y: 72
            text: qsTr("Button")
            onClicked: {
                dodawanie("horror","horror")
            }}

        Button {
            id: historyczna
            x: -165
            y: 145
            text: qsTr("Button")
            onClicked:
            {
                dodawanie("powieść historyczna","historyczna")
            }
        }

        Button {
            id: romans
            x: 136
            y: 220
            text: qsTr("Button")
            onClicked:
            {
                dodawanie("literatura obyczajowa, romans","romans")
            }
        }
    }
    Text{
        id: text3
        x: 79
        y: 207
        text: " "
        font.pixelSize: 12
    }
    TextField {
        id: sciezka
        x: 54
        y: 217
        placeholderText: qsTr("login1")
        Keys.onPressed: {
            bladDodajPage1.visible = false
            text4.visible = false
            ladowanie.visible = false
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                dodawanieZPliku()
            }
        }
    }

    Button {
        id: cofnijDoDodajPage
        x: 38
        y: 147
        text: qsTr("cofnij")

        Connections {
            target: cofnijDoDodajPage
            onClicked: stronaGlowna.state = "dodajPage"
        }
    }
    TextField {
        id: usunKsiazkeTytul
        x: 409
        y: 531
        placeholderText: qsTr("login1")
        text: ""
        Keys.onPressed: {
            komunikatUsunieto.visible = false
            komunikatBlad.visible = false
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                usunKsiazke()
            }
        }
    }

    TextField {
        id: usunPlik
        x: 308
        y: 566
        placeholderText: qsTr("login1")
        text: ""
        Keys.onPressed:{
            komunikatUsunieto.visible = false
            komunikatBladPliku.visible = false
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                usunPlikKsiazek()
            }
        }
    }

    TextField {
        id: usunKsiazkeAutor
        x: 409
        y: 580
        placeholderText: qsTr("login1")
        text: ""
        Keys.onPressed: {
            komunikatUsunieto.visible = false
            komunikatBlad.visible = false
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                usunKsiazke()
            }
        }
    }

    TextField {
        id: usunKsiazkeTag
        x: 409
        y: 683
        placeholderText: qsTr("login1")
        text: ""
        Keys.onPressed: {
            komunikatUsunieto.visible = false
            komunikatBlad.visible = false
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                usunKsiazke()
            }
        }
    }

    Text {
        id: lub
        x: 472
        y: 647
        text: qsTr("Text")
        font.pixelSize: 12
    }

    BusyIndicator {
        id: ladowanie
        x: 34
        y: 18
    }

    Button {
        id: dodaj
        x: 236
        y: 324
        text: qsTr("dodaj")
        onClicked:
        {
            dodawanieZPliku()
        }
    }
    Text {
        id: text4
        x: 195
        y: 369
        text: qsTr(" ")
        font.pixelSize: 12
    }

    Timer {
        id: delaytimer
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            ladowanie.visible = false
            var result = biblioteka.dodajKsiazkiZPlikuu(sciezka.text, id) + wybor
            text4.text = result
        }
    }
    Text {
        id: komunikatUsunieto
        x: 107
        y: 430
        text: qsTr("Text")
        font.pixelSize: 12
    }

    Button {
        id: buttonUsunPlik
        x: 256
        y: 323
        text: qsTr("Button")
        onClicked:
            usunPlikKsiazek()
    }

    Button {
        id: buttonUsunKsiazke
        x: 237
        y: 374
        text: qsTr("Button")
        onClicked:
            usunKsiazke()
    }

    Text {
        id: komunikatBlad
        x: 195
        y: 396
        text: qsTr("Text")
        font.pixelSize: 12
    }

    Text {
        id: komunikatBladPliku
        x: 80
        y: 344
        text: qsTr("Text")
        font.pixelSize: 12
    }

    Text {
        id: textKsiazke
        x: -41
        y: 56
        text: qsTr("Text")
        font.pixelSize: 12
    }

    Text {
        id: textPlik
        x: -135
        y: -109
        text: qsTr("Text")
        font.pixelSize: 12
    }
    ComboBox {
        id: comboBox
        x: 478
        y: 250
        model: ["- wybierz opcje -", textPlik.text, textKsiazke.text]
        onActivated:{
            if (currentIndex === 0){
                usunKsiazkeAutor.visible = false
                usunKsiazkeTytul.visible = false
                lub.visible = false
                usunKsiazkeTag.visible = false
                usunPlik.visible = false
                buttonUsunPlik.visible = false
                buttonUsunKsiazke.visible = false
                komunikatBlad.visible = false
                komunikatBladPliku.visible = false
            }
            else if (currentIndex === 1){
                usunKsiazkeAutor.visible = false
                usunKsiazkeTytul.visible = false
                lub.visible = false
                usunKsiazkeTag.visible = false
                usunPlik.visible = true
                buttonUsunPlik.visible = true
                buttonUsunKsiazke.visible = false
                komunikatBlad.visible = false
                komunikatBladPliku.visible = false
            }
            else {
                usunKsiazkeAutor.visible = true
                usunKsiazkeTytul.visible = true
                lub.visible = true
                usunKsiazkeTag.visible = true
                usunPlik.visible = false
                buttonUsunPlik.visible = false
                buttonUsunKsiazke.visible = true
                komunikatBlad.visible = false
                komunikatBladPliku.visible = false
            }
        }
    }

    Timer {
        id: timer1
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            ladowanie.visible = false
            var result = biblioteka.usunKsiazkeTytul(usunKsiazkeTytul.text,usunKsiazkeAutor.text)
            komunikatUsunieto.text = result
        }
    }

    Timer {
        id: timer2
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            ladowanie.visible = false
            var result = biblioteka.usunKsiazkeTag(usunKsiazkeTag.text)
            komunikatUsunieto.text = result
        }
    }
    Button {
        id: usunPage
        x: 12
        y: 87
        text: qsTr("Button")

        Connections {
            target: usunPage
            onClicked: stronaGlowna.state = "adminPage"
        }
    }

    Button {
        id: userPageAdminPage
        x: 18
        y: 59
        text: qsTr("Button")

        Connections {
            target: userPageAdminPage
            onClicked: stronaGlowna.state = "adminPage"
        }
    }

    Text {
        id: bladDodajPage1
        x: 211
        y: 266
        text: qsTr("Text")
        font.pixelSize: 12
    }

    Button {
        id: buttonDodajPage
        x: 12
        y: 48
        text: qsTr("Button")

        Connections {
            target: buttonDodajPage
            onClicked: stronaGlowna.state = "adminPage"
        }
    }

    Button {
        id: tagRF
        x: 18
        y: 59
        text: qsTr("Button")

        Connections {
            target: tagRF
            onClicked: stronaGlowna.state = "userPage"
        }
    }


    function usunPlikKsiazek(){
        if (usunPlik.text === ""){
            komunikatBladPliku.text = "Nie podano ścieżki do pliku"
            komunikatBladPliku.visible = true
        }
        else{
        komunikatUsunieto.text = biblioteka()
        komunikatUsunieto.visible = true
        }
    }

    function usunKsiazke(){
        if (usunKsiazkeTag.text === ""){
            if (usunKsiazkeTytul.text === ""){
                komunikatBlad.text = "Nie podano tytułu"
                komunikatBlad.visible = true
            }
            else if (usunKsiazkeAutor.text === ""){
                komunikatBlad.text = "Nie podano autora"
                komunikatBlad.visible = true
            }
            else{
                komunikatUsunieto.text = "Trwa usuwanie"
                ladowanie.visible = true
                komunikatUsunieto.visible = true
                timer1.start()
            }}
        //tytul
        else{
            komunikatUsunieto.text = "Trwa usuwanie"
            ladowanie.visible = true
            komunikatUsunieto.visible = true
            timer2.start()
            //tag
        }
    }

    function dodawanie(w,i){
        wybor = w
        id = i
        stronaGlowna.state = "dodajPage1"
        ladowanie.visible = false
        text3.text = "Dodawanie książek z gatunku " + wybor
    }
    function dodawanieZPliku(){
        if(sciezka.text === ""){
            bladDodajPage1.text = "nie podano sciezki"
            bladDodajPage1.visible = true
        }
        else{
        ladowanie.visible = true
        text4.text = "Trwa dodawanie książek z pliku: \n" + sciezka.text
        text4.visible = true
        delaytimer.start()}
    }
}




