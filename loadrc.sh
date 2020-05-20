#!/usr/bin/env bash

function loadrc() {
        local dirpath=$(pwd)
        local dirpaths=($dirpath)

        while ! [ "$dirpath" = "/" ] ; do dirpath=$(dirname $dirpath) ; dirpaths+=($dirpath) ; done

        for (( idx=${#dirpaths[@]}-1 ; idx>=0 ; idx-- )) ; do
            if [ -f "${dirpaths[idx]}/.loadrc" ] ; then
                source "${dirpaths[idx]}/.loadrc"
            fi
        done
}

function unloadrc() {
        local dirpath=$(pwd)

        while ! [ "$dirpath" = "/" ] ; do
                if [ -f "$dirpath/.unloadrc" ] ; then
                        source "$dirpath/.unloadrc"
                fi

                dirpath=$(dirname $dirpath)
        done
}

function cd() {
        unloadrc
        builtin cd "$@"
        loadrc
}

loadrc
