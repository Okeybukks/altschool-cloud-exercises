#!/usr/bin/bash


ram_file=$(pwd)/'ram_memory.log'

if [[ -e $ram_file ]]
then
	touch $ram_file

fi

echo "$(egrep "MemFree" /proc/meminfo) ===> $(date)" >> $ram_file


