#!/usr/bin/bash
# RUN AS ROOT

# pacman -Sy
# pacman -Qu | wc -l > /home/uibxn/.Scripts/pacman_updates_count.txt

yaourt -Syua
yaourt -Qu | wc -l > /home/uibxn/.Scripts/pacman_updates_count.txt
