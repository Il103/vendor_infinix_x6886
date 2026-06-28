#!/vendor/bin/sh

#SPD: add resmonitor and smartpanel bind small core by rui.fu 20230117 start
## This is a shell script for executing taskset commands at early-init step
## Do NOT add other commands in this file otherwise you may violate its SELinux policy

taskset -ap 3f `pidof -x resmonitor`
taskset -ap 3f `pidof -x com.transsion.smartpanel`
#SPD: add resmonitor and smartpanel bind small core by rui.fu 20230117 end
