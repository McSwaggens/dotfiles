face global Default             rgb:BABABA,default # rgb:1A1A1F
face global BufferPadding       rgb:333333,default

face global PrimaryCursor       rgb:111111,rgb:CCCCCC
face global PrimarySelection    rgb:d4d4d4,rgb:264f78+g
# face global PrimaryCursorEol    rgb:EE8888,rgb:EE8888

face global SecondaryCursor     rgb:111111,rgb:AAAAAA
face global SecondarySelection  rgb:d4d4d4,rgb:3a3d41
# face global SecondaryCursorEol  rgb:FFFF00,rgb:FFFF00

# face global	value	         rgb:b5cea8
face global value            rgb:D09990
face global type             rgb:569cd6
face global identifier       rgb:dedede
face global string           rgb:D09990
face global module           rgb:D09990
face global error            rgb:cc6666
face global keyword          rgb:569cd6
# face global operator         rgb:ff9999+b
face global operator         rgb:569cd6
face global attribute        rgb:569cd6
# face global comment          rgb:555557
face global comment          rgb:57A64A
# face global comment          rgb:6B6B6B #608B4E
face global meta             rgb:6B6B6B

face global title            rgb:66CC66+b
face global header           rgb:CC6666
face global bold             rgb:ff9999+b
face global italic           rgb:ededed+i
face global mono             rgb:cccccc,rgb:212121
face global block            rgb:cccccc,rgb:121212
face global link             rgb:3333BB
face global bullet           rgb:ff9999
face global list             rgb:ff9999

face global LineNumbers      rgb:CCCCCC
face global LineNumberCursor rgb:CCCCCC,rgb:0F0F0F+ga

face global MenuForeground   rgb:15151A,rgb:569cd6 # 264f78
face global MenuBackground   rgb:CCCCCC,rgb:15151A # 212121
face global MenuInfo         rgb:CCCCCC,rgb:15151A # 212121

face global StatusLine       rgb:CCCCCC,default # 303030
face global StatusLineMode   rgb:CCCCCC,default # 303030
face global StatusLineInfo   rgb:CCCCCC,default # 303030
face global StatusLineValue  rgb:CCCCCC,default # 303030
face global StatusCursor     rgb:CCCCCC,rgb:787878

face global Information      rgb:CCCCCC,rgb:15151A
face global Error            rgb:cc6666,default
face global Prompt           rgb:569cd6,default
face global MatchingChar     rgb:50C0C0+f
face global Search           rgb:0000FF,rgb:FF00FF
face global Whitespace       rgb:252525,default

hook -group c-highlight global ModuleLoaded c-family %{
	add-highlighter shared/cpp/code/Keyword regex '\b(true|false|null|byte)\b' 0:keyword
	add-highlighter shared/c/code/Keyword   ref cpp/code/Keyword

	add-highlighter shared/cpp/code/Primitive regex '\b(u?int|float|u|s)\d+(_t)?\b' 0:keyword
	add-highlighter shared/c/code/Primitive   ref   cpp/code/Primitive

	add-highlighter shared/cpp/code/Punctuation regex ',|->|\.|\*|/|\+|-|%|\|\||&|<|>|=|!=|^' 0:rgb:666666
	add-highlighter shared/c/code/Punctuation   ref cpp/code/Punctuation

	add-highlighter shared/cpp/code/Type regex '\b([A-Z](\w|_)+[a-z](\w|_)*|\w+_t)(?!\()\b' 0:rgb:3DC9B0
	add-highlighter shared/c/code/Type   ref cpp/code/Type

	add-highlighter shared/cpp/code/Constant regex '\b[A-Z][A-Z\d_]+\b' 0:rgb:BB62C3
	add-highlighter shared/c/code/Constant   ref cpp/code/Constant

	# add-highlighter shared/cpp/line_comment regex '//(?S).*(@(Todo|Note|Warning|FixMe|RemoveMe|Bug|OptimizeMe)):?' 1:rgb:DE7CEB

	# add-highlighter shared/cpp/code/Call regex '\b([A-Z](\w|\d)+)\(' 1:Default # 1:rgb:CC9966+b # 1:rgb:8770ff
	# add-highlighter shared/c/code/Call   ref cpp/code/Call

	# add-highlighter shared/cpp/code/dimm regex ',|\.|->' 0:rgb:666666
	# add-highlighter shared/c/code/dimm regex ',|\.|->' 0:rgb:666666
	# add-highlighter shared/cpp/code/Type regex '\b([A-Z][a-z\d]+(_?[A-Z][a-z\d]*)*)\b(&|\*)*(?!\()(?!<)' 0:rgb:CC9966
	# add-highlighter shared/c/code/ops    regex '((!|<|>|&|\||^|\+|-|\*|/|%|=)=?)|;' 0:rgb:F3AB75 # D4D4D4
	# add-highlighter shared/c/code/MACROS regex '\b_*[A-Z]+\d*[A-Z|\d|_]+\b' 0:rgb:BB62C3+b
	# add-highlighter shared/c/code/type   regex '\b(?:struct|enum|union)\s+(\w+)\b'  1:rgb:3DC9B0
	# add-highlighter shared/c/code/Type   regex '\b([A-Z][a-z|\d]+(_*[A-Z\d][a-z\d]*)*|\w+_t)\b' 0:rgb:3DC9B0
	# add-highlighter shared/c/code/prims  regex '\b(u|i|s|uint|int|f|float)(8|16|32|64)(_t)?\b'          0:keyword

	# add-highlighter shared/c/code/member regex '(?:\.|->)(\w+\b)' 1:rgb:D7D8D7
	# add-highlighter shared/c/code/member regex '(\b\w+)::(\w+)'   1,2:rgb:D7D8D7
	# add-highlighter shared/c/code/func   regex '\b(?!(sizeof|if|for|while|switch|return|typedef)\b)([a-z|\d|_]+)\(' 0:rgb:FF00FF # 2:rgb:A55755
}

hook -group c-highlight global WinSetOption filetype=(c|cpp) %{
	add-highlighter window/ regex '@(Todo|Note|TestMe|OptimizeMe|\w+)\b' 0:default+b
	add-highlighter window/ regex '@(Warning|RemoveMe)\b' 0:rgb:E39D10+b
	add-highlighter window/ regex '@(FixMe|Bug)\b' 0:rgb:D02222+b
}
