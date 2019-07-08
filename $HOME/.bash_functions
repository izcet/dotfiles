#!/bin/bash

function get_rand () {
    local ARG="$1"
    local MODULO=${ARG:-"2"} 
    local RAND="$(($(openssl rand 2 | od -DAn | tr -d '[:space:]') % $MODULO))"
    echo "$RAND"
}

