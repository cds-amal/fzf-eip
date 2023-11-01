#!/usr/bin/env bash

if [ ! -d ERCs ]; then
  printf "Clone ERC repository"
  git clone --depth 1 https://github.com/ethereum/ERCs.git
  # There is no `ERC-1` its `EIP-1` for both repos, so we just copy it
  cp ERCs/ERCS/eip-1.md ERCs/ERCS/erc-1.md
fi

the_ercs=$(find ERCs/ERCS -type f -name \*.md | sed -E 's:.+-::' | sed 's:.md::' | sort -n)
for no in $the_ercs; do
  file="ERCs/ERCS/erc-$no.md"

  # extract lines from ^erc to ^title forming tuples
  # delete header of tuples, "header: data"
  # convert linefeeds to spaces
  # squash spaces
  sed -n '/^erc:/,/^title/p;' "$file" | sed -E 's/^[^:]+://' | tr '\n' ' ' | tr -s ' '

  # separate entries
  printf "\n"
done | sed -E 's/(erc|title):/ /g' | sed -E '/^$/d' >.cache/erc-index

[[ -d ERCs ]] && rm -rf ERCs
