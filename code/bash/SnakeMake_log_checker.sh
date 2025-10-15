#!/bin/bash

for logfile in "$@"; do
    echo -e "Rules that failed in $logfile:"
    grep "Error in rule" "$logfile" | awk -F'rule ' '{print $2}' | awk -F':' '{print $1}' | sort | uniq
    echo
    printf '%0.s-' {1..50}
    echo
done

