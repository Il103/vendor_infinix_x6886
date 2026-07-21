#!/vendor/bin/sh

#SPD: add kswapd0 and kcompactd0 bind 0~6 core at ad8 for ADBHBSY-4652 ADBHBSY-5576 by MTK and changbing.wu 20221123 start
## This is a shell script for executing taskset commands at early-init step
## Do NOT add other commands in this file otherwise you may violate its SELinux policy

taskset -p 1f  `pgrep  kcompactd0`
#SPD: add kswapd0 and kcompactd0 bind 0~6 core at ad8 for ADBHBSY-4652 ADBHBSY-5576 by MTK and changbing.wu 20221123 end
