function __todo_auto_display --on-variable PWD
    set -l todo_file ""
    if test -f TODO.md
        set todo_file TODO.md
    else if test -f todo.md
        set todo_file todo.md
    end

    if test -n "$todo_file"
        if command -q glow
            glow "$todo_file" | string trim | string match -rv '^\s*$'
        else
            cat "$todo_file"
        end
    end
end
