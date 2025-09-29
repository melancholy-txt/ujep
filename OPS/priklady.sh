#!/bin/bash

POCET_PRIKLADU=$1  
NAZEV_SOUBORU=$2

rm -f "$NAZEV_SOUBORU.html"
touch "$NAZEV_SOUBORU.html"

echo "<body>" >> "$NAZEV_SOUBORU.html" 

for i in $(seq 1 "$POCET_PRIKLADU"); do
    OPERAND1=$(shuf -i 1-100 -n 1)
    OPERAND2=$(shuf -i 1-100 -n 1)
    OPERATOR=$(shuf -i 1-4 -n 1)       
    # 1=+, 2=-, 3=*, 4=/

    case $OPERATOR in
        1) OPERATOR="+" ;;
        2) OPERATOR="-" ;;
        3) OPERATOR="*" ;;
        4) OPERATOR="/" ;;
    esac
    echo "<h3> $OPERAND1$OPERATOR$OPERAND2</h3> " >> "$2.html"
done

echo "</body>" >> "$2.html"
