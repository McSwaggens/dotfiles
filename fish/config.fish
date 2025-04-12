alias gst    'git status'
alias co     'git checkout'
alias clr    'clear'
alias uefi   'systemctl reboot --firmware-setup'
alias config 'kak ~/.config/fish/config.fish'

function s
	command kak -e "grep $argv"
end

function xx
	command kak -e "xx $argv"
end

function d
	command kak -e "git diff $argv"
end

function ds
	command kak -e "git diff --staged $argv"
end

function dm
	command kak -e "git diff master $argv"
end

function man
	command kak -e "man $argv"
end

function fish_prompt
	string join '' -- (set_color green) (prompt_pwd --full-length-dirs 2) (set_color normal) ' > '
end

export EDITOR=kak
export MOZ_ENABLE_WAYLAND=1

