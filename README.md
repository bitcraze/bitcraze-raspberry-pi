# Bitcraze pre-installed Raspian SD-card image 

This project is for Bitcraze pre-installed Raspian SD-card image but doesn't contain any code or image, it's used for tracking issues and improvements.

The SD-card image is based on the Wheezy version of Raspian for the Raspberry Pi. Nothing it removed from the image so you can use it for anything that you could use the origional image for. We have just added our stuff on top of it.

There's a list of what's included:

* UDEV rules for access to the Crazyradio and NRF bootloader

* crazyflie-pc-client and crazyradio-firmware pre-cloned

* pyusb and pygame

* UDEV rules to automatically launch the cfheadless client when Crazyradio is plugged in

* Driver for the Xbox 360 wireless controller and automatic start of the utilities

* Mercurial

For more info see our [wiki](http://wiki.bitcraze.se/projects:crazyflie:binaries:raspberrypi "Bitcraze Wiki") and [hacks page](http://wiki.bitcraze.se/projects:crazyflie:hacks:rasberrypi "Raspberry hack page").

Downloading
-----------
The Bitcraze VM can either be downloaded via torrent or via direct download:

* [Bitcraze Raspian image](https://mega.co.nz/#!HJpH2KDJ!bY-EdGtyxIRzOUu6xNVWnid_cco5wS-IQ6ELfc5Y1Q8 "Direct download") (limited to 6 simultanious downloads)

How do I use it?
----------------
First of all you need to set up what controller and link settings you are using. This is done by editing the two files in the folder /home/bitcraze named controller.conf and link.conf. They should only contain one row each.

To fly first insert the USB controller, then power on the Crazyflie and lastly insert the Crazyradio. This will start the cfheadless client and connect to the Crazyflie. In a few seconds you sould be ready to fly.

To quick either power off the Crazyflie or pull-out the Crazyradio.

In order to restart flying you have to pull-out the Crazyradio dongle and insert it again.

Troubleshooting
---------------
Try to pull-out and insert the Crazyradio. Then wait up to 10 seconds before you try to control the Crazyflie.

If you see the LED on the Crazyradio blinking green, then it's connected. If it's blinking red it means that it cannot connect to the Crazyflie.

Check logfile /tmp/cfheadless.log for messages

Logging in
----------
There's a new user created that can be used to log in:
```
User: bitcraze
Pass: crazyflie
```

