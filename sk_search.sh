#!/bin/sh

###############################################################################
#
#       Search Command
#       Auteur  : Ivan Colonneau
#       Date    : 04 / 09 / 2020
#
###############################################################################


################################## Colors ######################################

green='\e[1;32m'
neutre='\e[0;m'

################################# Background ####################################

bgRed='\e[41m'

#################################### Script ######################################
echo "\n"
if [ ! -z "$1" ];then
        checkFile=$(echo $1 | tr -cd '/' | wc -c)
        if [ $checkFile -eq 0 ];then
                count=$(sudo find / -name $1 | wc -l)
                if [ $count -ne 0 ];then
                        echo "${green}Total: ${neutre}$count\n"
                        sudo find / -name $1
                else
                        echo "${bgRed}Sorry no file found"
                fi
        else
                echo "${bgRed}Error: sk_search expected filename string for search parameter"
        fi
else
        echo "${bgRed}Error: sk_search expected 1 parameter"
fi
echo "\n"