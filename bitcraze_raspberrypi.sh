set -x

CLIENT_VERSION=2014.12.3

#inctall required packages
sudo apt-get update
sudo apt-get -y install python-usb xboxdrv

#clone projects
cd
mkdir -p projects
cd projects
git clone https://github.com/bitcraze/crazyflie-clients-python
cd crazyflie-clients-python
git checkout $CLIENT_VERSION

#Create udev files
cat > 99-crazyflie.rules << __EOF__
SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", ATTRS{idProduct}=="7777", MODE=="0664", GROUP="plugdev", RUN+="/root/bin/cfheadless"
SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", ATTRS{idProduct}=="0101", MODE=="0664", GROUP="plugdev"
__EOF__
sudo mv 99-crazyflie.rules /etc/udev/rules.d/99-crazyflie.rules

cat > 99-xboxdrv.rules << __EOF__
SUBSYSTEM=="usb", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="0719", GROUP="plugdev", RUN+="/root/bin/xbox360"
__EOF__
sudo mv 99-xboxdrv.rules /etc/udev/rules.d/99-xboxdrv.rules

#Create launch scripts
cd
sudo mkdir -p /root/bin
cat > cfheadless << __EOF__
#!/bin/sh
if test "\$ACTION" = "add"
then
        /usr/bin/sudo -u pi /home/pi/start_cfheadless &
        echo $! > /tmp/cfheadless.pid
else
        killall -9 cfheadless
        if test -f /tmp/cfheadless.pid
        then
                PID=`cat /tmp/cfheadless.pid`
                kill -9 $PID
        fi
fi
__EOF__
sudo mv cfheadless /root/bin/cfheadless
sudo chmod +x /root/bin/cfheadless

cat > xbox360 << __EOF__
#!/bin/sh
if test "$ACTION" = "add"
then
        /usr/bin/xboxdrv &
else
        killall -9 xboxdrv
fi
__EOF__
sudo mv xbox360 /root/bin/xbox360
sudo chmod +x /root/bin/xbox360

cat > start_cfheadless << __EOF__
/home/pi/projects/crazyflie-clients-python/bin/cfheadless -u `cat /home/pi/link.conf` -i `cat /home/pi/controller.conf` > /tmp/cfheadless.log 2>&1
__EOF__
chmod +x start_cfheadless

echo PS3_Mode_1 > /home/pi/controller.conf
echo radio://0/10/250K > /home/pi/link.conf
