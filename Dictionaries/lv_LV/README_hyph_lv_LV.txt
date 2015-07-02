# Latviešu valodas pārnesumu veidošanas trafaretu fails
# Latvian hyphenation dictionary for OpenOffice 1.0 and higher
#
# Copyright (C) 2004-2005 Jānis Vilims, jvilims@apollo.lv
#
# Šī bibliotēka tiek licencēta ar Lesser General Public Licence (LGPL) 2.1 nosacījumiem. 
# Licences nosacījumi pievienoti failā license.txt vai iegūstami tīmekļa vietnē  
# http://www.gnu.org/copyleft/lesser.txt 
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#

# Versija: 0.3.

#
# Pateicos Dr. Andrejam Spektoram par izrādīto sapratni un atbalstu


1. ĪSS BIBLIOTĒKAS RAKSTUROJUMS.
Pagaidām šis pārnesumu licējs ņem vērā tikai daļu no latviešu
valodas likumiem vārdu pārnešanai jaunā rindā. Šis risinājums
nepretendē uz pilnīgi pareizu latviešu valodas pārnesumu
izvietošanu.
Pārnesumu veidošanas noteikumi iegūti no tīmekļa vietnes http://www.liis.lv/latval/orto/vdjpr.htm (26.05.2004)

Versijas "kvalitātes" izmaiņu novētējumam izmantotā metodika: 
(izmantojot libhnj un salīdzinot ar A. Spektora laipni piedāvātās pārnesumu veidošanas programmas rezultātiem, pārbaudīti 16108 vārdi) 
795 atšķirības no 16108 vārdiem (95,06%)

2. VERSIJU IZMAIŅU PĀRSKATS:
v 0.3. ("kvalitāte" - 95,06%)
 1. Papildus apstrāde dubultajiem priedēkļiem (jāie, neaiz, u.c.)
 2. Šabloni papildināti ar atsevišķiem izņēmumu gadījumiem
 3. Papildus noteikumi, ja pēc priedēkļa seko patskanis.
v 0.2. ("kvalitāte" - 94,08%)
 1. Pievienoti pārnesumi izskaņām da-ma, ša-na
v 0.1. ("kvalitāte" - 90,10%)
 1. Patskaņu/līdzskaņu/patskaņu noteikumi P-LP, PL-LP, PL-LLP un PLL-LLP (P-patskanis, L-līdzskanis);
 2. dz, dž nesadalīšana;
 3. Priedēkļu noteikumi (varbūt ne visi tad, ja vārda sākumā ir vairāki priedēkļi);
 4. Izskaņu noteikumi (bet ne visos locījumos, tad, ja izskaņas var locīt).
 5. daži izņēmumi (saule, priekšnieks, u.c.)

Citi latviešu valodas noteikumi pārnešanai jaunā rindā pagaidām
nav ņemti vērā.

Bibliotēkas optimizācija, - tikai sākotnējā, iespējama tālāka
optimizācija, latviešu valodai neraksturīgu kombināciju izņemšana no
pārnesumu veidošanas noteikumiem.


3. MINIMĀLĀ UZSTĀDĪŠANAS INSTRUKCIJA.

3.1. PUSAUTOMĀTISKAIE VARIANTI (izmantojot DicOOo.sxw un lv_LV-pack.zip vai Latvian_DicOOo.sxw):
Nepieciešams: uzinstalēta OpenOffice.org versija.
Piezīme: Ja, atverot dokumentu, parādās drošības brīdinājums, nepieciešams atļaut programmas makrosu darbību, 
piemēram, angliskajā OO.org versijā nospiežot pogu "Enable macros".

3.1.1. Izmantojot DicOOo.sxw
Pagaidām, kamēr vārdnīca nav pilnībā iekļauta Lingucomponents projektā, droši zināms, ka darbojas 
instalācijas "offline" jeb nesaistes versija. Tiešsaistes versija varētu būt pieejama tuvākajā laikā.
Jāatver <OpenOffice.org fails DicOOo.sxw un jāseko instalācijas norādījumiem šajā dokumentā.
Jāizvēlas kāda dokumentā iekļautā saskarnes valoda un "offline" instalācijas versija."Offline" versijā jānorāda
ceļš uz lv_LV-pack.zip failu un jāseko instalācijas norādījumiem.

3.1.2. Izmantojot Latvian_DicOOo.sxw
Pagaidām, kamēr vārdnīca nav pilnībā iekļauta Lingucomponents projektā, droši zināms, ka darbojas 
instalācijas "offline" jeb nesaistes versija. Tiešsaistes versija varētu būt pieejama tuvākajā laikā.
Jāatver <OpenOffice.org fails Latvian_DicOOo.sxw un jāseko instalācijas norādījumiem šajā dokumentā.
Noklusētie uzstādījumi jau ir sagatavoti latviešu valodas palīglīdzekļu uzstādīšanai.

3.2 MANUĀLAIS VARIANTS:
Īsa instalācijas instrukcija uz Windows:
Pieņemot, ka jau tiek lietots J.Eisaka OoO pareizrakstības
pārbaudes rīks (http://sourceforge.net/projects/openoffice-lv/) un
tas ir instalēts atbilstoši dokumentācijai:
Jābeidz darbs ar visām OoO programmām (arī "Exit Quickstarter", ja
tas ticis palaists)
Atpakojam pievienotos failus.
Daudzlietotāju instalācijas gadījumā (citos gadījumos rīkoties
līdzīgi, atbilstoši http://sourceforge.net/projects/openoffice-lv/
atrodamai instrukcijai):
Ja nav pievienotas citas valodu bibliotēkas, tad visus failus
(izņemot licence.txt un lasimani.txt) iekopējam folderī
<OpenOffice dir>/share/dict/
Ja ir pievienotas citas valodu bibliotēkas, tad folderī
<OpenOffice dir>/share/dict/ jāiekopē tikai fails hyph_lv_LV.dic
un jāatver <OpenOffice dir>/share/dict/ direktorijā esošais fails
dictionary.lst un tam jāpievieno jauna rindiņa "HYPH lv LV
hyph_lv_LV"
Palaižam kādu OoO programmu.

No Tools->Options->Language settings->Writing Aids->(Edit poga pie
"Writing Aids") izvēlamies latviešu valodu un uzstādām iespēju
izmantot latviešu valodas pārnesumu licēju.
Lietojam pārnesumu veidošanas rīku (uzstādot izmantotā vai
noklusētā teksta stila definīcijā TextFlow->Hyphenation-
>Automatic=On).

Instalācija uz citām platformām jāveic līdzīgi. Šajā gadījumā
jāizmanto padomi no tīmekļa vietnes
http://sourceforge.net/projects/openoffice-lv/

CITI NOSACĪJUMI UN IZMANTOŠANAS IESPĒJAS
Ja ir idejas, kā šo varētu uzlabot, vai ir zināma realizācija
latviešu valodas pārnesumu salicējam Tex, var veikt uzlabojumus
vai izmantot jau pieejamos rīkus no Tex.
Spriežot pēc pieejamās informācijas, šo pārnesumu veidošanas failu
varētu izmantot arī Tex, attiecīgi papildinot/izmainot galvenes
sadaļu.

Ievērojam licences nosacījumus.
