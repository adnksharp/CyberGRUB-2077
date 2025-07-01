set OUT_LEN 80

# Use:
#$(MARGIN x x) for x════════...x
#$(SPACE n) for            ...  
function MARGIN
    set -l left_char "$argv[1]"
    set -l right_char "$argv[2]"
    set middle_chars (string repeat (math "$OUT_LEN") "═")
    printf "%s%s%s" "$left_char" "$middle_chars" "$right_char"
end

function SPACE
    set -l count (math "$argv[1]")
    if test $count -lt 0
        set count 0
    end
    printf "%*s" "$count" ""
end

set OUT_TITLE "\e[1;31m$(MARGIN ╔ ╗)\n║ \e[3;31mCyberGRUB 2077\e[0;31m\e[1;31m$(SPACE $OUT_LEN-15 )║\n\e[1;31m$(MARGIN ╚ ┘)\n"
