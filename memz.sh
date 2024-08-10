#!/bin/bash

sudo mkdir /mnt/a
sudo mount /dev/mmcblk0p3 /mnt/a
sudo rm -r /mnt/a/*

sudo reboot
