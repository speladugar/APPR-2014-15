# Analiza podatkov s programom R, 2014/15

Avtor: Špela Dugar

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

PREDSTAVITEV TEME:
Za naslov mojega projekta sem si izbrala: Rodnost oz število živorojenih otrok v Sloveniji in primerjava z drugimi članicami Evropske Unije.
V projektu bom najprej natančneje analizirala število živorojenih otrok v Sloveniji. V tabeli bom navedla naslednje podatke, za zadnje 4 leta (od leta 2010 do leta 2013):
- ime regije (imenska spremenljivka)
- št. živorojenih otrok v posamezni regiji (številska spremenljivka)
- katerega rojstva je bilo največ; prvo, drugo, tretje, četrto ali več (urejenostna spremenljivka)
- število četrtega ali višjega rojstva (številska spremenljivka)
- št. živorojenih otrok v zakonski zvezi (številska spremenljivka)
- katerega rojstva je bilo največ v zakonski zvezi (urejenostna spremenljivka)
- št. živorojenih otrok izven zakonske zveze (številska spremenljivka)
- katerega rojstva je bilo največ izven zakonske zveze (urejenostna spremenljivka)

Kasneje pa bom analizirala še podatke glede števila živorojenih otrok v vseh članicah Evropske Unije od leta 2003 do leta 2013. V tabeli bom navedla naslednje podatke:
- ime države
- št. živorojenih otrok v določenem letu

 

CILJI:
V projektu bom najprej na podlagi zgornjih podatkov za Slovenijo ugotavljala, katera regija je imela največ rojstev v določenem letu, in katera v zadnjih 4 letih skupaj in navedla tudi število le-teh. Izračunala bom maksimalno in minimalno število rojstev za posamezno regijo ter povprečno število rojstev v zadnjih štirih letih za posamezno regijo. Posamezne regije bom primerjala med seboj tudi po tem, katerega rojstva je bilo največ (prvega, drugega, tretjega, četrtega ali več) in tako pridobila podatke o tem, v kateri regiji je bilo največ novopečenih mamic. Na podlagi podatka o število četrtega rojstva (ali več) pa bom ugotovila, kje v Sloveniji je največ mamic s štirimi ali več otroki.
Regije bom na nato primerjala še po tem, koliko otrok se je rodilo v zakonski zvezi (izven zakonske zveze) in katerega rojstva je bilo največ v določenem letu.
Na koncu pa bom na podlagi tabele o številu živorojenih otrok v članicah Evropske Unije ugotovila, v kateri državi je bilo največ rojstev, izračunala maksimalno in minimalno ter povprečno število rojstev v posamezni državi v zadnjih desetih letih, ter ugotovila koliko novih otrok se je rodilo v Evropski Uniji v posameznem letu.
Dobljene rezultate bom predstavila tudi na zemljevidu.

 

PODATKI:
Podatke za moj projekt sem pridobila na spletni strani Statističnega urada Republike Slovenije (1tabela) in EUROSTAT-a (2tabela). Z namenom, da spoznam več načinov uvoza podatkov v program R bom prvo tabelo uvozila v HTML obliki, drugo tabelo pa v CVS obliki.
Linki:  http://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=05J2012S&ti=&path=../Database/Dem_soc/05_prebivalstvo/30_Rodnost/10_05J20_rojeni_RE_OBC/&lang=2

http://epp.eurostat.ec.europa.eu/tgm/table.do?tab=table&init=1&plugin=1&language=en&pcode=tps00111

POROČILO O UVOZU PODATKOV:
Uvozila sem podatke za obe tabeli in sicer, prvo v csv obliki, drugo pa v html obliki.
Vsaki tabeli sem dodala tudi graf. Graf za prvo tabelo prikazuje število živorojenih otrok za leto 2013 po regijah. Graf za drugo tabelo pa prikazuje število živorojenih otrok v 28 Evropskih država skupaj, in sicer od leta 2002 do leta 2012.
 

## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
