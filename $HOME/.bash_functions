#!/bin/bash

function get_rand () {
    local ARG="$1"
    local MODULO=${ARG:-"2"} 
    local RAND="$(($(openssl rand 2 | od -DAn | tr -d '[:space:]') % $MODULO))"
    echo "$RAND"
}

function discordtrash () {
    local ARG="$1"
    local TOTAL=${ARG:-"1"}
    
    local COUNT=0
    local STRING=""
    local TRASH=""
    local SEED=0
    local CHARS=0

    local MAX=16
    if [ "$TOTAL" -gt "$MAX" ] ; then
        echo "Number of songs truncated to $MAX to have a reasonable response time."
        TOTAL="$MAX"
    fi
    
    while [ "$COUNT" -lt "$TOTAL" ] ; do
        SEED="`head -c 9 /dev/random | base64`"
        CHARS="$((3 + $( get_rand 6 ) ))"
        TRASH="`echo $SEED | head -c $CHARS`"
        
        STRING="$STRING\n-p $TRASH"
        
        COUNT=$(($COUNT + 1))
    done
    echo -e "$STRING" | pbcopy
}
