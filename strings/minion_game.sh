#!/bin/bash

read s

minion_game() {
    string=$1
    stuart=0
    kevin=0

    for (( i=0; i<${#string}; i++ )); do
        if [[ "${string:i:1}" =~ [AEIOU] ]]; then
            (( kevin += ${#string} - i ))
        elif [[ "${string:i:1}" =~ [a-zA-Z] ]]; then
            (( stuart += ${#string} - i ))
        fi
    done

    if (( kevin < stuart )); then
        echo "Stuart $stuart"
    elif (( stuart < kevin )); then
        echo "Kevin $kevin"
    else
        echo "Draw"
    fi
}

minion_game "$s"

