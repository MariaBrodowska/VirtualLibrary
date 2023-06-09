﻿import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.12
import QtQuick.Controls 6.3
import QtQuick.Layouts 6.3
import QtQuick.Controls.Windows 6.0
Window {
    id: mainWindow
    width: 1540
    height: 820
    minimumWidth: 800
    minimumHeight: 600
    maximumHeight: 820
    maximumWidth: 1540
    visible: true
    visibility: Window.Maximized
    title: "Virtual Library"
    
    Rectangle{
        id: background
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#4fabee"
            }

            GradientStop {
                position: 0.51598
                color: "#2d7fdb"
            }

            GradientStop {
                position: 1
                color: "#c0e2fe"
            }

            orientation: Gradient.Vertical
        }
        color: "#aaaaff"
    }

    Image {
        id: mainPagebackground
        anchors.fill: parent
        source: "widok3D/widokglowny1.png"
        visible: false
    }

    Image {
        id: logo
        source: "images/logo.png"
        fillMode: Image.PreserveAspectFit
    }

    Grid {
        id: grid
        x: 136
        y: 378
        width: 400
        height: 400
        Layout.fillWidth: true
        anchors.horizontalCenter: parent.horizontalCenter
        Button {
            id: user
            Layout.maximumWidth: 336
            Layout.maximumHeight: 97
            text: qsTr("user")
            onClicked: {
                ktorastrona = "user"
                stronaGlowna.state = "userPage"
            }

        }

        Button {
            id: admin
            Layout.maximumWidth: 336
            Layout.maximumHeight: 97
            text: qsTr("admin")
            onClicked: {
                stronaGlowna.state = "loginPage"
                ktorastrona = "admin"
            }
        }
    }


    Rectangle {
        id: loginpage
        x: 187
        y: 293
        width: 200
        height: 200
        color: "#ffffff"
        Layout.fillWidth: true
        anchors.horizontalCenter: parent.horizontalCenter
        TextField {
            id: login
            x: 71
            y: 68

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
            x: 187
            y: 330
            width: 200
            height: 200
            placeholderText: qsTr("haslo")
            Layout.fillWidth: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Keys.onPressed: {
                bladLogowania.visible=false
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter){
                    zaloguj.clicked()
                }
            }
        }

        Button {
            id: zaloguj
            x: 121
            y: 227
            text: qsTr("zaloguj")
            onClicked:{
                if (login.text==="admin" && haslo.text==="admin"){
                    stronaGlowna.state = "adminPage"
                    login.text = ""
                    haslo.text = ""
                }
                else{
                    bladLogowania.visible=true;
                }}
        }

        Text {
            id: bladLogowania
            x: 83
            y: 181
            text: qsTr("Nieprawidłowy login lub hasło")
            font.pixelSize: 12
        }
    }

    Rectangle {
        id: userpage
        x: 745
        y: 293
        width: 200
        height: 200
        color: "#ffffff"
        Layout.fillWidth: true
        anchors.horizontalCenter: parent.horizontalCenter
        Button {
            id: wyszukajTagu
            x: 10
            y: 152
            text: qsTr("Button")
            onClicked: {
                stronaGlowna.state = "tagRFID"
                tagRFID.visible = true
                page = tag
            }
        }

        Button {
            id: wyszukajTytule
            x: 263
            y: 152
            text: qsTr("Button")
            onClicked: {
                stronaGlowna.state = "tytul"
                page = tytul
            }
        }

        Text {
            id: wyszukaj
            x: 173
            y: 80
            font.family: "Bruno Ace"
            text: qsTr("Wyszukaj")
            font.pixelSize: 20
        }

        Button {
            id: buttonWyswietl
            x: 10
            y: 236
            text: qsTr("Button")
            onClicked:
            {
                stronaGlowna.state = "wyswietlZawartosc"
                if(ktorastrona=="user"){
                    wyswietlAdminPage.visible = false
                    wyswietlUserPage.visible = true
                }
                else {
                    wyswietlUserPage.visible = false
                    wyswietlAdminPage.visible = true
                }
            }}

        Button {
            id: buttonWyszukaj
            x: 54
            y: 47
            text: qsTr("Button")
            onClicked: stronaGlowna.state = "userPage1"
        }

        Button {
            id: buttonDodaj
            x: 54
            y: 145
            text: qsTr("Button")
            onClicked: {
                swipeView.Component.onCompleted()
                stronaGlowna.state = "dodajPage"
                if (strzalka==true && strzalka1==true){
                    image.visible = true
                    image1.visible = true
                }
                else if(strzalka){
                    image.visible = true
                    image1.visible = false
                }
                else{
                    image1.visible = true
                    image.visible = false
                }
                comboBoxDodaj.visible = true
                comboBox.visible = false
            }
        }

        Button {
            id: buttonUsun
            x: 321
            y: 145
            text: qsTr("Button")
            onClicked:
            {
                stronaGlowna.state = "usunPage"
                comboBoxDodaj.visible = false
                comboBox.visible = true
            }
        }
    }
    property var listaWidok
    property var ktoryKierunek
    property var page
    function widok1(){
        listaWidok = biblioteka.znajdzKsiazkeWidok3D(kliknij1.text)
        stronaGlowna.state = "pagewidok3D"
        kliknij1.text = listaWidok[3]%2
        logo.visible = true
        lupa.visible = true
        if(listaWidok[3]%2 !== 0){
            lewo.visible = true
            prawo.visible = false
            ktoryKierunek = 'l'
        }
        else{
            prawo.visible = true
            lewo.visible = false
            ktoryKierunek = 'p'
        }}

    Rectangle {
        id: tag
        x: 211
        y: 301
        width: 200
        height: 200
        color: "#ffffff"
        Layout.fillWidth: true
        anchors.horizontalCenter: parent.horizontalCenter
        Button {
            id: przyciskSzukaj
            x: 173
            y: 129
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
            x: 76
            y: 57
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
            x: 0
            y: 180
            font.family: "Bruno Ace"
            text: ""
            font.pixelSize: 18
        }

        ScrollView {
            id: scrollView
            x: 251
            y: 130
            width: 200
            height: 200

            ListView {
                id: listTag
                x: 41
                y: 13
                width: 110
                height: 160
                visible: true
                anchors.fill: parent
                model: znajdzTagg()
                delegate: Item {
                    x: 5
                    width: 700
                    height: 50
                    MouseArea {
                        id: mouseAreaLista
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: {
                            var itemText = modelData
                            var regex = /Tag RFID: (\d+)/
                            var match = regex.exec(itemText)
                            if (match && match.length > 1) {
                                var tagID = match[1]
                                kliknij1.text = tagID
                                widok1();
                            }
                        }
                    }
                    Row {
                        id: row3
                        Rectangle {
                            width: 20
                            height: 20
                            color: "black"
                            radius: 6
                        }

                        Text {
                            text: modelData
                            anchors.verticalCenter: parent.verticalCenter
                            font.family: "Bruno Ace"
                            font.pixelSize: 16
                        }
                        spacing: 25
                    }
                }
            }
        }

    }

    Rectangle {
        id: tytulpage
        x: 297
        y: 492
        width: 200
        height: 200
        color: "#ffffff"
        Layout.fillWidth: true
        anchors.horizontalCenter: parent.horizontalCenter
        Button {
            id: przyciskSzukaj1
            x: 596
            y: 84
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
            x: -146
            y: -280
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
            x: -253
            y: -152
            font.family: "Bruno Ace"
            text: ""
            font.pixelSize: 18
        }

        ScrollView {
            id: scrollView1
            x: 251
            y: 130
            width: 200
            height: 200

            ListView {
                id: listTytul
                x: 41
                y: 13
                width: 110
                height: 160
                visible: true
                model: znajdzTytull()
                delegate: Item {
                    x: 5
                    width: 700
                    height: 50
                    MouseArea {
                        id: mouseAreaListaa
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: {
                            var itemText = modelData
                            var regex = /Tag RFID: (\d+)/
                            var match = regex.exec(itemText)
                            if (match && match.length > 1) {
                                var tagID = match[1]
                                kliknij1.text = tagID
                                widok1();
                            }
                        }
                    }

                    Row {
                        id: row2
                        Rectangle {
                            width: 20
                            height: 20
                            color: "black"
                            radius: 6
                        }

                        Text {
                            text: modelData
                            anchors.verticalCenter: parent.verticalCenter
                            font.family: "Bruno Ace"
                            font.pixelSize: 16
                        }
                        spacing: 25
                    }
                }
            }
        }
    }
    Rectangle {
        id: widok3D
        x: 142
        y: -261
        width: 200
        height: 200
        visible: false
        color: "#ffffff"
        anchors.fill: parent
        anchors.rightMargin: 489
        anchors.bottomMargin: -870
        anchors.leftMargin: 0
        anchors.topMargin: 1278
        Image {
            id: lewo
            width: 100
            height: 100
            visible: true
            source: "images/kierunek.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: prawo
            x: 4
            y: 4
            width: 100
            height: 100
            visible: true
            mirror: true
            source: "images/kierunek.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: nrSzafy
            x: 4
            y: 4
            width: 100
            height: 100
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Image {
            id: lupapomniejszone
            width: 100
            height: 100
            visible: false
            source: "images/lupapomn.png"
            MouseArea {
                id: mousewidokb
                width: 73
                height: 73
                visible: true
                onClicked: {
                    if (page===tag){
                        stronaGlowna.state = "tagRFID"}
                    else{
                        stronaGlowna.state = "tytul"
                    }
                    ramka.visible = false
                }
                onEntered: {
                    lupapomniejszone.scale = 1.3
                }
                onExited: {
                    lupapomniejszone.scale = 1.0
                }
            }
            MouseArea {
                id: mousewidokb2
                width: 73
                height: 73
                visible: false
                anchors.fill: parent
                onEntered: {
                    lupapomniejszone.scale = 1.3
                }
                onExited: {
                    lupapomniejszone.scale = 1.0
                }
                onClicked:{
                    mainPagebackground.source = "widok3d/widokglowny1.png"
                    nrSzafy.visible = false
                    mousewidokb.visible = true
                    mousewidok.visible = true
                    mousewidok2.visible = false
                    mousewidokb2.visible = false
                    lupa.visible = true
                    ramka.visible = false
                    logo.visible = true
                    if (ktoryKierunek==='l'){
                        lewo.visible = true
                        prawo.visible = false
                    }
                    else{
                        prawo.visible = true
                        lewo.visible = false
                    }
                }
            }
        }
        Image {
            id: lupa
            width: 100
            height: 100
            visible: true
            source: "images/lupa.png"
            MouseArea {
                id: mousewidok2
                width: 73
                height: 73
                visible: false
                onClicked:{
                    if(ktoryKierunek==="l"){
                        mainPagebackground.source = "widok3d/plewaprzod.png"

                    }
                    else{
                        mainPagebackground.source = "widok3d/pprawaprzod.png"

                    }
                    nrSzafy.visible = false
                    //logo.visible = false
                    ramka.visible = true
                    mousewidok2.visible = false
                    lupa.visible = false
                    if (listaWidok[4]==='1'){
                        ramka.y = -706
                    }
                    else if(listaWidok[4]==='2'){
                        ramka.y = -609
                    }
                    else if(listaWidok[4]==='3'){
                        ramka.y = -518
                    }
                    else if(listaWidok[4]==='4'){
                        ramka.y = -424
                    }
                    else{
                        ramka.y = -323
                    }
                    switch(listaWidok[5]){
                    case '1':
                        ramka.x = 431
                        break
                    case '2':
                        ramka.x = 483
                        break
                    case '3':
                        ramka.x = 533
                        break
                    case '4':
                        ramka.x = 583
                        break
                    case '5':
                        ramka.x = 639
                        break
                    case '6':
                        ramka.x = 690
                        break
                    case '7':
                        ramka.x = 738
                        break
                    case '8':
                        ramka.x = 792
                        break
                    case '9':
                        ramka.x = 846
                        break
                    default:
                        ramka.x = 901
                    }
                }
                onEntered: {
                    lupa.scale = 1.3
                }
                onExited: {
                    lupa.scale = 1.0
                }
            }
            MouseArea {
                id: mousewidok
                width: 60
                height: 60
                visible: true
                onClicked: {
                    if(ktoryKierunek==="l"){
                        mainPagebackground.source = "widok3d/szafalewa.png"
                        nrSzafy.x = 802
                        nrSzafy.y = -461
                    }
                    else{
                        mainPagebackground.source = "widok3d/szafaprawa.png"
                        nrSzafy.x = 728
                        nrSzafy.y = -452
                    }
                    nrSzafy.text = listaWidok[3]
                    nrSzafy.visible = true
                    lewo.visible = false
                    prawo.visible = false
                    mousewidok.visible = false
                    mousewidokb.visible = false
                    mousewidok2.visible = true
                    mousewidokb2.visible = true
                }
                onEntered: {
                    lupa.scale = 1.3
                }
                onExited: {
                    lupa.scale = 1.0
                }
            }
        }

        Image {
            id: ramka
            width: 100
            height: 100
            source: "images/border.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: usunpage
        x: 260
        y: 479
        width: 200
        height: 200
        color: "#ffffff"
        Layout.fillWidth: true
        anchors.horizontalCenter: parent.horizontalCenter
        TextField {
            id: usunKsiazkeTytul
            x: -74
            y: -289
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
            x: -75
            y: -198
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: komunikatUsunieto
            x: -184
            y: -88
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: komunikatBlad
            x: -75
            y: -223
            text: qsTr("Text")
            font.pixelSize: 12
        }

        TextField {
            id: usunPlik
            x: -177
            y: -227
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
            x: -75
            y: -255
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
            x: -75
            y: -166
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

        Button {
            id: buttonUsunPlik
            x: -13
            y: -142
            text: qsTr("Button")
            onClicked:
            {
                usunPlikKsiazek()
            }
        }

        Button {
            id: buttonUsunKsiazke
            x: -13
            y: -126
            text: qsTr("Button")
            onClicked:
            {
                usunKsiazke()
            }
        }

        Text {
            id: komunikatBladPliku
            x: -174
            y: -175
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: textKsiazke
            x: 179
            y: -171
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: textPlik
            x: 85
            y: -336
            text: qsTr("Text")
            font.pixelSize: 12
        }

        ComboBox {
            id: comboBox
            x: -113
            y: -346
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
                    komunikatUsunieto.visible = false
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
                    komunikatUsunieto.visible = false
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
                    komunikatUsunieto.visible = false
                }
            }
        }

        TextField {
            id: sciezka
            x: -180
            y: -268
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

        Text{
            id: text3
            x: -245
            y: -332
            text: " "
            font.pixelSize: 12
        }

        Button {
            id: dodaj
            x: -19
            y: -196
            text: qsTr("dodaj")
            onClicked:
            {
                dodawanieZPliku()
            }
        }

        Text {
            id: text4
            x: -214
            y: -135
            text: qsTr(" ")
            font.pixelSize: 12
        }

        Text {
            id: bladDodajPage1
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: dodajjplikksiazek
            text: qsTr("dodaj plik z książkami (.csv)")
            font.pixelSize: 12
        }

        Text {
            id: dodajjksiazke
            text: qsTr("dodaj książkę")
            font.pixelSize: 12
        }

        ComboBox {
            id: comboBoxDodaj
            x: -763
            y: -470
            model: ["- wybierz opcje -", dodajjplikksiazek.text, dodajjksiazke.text]
            onActivated:{
                if (currentIndex === 0){
                    dodajKsiazkeTytul.visible = false
                    dodajKsiazkeAutor.visible = false
                    sciezka.visible = false//plik
                    dodaj.visible = false//plik
                    buttonDodajKsiazke.visible = false
                    brakTytuluAutora.visible = false
                    bladDodajPage1.visible = false//
                    text4.visible = false//
                }
                else if (currentIndex === 1){
                    dodajKsiazkeTytul.visible = false
                    dodajKsiazkeAutor.visible = false
                    sciezka.visible = true//plik
                    dodaj.visible = true//plik
                    buttonDodajKsiazke.visible = false
                    brakTytuluAutora.visible = false
                    bladDodajPage1.visible = false//
                    text4.visible = false//
                }
                else {
                    dodajKsiazkeTytul.visible = true
                    dodajKsiazkeAutor.visible = true
                    sciezka.visible = false//plik
                    dodaj.visible = false//plik
                    buttonDodajKsiazke.visible = true
                    brakTytuluAutora.visible = false
                    bladDodajPage1.visible = false//
                    text4.visible = false//
                }
            }
        }

        Button {
            id: buttonDodajKsiazke
            x: 734
            y: 306
            width: 150
            height: 40
            text: qsTr("dodaj")
            onClicked:{
                dodawanieKsiazki()
            }
        }

        Text {
            id: brakTytuluAutora
            text: qsTr("Text")
            font.pixelSize: 12
        }

        TextField {
            id: dodajKsiazkeAutor
            x: -66
            y: -246
            text: ""
            placeholderText: qsTr("login1")
            Keys.onPressed: {
                brakTytuluAutora.visible = false
                text4.visible = false
                ladowanie.visible = false
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    dodawanieKsiazki()
                }
            }
        }

        TextField {
            id: dodajKsiazkeTytul
            x: -66
            y: -246
            text: ""
            placeholderText: qsTr("login1")
            Keys.onPressed: {
                brakTytuluAutora.visible = false
                text4.visible = false
                ladowanie.visible = false
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    dodawanieKsiazki()
                }
            }
        }
    }

    Rectangle {
        id: wyswietlzawartosc
        x: 734
        y: 306
        width: 200
        height: 200
        color: "#ffffff"
        Layout.fillWidth: true
        anchors.horizontalCenter: parent.horizontalCenter
        SpinBox {
            id: spinSzafa
            x: -716
            y: -163
        }

        SpinBox {
            id: spinPolka
            x: -716
            y: -96
        }

        SpinBox {
            id: spinKsiazka
            x: -716
            y: -27
        }

        Text {
            id: textSzafa
            x: -716
            y: -189
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: textPolka
            x: -716
            y: -119
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: textKsiazka
            x: -716
            y: -50
            text: qsTr("Text")
            font.pixelSize: 12
        }

        PathView {
            id: pathView
            x: -751
            y: 21
            width: 250
            height: 130
            model: ListModel {
                id: listView1
                ListElement {
                    name: "wszystkie"
                    colorCode: "black"
                }
                ListElement {
                    name: "fantasy"
                    colorCode: "white"
                }
                ListElement {
                    name: "kryminał"
                    colorCode: "white"
                }
                ListElement {
                    name: "historyczna"
                    colorCode: "white"
                }
                ListElement {
                    name: "młodzieżowa"
                    colorCode: "white"
                }
                ListElement {
                    name: "przygodowa"
                    colorCode: "white"
                }
                ListElement {
                    name: "horror"
                    colorCode: "white"
                }
                ListElement {
                    name: "biografia"
                    colorCode: "white"
                }
            }
            delegate: RowLayout {
                Column{
                    Rectangle {
                        width: 20
                        height: 20
                        color: colorCode
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text {
                        x: 5
                        text: name
                        font.bold: true
                        font.pixelSize: 9
                        font.family: "Bruno Ace"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    spacing: 5
                }}
            path: Path {
                startY: 100
                PathQuad {
                    x: 120
                    y: 25
                    controlY: 75
                    controlX: 255
                }

                PathQuad {
                    x: 120
                    y: 100
                    controlY: 75
                    controlX: -15
                }
                startX: 120
            }
        }

        ScrollView {
            id: scrollView2
            width: 200
            height: 200

            ListView {
                id: listView
                x: 333
                y: 90
                width: 110
                height: 160
                visible: true
                model: wyswietlZaw()
                delegate: Text {
                    x: 5
                    width: 80
                    height: 45

                    Row {
                        id: row1
                        Rectangle {
                            width: 10
                            height: 10
                            color: "black"
                            radius: 3
                        }

                        Text {
                            text: modelData
                            anchors.verticalCenter: parent.verticalCenter
                            font.family: "Bruno Ace"
                            font.pixelSize: 15
                        }
                        spacing: 10
                    }
                }
            }
        }
    }
    property bool strzalka: true
    property bool strzalka1: false
    Rectangle {
        id: dodajpage
        x: 489
        y: 527
        width: 200
        height: 200
        color: "#ffffff"
        Layout.fillWidth: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: gatunki
            x: 31
            y: 130
            text: qsTr("Text")
            font.pixelSize: 12
        }
        SwipeView {
            id: swipeView
            x: 114
            y: 200
            width: 200
            height: 200
            Component.onCompleted: { //resetowanie swipe do pierwszego pola
                currentIndex = 0
                swipeView.itemAt(currentIndex + 1).z = 0
                swipeView.itemAt(currentIndex).z = 1
            }
            onCurrentIndexChanged: {
                if (currentIndex-1>=0 && currentIndex-1<=7){
                    itemAt(currentIndex-1).scale = 1.0
                    itemAt(currentIndex-1).z = 0
                } //resetowanie poprzedniego
                if (currentIndex+1>=0 && currentIndex+1<=7){
                    itemAt(currentIndex+1).scale = 1.0
                    itemAt(currentIndex + 1).z = 0
                } //resetowanie nastepnego
                if (currentIndex>=0 && currentIndex<=7){
                    currentItem.scale = 1.5
                    currentItem.z = 1
                } //ustawienie obecnego
                if (currentIndex===0){
                    image.visible = true
                    image1.visible = false
                    strzalka = true
                    strzalka1 = false
                    itemAt(currentIndex+1).z = 0
                }
                else if(currentIndex===7){
                    image.visible = false
                    image1.visible = true
                    strzalka = false
                    strzalka1 = true
                }
                else{
                    image1.visible = true
                    image.visible = true
                    strzalka = true
                    strzalka1 = true
                }

            }

            Button {
                id: fantasy
                x: -165
                y: -1
                z: 1
                text: qsTr("Button")
                onClicked:{
                    dodawanie("fantasy, science fiction","fantasy")
                }
                scale: 1.5
            }

            Button {
                id: przygodowa
                x: 136
                y: -1
                z: 0
                text: qsTr("Button")
                onClicked:{
                    dodawanie("powieść przygodowa","przygodowa")

                }
            }

            Button {
                id: kryminal
                x: -165
                y: 72
                text: qsTr("Button")
                onClicked:{
                    dodawanie("kryminał, sensacja, thriller","kryminal")
                }
            }

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
                }
            }

            Button {
                id: horror
                x: 136
                y: 72
                text: qsTr("Button")
                onClicked: {
                    dodawanie("horror","horror")
                }
            }

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

        Image {
            id: image1
            width: 100
            height: 100
            x: 783
            y: 110
            source: "images/strzalka2.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseArea
                width: 100
                height: 100
                onClicked: {
                    if(swipeView.currentIndex>0){
                        swipeView.currentIndex-=1
                    }
                }
                onEntered: {
                    image1.source = "images/strzalka2pods.png"
                    image1.scale = 1.9
                    mouseArea.scale = 1.1
                }

                onExited: {
                    image1.source = "images/strzalka2.png"
                    image1.scale = 1.8
                    mouseArea.scale = 1.0
                }
            }

        }

        Image {
            id: image
            x: 783
            y: 110
            width: 100
            height: 100
            source: "images/strzalka2.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseArea1
                width: 100
                height: 100
                hoverEnabled: true
                onClicked: {
                    if(swipeView.currentIndex<7){
                        swipeView.currentIndex+=1
                    }
                }
                onEntered: {
                    image.source = "images/strzalka2pods.png"
                    image.scale = 1.6
                    mouseArea1.scale = 1.1
                }

                onExited: {
                    image.source = "images/strzalka2.png"
                    image.scale = 1.5
                    mouseArea1.scale = 1.0
                }
            }
        }



    }

    Text {
        id: name
        x: 783
        y: 110
        width: 563
        height: 80
        visible: false
        text: qsTr("Virtual Library")
        horizontalAlignment: Text.AlignHCenter
        Layout.fillWidth: true
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Bruno Ace"
        style: Text.Sunken
        font.pixelSize: 60
        textFormat: Text.RichText
        Layout.topMargin: 150
        Layout.minimumHeight: 0
    }


    Button {
        id: zapisz
        y: 12
        width: 76
        height: 28
        text: qsTr("zapisz")
        font.pointSize: 9
        Layout.margins: 20
        Layout.fillWidth: true
        x: parent.width - width - 20
        font.family: "Bruno Ace"
        onClicked: {
            biblioteka.zapisWszystkich()
        }
    }

    StateGroup {
        id: stronaGlowna
        state: "mainPage"
        states: [
            State {
                name: "mainPage"

                PropertyChanges {
                    target: user
                    x: 293
                    y: 396
                    width: 336
                    height: 97
                    text: qsTr("user")
                    font.family: "Bruno Ace"
                    font.pointSize: 25
                }

                PropertyChanges {
                    target: admin
                    x: 926
                    y: 396
                    width: 336
                    height: 97
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
                    target: ladowanie
                    x: -46
                    y: 254
                    visible: true
                    anchors.horizontalCenterOffset: -1101
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

                PropertyChanges {
                    target: spinPolka
                    visible: false
                }

                PropertyChanges {
                    target: spinKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: textSzafa
                    visible: false
                }

                PropertyChanges {
                    target: textPolka
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: -114
                    y: 125
                    width: 46
                    height: 32
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    visible: false
                }

                PropertyChanges {
                    target: spinSzafa
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: pathView
                    visible: false
                }
                PropertyChanges {
                    target: grid
                    x: 136
                    y: 378
                    width: 741
                    height: 256
                    spacing: 70
                }

                PropertyChanges {
                    target: userpage
                    visible: false
                }

                PropertyChanges {
                    target: loginpage
                    visible: false
                }

                PropertyChanges {
                    target: tag
                    visible: false
                }

                PropertyChanges {
                    target: usunpage
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    visible: false
                }

                PropertyChanges {
                    target: dodajpage
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    visible: false
                }

                PropertyChanges {
                    target: mainPagebackground
                    visible: true
                    anchors.leftMargin: -23
                    anchors.topMargin: 0
                    anchors.rightMargin: -22
                    anchors.bottomMargin: -37
                }

                PropertyChanges {
                    target: name
                    visible: false
                }

                PropertyChanges {
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
                }
            },
            State {
                name: "loginPage"

                PropertyChanges {
                    target: haslo
                    x: 70
                    y: 126
                    width: 301
                    height: 33
                    visible: true
                    font.pixelSize: 25
                    placeholderTextColor: "#0d71e1"
                    anchors.verticalCenterOffset: 13
                    anchors.horizontalCenterOffset: -2
                    scale: 1.3
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
                    target: haslo
                    x: 163
                    y: 268
                    width: 298
                    height: 29
                }

                PropertyChanges {
                    target: login
                    x: 70
                    y: 65
                    width: 301
                    height: 33
                    visible: true
                    placeholderTextColor: "#0d71e1"
                    scale: 1.3
                    baselineOffset: 25
                    placeholderText: qsTr("login")
                    font.italic: false
                    font.pointSize: 20
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: zaloguj
                    x: 122
                    y: 241
                    width: 198
                    height: 40
                    visible: true
                    text: qsTr("zaloguj")
                    font.hintingPreference: Font.PreferDefaultHinting
                    scale: 1.3
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
                    x: 58
                    y: 191
                    width: 275
                    height: 27
                    visible: false
                    color: "#e00000"
                    text: qsTr("Nieprawidłowy login lub hasło")
                    font.pixelSize: 17
                    scale: 1.2
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: bladLogowania
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

                PropertyChanges {
                    target: spinPolka
                    visible: false
                }

                PropertyChanges {
                    target: spinKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: textSzafa
                    visible: false
                }

                PropertyChanges {
                    target: textPolka
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    visible: false
                }

                PropertyChanges {
                    target: spinSzafa
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: -157
                    y: 100
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: pathView
                    visible: false
                }

                PropertyChanges {
                    target: grid
                    visible: false
                }

                PropertyChanges {
                    target: userpage
                    visible: false
                }

                PropertyChanges {
                    target: loginpage
                    x: 765
                    y: 233
                    width: 441
                    height: 287
                    visible: true
                    color: "#00ffffff"
                    anchors.horizontalCenterOffset: 1
                    layer.enabled: true
                }

                PropertyChanges {
                    target: tag
                    visible: false
                }

                PropertyChanges {
                    target: usunpage
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    visible: false
                }

                PropertyChanges {
                    target: dodajpage
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    visible: false
                }

                PropertyChanges {
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
                }

                PropertyChanges {
                    target: name
                    visible: false
                }
            },
            State {
                name: "userPage"

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
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
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
                    x: 38
                    y: 302
                    width: 247
                    height: 60
                    text: qsTr("po tagu RFID")
                    font.pointSize: 18
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wyszukajTytule
                    x: 366
                    y: 302
                    width: 247
                    height: 60
                    text: qsTr("po tytule")
                    font.pointSize: 18
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wyszukaj
                    x: 244
                    y: 204
                    width: 180
                    height: 40
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: false
                    textFormat: Text.RichText
                    font.family: "Bruno Ace"
                    text: qsTr("Wyszukaj")
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
                    x: 98
                    y: 405
                    width: 470
                    height: 58
                    visible: true
                    text: qsTr("wyświetl zawartość")
                    font.pointSize: 18
                    font.family: "Bruno Ace"
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

                PropertyChanges {
                    target: spinPolka
                    visible: false
                }

                PropertyChanges {
                    target: spinKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: textSzafa
                    visible: false
                }

                PropertyChanges {
                    target: textPolka
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    visible: false
                }

                PropertyChanges {
                    target: spinSzafa
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: -142
                    y: 110
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: pathView
                    visible: false
                }

                PropertyChanges {
                    target: userpage
                    x: 177
                    y: 64
                    width: 666
                    height: 636
                    color: "#00ffffff"
                    anchors.horizontalCenterOffset: 0
                }

                PropertyChanges {
                    target: loginpage
                    visible: false
                }

                PropertyChanges {
                    target: tag
                    visible: false
                }

                PropertyChanges {
                    target: usunpage
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    visible: false
                }

                PropertyChanges {
                    target: dodajpage
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    visible: false
                }

                PropertyChanges {
                    target: kliknij1
                    visible: false
                }

                PropertyChanges {
                    target: kliknij
                    x: 97
                    y: 184
                    width: 688
                    height: 58
                    visible: false
                    text: qsTr("Wyświetl więcej szczegółów")
                    font.pixelSize: 40
                    font.family: "Bruno Ace"
                }
            },

            State {
                name: "userPage1"

                PropertyChanges {
                    target: haslo
                    x: 166
                    y: 267
                    width: 307
                    height: 36
                    visible: false
                    font.pixelSize: 25
                    passwordCharacter: qsTr("●")
                    overwriteMode: true
                    echoMode: TextInput.Password
                    placeholderText: qsTr("hasło")
                    font.family: "Bruno Ace"
                    font.italic: false
                    font.pointSize: 25
                }
                PropertyChanges {
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
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
                    placeholderText: qsTr("login")
                    font.family: "Bruno Ace"
                    font.italic: false
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
                    x: 74
                    y: 256
                    width: 198
                    height: 52
                    text: qsTr("po tagu RFID")
                    scale: 1.2
                    font.family: "Bruno Ace"
                    font.pointSize: 15
                }

                PropertyChanges {
                    target: wyszukajTytule
                    x: 358
                    y: 256
                    width: 198
                    height: 52
                    text: qsTr("po tytule")
                    scale: 1.2
                    font.family: "Bruno Ace"
                    font.pointSize: 15
                }

                PropertyChanges {
                    target: wyszukaj
                    x: 250
                    y: 167
                    width: 141
                    height: 27
                    text: qsTr("Wyszukaj")
                    font.pixelSize: 23
                    scale: 1.2
                    font.family: "Bruno Ace"
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
                    target: buttonWyswietl
                    x: 188
                    y: 318
                    width: 265
                    height: 52
                    visible: false
                    text: qsTr("wyświetl zawartość")
                    font.family: "Bruno Ace"
                    font.pointSize: 14
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
                    target: ladowanie
                    visible: false
                }

                PropertyChanges {
                    target: userPageAdminPage
                    x: 12
                    y: 12
                    width: 83
                    height: 24
                    visible: true
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

                PropertyChanges {
                    target: spinPolka
                    visible: false
                }

                PropertyChanges {
                    target: spinKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: textSzafa
                    visible: false
                }

                PropertyChanges {
                    target: textPolka
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    visible: false
                }

                PropertyChanges {
                    target: spinSzafa
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: -142
                    y: 110
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: pathView
                    x: 204
                    y: 267
                    visible: false
                }

                PropertyChanges {
                    target: loginpage
                    visible: false
                }

                PropertyChanges {
                    target: userpage
                    y: 102
                    width: 613
                    height: 531
                    visible: true
                    color: "#00ffffff"
                    anchors.horizontalCenterOffset: -13
                }

                PropertyChanges {
                    target: tag
                    visible: false
                }

                PropertyChanges {
                    target: background
                    anchors.bottomMargin: 0
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                }

                PropertyChanges {
                    target: usunpage
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    visible: false
                }

                PropertyChanges {
                    target: dodajpage
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    visible: false
                }

                PropertyChanges {
                    target: kliknij1
                    visible: false
                }
            },

            State {
                name: "tagRFID"

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
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
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
                    x: 114
                    y: 13
                    width: 338
                    height: 45
                    scale: 1.2
                    placeholderTextColor: "#0d71e1"
                    placeholderText: qsTr("wprowadź tag RFID")
                    font.pointSize: 20
                    font.family: "Bruno Ace"
                }
                PropertyChanges {
                    target: przyciskSzukaj
                    x: 237
                    y: 288
                    width: 144
                    height: 40
                    visible: false
                    text: qsTr("szukaj")
                    scale: 1.2
                    anchors.verticalCenterOffset: 7
                    anchors.horizontalCenterOffset: -1
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
                    x: 10
                    y: 232
                    width: 552
                    height: 107
                    color: "#000000"
                    font.pixelSize: 19
                    horizontalAlignment: Text.AlignHCenter
                    scale: 1.2
                    font.bold: false
                    font.family: "Bruno Ace"
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
                    target: ladowanie
                    x: 934
                    y: 520
                    visible: false
                    anchors.horizontalCenterOffset: 0
                    scale: 1.5
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

                PropertyChanges {
                    target: spinPolka
                    visible: false
                }

                PropertyChanges {
                    target: spinKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: textSzafa
                    visible: false
                }

                PropertyChanges {
                    target: textPolka
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    visible: false
                }

                PropertyChanges {
                    target: spinSzafa
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: -174
                    y: 110
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: pathView
                    visible: false
                }

                PropertyChanges {
                    target: loginpage
                    visible: false
                }

                PropertyChanges {
                    target: userpage
                    visible: false
                }

                PropertyChanges {
                    target: tag
                    x: 677
                    y: 237
                    width: 565
                    height: 338
                    color: "#00ffffff"
                    anchors.horizontalCenterOffset: -6
                }

                PropertyChanges {
                    target: usunpage
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    visible: false
                }

                PropertyChanges {
                    target: dodajpage
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    visible: false
                }

                PropertyChanges {
                    target: listTag
                    x: 364
                    y: 355
                    width: 812
                    height: 402
                }

                PropertyChanges {
                    target: listTytul
                    x: 0
                    y: 0
                    width: 626
                    height: 481
                }

                PropertyChanges {
                    target: scrollView
                    x: -114
                    y: 105
                    width: 792
                    height: 444
                }

                PropertyChanges {
                    target: kliknij1
                    x: 121
                    y: 361
                    width: 341
                    height: 188
                    visible: false
                }

                PropertyChanges {
                    target: kliknij
                    x: 18
                    y: 209
                    width: 517
                    height: 47
                    visible: true
                    color: "#bbc9ce"
                    text: qsTr("Wyświetl więcej szczegółów")
                    font.pixelSize: 25
                    font.italic: true
                    font.underline: false
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: kliknij11
                    x: -228
                    y: 194
                    visible: true
                    scale: 0.4
                    rotation: 32.683
                }
            },



            State {
                name: "pagewidok3D"

                PropertyChanges {
                    target: haslo
                    x: 166
                    y: 267
                    width: 307
                    height: 36
                    visible: false
                    font.pixelSize: 25
                    overwriteMode: true
                    font.pointSize: 25
                    font.family: "Bruno Ace"
                    echoMode: TextInput.Password
                    passwordCharacter: qsTr("●")
                    placeholderText: qsTr("hasło")
                    font.italic: false
                }
                PropertyChanges {
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
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
                    font.family: "Bruno Ace"
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
                    x: 114
                    y: 13
                    width: 338
                    height: 45
                    placeholderTextColor: "#aaaaff"
                    font.pointSize: 20
                    font.family: "Bruno Ace"
                    scale: 1.2
                    placeholderText: qsTr("wprowadź tag RFID")
                }

                PropertyChanges {
                    target: przyciskSzukaj
                    x: 237
                    y: 288
                    width: 144
                    height: 40
                    visible: false
                    text: qsTr("szukaj")
                    font.pointSize: 15
                    font.family: "Bruno Ace"
                    scale: 1.2
                    anchors.horizontalCenterOffset: "-1"
                    anchors.verticalCenterOffset: 7
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
                    x: 10
                    y: 232
                    width: 552
                    height: 107
                    color: "#000000"
                    font.pixelSize: 19
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                    scale: 1.2
                    font.bold: false
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
                    target: ladowanie
                    x: 934
                    y: 520
                    visible: false
                    scale: 1.5
                    anchors.horizontalCenterOffset: 0
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

                PropertyChanges {
                    target: spinPolka
                    visible: false
                }

                PropertyChanges {
                    target: spinKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: textSzafa
                    visible: false
                }

                PropertyChanges {
                    target: textPolka
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    visible: false
                }

                PropertyChanges {
                    target: spinSzafa
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: "-174"
                    y: 110
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: pathView
                    visible: false
                }

                PropertyChanges {
                    target: loginpage
                    visible: false
                }

                PropertyChanges {
                    target: userpage
                    visible: false
                }

                PropertyChanges {
                    target: tag
                    x: 677
                    y: 237
                    width: 565
                    height: 338
                    visible: false
                    color: "#00ffffff"
                    anchors.horizontalCenterOffset: "-6"
                }

                PropertyChanges {
                    target: usunpage
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    visible: false
                }

                PropertyChanges {
                    target: dodajpage
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    visible: false
                }

                PropertyChanges {
                    target: listTag
                    x: 641
                    y: 410
                    width: 580
                    height: 424
                }

                PropertyChanges {
                    target: listTytul
                    x: 0
                    y: 0
                    width: 626
                    height: 481
                }

                PropertyChanges {
                    target: scrollView
                    x: "-71"
                    y: 111
                    width: 792
                    height: 444
                }

                PropertyChanges {
                    target: kliknij1
                    x: 210
                    y: 651
                    width: 264
                    height: 96
                    visible: false
                    text: qsTr("gkjhgjvText")
                    font.pixelSize: 40
                }

                PropertyChanges {
                    target: widok3D
                    visible: true
                    anchors.topMargin: 820
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                }

                PropertyChanges {
                    target: mainPagebackground
                    visible: true
                    source: "widok3d/widokglowny1.png"
                }

                PropertyChanges {
                    target: mousewidokback
                    x: 1389
                    y: -124
                    visible: true
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }

                PropertyChanges {
                    target: image4
                    x: 985
                    y: 472
                }

                PropertyChanges {
                    target: lupa
                    x: 1372
                    y: -245
                    source: "images/lupa.png"
                }

                PropertyChanges {
                    target: prawo
                    x: 705
                    y: -321
                    width: 164
                    height: 239
                    visible: true
                    rotation: -30.709
                }

                PropertyChanges {
                    target: lewo
                    x: 640
                    y: -321
                    width: 164
                    height: 239
                    visible: true
                    rotation: 28.795
                }

                PropertyChanges {
                    target: lupapomniejszone
                    x: 1372
                    y: -139
                    visible: true
                    source: "images/lupapomn.png"
                }

                PropertyChanges {
                    target: tlo
                    x: 0
                    y: 0
                    width: 476
                    height: 219
                    visible: true
                    source: "widok3d/szafalewa.png"
                }

                PropertyChanges {
                    target: mousewidok
                    x: 13
                    y: 14
                    width: 73
                    height: 73
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                }

                PropertyChanges {
                    target: nrSzafy
                    x: 728
                    y: -452
                    visible: false
                    color: "#bbc9ce"
                    text: qsTr("8")
                    font.pixelSize: 80
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: mousewidok2
                    hoverEnabled: true
                    anchors.rightMargin: 91
                    anchors.bottomMargin: 161
                    anchors.leftMargin: -91
                    anchors.topMargin: -161
                    cursorShape: Qt.PointingHandCursor
                }

                PropertyChanges {
                    target: mousewidokb
                    x: 14
                    y: 14
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }

                PropertyChanges {
                    target: mousewidokb2
                    hoverEnabled: true
                    anchors.rightMargin: 13
                    anchors.bottomMargin: 8
                    anchors.leftMargin: 14
                    anchors.topMargin: 14
                    cursorShape: Qt.PointingHandCursor
                }

                PropertyChanges {
                    target: ramka
                    x: 901
                    y: -706
                    width: 218
                    height: 203
                    visible: false
                    source: "images/border.png"
                }
            },

            State {
                name: "tytul"

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
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
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
                    target: kliknij1
                    x: 121
                    y: 361
                    visible:false
                    width: 341
                    height: 188
                }

                PropertyChanges {
                    target: kliknij
                    x: 18
                    y: 209
                    width: 517
                    height: 47
                    visible: true
                    color: "#bbc9ce"
                    text: qsTr("Wyświetl więcej szczegółów")
                    font.pixelSize: 25
                    font.italic: true
                    font.underline: false
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: kliknij11
                    x: -228
                    y: 194
                    visible: true
                    scale: 0.4
                    rotation: 32.68
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
                    font.pixelSize: 19
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                    font.bold: false
                }

                PropertyChanges {
                    target: tytul
                    x: 94
                    y: 29
                    width: 338
                    height: 45
                    font.letterSpacing: 0.1
                    scale: 1.2
                    font.italic: false
                    font.wordSpacing: 0.1
                    font.family: "Bruno Ace"
                    font.pointSize: 20
                    baselineOffset: 21
                    placeholderTextColor: "#0d71e1"
                }

                PropertyChanges {
                    target: przyciskSzukaj1
                    width: 134
                    height: 36
                    visible: false
                    scale: 1.2
                    font.pointSize: 15
                    anchors.verticalCenterOffset: 17
                    anchors.horizontalCenterOffset: -1
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
                    x: -13
                    y: 248
                    width: 552
                    height: 107
                    font.pixelSize: 19
                    horizontalAlignment: Text.AlignHCenter
                    scale: 1.2
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
                    target: ladowanie
                    y: 520
                    visible: false
                    scale: 1.5
                    anchors.horizontalCenterOffset: 1
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

                PropertyChanges {
                    target: spinPolka
                    visible: false
                }

                PropertyChanges {
                    target: spinKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: textSzafa
                    visible: false
                }

                PropertyChanges {
                    target: textPolka
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    visible: false
                }

                PropertyChanges {
                    target: spinSzafa
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: -130
                    y: 125
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: pathView
                    visible: false
                }

                PropertyChanges {
                    target: loginpage
                    visible: false
                }

                PropertyChanges {
                    target: userpage
                    visible: false
                }

                PropertyChanges {
                    target: tag
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    x: 697
                    y: 227
                    width: 527
                    height: 332
                    color: "#00ffffff"
                    anchors.horizontalCenterOffset: 1
                }

                PropertyChanges {
                    target: usunpage
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    visible: false
                }

                PropertyChanges {
                    target: dodajpage
                    visible: false
                }

                PropertyChanges {
                    target: listTytul
                    x: 0
                    y: 0
                    width: 627
                    height: 483
                }

                PropertyChanges {
                    target: listTag
                    x: -583
                    y: 192
                    width: 1350
                    height: 548
                }

                PropertyChanges {
                    target: scrollView1
                    x: -134
                    y: 123
                    width: 835
                    height: 443
                }

                PropertyChanges {
                    target: mouseAreaListaa
                    cursorShape: Qt.PointingHandCursor
                }
            },

            State {
                name: "adminPage"

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
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
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
                    text: qsTr("wyloguj")
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
                    x: 108
                    y: 59
                    width: 209
                    height: 55
                    text: qsTr("wyszukaj")
                    scale: 1.2
                    font.family: "Bruno Ace"
                    font.pointSize: 16
                }

                PropertyChanges {
                    target: buttonWyswietl
                    x: 406
                    y: 60
                    width: 209
                    height: 55
                    text: qsTr("wyświetl zawartość")
                    scale: 1.2
                    font.family: "Bruno Ace"
                    font.pointSize: 12
                }

                PropertyChanges {
                    target: buttonDodaj
                    x: 108
                    y: 167
                    width: 209
                    height: 55
                    text: qsTr("dodaj")
                    scale: 1.2
                    font.family: "Bruno Ace"
                    font.pointSize: 16
                }

                PropertyChanges {
                    target: buttonUsun
                    x: 406
                    y: 168
                    width: 209
                    height: 55
                    text: qsTr("usuń")
                    scale: 1.2
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

                PropertyChanges {
                    target: spinPolka
                    visible: false
                }

                PropertyChanges {
                    target: spinKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: textSzafa
                    visible: false
                }

                PropertyChanges {
                    target: textPolka
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    visible: false
                }

                PropertyChanges {
                    target: spinSzafa
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: -130
                    y: 145
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: pathView
                    visible: false
                }

                PropertyChanges {
                    target: userpage
                    y: 247
                    width: 721
                    height: 282
                    visible: true
                    color: "#00ffffff"
                    anchors.horizontalCenterOffset: 1
                }

                PropertyChanges {
                    target: loginpage
                    visible: false
                }

                PropertyChanges {
                    target: tag
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    visible: false
                }

                PropertyChanges {
                    target: dodajpage
                    visible: false
                }

                PropertyChanges {
                    target: usunpage
                    visible: false
                }
            },

            State {
                name: "usunPage"

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
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
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
                    target: ladowanie
                    x: 294
                    y: 558
                    visible: false
                    anchors.horizontalCenterOffset: -1
                    scale: 1.5
                }

                PropertyChanges {
                    target: usunKsiazkeTytul
                    x: 186
                    y: 190
                    width: 259
                    height: 28
                    visible: false
                    placeholderText: qsTr("tytuł")
                    placeholderTextColor: "#0d71e1"
                    font.family: "Bruno Ace"
                    font.pointSize: 16
                }

                PropertyChanges {
                    target: usunPlik
                    x: 83
                    y: 252
                    width: 468
                    height: 38
                    visible: false
                    placeholderText: qsTr("ścieżka do pliku")
                    placeholderTextColor: "#0d71e1"
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
                    x: 185
                    y: 224
                    width: 259
                    height: 25
                    visible: false
                    placeholderText: qsTr("autor")
                    font.pointSize: 16
                    font.family: "Bruno Ace"
                    placeholderTextColor: "#0d71e1"
                }

                PropertyChanges {
                    target: usunKsiazkeTag
                    x: 185
                    y: 313
                    width: 259
                    height: 26
                    visible: false
                    placeholderText: qsTr("tag RFID")
                    placeholderTextColor: "#0d71e1"
                    font.pointSize: 16
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: lub
                    x: 185
                    y: 281
                    width: 259
                    height: 17
                    visible: false
                    text: qsTr("lub")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: comboBox
                    x: 147
                    y: 133
                    width: 347
                    height: 37
                    font.pointSize: 14
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: komunikatUsunieto
                    x: 73
                    y: 398
                    width: 476
                    height: 44
                    visible: false
                    text: qsTr("text")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: buttonUsunPlik
                    x: 247
                    y: 337
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
                    y: 353
                    width: 134
                    height: 31
                    visible: false
                    text: qsTr("usuń")
                    font.pointSize: 12
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: komunikatBlad
                    x: 185
                    y: 256
                    width: 259
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
                    visible: true
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: tagRF
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
                    target: userPageAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: spinPolka
                    visible: false
                }

                PropertyChanges {
                    target: spinKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: textSzafa
                    visible: false
                }

                PropertyChanges {
                    target: textPolka
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    visible: false
                }

                PropertyChanges {
                    target: spinSzafa
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: -147
                    y: 91
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: pathView
                    visible: false
                }

                PropertyChanges {
                    target: userpage
                    visible: false
                }

                PropertyChanges {
                    target: loginpage
                    visible: false
                }

                PropertyChanges {
                    target: tag
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    visible: false
                }

                PropertyChanges {
                    target: usunpage
                    x: 649
                    y: 118
                    width: 621
                    height: 469
                    color: "#00ffffff"
                    anchors.horizontalCenterOffset: 1
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    visible: false
                }

                PropertyChanges {
                    target: dodajpage
                    visible: false
                }

                PropertyChanges {
                    target: dodajjplikksiazek
                    visible: false
                }

                PropertyChanges {
                    target: dodajjksiazke
                    visible: false
                }

                PropertyChanges {
                    target: comboBoxDodaj
                    visible: false
                }

                PropertyChanges {
                    target: buttonDodajKsiazke
                    visible: false
                }

                PropertyChanges {
                    target: brakTytuluAutora
                    visible: false
                }

                PropertyChanges {
                    target: dodajKsiazkeAutor
                    visible: false
                }

                PropertyChanges {
                    target: dodajKsiazkeTytul
                    visible: false
                }
            },

            State {
                name: "wyswietlZawartosc"

                PropertyChanges {
                    target: haslo
                    x: 166
                    y: 267
                    width: 307
                    height: 36
                    visible: false
                    font.pixelSize: 25
                    font.family: "Bruno Ace"
                    echoMode: TextInput.Password
                    placeholderText: qsTr("hasło")
                    overwriteMode: true
                    font.italic: false
                    font.pointSize: 25
                    passwordCharacter: qsTr("●")
                }
                PropertyChanges {
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
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
                    placeholderText: qsTr("login")
                    font.italic: false
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
                    target: ladowanie
                    x: 294
                    y: 421
                    visible: false
                    scale: 1.5
                }

                PropertyChanges {
                    target: usunKsiazkeTytul
                    x: 186
                    y: 190
                    width: 259
                    height: 28
                    visible: false
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("tytuł")
                    placeholderTextColor: "#aaaaff"
                    font.pointSize: 16
                }

                PropertyChanges {
                    target: usunPlik
                    x: 83
                    y: 252
                    width: 468
                    height: 38
                    visible: false
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("ścieżka do pliku")
                    placeholderTextColor: "#aaaaff"
                    font.pointSize: 18
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
                    x: 185
                    y: 224
                    width: 259
                    height: 25
                    visible: false
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("autor")
                    placeholderTextColor: "#aaaaff"
                    font.pointSize: 16
                }

                PropertyChanges {
                    target: usunKsiazkeTag
                    x: 185
                    y: 313
                    width: 259
                    height: 26
                    visible: false
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("tag RFID")
                    placeholderTextColor: "#aaaaff"
                    font.pointSize: 16
                }

                PropertyChanges {
                    target: lub
                    x: 185
                    y: 281
                    width: 259
                    height: 17
                    visible: false
                    text: qsTr("lub")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: comboBox
                    x: 147
                    y: 133
                    width: 347
                    height: 37
                    visible: false
                    font.family: "Bruno Ace"
                    font.pointSize: 14
                }

                PropertyChanges {
                    target: komunikatUsunieto
                    x: 76
                    y: 391
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
                    y: 337
                    width: 134
                    height: 32
                    visible: false
                    text: qsTr("usuń")
                    font.family: "Bruno Ace"
                    font.pointSize: 12
                }

                PropertyChanges {
                    target: buttonUsunKsiazke
                    x: 247
                    y: 353
                    width: 134
                    height: 31
                    visible: false
                    text: qsTr("usuń")
                    font.family: "Bruno Ace"
                    font.pointSize: 12
                }

                PropertyChanges {
                    target: komunikatBlad
                    x: 185
                    y: 256
                    width: 259
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
                    visible: false
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: tagRF
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
                    target: userPageAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: 333
                    y: 90
                    width: 750
                    height: 539
                    flickableDirection: Flickable.HorizontalAndVerticalFlick
                    synchronousDrag: false
                    antialiasing: true
                    activeFocusOnTab: false
                    focus: false
                    highlightRangeMode: ListView.ApplyRange
                    keyNavigationWraps: true
                    cacheBuffer: 320
                    spacing: 5
                    snapMode: ListView.NoSnap
                    layoutDirection: Qt.RightToLeft
                    orientation: ListView.Vertical
                    visible: true
                }

                PropertyChanges {
                    target: spinPolka
                    x: -53
                    y: 237
                    width: 155
                    height: 30
                    scale: 1.4
                }

                PropertyChanges {
                    target: spinKsiazka
                    x: -53
                    y: 328
                    width: 155
                    height: 30
                    scale: 1.4
                }

                PropertyChanges {
                    target: textSzafa
                    x: -53
                    y: 111
                    width: 155
                    height: 22
                    text: qsTr("numer szafy")
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    scale: 1.4
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: textPolka
                    x: -53
                    y: 204
                    width: 155
                    height: 17
                    text: qsTr("numer półki")
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    scale: 1.4
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: textKsiazka
                    x: -53
                    y: 296
                    width: 155
                    height: 17
                    text: qsTr("numer książki")
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    scale: 1.4
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    x: 12
                    y: 12
                    width: 80
                    height: 28
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: spinSzafa
                    x: -53
                    y: 150
                    width: 155
                    height: 29
                    scale: 1.4
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    x: 12
                    y: 12
                    width: 80
                    height: 28
                    text: qsTr("cofnij")
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: pathView
                    x: -96
                    y: 432
                    width: 241
                    height: 130
                    pathItemCount: 8
                    dragMargin: 0
                    scale: 1.7
                }

                PropertyChanges {
                    target: userpage
                    visible: false
                }

                PropertyChanges {
                    target: loginpage
                    visible: false
                }

                PropertyChanges {
                    target: tag
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    visible: false
                }

                PropertyChanges {
                    target: usunpage
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    x: 461
                    y: 154
                    width: 686
                    height: 504
                    color: "#00ffffff"
                    anchors.horizontalCenterOffset: -250
                }

                PropertyChanges {
                    target: dodajpage
                    visible: false
                }

                PropertyChanges {
                    target: scrollView2
                    x: 323
                    y: 100
                    width: 686
                    height: 471
                }
            },

            State {
                name: "dodajPage"

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
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
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
                    x: 947
                    y: 65
                    width: 488
                    height: 53
                    text: qsTr("Wybierz gatunek jaki chcesz dodać")
                    font.pixelSize: 22
                    scale: 1.2
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
                    x: 0
                    y: 0
                    width: 279
                    height: 160
                    text: qsTr("Fantasy, science fiction")
                    z: 2
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
                    x: 1048
                    y: 213
                    width: 279
                    height: 160
                    layer.wrapMode: ShaderEffectSource.ClampToEdge
                    baselineOffset: 0
                    layer.smooth: true
                    layer.effect: swipeView
                    font.hintingPreference: Font.PreferVerticalHinting
                    antialiasing: false
                    focus: true
                    scale: 1.3
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

                PropertyChanges {
                    target: spinPolka
                    visible: false
                }

                PropertyChanges {
                    target: spinKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: textSzafa
                    visible: false
                }

                PropertyChanges {
                    target: textPolka
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    visible: false
                }

                PropertyChanges {
                    target: spinSzafa
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: 187
                    y: 117
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: pathView
                    visible: false
                }

                PropertyChanges {
                    target: userpage
                    visible: false
                }

                PropertyChanges {
                    target: loginpage
                    visible: false
                }

                PropertyChanges {
                    target: tag
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    visible: false
                }

                PropertyChanges {
                    target: usunpage
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    y: 251
                    visible: false
                    anchors.horizontalCenterOffset: 596
                }

                PropertyChanges {
                    target: dodajpage
                    x: 0
                    y: -65
                    width: 2160
                    height: 547
                    color: "#00ffffff"
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: -117
                }

                PropertyChanges {
                    target: image
                    x: 1178
                    y: 482
                    width: 289
                    height: 123
                    visible: true
                    source: "images/strzalka2.png"
                    scale: 1.5
                    rotation: 50.348
                }

                PropertyChanges {
                    target: image1
                    x: 992
                    y: 494
                    visible: true
                    rotation: -47.143
                    scale: 1.8
                    mirror: true
                }

                PropertyChanges {
                    target: mouseArea1
                    x: 68
                    y: 24
                    width: 133
                    height: 65
                    rotation: -50.223
                    drag.target: swipeView
                    acceptedButtons: Qt.LeftButton
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }

                PropertyChanges {
                    target: mouseArea
                    x: 3
                    y: 13
                    width: 110
                    height: 55
                    rotation: 47.009
                    drag.target: swipeView
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }
            },

            State {
                name: "dodajPage1"
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
                    target: logo
                    x: 356
                    y: -59
                    width: 828
                    height: 318
                    visible: true
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
                    y: 104
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
                    x: 86
                    y: 306
                    width: 470
                    height: 40
                    visible: false
                    font.pointSize: 18
                    font.family: "Bruno Ace"
                    placeholderTextColor: "#0d71e1"
                    placeholderText: qsTr("podaj ścieżkę do listy (.csv)")
                }

                PropertyChanges {
                    target: dodaj
                    x: 236
                    y: 387
                    width: 159
                    height: 38
                    visible: false
                    text: qsTr("dodaj")
                    font.pointSize: 13
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: text4
                    x: 42
                    y: 455
                    width: 548
                    height: 163
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
                    target: ladowanie
                    x: 301
                    y: 643
                    visible: false
                    anchors.horizontalCenterOffset: 0
                    scale: 1.8
                }

                PropertyChanges {
                    target: bladDodajPage1
                    x: 86
                    y: 358
                    width: 470
                    height: 16
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
                    font.family: "Bruno Ace"
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

                PropertyChanges {
                    target: spinPolka
                    visible: false
                }

                PropertyChanges {
                    target: spinKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: textSzafa
                    visible: false
                }

                PropertyChanges {
                    target: textPolka
                    visible: false
                }

                PropertyChanges {
                    target: textKsiazka
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlUserPage
                    visible: false
                }

                PropertyChanges {
                    target: spinSzafa
                    visible: false
                }

                PropertyChanges {
                    target: listView
                    x: -130
                    y: 110
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlAdminPage
                    visible: false
                }

                PropertyChanges {
                    target: pathView
                    visible: false
                }

                PropertyChanges {
                    target: userpage
                    visible: false
                }

                PropertyChanges {
                    target: loginpage
                    visible: false
                }

                PropertyChanges {
                    target: tag
                    visible: false
                }

                PropertyChanges {
                    target: tytulpage
                    visible: false
                }

                PropertyChanges {
                    target: wyswietlzawartosc
                    visible: false
                }

                PropertyChanges {
                    target: dodajpage
                    visible: false
                }

                PropertyChanges {
                    target: usunpage
                    x: 650
                    y: 124
                    width: 619
                    height: 595
                    visible: true
                    color: "#00ffffff"
                }

                PropertyChanges {
                    target: comboBoxDodaj
                    x: 137
                    y: 184
                    width: 358
                    height: 34
                    font.pointSize: 12
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: dodajjksiazke
                    x: -23
                    y: -223
                }

                PropertyChanges {
                    target: dodajjplikksiazek
                    x: -30
                    y: -265
                }

                PropertyChanges {
                    target: buttonDodajKsiazke
                    x: 245
                    y: 399
                    width: 130
                    height: 35
                    visible: false
                    font.pointSize: 13
                    font.family: "Bruno Ace"
                    rotation: 0.016
                }

                PropertyChanges {
                    target: brakTytuluAutora
                    x: 169
                    y: 366
                    width: 282
                    height: 21
                    visible: false
                    color: "#ff0000"
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Bruno Ace"
                }

                PropertyChanges {
                    target: dodajKsiazkeTytul
                    x: 169
                    y: 272
                    width: 282
                    height: 34
                    visible: false
                    color: "#000000"
                    placeholderTextColor: "#0d71e1"
                    font.pointSize: 19
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("tytuł")
                }

                PropertyChanges {
                    target: dodajKsiazkeAutor
                    x: 169
                    y: 318
                    width: 282
                    height: 34
                    visible: false
                    color: "#000000"
                    placeholderTextColor: "#0d71e1"
                    font.pointSize: 19
                    font.family: "Bruno Ace"
                    placeholderText: qsTr("autor")
                }

                PropertyChanges {
                    target: background
                    color: "#aaaaff"
                }
            },

            State {

            }]
    }
    Button {
        id: loginPage
        x: 97
        y: 145
        text: qsTr("cofnij")
        onClicked: {
            stronaGlowna.state = "mainPage"
            login.text= ""
            haslo.text= ""
        }
    }
    property string ktorastrona
    Button {
        id: cofinijDoGlownej1
        x: 97
        y: 145
        text: qsTr("cofnij")
        font.family: "Bruno Ace"
        onClicked: stronaGlowna.state = "mainPage"
    }
    Button {
        id: userPageMainPage
        x: 97
        y: 145
        visible: false
        text: qsTr("cofnij")
        font.family: "Bruno Ace"
        onClicked: stronaGlowna.state = "mainPage"
    }
    Button {
        id: cofnijDoWyszukajPage
        x: 69
        y: 110
        text: qsTr("Button")
        onClicked: {
            if (ktorastrona=="user"){
                stronaGlowna.state = "userPage"}
            else stronaGlowna.state = "userPage1"
        }
    }
    property string wybor
    property string id

    Button {
        id: cofnijDoDodajPage
        x: 38
        y: 147
        text: qsTr("cofnij")
        onClicked:
        {
            stronaGlowna.state = "dodajPage"
            swipeView.Component.onCompleted()
            if (strzalka==true && strzalka1==true){
                image.visible = true
                image1.visible = true
            }
            else if(strzalka){
                image.visible = true
                image1.visible = false
            }
            else{
                image1.visible = true
                image.visible = false
            }
        }
    }



    Button {
        id: usunPage
        x: 12
        y: 87
        text: qsTr("Button")
        onClicked: {
            stronaGlowna.state = "adminPage"
        }
    }

    Image {
        id: kliknij11
        x: 121
        y: 361
        visible: false
        source: "images/kliknij1.png"
        fillMode: Image.PreserveAspectFit
    }

    Button {
        id: userPageAdminPage
        x: 18
        y: 59
        text: qsTr("Button")
        onClicked: stronaGlowna.state = "adminPage"
    }

    Image {
        id: image2
        width: 100
        height: 100
        source: "qrc:/qtquickplugin/images/template_image.png"
        fillMode: Image.PreserveAspectFit
    }

    Button {
        id: buttonDodajPage
        x: 12
        y: 48
        text: qsTr("Button")
        onClicked: stronaGlowna.state = "adminPage"
    }

    Button {
        id: tagRF
        x: 18
        y: 59
        text: qsTr("Button")
        onClicked: {
            if (ktorastrona == "user"){
                stronaGlowna.state = "userPage"}
            else stronaGlowna.state = "userPage1"

        }
    }

    StateGroup {
        id: stateGroup
        states: [
            State {
                name: "State1"
            }
        ]
    }
    property int gatun
    property var listaKsiazek
    property var listaTag
    property var listaTytul
    function wyswietlZaw(){
        gatun = pathView.currentIndex-1
        listaKsiazek = biblioteka.wyswietlZawartosc(spinSzafa.value,spinPolka.value,spinKsiazka.value,gatun);
        return listaKsiazek
    }
    function znajdzTagg(){
        listaTag = biblioteka.znajdzKsiazkeTag(tagRFID.text)
        return listaTag
    }
    function znajdzTytull(){
        listaTytul = biblioteka.znajdzKsiazkeTytul(tytul.text)
        return listaTytul
    }

    Button {
        id: wyswietlUserPage
        x: 12
        y: 64
        text: qsTr("Button")
        onClicked: stronaGlowna.state = "userPage"
    }

    Button {
        id: wyswietlAdminPage
        x: 12
        y: 64
        text: qsTr("Button")
        onClicked: stronaGlowna.state = "adminPage"
    }

    BusyIndicator {
        id: ladowanie
        x: 814
        y: 487
        Layout.fillWidth: true
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: kliknij1
        x: 121
        y: 361
        visible: false
        text: qsTr("Text")
        font.pixelSize: 12
    }

    Text {
        id: kliknij
        x: 97
        y: 184
        visible: false
        text: qsTr("Text")
        font.pixelSize: 12
    }





    function usunPlikKsiazek(){
        if (usunPlik.text === ""){
            komunikatBladPliku.text = "Nie podano ścieżki do pliku"
            komunikatBladPliku.visible = true
        }
        else{
            komunikatUsunieto.text = "Trwa usuwanie"
            ladowanie.visible = true
            komunikatUsunieto.visible = true
            timer3.start()
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
    function dodawanieKsiazki(){
        if(dodajKsiazkeTytul.text === ""){
            brakTytuluAutora.text = "nie podano tytułu"
            brakTytuluAutora.visible = true
        }
        else if(dodajKsiazkeAutor.text === ""){
            brakTytuluAutora.text = "nie podano autora"
            brakTytuluAutora.visible = true
        }
        else{
            ladowanie.visible = true
            text4.text = "Trwa dodawanie książki: " + dodajKsiazkeTytul.text + " " + dodajKsiazkeAutor.text
            text4.visible = true
            delaytimerKsiazka.start()}
    }

    Timer {
        id: delaytimerKsiazka
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            ladowanie.visible = false
            var result = biblioteka.dodajKsiazke(dodajKsiazkeTytul.text,dodajKsiazkeAutor.text,id) + wybor
            text4.text = result
        }
    }

    Timer {
        id: delaytimer
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            ladowanie.visible = false
            var result = biblioteka.dodajKsiazkiZPlikuu(sciezka.text, id)
            text4.text = result
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
        id: timer3
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            ladowanie.visible = false
            var result = biblioteka.usunKsiazkePlik(usunPlik.text)
            komunikatUsunieto.text = result
        }
    }

}
