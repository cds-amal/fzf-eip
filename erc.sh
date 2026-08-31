#!/usr/bin/env bash
# FZF_EIP_HOME is not renamed FZF_ERC_HOME
function erc () {
  URL="https://github.com/ethereum/ERCs/blob/master/ERCS/erc"
  erc_number=$(
    fzf --no-sort \
      --prompt 'Ethereum Improvement Proposal (ERC) >' \
      --preview='echo {}' --preview-window=down:1:wrap \
      --height=80% <"$FZF_EIP_HOME/.cache/erc-index" \
      | awk '{ print $1 }'
  )

  # do nothing if nothing selected
  [[ -z $erc_number ]] && return
  (
    "${FZF_BROWSER}" "${URL}-${erc_number}.md" > /dev/null 2>&1 &
  )
}
