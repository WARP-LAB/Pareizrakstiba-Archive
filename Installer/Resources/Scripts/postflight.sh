#!/bin/sh
sudo chown -R root:wheel /Library/Services/
sudo chmod -R 755 /Library/Services/
# trying a hack to get the app out of sanbox, so lsboxd won't cry
sudo open /Library/Services/Pareizrakstiba.service/
sudo sleep 3
sudo killall Pareizrakstiba
