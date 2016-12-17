CEILING="${BLOCK_INSTANCE%/*}"
CEILING="${CEILING:-100}"

STEP="${BLOCK_INSTANCE#*/}"
STEP="${STEP:-5}"

case $BLOCK_BUTTON in	# Ponymix auto-prints volume so >/dev/null
  3) ponymix toggle >/dev/null;;				# Right Click
  4) ponymix --max-volume $CEILING increase $STEP >/dev/null;;	# Scroll Up
  5) ponymix --max-volume $CEILING decrease $STEP >/dev/null;;	# Scroll Down
esac

if ponymix is-muted; then
	STATE="MUTED"
	echo "$STATE"
else
	STATE="$(ponymix get-volume)%"

	DEVICE='alsa_output.pci-0000_00_14.2.analog-stereo'
	ACTIVE_SINK=$(pacmd list-sinks | grep -v '<hdmi-output-0>' | grep 'active port' | awk '{ print $3 }')

	if [ "$ACTIVE_SINK" = "<analog-output-speaker>" ]; 	then
	OUTPUT=""
else
	OUTPUT=""
fi
	echo " $OUTPUT $STATE"
fi
exit 
