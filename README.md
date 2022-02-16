# Bitcraze pre-installed Raspian SD-card image 

**This repo is not currently being maintained**

This project is for Bitcraze pre-installed Raspian SD-card image but doesn't contain any code or image, it's used for tracking issues and improvements.

The SD-card image is based on the Wheezy version of Raspian for the Raspberry Pi. Nothing it removed from the image so you can use it for anything that you could use the origional image for. We have just added our stuff on top of it.

There's a list of what's included:

* UDEV rules for access to the Crazyradio and NRF bootloader

* crazyflie-clients-python and crazyradio-firmware pre-cloned

* pyusb

* UDEV rules to automatically launch the cfheadless client when Crazyradio is plugged in

* Driver for the Xbox 360 wireless controller and automatic start of the utilities

* Git

For more info see our [wiki](http://wiki.bitcraze.se/projects:crazyflie:binaries:raspberrypi "Bitcraze Wiki") and [hacks page](http://wiki.bitcraze.se/projects:crazyflie:hacks:rasberrypi "Raspberry hack page").

The image is generated from the raspberrypi.org release of Rasbian and by running bitctaze_raspberrypi.sh as pi user.

Downloading
-----------
The Bitcraze VM can either be downloaded via torrent or via direct download:

* Bitcraze Raspian image 0.3 [torrent](http://files.bitcraze.se/dl/cfpi-0_3.7z.torrent "Torrent") (prefered)
* Bitcraze Raspian image 0.3 [direct download](http://files.bitcraze.se/dl/cfpi-0_3.7z "Direct download")

How do I use it?
----------------
First of all you need to set up what controller and link settings you are using. This is done by editing the two files in the folder /home/pi named controller.conf and link.conf. They should only contain one row each.

To fly first insert the USB controller, then power on the Crazyflie and lastly insert the Crazyradio. This will start the cfheadless client and connect to the Crazyflie. In a few seconds you sould be ready to fly.

To quick either power off the Crazyflie or pull-out the Crazyradio.

In order to restart flying you have to pull-out the Crazyradio dongle and insert it again.

Flashing the Crazyradio
-----------------------
The Crazyradio firmware can be updated using the Raspberry Pi and doing the following steps:
* Connect the Raspberry Pi to your local network
* Power it on and SSH to it (user=raspberry and password=pi)
* Make sure that no controller is connected
* Insert the Crazyradio into a USB port on the Raspberry Pi
* Go into the crazyradio-firmware directory and download a firmware update
```
cd projects/crazyradio-firmware
wget https://bitbucket.org/bitcraze/crazyradio-firmware/downloads/cradio-0.52.bin
```
* Launch the Crazyradio bootloader and flash the firmware
```
python usbtools/launchBootloader.py
python usbtools/nrfbootload.py flash cradio-0.52.bin
```
* Make sure that the flashing is successful, otherwise retry again!
* Unplug the Crazyradio and re-insert it again. It's now running the new firmware.

Flashing the Crazyflie 1
------------------------
The Crazyflie firmware can be updated using the Raspberry Pi and doing the following steps:
* Connect the Raspberry Pi to your local network
* Power it on and SSH to it (user=pi and password=raspberry)
* Make sure that no controller is connected
* Insert the Crazyradio into a USB port on the Raspberry Pi
* Go into the crazyflie-clients-python directory and download a firmware update
```
cd projects/crazyflie-clients-python
wget https://bitbucket.org/bitcraze/crazyflie-firmware/downloads/Crazyflie_2014.01.0.bin
```
* Power off the Crazyflie and launch the bootloader
```
bin/cfloader flash Crazyflie_2014.01.0.bin
```
* Power on the Crazyflie within 10s and wait while the firmware is flashing
* The Crazyflie will automatically resetart and run the new firmware once the flashing is done

Troubleshooting
---------------
Try to pull-out and insert the Crazyradio. Then wait up to 10 seconds before you try to control the Crazyflie.

If you see the LED on the Crazyradio blinking green, then it's connected. If it's blinking red it means that it cannot connect to the Crazyflie.

Check logfile /tmp/cfheadless.log for messages

Logging in
----------
There's a new user created that can be used to log in:
```
User: pi
Pass: raspberry
```

