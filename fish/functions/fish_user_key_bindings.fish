
function fish_user_key_bindings
    bind \n execute
    bind \r execute

    bind \ch backward-char
    bind \cj down-or-search

    bind \ck up-or-search
    bind \cl forward-char

    bind \ca beginning-of-line
    bind \ce end-of-line

    bind \cz fg
    bind \cf _fzf_search_directory

    bind -k backspace backward-delete-char
    bind \eH backward-kill-word

    bind --erase --preset \cd
end
