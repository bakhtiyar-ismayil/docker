#!/bin/bash
 
# Get the current time
now=$(date +"%H:%M:%S")
seconds=$(date +%S)
odd_or_even="EVEN"
 
# Check if seconds are odd or even
if (( seconds % 2 != 0 )); then
    odd_or_even="ODD"
fi
 
# Respond with the current time and odd/even status
echo -e "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\n$now $odd_or_even"
