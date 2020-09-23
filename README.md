# 64-bitify
Script to make your raspberry pi 64-bit. Works on all Raspberry Pi 4s running Raspberry Pi OS and Raspberry Pi OS-based OSes. This is alpha code and might brick your pi so MAKE SURE TO BACKUP! The code simply makes your kernal 64-bit, so you get a performance boost, while sill letting you run your 32-bit apps in a 32-bit userland. 

# Caveats 
There are caveats to this, but if you have any problems, then try disabling 64-bit with the script and reboot. If it still is broken, then maybe use that backup I told you to make. So far, it's been noted that Kodi runs a little slower because the renderer is blocked, Java (NOT openJDK) doesnt work,  KDE shell doesnt work either, and Box86 doesnt work without recompiling for 64 bit. Wolfaram and Mathamatica, doesnt work, but a workaround is listed here:https://www.raspberrypi.org/forums/viewtopic.php?t=250730.

# Download script
Download script to make your existing install 64-bit: `cd ~ && wget https://raw.githubusercontent.com/mobilegmYT/64-bitify/master/64-bitify.sh & chmod +x 64-bitify.sh & ./64-bitify.sh`

# Download OS
Download 64-bit img version of TwisterOS: http://download1980.mediafire.com/0d6s18sgqkcg/dbc83jpil9fj54e/TwisterOS-64bit.img.xz

# Performance
The pi isn't noticably faster, but if you do a high-performance task like creating a large file, then it certainly shaves some time off. Here is a benchmark I did with sysbenchmark(both tests ran the same settings of) `sysbench --test=cpu --cpu-max-prime=2000 --num-threads=4 run`

### Without 64-bit:
```
Test execution summary:
    total time:                          2.3952s
    total number of events:              10000
    total time taken by event execution: 9.5670
    per-request statistics:
         min:                                  0.93ms
         avg:                                  0.96ms
         max:                                 13.02ms
         approx.  95 percentile:               0.95ms

Threads fairness:
    events (avg/stddev):           2500.0000/11.90
    execution time (avg/stddev):   2.3918/0.00
```    

### With 64-bit:
```
Test execution summary:
    total time:                          1.7353s
    total number of events:              10000
    total time taken by event execution: 6.9303
    per-request statistics:
         min:                                  0.66ms
         avg:                                  0.69ms
         max:                                 15.75ms
         approx.  95 percentile:               0.68ms

Threads fairness:
    events (avg/stddev):           2500.0000/38.20
    execution time (avg/stddev):   1.7326/0.00
```    

# Help
Go to the Pi Labs discord https://discord.gg/QGVRzJ for help with this version of TwisterOS. My nametag is "Raspberry Pi News#7199".

# Credits
The code to make your pi 64-bit is from https://medium.com/for-linux-users/how-to-make-your-raspberry-pi-4-faster-with-a-64-bit-kernel-77028c47d653.
Thanks to MonkaBlyat and the sSupreme team for the code to enable and disable 64-bit
Thanks to the Pi Labs devs for the original Twister OS image.
