#!/bin/bash

# Function to send SMS
send_sms() {
    recipient="$1"
    message="$2"
    termux-sms-send -n "$recipient" "$message"
    echo "SMS sent to $recipient"
}

# Read user input
read -p "Enter recipient's phone number: " recipient
read -p "Enter the message: " message
read -p "Enter the time to send the SMS (HH:MM format): " send_time

# Convert send_time to timestamp
current_date=$(date +%Y-%m-%d)
timestamp=$(date -d "$current_date $send_time" +%s)
current_timestamp=$(date +%s)

# Calculate delay time
if [[ $timestamp -lt $current_timestamp ]]; then
    delay=0
else
    delay=$((timestamp - current_timestamp))
fi

# Sleep for delay time
sleep $delay

# Send SMS
send_sms "$recipient" "$message"
