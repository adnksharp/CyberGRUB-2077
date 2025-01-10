OUT_LENGHT=80

# Use:
#$(MARGIN x x) for x════════...x
MARGIN() {
	BORDER=$1
	CHAR="═"
	for (( i=0; i<$OUT_LENGHT; i++ )); do
		OUT="$OUT$CHAR"
	done
	echo "$BORDER$2"
}