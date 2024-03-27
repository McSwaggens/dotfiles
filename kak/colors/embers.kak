evaluate-commands %sh{
	# base_background='rgb:16130F'
	base_background='default'
	base_light_black='rgb:2C2620'
	selection_black='rgb:433B32'
	comments='rgb:5A5047'
	base_dark_grey='rgb:8A8075'
	base_grey='rgb:A39A90'
	base_grey2=''
	base_light_grey='rgb:BEB6AE'
	base_white='rgb:DBD6D1'
	base_red='rgb:826D57'
	base_orange='rgb:828257'
	base_yellow='rgb:6D8257'
	base_green='rgb:57826D'
	base_cyan='rgb:576D82'
	base_blue='rgb:6D5782'
	base_purple='rgb:82576D'
	base_brown='rgb:825757'

	echo "
		face global	value ${base_orange}
		face global	type ${base_yellow}
		face global	identifier ${base_red}
		face global	string ${base_green}
		face global	error ${base_grey},${base_green}
		face global	keyword	${base_purple}
		face global	operator ${base_grey}
		face global	attribute ${base_orange}
		face global	comment	${comments}
		face global	meta ${base_yellow}
		face global	module ${base_green}
		face global	variable rgb:BA4444+i
		face global	function rgb:BA4444+f

		face global	title ${base_blue}
		face global	header ${base_blue}
		face global	bold ${base_yellow}
		face global	italic ${base_orange}
		face global	mono ${base_green}
		face global	block ${base_orange}
		face global	link ${base_blue}
		face global	bullet ${base_green}
		face global	list ${base_red}

		face global	Default	${base_grey},${base_background}
		face global BufferPadding	${base_background},${base_background}
		face global	PrimarySelection ${base_white},${base_blue}
		face global	SecondarySelection ${base_grey},${base_blue}
		face global	PrimaryCursor rgb:16130F,${base_white}
		face global	SecondaryCursor	rgb:16130F,${base_grey}
		face global	LineNumbers	${base_background},${base_background}
		face global	LineNumberCursor ${base_background},rgb:282828+b
		face global	MenuForeground ${base_white},${base_blue}
		face global	MenuBackground ${base_blue},${base_light_black}
		face global	StatusLine ${base_light_grey},${base_background}
		face global	StatusLineMode ${base_yellow}
		face global	StatusLineInfo ${base_blue}
		face global	StatusLineValue	${base_green}
		face global	StatusCursor ${selection_black},${base_blue}
		face global	MenuInfo ${base_blue}
		face global	Information	${base_background},${base_blue}
		face global	Error ${base_light_black},${base_red}
		face global	Prompt ${base_yellow},${base_background}
		face global	MatchingChar ${base_blue},${base_background}+b
		# face global	BufferPadding ${base_background},${base_background}

		hook global	ModuleLoaded c-family %{
			add-highlighter	shared/cpp/code/keyword regex '\b(null|requires|concept|co_return|co_yield|co_await)\b' 0:keyword

			add-highlighter	shared/cpp/code/prims regex '\b(u|uint|i|int|s|f|float)(8|16|32|64|128|256|512)\b' 0:type
			add-highlighter	shared/c/code/prims   regex '\b(u|uint|i|int|s|f|float)(8|16|32|64|128|256|512)\b' 0:type

			add-highlighter shared/cpp/code/dimm regex ',|\.|->' 0:rgb:666666
			add-highlighter shared/c/code/dimm   regex ',|\.|->' 0:rgb:666666

			add-highlighter shared/cpp/code/punc regex '\{|\}|\(|\)|\[|\]|;|:' 0:rgb:703040
			add-highlighter shared/c/code/punc   regex '\{|\}|\(|\)|\[|\]|;|:' 0:rgb:703040

			# add-highlighter shared/cpp/code/func regex '\b([A-Z][A-z0-9_]*\b)(<[^\(\);\n]*?>)?\(' 1:function
			# add-highlighter shared/cpp/code/func regex '\b[A-Z][A-z0-9_]*\b' 0:function+u
		}
	"
}
