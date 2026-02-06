set fish_greeting

alias gst    'git status'
alias co     'git checkout'
alias clr    'clear'
alias uefi   'systemctl reboot --firmware-setup'
alias config 'kak ~/.config/fish/config.fish'
alias dc     'make clean'
alias log    'kak -e "git log"'
alias rs     'git restore --staged'

function s
	command kak -e "grep $argv"
end

function xx
	set editor kak

	# If no arguments are passed, call fzf
	if test (count $argv) -eq 0
		set file (fzf)
		if test -n "$file"
			$editor "$file"
		end
		else
		# If an argument is passed, search for it using fd
		set search_term $argv[1]
		set results (fd "$search_term")

		# Check how many files were found
		set result_count (count $results)

		if test $result_count -eq 1
			# If exactly one file is found, open it in the editor
			$editor "$results"
		else if test $result_count -gt 1
			# If multiple files are found, run command with kak
			kak -e "xx $argv"
		end
	end
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
	string join '' -- (set_color grey) (prompt_pwd --full-length-dirs 2) (set_color normal) ' > '
end

fish_add_path -m ~/.local/bin

if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

eval (keychain --eval --quiet id_ed25519)

export EDITOR=kak
export MOZ_ENABLE_WAYLAND=1

source ~/spoopy.fish

function ai
    # Read stdin if piped
    set stdin_content ""
    if not isatty stdin
        while read -l line
            set stdin_content "$stdin_content$line\n"
        end
    end

    # Combine arguments
    set arg_content (string join " " $argv)

    # Build final prompt
    if test -n "$stdin_content" -a -n "$arg_content"
        set prompt "$arg_content\n\nInput:\n$stdin_content"
    else if test -n "$stdin_content"
        set prompt "$stdin_content"
    else if test -n "$arg_content"
        set prompt "$arg_content"
    else
        echo "Usage:"
        echo "  ai <question>"
        echo "  <command> | ai <instruction>"
        return 1
    end

    set response (curl -s "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash-exp:generateContent" \
        -H "Content-Type: application/json" \
        -H "x-goog-api-key: $GEMINI_API_KEY" \
        -d "{
            \"contents\": [{
                \"parts\": [{
                    \"text\": $(printf '%s' "$prompt" | jq -Rs .)
                }]
            }]
        }")    

    # Check for errors
    set error_msg (echo $response | jq -r '.error.message // empty')
    if test -n "$error_msg"
        echo "❌ Gemini API Error:" >&2
        echo $error_msg >&2
        return 1
    end
    
    # Extract and display the content
    echo $response | jq -r '.candidates[0].content.parts[0].text' | glow
end
