#!/bin/bash
# Create Input-Shaper diagrams
echo '\nX-Axis:'
~/klipper/scripts/calibrate_shaper.py /tmp/resonances_x_*.csv -o ~/printer_data/config/calibration_data_x.png
echo '\nY-Axis:'
~/klipper/scripts/calibrate_shaper.py /tmp/resonances_y_*.csv -o ~/printer_data/config/calibration_data_y.png
