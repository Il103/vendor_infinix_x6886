#!/vendor/bin/sh

#USD: create memcg:nowb to anti-wb key-process for MF2.3 by dongyun.liu 20240821 start
## This is a shell script to set key-process to /dev/memcg/nowb/task commands at boot-compeleted step
## Do NOT add other commands in this file otherwise you may violate its SELinux policy
PROC_FILE="/proc/memfusion/keyproc"
TARGET_FILE="/dev/memcg/nowb/cgroup.procs"
while IFS= read -r line; do
    if echo "$line" | grep -qE '^[0-9]+$'; then
        if [ "$line" -gt 0 ]; then
            echo "$line" > "$TARGET_FILE"
        fi
    fi
done < "$PROC_FILE"
#USD: create memcg:nowb to anti-wb key-process for MF2.3 by dongyun.liu 20240821 end

