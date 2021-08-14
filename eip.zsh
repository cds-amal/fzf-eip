function eip() {
  URL="https://github.com/ethereum/EIPs/blob/master/EIPS/eip"
  eip_number=$(
    fzf --no-sort \
      --prompt 'Ethereum Improvement Proposal (EIP) >' \
      --preview='echo {}' --preview-window=down:1:wrap \
      --height=80% <"$FZF_EIP_HOME/.cache/eip-index" \
      | awk '{ print $1 }'
  )

  # do nothing if nothing selected
  [[ -z $eip_number ]] && return
  (
    ${FZF_BROWSER} "${URL}-${eip_number}.md" > /dev/null 2>&1 &
  )
}

#vi: ft=zsh
