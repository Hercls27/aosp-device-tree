#!/system/bin/sh


echo PLAY bootup tone

agmplay vendor/etc/bootup.wav -D 0 -d 100 -i "MI2S-LPAIF-RX-PRIMARY"

echo STOP bootup tone


#disable
exit
