
function fish_user_key_bindings
    bind \n execute
    bind \r execute

    bind \ch backward-char
    bind \cj down-or-search

    bind \ck up-or-search
    bind \cl tryclear

    bind \ca beginning-of-line
    bind \ce end-of-line

    bind \cz fg

    bind backspace backward-delete-char
    bind \eH backward-kill-word

    bind --erase --preset \cd
end

function tryclear
	if test -z (commandline)
		commandline -f clear-screen
	else
		commandline -f forward-char
	end
end
