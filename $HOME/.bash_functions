#!/bin/bash

function get_rand () {
    local ARG="$1"
    local MODULO=${ARG:-"2"} 
    local RAND="$(($(openssl rand 2 | od -DAn | tr -d '[:space:]') % $MODULO))"
    echo "$RAND"
}

function discordtrash () {
    local ARG="$1"
    local NUM=${ARG:-"1"}
    local COUNT=0
    local STRING=""
    while [ "$COUNT" -lt "$NUM" ] ; do
        echo "$COUNT $STRING"
        local SEED="`head -c 9 /dev/random | base64`"
        local CHARS="$((3 + $( get_rand 6 ) ))"
        local TRASH="`echo $SEED | head -c $CHARS`"
        
        STRING="-p $TRASH\n$STRING"
        
        COUNT=$(($COUNT + 1))
    done
    echo "$STRING" #| pbcopy
}
