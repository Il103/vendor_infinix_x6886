#!/vendor/bin/sh

#SPD: add kswapd0 bind 0~5 core for XLBSSB-2493 by heyuan.li 20230217 start
## This is a shell script for executing taskset commands at early-init step
## Do NOT add other commands in this file otherwise you may violate its SELinux policy

taskset -ap ff `pidof -x kswapd0`
#SPD: add kswapd0 bind 0~5 core for XLBSSB-2493 by heyuan.li 20230217 end