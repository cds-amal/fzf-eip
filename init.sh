if uname | grep -q Darwin; then
	export FZF_BROWSER='open'
elif uname -a | grep -q microsoft; then
	export FZF_BROWSER='/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'
  # export FZF_BROWSER='/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe'
else
	export FZF_BROWSER='xdg-open'
	# export FZF_BROWSER='brave'
	# export FZF_BROWSER='google-chrome'
	# export FZF_BROWSER='google-chrome-stable'
fi
source ${FZF_EIP_HOME}/eip.zsh
