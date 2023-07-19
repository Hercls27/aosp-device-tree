#! /vendor/bin/sh

chown -h root.oem_2902 /sys/devices/platform/soc/10048000.tmc/coresight-tmc-etr/block_size
chmod 660 /sys/devices/platform/soc/10048000.tmc/coresight-tmc-etr/block_size
mkdir /config/stp-policy/coresight-stm:p_ost.policy
chmod 660 /config/stp-policy/coresight-stm:p_ost.policy
mkdir /config/stp-policy/coresight-stm:p_ost.policy/default
chmod 660 /config/stp-policy/coresight-stm:p_ost.policy/default
echo 0x10 > /sys/bus/coresight/devices/coresight-stm/traceid
chmod 666 /dev/byte-cntr
