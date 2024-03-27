hook global BufCreate .*\.q$ %{
	set-option buffer filetype qualia
	set-option buffer comment_line '//'
}

hook global WinSetOption filetype=qualia %{
	hook window InsertChar \n -group qualia-insert qualia-insert-on-new-line
	hook window InsertChar \n -group qualia-indent qualia-indent-on-new-line
	hook -once -always window WinSetOption filetype=.* %{ remove-hooks window qualia-.+ }
}

define-command -hidden qualia-insert-on-new-line %{
	evaluate-commands -draft -itersel %{
		# copy '//' comment prefix and following white spaces
		try %{ execute-keys -draft k <a-x> s ^\h*//\h* <ret> y jgh P }
	}
}

define-command -hidden qualia-indent-on-new-line %{
	evaluate-commands -draft -itersel %{
		# preserve previous line indent
		try %{ execute-keys -draft <semicolon> K <a-&> }
		# cleanup trailing whitespaces from previous line
		try %{ execute-keys -draft k <a-x> s \h+$ <ret> d }
		# indent after line ending with :
		try %{ execute-keys -draft <space> k <a-x> <a-k> :$ <ret> j <a-gt> }
	}
}

# Regions
add-highlighter shared/qualia regions
add-highlighter shared/qualia/code default-region group
add-highlighter shared/qualia/double_string region %{(?<!\\)(\\\\)*\K"} %{(?<!\\)(\\\\)*"} fill string
add-highlighter shared/qualia/comment_inline region // $ fill comment

# Grammar
add-highlighter shared/qualia/code/ regex \b(?<name>[A-Z][\w\d_]*)\h*\(.*?\) name:default
add-highlighter shared/qualia/code/ regex \b(true|false|null)\b 0:keyword
add-highlighter shared/qualia/code/ regex \b(byte|bool|int|int8|int16|int32|uint|int64|uint8|uint16|uint32|uint64|float16|float32|float64|type_id)\b 0:keyword
add-highlighter shared/qualia/code/ regex \b(import|struct|enum|defer|alias|claim|inc|dec|OR|XOR|AND|NOT|MOD|is|not|and|or|as|in|for|asm|while|if|else|then|match|where|return|break|continue)\b 0:keyword
add-highlighter shared/qualia/code/ regex \b(\d_?)+((((u|s)(8|16|32|64)?)|((\.(\d|(_\d)?)*)?(f(16|32|64))?)))?\b 0:value
add-highlighter shared/qualia/code/ regex \b0x([\da-fA-F]_?)+((u|s)(8|16|32|64)?)?\b 0:value
add-highlighter shared/qualia/code/ regex \b0b([01]_?)+((u|s)(8|16|32|64)?)?\b 0:value
add-highlighter shared/qualia/code/ regex \b([\da-fA-F]_?)+h(u|s)?(8|16|32|64)?\b 0:value
add-highlighter shared/qualia/code/ regex \b([01]_?)+b((u|s)(8|16|32|64)?)?\b 0:value

hook global WinSetOption filetype=qualia %{
	add-highlighter window/qualia ref qualia
}
hook global WinSetOption filetype=(?!qualia).* %{
	remove-highlighter window/qualia
}
