declare-option -docstring "shell command run to search for file" str xxcmd 'fd'

provide-module xx %{

require-module jump











require-module fifo

define-command -params .. -docstring %{
    xx [<arguments>]: xx utility wrapper
    All optional arguments are forwarded to the xx utility
    Passing no argument will perform a literal-string xx for the current selection
} xx %{
    evaluate-commands -try-client %opt{toolsclient} %{
        fifo -name *xx* -script %exp{
            trap - INT QUIT
            if [ $# -eq 0 ]; then
                case "$kak_opt_xxcmd" in
                ag\ * | git\ xx\ * | xx\ * | rg\ * | ripgrep\ * | ugrep\ * | ug\ *)
                    set -- -F "$kak_selection"
                    ;;
                ack\ *)
                    set -- -Q "$kak_selection"
                    ;;
                *)
                    set -- "$kak_selection"
                    ;;
                esac
            fi
            %opt{xxcmd} "$@" 2>&1 | rg --pcre2 '(?<!/)$' | awk '{ print length($0) " " $0; }' $file | sort -n | cut -d ' ' -f 2- | tr -d '\r'
        } -- %arg{@}
        set-option buffer filetype xx
        set-option buffer jump_current_line 0
    }
}
complete-command xx file 

hook -group xx-highlight global WinSetOption filetype=xx %{
    add-highlighter window/xx group
    add-highlighter window/xx/ regex "^([^:\n]+)?" 1:cyan
    add-highlighter window/xx/ line %{%opt{jump_current_line}} default+b
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/xx }
}

hook global WinSetOption filetype=xx %{
    hook buffer -group xx-hooks NormalKey <ret> xx-jump
    hook -once -always window WinSetOption filetype=.* %{ remove-hooks buffer xx-hooks }
}

define-command -hidden xx-jump %{
	try %{
		execute-keys 'x_'
		evaluate-commands -try-client %opt{jumpclient} %{
			edit %val{selection}
			focus
		}
	}
}

}

hook -once global KakBegin .* %{ require-module xx }
