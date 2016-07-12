# DUE laser control
A high resolution analog-digital digital-analog converter with PID to control
a Sirah Matisse ring laser for time resolved spectral scans.

## Hardware
An Arduino Due is used to control an AD7176 AD converter connected to 
a strain gauge measuring the laser reference cavity length and
an AD5791 DA converter that is used to drive the piezo amplifier for
the piezo that changes the reference cavity length.

We use the EVAL-AD7176-2SDZ and EVAL-AD5791SDZ reference boards with
a custom power supply (layout TBD).

A breakout board to adapt the existing RJ50 connector to SMA is also provided.

## Firmware
Right now, this can only be built with the Arduino IDE, but an addition to 
https://github.com/sudar/Arduino-Makefile is being worked on.

## Software
https://github.com/Ulm-IQO/qudi will be used to provide a user-friendly interface.
