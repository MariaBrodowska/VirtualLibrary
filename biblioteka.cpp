#include "biblioteka.h"
#include <QDebug>
#include <vector>
Biblioteka::Biblioteka(QObject *parent)
{}

int Biblioteka :: ileszaf[8] = {};
int Biblioteka :: ilepolek[8] = {};
int Biblioteka :: ileksiazek[8] = {};
int Biblioteka :: ileusunieto[8] = {};
int Biblioteka :: nrSzafyWBibliotece = 0;
Szafa &Biblioteka::getSzafa(int numerSzafy){
    if (numerSzafy <= szafy.size()) {
    return szafy[numerSzafy - 1];
    }
    else {
        throw out_of_range("Niepoprawny numer szafy");
    }}

void Biblioteka::dodajSzafe(const Szafa &szafa, int pozycja){
    szafy.insert(szafy.begin()+pozycja-1, szafa);
    //szafy.resize(pozycja,szafa);
    //szafy.push_back(szafa);
    cout << "~dodaje szafe do biblioteki~" <<endl;
}
Q_INVOKABLE QStringList  Biblioteka::znajdzKsiazkeTag(int tagID){
    cout << "Wyszukiwanie ksiazki z tagiem: "<< tagID << endl;
    bool znaleziono = false;
    string tag = to_string(tagID);
    int s = tag.length();
    QStringList listaWynikow = {};
    for (const auto& szafa : szafy) {
        for (const auto& polka : szafa.polki) {
            for (const auto& ksiazka : polka.ksiazki) {
                string tagksiazki = to_string(ksiazka.tagID);
                bool czy = false;
                    for (int i=0;i<s;i++){
                        if (tagksiazki[i]!=tag[i]){
                            czy = false;
                            break;
                        }
                        if (i==s-1){
                            czy = true;
                        }
                    }
                    if(czy){
                    QString element = QString::fromStdString(ksiazka.tytul + " " + ksiazka.autor + "\nTag RFID: " + to_string(ksiazka.tagID) + " Szafa: " + to_string(szafa.numer) + ", Polka: " + to_string(polka.numer) + ", Książka: " +to_string(ksiazka.numer) + ", gatunek: " + GatunekToString(ksiazka.gatunek));
                    listaWynikow.append(element);
                    znaleziono= true;}
                }
            }}
    if (!znaleziono) {
        QString element = QString::fromStdString("Nie znaleziono ksiazki o tagu: " + to_string(tagID));
        listaWynikow.append(element);
    }
    return listaWynikow;
}

string Biblioteka::zamienNaMaleLitery(const string &wyraz) {
    string wynik = wyraz;
    for (char &znak : wynik){
        znak = tolower(znak);
    }
    return wynik;
}

Q_INVOKABLE QStringList  Biblioteka::znajdzKsiazkeWidok3D(int tagID){
    QStringList listaWynikow = {};
    for (const auto& szafa : szafy) {
        for (const auto& polka : szafa.polki) {
                for (const auto& ksiazka : polka.ksiazki) {
                    if(ksiazka.tagID==tagID){
                    listaWynikow.append(QString::fromStdString(ksiazka.tytul));
                    listaWynikow.append(QString::fromStdString(ksiazka.autor));
                    listaWynikow.append(QString::fromStdString(to_string(ksiazka.tagID)));
                    listaWynikow.append(QString::fromStdString(to_string(szafa.numerWBibliotece)));
                    listaWynikow.append(QString::fromStdString(to_string(polka.numer)));
                    listaWynikow.append(QString::fromStdString(to_string(ksiazka.numer)));
                    }
                }
        }}
    return listaWynikow;
}
Q_INVOKABLE QStringList Biblioteka::znajdzKsiazkeTytul(QString tytul){
    cout << "Wyszukiwanie ksiazki o tytule: "<< tytul.toStdString() << endl;
    string wyszukiwana, znaleziona;
    QStringList listaWynikow = {};
    wyszukiwana = zamienNaMaleLitery(tytul.toStdString());
    bool znaleziono = false;
    int s = tytul.length();
    for (const auto& szafa : szafy) {
        for (const auto& polka : szafa.polki) {
            for (const auto& ksiazka : polka.ksiazki) {
                znaleziona = zamienNaMaleLitery(ksiazka.tytul);
                bool czy = false;
                    for (int i=0;i<s;i++){
                    if (wyszukiwana[i]!=znaleziona[i]){
                        czy = false;
                        break;
                    }
                    if (i==s-1)czy = true;
                    }
                if (czy) {
                    QString element = QString::fromStdString(ksiazka.tytul + " " + ksiazka.autor + "\nTag RFID: " + to_string(ksiazka.tagID) + ", Szafa: " + to_string(szafa.numer) + ", Polka: " + to_string(polka.numer) + ", Książka: " +to_string(ksiazka.numer) + ", gatunek: " + GatunekToString(ksiazka.gatunek));
                    listaWynikow.append(element);
                    znaleziono = true;
                }}
            }}
    if (!znaleziono) {
        QString element = QString::fromStdString("Nie znaleziono książki o tytule: " + tytul.toStdString());
        listaWynikow.append(element);
    }
    return listaWynikow;
}

void Biblioteka::dodajKsiazkiZPliku(string nazwaPliku, Gatunek gatunek){
    ifstream plik;
    plik.open(nazwaPliku.c_str());
    if (!plik.is_open()) {
        cout << "Nie udalo sie otworzyc pliku"<< endl;
        exit(0);}
    string tytul, autor;

    int numerKsiazki, numerSzafy, numerPolki;
    numerSzafy = ileszaf[gatunek];

    if (ilepolek[gatunek]%5 == 0 && ilepolek[gatunek] != 0){
        numerPolki = 5;
    }
    else {numerPolki = ilepolek[gatunek]%5;}

    if (ileksiazek[gatunek]%10 == 0 && ileksiazek[gatunek] != 0){
        numerKsiazki = 10;
    }
    else {numerKsiazki = ileksiazek[gatunek]%10;}

    while (getline(plik,tytul,';')) {
        getline(plik,autor);
        if (ileszaf[gatunek]==0 && ilepolek[gatunek]==0){
            numerSzafy=1;
            ileszaf[gatunek]++;
            nrSzafyWBibliotece++;
            Szafa szafa(numerSzafy,nrSzafyWBibliotece,gatunek);
            dodajSzafe(szafa,ileszaf[gatunek]);
            numerPolki=1;
            ilepolek[gatunek]++;
            Polka polka(numerPolki);
            getSzafa(numerSzafy).dodajPolke(polka,numerPolki);
        }
        if (numerPolki==5 && numerKsiazki==10){
            numerSzafy++;
            ileszaf[gatunek]++;
            nrSzafyWBibliotece++;
            Szafa szafa(numerSzafy,nrSzafyWBibliotece, gatunek);
            dodajSzafe(szafa,ileszaf[gatunek]);
            numerPolki = 1;
            ilepolek[gatunek]++;
            Polka polka(numerPolki);
            getSzafa(numerSzafy).dodajPolke(polka,numerPolki);
            numerKsiazki = 0;
        }
        if (numerPolki!=5 && numerKsiazki==10){
            numerPolki++;
            ilepolek[gatunek]++;
            Polka polka(numerPolki);
            getSzafa(numerSzafy).dodajPolke(polka,numerPolki);
            numerKsiazki = 0;
        }
        numerKsiazki++;
        ileksiazek[gatunek]++;
        Ksiazka ksiazka(tytul, autor, gatunek, tagID++,numerKsiazki);
        getSzafa(numerSzafy).getPolka(numerPolki).dodajKsiazke(ksiazka,numerKsiazki);

    }
    plik.close();
    cout << "Dodano ksiazki z pliku: " << nazwaPliku << ", o gatunku: " << gatunek << endl;
    cout << "Liczba stworzonych polek: " << numerPolki + (numerSzafy-1)*5 << endl;
    cout << "Liczba stworzonych szaf: " << numerSzafy << endl;
    cout << ileszaf[gatunek]+1 << endl;
    cout << ilepolek[gatunek]+1 << endl;
    cout << ileksiazek[gatunek] << endl;
    cout << numerSzafy << endl;
    cout << numerPolki << endl;
    cout << numerKsiazki << endl;
}
Gatunek Biblioteka :: convertToGatunek(const QString& qstr){
    if (qstr == "fantasy"){return fantasy;}
    else if (qstr == "historyczna"){return historyczna;}
    else if (qstr == "mlodziezowa"){return mlodziezowa;}
    else if (qstr == "przygodowa"){return przygodowa;}
    else if (qstr == "kryminal"){return kryminal;}
    else if (qstr == "horror"){return horror;}
    else if (qstr == "biografia"){return biografia;}
    else {return romans;}
}

string Biblioteka::qStringToString(QString z)
{
    return z.toStdString();
}

string Biblioteka :: GatunekToString(Gatunek g){
    switch (g){
        case fantasy:
            return "fantasy";
        case kryminal:
            return "kryminał";
        case historyczna:
            return "powieść historyczna";
        case mlodziezowa:
            return "powieść młodzieżowa";
        case przygodowa:
            return "powieść przygodowa";
        case horror:
            return "horror";
        case biografia:
            return "biografia";
        default:
            return "literatura obyczajowa, romans";
    }
}
QString Biblioteka :: GatunekToQString(Gatunek g){
    switch (g){
    case fantasy:
            return "fantasy";
    case kryminal:
    return "kryminał";
        case historyczna:
            return "powieść historyczna";
    case mlodziezowa:
            return "powieść młodzieżowa";
    case przygodowa:
            return "powieść przygodowa";
    case horror:
            return "horror";
    case biografia:
            return "biografia";
    default:
        return "literatura obyczajowa, romans";
    }
}
Q_INVOKABLE QString Biblioteka :: dodajKsiazkiZPlikuu(QString nazwaPliku, QString gat){
    Gatunek gatunek = convertToGatunek(gat);
    ifstream plik;
    string wynik;

    plik.open(nazwaPliku.toStdString());
    if(!filesystem::exists(nazwaPliku.toStdString())){
        cout << "Nie znaleziono pliku: " << nazwaPliku.toStdString() << endl;
        return "Nie znaleziono pliku:\n" + nazwaPliku;}
    else if (!plik.is_open()) {
        cout << "Nie udało się otworzyć pliku: " << nazwaPliku.toStdString() << endl;
        return "Nie udało się otworzyć pliku:\n" + nazwaPliku;}

    string tytul, autor;

    for (auto& szafa : szafy) {
        for (auto& polka : szafa.polki) {
            for(auto& ksiazka : polka.ksiazki){
                if (ksiazka.tagID >= tagID){
                    tagID = ksiazka.tagID+1;
                }
            }
        }}

    int numerKsiazki, numerSzafy, numerPolki;
    numerSzafy = ileszaf[gatunek];

    if (ilepolek[gatunek]%5 == 0 && ilepolek[gatunek] != 0){
        numerPolki = 5;
    }
    else {numerPolki = ilepolek[gatunek]%5;}

    if (ileksiazek[gatunek]%10 == 0 && ileksiazek[gatunek] != 0){
        numerKsiazki = 10;
    }
    else {numerKsiazki = ileksiazek[gatunek]%10;}

    for (auto& szafa : szafy) {
        for (auto& polka : szafa.polki) {
            if(polka.ksiazki.size() < 10 && polka.ksiazki.size() > 0 && gatunek==szafa.gatunek){ //jesli jakas polka w istniejacej juz szafie jest niepelna to dodaje ksiazki na koniec tej poki
                cout << "polka ksiazki size:  " <<   polka.ksiazki.size() << endl;
            if (ileusunieto[gatunek]>0){
                int ileKsiazek = polka.ksiazki.size();
                while (getline(plik,tytul,';')) {
                getline(plik,autor);
                ileKsiazek++;
                ileusunieto[gatunek]--;
                Ksiazka ksiazka(tytul, autor, gatunek, tagID++,ileKsiazek);
                getSzafa(szafa.numer).getPolka(polka.numer).dodajKsiazke(ksiazka,ileKsiazek);
                if (ileKsiazek == 10) break;
                }}
        }}}
    while (getline(plik,tytul,';')) { //jesli skoncza sie wolne istniejace juz miejsca tworze nowe polki i szafy
        getline(plik,autor);
        if (ileszaf[gatunek]==0 && ilepolek[gatunek]==0){
            numerSzafy=1;
            ileszaf[gatunek]++;
            nrSzafyWBibliotece++;
            Szafa szafa(numerSzafy,nrSzafyWBibliotece,gatunek);
            dodajSzafe(szafa,ileszaf[gatunek]);
            numerPolki=1;
            ilepolek[gatunek]++;
            Polka polka(numerPolki);
            getSzafa(numerSzafy).dodajPolke(polka,numerPolki);
        }
        if (numerPolki==5 && numerKsiazki==10){
            numerSzafy++;
            ileszaf[gatunek]++;
            nrSzafyWBibliotece++;
            Szafa szafa(numerSzafy,nrSzafyWBibliotece,gatunek);
            dodajSzafe(szafa,ileszaf[gatunek]);
            numerPolki = 1;
            ilepolek[gatunek]++;
            Polka polka(numerPolki);
            getSzafa(numerSzafy).dodajPolke(polka,numerPolki);
            numerKsiazki = 0;
        }
        if (numerPolki!=5 && numerKsiazki==10){
            numerPolki++;
            ilepolek[gatunek]++;
            Polka polka(numerPolki);
            getSzafa(numerSzafy).dodajPolke(polka,numerPolki);
            numerKsiazki = 0;
        }
        numerKsiazki++;
        ileksiazek[gatunek]++;
        Ksiazka ksiazka(tytul, autor, gatunek, tagID++,numerKsiazki);
        getSzafa(numerSzafy).getPolka(numerPolki).dodajKsiazke(ksiazka,numerKsiazki);
        cout << "s: " << numerSzafy << " p: " << numerPolki << endl;
        cout << "drugie s: " << ileszaf[gatunek] << " p: " << ilepolek[gatunek] << endl;
    }
    plik.close();
    QString wyn = "Dodano książki z pliku:\n" + nazwaPliku + "\no gatunku ";
    cout << "Dodano ksiazki z pliku: " << nazwaPliku.toStdString() << "\no gatunku " << gat.toStdString() << endl;
    return wyn;
}

QString Biblioteka::dodajKsiazke(QString tytul, QString autor, QString gat)
{
    Gatunek gatunek = convertToGatunek(gat);
    string tytull = qStringToString(tytul);
    string autorr = qStringToString(autor);
    //przypisanie nastepnego tagu
    for (auto& szafa : szafy) {
        for (auto& polka : szafa.polki) {
            for(auto& ksiazka : polka.ksiazki){
                if (ksiazka.tagID >= tagID){
                tagID = ksiazka.tagID+1;
                }}}}
    int numerKsiazki, numerSzafy, numerPolki;
    numerSzafy = ileszaf[gatunek];
    if (ilepolek[gatunek]%5 == 0 && ilepolek[gatunek] != 0){
        numerPolki = 5;
    }
    else {numerPolki = ilepolek[gatunek]%5;}
    if (ileksiazek[gatunek]%10 == 0 && ileksiazek[gatunek] != 0){
        numerKsiazki = 10;
    }
    else {numerKsiazki = ileksiazek[gatunek]%10;}
    //sprawdzenie czy jest wolne miejsce w istniejacych juz szafach
    //zmienne statyczne przechowuja inf na jakim indeksie skonczylismy dodawac
    for (auto& szafa : szafy) {
        for (auto& polka : szafa.polki) {
            cout << "przed polka ksiazki size:  " <<   polka.ksiazki.size() << endl;
            if(polka.ksiazki.size() < 10 && polka.ksiazki.size() > 0 && gatunek==szafa.gatunek){ //jesli jakas polka w istniejacej juz szafie jest niepelna to dodaje ksiazki na koniec tej poki
                int ileKsiazek = polka.ksiazki.size();
                cout << "czytam" << endl;
                ileKsiazek++;
                if (ileusunieto[gatunek]>0){
                    ileusunieto[gatunek]--;
                    Ksiazka ksiazka(tytull, autorr, gatunek, tagID++,ileKsiazek);
                    polka.dodajKsiazke(ksiazka,ileKsiazek);
                }
                else{
                    numerKsiazki++;
                    ileksiazek[gatunek]++;
                    Ksiazka ksiazka(tytull, autorr, gatunek, tagID++,numerKsiazki);
                    polka.dodajKsiazke(ksiazka,numerKsiazki);
                }
                cout << "po polka ksiazki size:  " <<   polka.ksiazki.size() << endl;
                return "Dodano książkę: " + tytul + " " + autor + "\no gatunku : "; //dodajemy tylko jedna
                }
    }}
    cout << "koniec petli" << endl;
    //jesli nie ma miejsca przypisujemy lokalizacje ostatnio dodanej ksiazki z danego gatunku
    if (ileszaf[gatunek]==0 && ilepolek[gatunek]==0){
    cout << "p 1  " << endl;
    numerSzafy=1;
    ileszaf[gatunek]++;
    nrSzafyWBibliotece++;
    Szafa szafa(numerSzafy,nrSzafyWBibliotece,gatunek);
    dodajSzafe(szafa,ileszaf[gatunek]);
    numerPolki=1;
    ilepolek[gatunek]++;
    Polka polka(numerPolki);
    getSzafa(numerSzafy).dodajPolke(polka,numerPolki);
    }
    else if (numerPolki==5 && numerKsiazki==10){
    cout << "p 2  " << endl;
    numerSzafy++;
    ileszaf[gatunek]++;
    nrSzafyWBibliotece++;
    Szafa szafa(numerSzafy, nrSzafyWBibliotece,gatunek);
    dodajSzafe(szafa,ileszaf[gatunek]);
    numerPolki = 1;
    ilepolek[gatunek]++;
    Polka polka(numerPolki);
    getSzafa(numerSzafy).dodajPolke(polka,numerPolki);
    numerKsiazki = 0;
    }
    else if (numerPolki!=5 && numerKsiazki==10){
    cout << "p 3  " << endl;
    numerPolki++;
    ilepolek[gatunek]++;
    Polka polka(numerPolki);
    getSzafa(numerSzafy).dodajPolke(polka,numerPolki);
    numerKsiazki = 0;
    }
    numerKsiazki++;
    ileksiazek[gatunek]++;
    Ksiazka ksiazka(tytull, autorr, gatunek, tagID++,numerKsiazki);
    getSzafa(numerSzafy).getPolka(numerPolki).dodajKsiazke(ksiazka,numerKsiazki);
    return "Dodano książkę: " + tytul + " " + autor + "\no gatunku : ";
}

Q_INVOKABLE QString Biblioteka::usunKsiazkeTag(int tagID){
    cout << "Usowanie ksiazki z tagiem: "<< tagID << endl;
    string wynik;
    for (auto& szafa : szafy) {
        for (auto& polka : szafa.polki) {
                auto it = polka.ksiazki.begin();
            while(it != polka.ksiazki.end()) {
                    if (it->tagID == tagID) {
                        wynik = "Usunięto książkę z tagiem: "+to_string(it->tagID)+"\nTytul: "+it->tytul+"\nAutor: " + it->autor + "\nSzafa: " + to_string(szafa.numer) + ", Polka: " + to_string(polka.numer) + ", Książka: " +to_string(it->numer);
                        ileusunieto[it->gatunek]++;
                        polka.ksiazki.erase(it);
                        while(it != polka.ksiazki.end()){
                            it->numer--;
                            it++;
                        }
                        QString wyn = QString::fromStdString(wynik);
                        return wyn;
                    }
                    else{
                        it++;}
                }
            }}
    wynik = "Nie znaleziono ksiązki o tagu " + to_string(tagID);
    QString wyn = QString::fromStdString(wynik);
    return wyn;
}
Q_INVOKABLE QString Biblioteka::usunKsiazkeTytul(QString tytul,QString autor){
    cout << "Usowanie ksiazki o tytule: "<< tytul.toStdString() << "autorze: " << autor.toStdString() << endl;
    string wynik="", tytull, autorr;
    tytull = zamienNaMaleLitery(tytul.toStdString());
    autorr = zamienNaMaleLitery(autor.toStdString());
    for (auto& szafa : szafy) {
        for (auto& polka : szafa.polki) {
                auto it = polka.ksiazki.begin();
                while(it != polka.ksiazki.end()){
                    if (zamienNaMaleLitery(it->tytul) == tytull && zamienNaMaleLitery(it->autor) == autorr) {
                        wynik += "Usunięto książkę z tagiem: "+to_string(it->tagID)+"\nTytul: "+it->tytul+" Autor: " +  it->autor + "\nszafa: " + to_string(szafa.numer) + ", polka: " + to_string(polka.numer) + ", książka: " +to_string(it->numer) + " gatunek: " + GatunekToString(it->gatunek) + "\n\n";
                        ileusunieto[it->gatunek]++;
                        polka.ksiazki.erase(it);
                        while(it != polka.ksiazki.end()){
                            it->numer--;
                            it++;
                        }
                    }
                    else{
                        it++;}
                }}}
    if (wynik==""){
        wynik = "Nie znaleziono ksiazki o tytule: " + tytul.toStdString() + " i autorze: " + autor.toStdString();}
    cout << wynik << endl;
    QString wyn = QString::fromStdString(wynik);
    return wyn;
}
Q_INVOKABLE QString Biblioteka::usunKsiazkePlik(QString sciezka){
    cout << "Usowanie ksiazek z pliku: "<< sciezka.toStdString() << endl;
    string wynik, sciezkaa, tytul, autor;
    sciezkaa = sciezka.toStdString();

    ifstream plik;
    plik.open(sciezkaa);
    if(!filesystem::exists(sciezka.toStdString())){
        cout << "Nie znaleziono pliku: " << sciezkaa << endl;
        return "Nie znaleziono pliku:\n" + sciezka;}
    else if (!plik.is_open()) {
        cout << "Nie udało się otworzyć pliku: " << sciezkaa << endl;
        return "Nie udało się otworzyć pliku:\n" + sciezka;}

    while (getline(plik,tytul,';')) {
        getline(plik,autor);
        for (auto& szafa : szafy) {
            for (auto& polka : szafa.polki) {
                    auto it = polka.ksiazki.begin();
                    while(it != polka.ksiazki.end()){
                        if (it->tytul == tytul && it->autor == autor) {
                            ileusunieto[it->gatunek]++;
                            polka.ksiazki.erase(it);
                            while(it != polka.ksiazki.end()){
                                it->numer--;
                                it++;
                            }
                        }
                        else{
                            it++;}
                    }

            }}
    }
    plik.close();
    wynik = "Usunięto książki z pliku: \n" + sciezkaa;
    cout << wynik << endl;
    QString wyn = QString::fromStdString(wynik);
    return wyn;
}
Q_INVOKABLE QStringList Biblioteka::wyswietlZawartosc(int nrS, int nrP, int nrK, int gat){
    bool ws,wp,wk;
    ws = false;
    wp = wk = ws;
    if (nrS==0) ws = true;
    if (nrP==0) wp = true;
    if (nrK==0) wk = true;
    QStringList listaWynikow = {};
    if(gat == -1){
    for (const auto& szafa : szafy) {
        for (const auto& polka : szafa.polki) {
            for (const auto& ksiazka : polka.ksiazki) {
                if ((nrS==szafa.numer or ws==true) and (nrP==polka.numer or wp==true) and (nrK==ksiazka.numer or wk==true)){
                    QString element = QString::fromStdString(ksiazka.tytul + " " + ksiazka.autor + "\ntag RFID: " + to_string(ksiazka.tagID) + " s: " + to_string(szafa.numer) + ", p: " + to_string(polka.numer) + ", k: " +to_string(ksiazka.numer) +", g: " +GatunekToString(ksiazka.gatunek));
                    listaWynikow.append(element);
                }
            }
        }
    }}
    else{
    Gatunek gatunek = intToGatunek(gat);
    for (const auto& szafa : szafy) {
        for (const auto& polka : szafa.polki) {
            for (const auto& ksiazka : polka.ksiazki) {
                if(gatunek==ksiazka.gatunek){
                    if ((nrS==szafa.numer or ws==true) and (nrP==polka.numer or wp==true) and (nrK==ksiazka.numer or wk==true)){
                        QString element = QString::fromStdString(ksiazka.tytul + " " + ksiazka.autor + "\ntag RFID: " + to_string(ksiazka.tagID) + " s: " + to_string(szafa.numer) + ", p: " + to_string(polka.numer) + ", k: " +to_string(ksiazka.numer) +", g: " +GatunekToString(ksiazka.gatunek));
                        listaWynikow.append(element);
                    }
                }
            }}
    }}
    return listaWynikow;
}
Gatunek Biblioteka :: intToGatunek(int g){
    switch(g){
        case 0:
            return fantasy;
            break;
        case 1:
            return kryminal;
            break;
        case 2:
            return historyczna;
            break;
        case 3:
            return mlodziezowa;
            break;
        case 4:
            return przygodowa;
            break;
        case 5:
            return horror;
            break;
        case 6:
            return biografia;
            break;
        default:
            return romans;
            break;
    }
}
void Biblioteka::dodajZapis(string nazwaPliku, Gatunek gatunek){
    ifstream plik;
    plik.open(nazwaPliku);
    cout << "wczytywanie " << gatunek <<endl;
    if (!plik.is_open()) {
            cout << "Nie udalo sie otworzyc pliku"<< endl;
            exit(0);}
    string tytul, autor, ptag, pszafa, pszafab, ppolka, pksiazka;
    int tag, nrszafa,nrszafaB, nrpolka, nrksiazka;
    string linia, ileusuniete;
    getline(plik,linia,';');
    getline(plik,ileusuniete);
    ileusunieto[gatunek]=stoi(ileusuniete);
    getline(plik,linia);
    while (getline(plik,tytul,';')) {
            getline(plik,autor,';');
            getline(plik,ptag,';');
            getline(plik,pszafab,';');
            getline(plik,pszafa,';');
            getline(plik,ppolka,';');
            getline(plik,pksiazka);
            tag = stoi(ptag);
            nrszafaB = stoi(pszafab);
            nrszafa = stoi(pszafa);
            nrpolka = stoi(ppolka);
            nrksiazka = stoi(pksiazka);
            cout <<"1"<<endl;
            Szafa* s = nullptr;
            for (auto& szafa : szafy){
                if(szafy.empty()){
                    break;
                }
                if(szafa.numer==nrszafa && szafa.gatunek==gatunek){
                    s = &szafa;
                }
            }
            cout <<"1.5"<<endl;
            if (s==nullptr){
                nrSzafyWBibliotece++;
                Szafa szafa(nrszafa,nrszafaB,gatunek);
                ileszaf[gatunek]++;
                cout <<"1.7"<<endl;
                dodajSzafe(szafa,nrszafa);
                cout <<"1.8"<<endl;
                s = &getSzafa(nrszafa);
            }
            cout <<"2"<<endl;
            Polka* p = nullptr;
            for(auto& polka : s->polki){
                if(polka.numer==nrpolka && s->gatunek==gatunek){
                        p = &polka;
                    }
                }
            if(p==nullptr){
                Polka polka(nrpolka);
                ilepolek[gatunek]++;
                s->dodajPolke(polka,nrpolka);
                p = &s->getPolka(nrpolka);
            }
            cout <<"3"<<endl;
            Ksiazka ksiazka(tytul, autor, gatunek, tag, nrksiazka);
            ileksiazek[gatunek]++;
            p->dodajKsiazke(ksiazka,nrksiazka);
            cout <<"4"<<endl;
    }
    ileksiazek[gatunek]+=ileusunieto[gatunek]; //ileksiazek - na jakim indeksie zakonczylo sie dodawanie
    plik.close();
}
void Biblioteka :: odczytWszystkich(){
    dodajZapis("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\fantasy.csv",fantasy);
    dodajZapis("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\kryminal.csv",kryminal);
    dodajZapis("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\historyczna.csv",historyczna);
    dodajZapis("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\mlodziezowa.csv",mlodziezowa);
    dodajZapis("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\przygodowa.csv",przygodowa);
    dodajZapis("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\horror.csv",horror);
    dodajZapis("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\biografia.csv",biografia);
    dodajZapis("C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\romans.csv",romans);
}
void Biblioteka :: zapisDoPliku(Gatunek gatunek){
    ofstream plik;
    string nazwaPliku;
    switch (gatunek){
    case fantasy:
            nazwaPliku = "C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\fantasy.csv";
            break;
    case kryminal:
            nazwaPliku = "C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\kryminal.csv";
            break;
    case historyczna:
            nazwaPliku = "C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\historyczna.csv";
            break;
    case mlodziezowa:
            nazwaPliku = "C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\mlodziezowa.csv";
            break;
    case przygodowa:
            nazwaPliku = "C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\przygodowa.csv";
            break;
    case horror:
            nazwaPliku = "C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\horror.csv";
            break;
    case biografia:
            nazwaPliku = "C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\biografia.csv";
            break;
    default:
            nazwaPliku = "C:\\Users\\VivoBook\\Desktop\\VirtualLibrary\\vlibrary\\books\\romans.csv";
    }
    plik.open(nazwaPliku, ios_base::out);
    std::sort(szafy.begin(), szafy.end(), [](const Szafa& a, const Szafa& b) {
            return a.numerWBibliotece < b.numerWBibliotece;
    });
    if(!plik.is_open()){
            cout << "Nie udalo sie otworzyc pliku" << endl;
    }
    else{
            plik << "ile usunieto" << ";" << ileusunieto[gatunek] << "\n";
            plik << "tytul" << ";" << "autor" << ";" << "tag RFID" << ";" << "nr szafy w bibliotece" << ";" << "nr szafy" << ";" << "nr polki" << ";" << "nr ksiazki" << "\n";
            for (const auto& szafa : szafy) {
                for (const auto& polka : szafa.polki) {
                    for (const auto& ksiazka : polka.ksiazki) {
                        if(gatunek==ksiazka.gatunek){
                    plik << ksiazka.tytul << ";" << ksiazka.autor << ";" << to_string(ksiazka.tagID) << ";" << to_string(szafa.numerWBibliotece)  << ";" << to_string(szafa.numer) << ";" << to_string(polka.numer) << ";" << to_string(ksiazka.numer) << "\n";
                        }
                    }
            }}
            plik.close();
    }}
void Biblioteka :: zapisWszystkich(){
    cout << "Trwa zapisywanie do pliku" << endl;
    zapisDoPliku(fantasy);
    zapisDoPliku(kryminal);
    zapisDoPliku(historyczna);
    zapisDoPliku(mlodziezowa);
    zapisDoPliku(przygodowa);
    zapisDoPliku(horror);
    zapisDoPliku(biografia);
    zapisDoPliku(romans);
    cout << "Zapisano do pliku" << endl;
}
