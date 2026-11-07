
#!/bin/bash

# Simple Interest Calculator

echo "================================"
echo "     Simple Interest Calculator"
echo "================================"

# Get inputs from user
read -p "Enter Principal Amount: " principal
read -p "Enter Annual Interest Rate (%): " rate
read -p "Enter Time (Years): " time

# Validate inputs
if ! awk -v p="$principal" -v r="$rate" -v t="$time" \
'BEGIN {
    if (p !~ /^[0-9]+([.][0-9]+)?$/ ||
        r !~ /^[0-9]+([.][0-9]+)?$/ ||
        t !~ /^[0-9]+([.][0-9]+)?$/ ||
        p <= 0 || r < 0 || t <= 0)
        exit 1
}'; then
    echo "Error: Please enter valid positive numbers."
    exit 1
fi

# Calculate simple interest
interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" \
'BEGIN { printf "%.2f", (p * r * t) / 100 }')

# Calculate total amount
total=$(awk -v p="$principal" -v i="$interest" \
'BEGIN { printf "%.2f", p + i }')

# Display results
echo "================================"
echo "Principal Amount : $principal"
echo "Interest Rate    : $rate%"
echo "Time Period      : $time years"
echo "--------------------------------"
echo "Simple Interest  : $interest"
echo "Total Amount     : $total"
echo "================================"
