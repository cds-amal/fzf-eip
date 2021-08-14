#!/usr/bin/env bash

if [ ! -d EIPs ]; then
  printf "Clone EIP repository"
  git clone --depth 1 https://github.com/ethereum/EIPs.git
fi

the_eips=$(find EIPs/EIPS -type f -name \*.md | sed -E 's:.+-::' | sed 's:.md::' | sort -n)
for no in $the_eips; do
  file="EIPs/EIPS/eip-$no.md"

  # extract lines from ^eip to ^title forming tuples
  # delete header of tuples, "header: data"
  # convert linefeeds to spaces
  # squash spaces
  sed -n '/^eip:/,/^title/p;' "$file" | sed -E 's/^[^:]+://' | tr '\n' ' ' | tr -s ' '

  # separate entries
  printf "\n"
done | sed -E 's/(eip|title):/ /g' | sed -E '/^$/d' >.cache/eip-index

[[ -d EIPs ]] && rm -rf EIPs
