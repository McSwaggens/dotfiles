alias gst  'git status'
alias clr  'clear'
alias uefi 'systemctl reboot --firmware-setup'
alias scan 'rg --vimgrep "f_op" | kak -e "set buffer filetype make"'

function man
	command man $argv | kak -e 'set buffer filetype man'
end

export EDITOR=kak
export MOZ_ENABLE_WAYLAND=1
