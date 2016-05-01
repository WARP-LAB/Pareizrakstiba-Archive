#!/bin/sh

# Pareizrakstiba installer postflight

# major.minor.revision
SYSVER="$(sw_vers -productVersion)"
# major.minor
SYSVER_MIN="${SYSVER#*.}"
# minor
SYSVER_MIN="${SYSVER_MIN%%.*}"

CONSOLE_USER=$(ps aux | grep console | grep -v grep | cut -d' ' -f1)

# Set permissions based on OS version
if [ $SYSVER_MIN -gt "6" ];
then
sudo chown -R root:wheel /Library/Services/
sudo chmod -R 755 /Library/Services/
else
sudo chown -R root:admin /Library/Services/
sudo chmod -R 775 /Library/Services/
fi

sudo killall Pareizrakstiba > /dev/null 2>&1
if [ $SYSVER_MIN -gt "4" ];
then
sudo -u $CONSOLE_USER /usr/bin/open -n /Library/Services/Pareizrakstiba.service
fi


# Flush Services
PBS="/System/Library/CoreServices/pbs"
if [ -f $PBS ] && [ $SYSVER_MIN -gt "4" ];
then
   sudo killall "System Preferences" > /dev/null 2>&1
   /System/Library/CoreServices/pbs -flush > /dev/null 2>&1
   /System/Library/CoreServices/pbs -update > /dev/null 2>&1
fi

# starting 10.6 we have automatic language detection
# which does not work, see https://www.mail-archive.com/cocoa-dev@lists.apple.com/msg46316.html
if [ $SYSVER_MIN -gt "5" ];
then
defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool FALSE > /dev/null 2>&1
sudo -u $CONSOLE_USER defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool FALSE > /dev/null 2>&1
fi

if [ $SYSVER_MIN -gt "4" ];
then
defaults write -g NSPreferredSpellServerLanguage 'lv' > /dev/null 2>&1
sudo -u $CONSOLE_USER defaults write -g NSPreferredSpellServerLanguage 'lv' 2>&1
fi




