#!/bin/sh

# Pareizrakstiba installer preflight

# major.minor.revision
SYSVER="$(sw_vers -productVersion)"
# major.minor
SYSVER_MIN="${SYSVER#*.}"
# minor
SYSVER_MIN="${SYSVER_MIN%%.*}"

CONSOLE_USER=$(ps aux | grep console | grep -v grep | cut -d' ' -f1)

# Kill Pareizrakstiba if running
syslog -s -l notice "Pareizrakstiba installer: Preflight: Killing and removing previous Pareizrakstiba if exists"
sudo killall Pareizrakstiba > /dev/null 2>&1
sudo rm -rf /Library/Services/Pareizrakstiba.service

# Reset preferred language to US English
if [ $SYSVER_MIN -gt "4" ];
then
syslog -s -l notice "Pareizrakstiba installer: Preflight: Set preffered language 10.5+ back to EN"
defaults write -g NSPreferredSpellServerLanguage 'en_US' > /dev/null 2>&1
sudo -u $CONSOLE_USER defaults write -g NSPreferredSpellServerLanguage 'en_US' 2>&1
else
syslog -s -l notice "Pareizrakstiba installer: Preflight: Set preffered language 10.4 back to EN"
defaults write -g NSPreferredSpellServerLanguage 'en_US' > /dev/null 2>&1
sudo -u $CONSOLE_USER defaults write -g NSPreferredSpellServerLanguage 'en_US' 2>&1
fi

# Flush Services
PBS="/System/Library/CoreServices/pbs"
if [ -f $PBS ] && [ $SYSVER_MIN -gt "4" ];
then
sudo killall "System Preferences" > /dev/null 2>&1
/System/Library/CoreServices/pbs -flush > /dev/null 2>&1
/System/Library/CoreServices/pbs -update > /dev/null 2>&1
fi

# Make Services dir if not exists
sudo mkdir -p /Library/Services/

# Remove Pareizrakstiba installer stuff
sudo rm -rf /Library/Application\ Support/Pareizrakstiba
sudo rm -rf /Library/Receipts/pareizrakstiba.pkg
sudo rm -rf /Library/Receipts/Uzstādīt\ Pareizrakstību.pkg
sudo rm -rf /Library/Receipts/Izdzēst\ Pareizrakstību.pkg
sudo rm -rf /Library/Receipts/Latviešu\ valodas\ afiksu\ tabula\ un\ vārdnīca.pkg
sudo rm -rf /Library/Receipts/Latviešu\ valodas\ pareizrakstības\ pārbaude.pkg

# Remove check spell and cocoAspell
sudo killall CheckSpell > /dev/null 2>&1
sudo killall cocoAspell > /dev/null 2>&1
sudo rm -rf /Library/Services/CheckSpell.service
sudo rm -rf /Library/Receipts/CheckSpell.mpkg
sudo rm -rf ~/Library/Services/CheckSpell.service
sudo rm -rf ~/Library/Services/cocoAspell.service
sudo rm -rf /Library/Application\ Support/cocoAspell
sudo rm -rf /Library/PreferencePanes/Spelling.prefPane
sudo rm -rf /usr/local/include/pspell
sudo rm -rf /usr/local/lib/aspell-0.60
sudo rm -rf /usr/local/bin/aspell
sudo rm -rf /usr/local/bin/aspell-import
sudo rm -rf /usr/local/bin/precat
sudo rm -rf /usr/local/bin/preunzip
sudo rm -rf /usr/local/bin/prezip
sudo rm -rf /usr/local/bin/prezip-bin
sudo rm -rf /usr/local/bin/pspell-config
sudo rm -rf /usr/local/bin/run-with-aspell
sudo rm -rf /usr/local/bin/word-list-compress
sudo rm -rf /usr/local/etc/aspell.conf
sudo rm -rf /usr/local/include/aspell.h
sudo rm -rf /usr/local/info/aspell-dev.info
sudo rm -rf /usr/local/info/aspell.info
sudo rm -rf /usr/local/lib/libaspell.*
sudo rm -rf /usr/local/lib/libpspell.*
sudo rm -rf /usr/local/man/man1/aspell-import.*
sudo rm -rf /usr/local/man/man1/aspell.*
sudo rm -rf /usr/local/man/man1/prezip-bin.*
sudo rm -rf /usr/local/man/man1/pspell-config.*
sudo rm -rf /usr/local/man/man1/run-with-aspell.*
sudo rm -rf /usr/local/man/man1/word-list-compress.*
sudo rm -rf ~/Library/Services/cocoAspell.service
sudo rm -rf /Library/Receipts/AspellEnglishDictionary.pkg
sudo rm -rf /Library/Receipts/aspell.pkg
sudo rm -rf /Library/Receipts/Spelling.pkg

