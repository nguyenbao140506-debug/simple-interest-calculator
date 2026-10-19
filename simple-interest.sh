#!/usr/bin/env bash
# Calculate simple interest for educational purposes.
# Input: principal (p), annual percentage rate (r), time in years (t).
# Output: (p * r * t) / 100.
set -euo pipefail

read -r -p "Enter the principal amount: " p
read -r -p "Enter the annual interest rate (%): " r
read -r -p "Enter the time period in years: " t

number='^[0-9]+([.][0-9]+)?$'
if ! [[ $p =~ $number && $r =~ $number && $t =~ $number ]]; then
  echo 'Error: Please enter non-negative numbers for all three values.' >&2
  exit 1
fi

awk -v p="$p" -v r="$r" -v t="$t" 'BEGIN {
  printf "The simple interest is: %.2f\n", (p * r * t) / 100
}'
