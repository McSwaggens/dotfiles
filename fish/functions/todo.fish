function todo -d "Append a checklist item to todo.md or display it"
    if test (count $argv) -eq 0
        # Display the todo file
        if test -f TODO.md
            if command -q glow
                glow TODO.md | string trim | string match -rv '^\s*$'
            else
                cat TODO.md
            end
        else if test -f todo.md
            if command -q glow
                glow todo.md | string trim | string match -rv '^\s*$'
            else
                cat todo.md
            end
        else
            echo "No todo.md found in current directory."
        end
    else
        # Append a new checklist item
        echo "- $argv" >>todo.md
    end
end
