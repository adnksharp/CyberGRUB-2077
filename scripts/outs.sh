OUT_LEN=80

# Use:
#$(MARGIN x x) for x════════...x
#$(SPACE n) for            ...  
MARGIN() 
{
	BORDER=$1
	CHAR="═"
	for (( i=0; i<$OUT_LEN; i++ )); do
		BORDER="$BORDER$CHAR"
	done
	echo "$BORDER$2"
}

SPACE()
{
	OUT=""
	for (( i=0; i<`expr $1`; i++ )); do
		OUT="$OUT "
	done
	echo "$OUT"
}

OUT_TITLE="\e[1;31m$(MARGIN ╔ ╗)\n║ \e[3;31mCyberGRUB 2077\e[0;31m\e[1;31m$(SPACE $OUT_LEN-15 )║\n\e[1;31m$(MARGIN ╚ ┘)\n"