#!/bin/sh

# Pareizrakstiba installer postflight

# major.minor.revision
SYSVER="$(sw_vers -productVersion)"
# major.minor
SYSVER_MIN="${SYSVER#*.}"
# minor
SYSVER_MIN="${SYSVER_MIN%%.*}"

# Set permissions based on OS version
if [ $SYSVER_MIN -gt "6" ];
then
sudo chown -R root:wheel /Library/Services/
sudo chmod -R 755 /Library/Services/
else
sudo chown -R root:admin /Library/Services/
sudo chmod -R 775 /Library/Services/
fi

if [ $SYSVER_MIN -gt "5" ];
then
sudo -u $USER defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool FALSE
sudo -u $USER defaults write -g NSPreferredSpellServerLanguage 'lv'
fi

sudo -u $USER  open -n /Library/Services/Pareizrakstiba.service/


