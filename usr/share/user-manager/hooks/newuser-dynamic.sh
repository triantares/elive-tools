#!/bin/bash
source /usr/lib/elive-tools/functions

main(){
    # pre {{{
    local NUMBERRANDOM username

    # input
    username="$1"

    # Usage
    if [[ -z "${1}" ]] ; then
        echo -e "Usage: $(basename $BASH_SOURCE) username"
        exit 1
    fi

    # checks
    if ! el_check_variables "username" ; then
        exit 1
    fi

    # variables
    if [[ -f "/etc/adduser.conf" ]] ; then
        source /etc/adduser.conf
    fi
    if [[ -z "$LANG" ]] ; then
        LANG="$(grep -s 'LANG=' /etc/default/locale | sed s/'LANG='// | tr -d '"' )"  # stupid syntax requires: '
    fi


    # }}}

    # set xchat random names {{{
    if ! el_check_variables "LANG,DHOME" ; then
        exit 1
    fi

    NUMBERRANDOM="$(expr $RANDOM % 100)"
    sed -i "s/irc_nick1\ =\ Elive_user/irc_nick1\ =\ Elive_user${NUMBERRANDOM}_${LANG:0:2}/" "${DHOME}/${username}/.xchat2/xchat.conf"

    NUMBERRANDOM="$(expr $RANDOM % 100)"
    sed -i "s/irc_nick2\ =\ Elive_user2/irc_nick2\ =\ Elive_user${NUMBERRANDOM}_${LANG:0:2}/" "${DHOME}/${username}/.xchat2/xchat.conf"

    NUMBERRANDOM="$(expr $RANDOM % 100)"
    sed -i "s/irc_nick3\ =\ Elive_user3/irc_nick3\ =\ Elive_user${NUMBERRANDOM}_${LANG:0:2}/"  "${DHOME}/${username}/.xchat2/xchat.conf"


    # }}}


}

#
#  MAIN
#
main "$@"

# vim: set foldmethod=marker :
