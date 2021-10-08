#!/usr/bin/env sh
# -*- coding: utf-8 -*-

# Authors: @Gesugao-san;
# Licence: MIT

# Usefull links:
# https://superuser.com/q/1338991
# https://stackoverflow.com/q/5725296

BYONDUrl="http://www.byond.com/download/build/"
#saveFile="./tmp.txt"

# magenta="\033[35m"
# green="\033[32m"
# def="\033[0m"

# BYOND version
get_BYOND_version_hardcoded() {
	imported=$(awk '/^BYOND_MAJOR_HARDCODED/{print $3}' '_config.ini') # -F " = "
	export BYOND_MAJOR_HARDCODED=$imported;
	imported=$(awk '/^BYOND_MINOR_HARDCODED/{print $3}' '_config.ini')
	export BYOND_MINOR_HARDCODED=$imported;
	unset imported;
	echo "BYOND_MAJOR_HARDCODED = $BYOND_MAJOR_HARDCODED"
	echo "BYOND_MINOR_HARDCODED = $BYOND_MINOR_HARDCODED"
}

get_BYOND_versions_list() {
	# TODO: ping to http://www.byond.com/
	#SAVE_TO_FILE=$1
	# https://sed.js.org/index.html
	versions=$(echo "cat //html/body/pre/a" |
	xmllint --html --shell $BYONDUrl |
	sed '/^\/\s>/d' |
	sed '/^\s-------/d' |
	sed '/"[a-z?/]/d' |
	sed 's/^[^"]*"\([^"]*\)\/".*/\1/' |
	# https://stackoverflow.com/a/1252191
	sed ':a;N;$!ba;s/\n/, /g')
	# 354
	# 355
	# ...
	# 514
	# 515
	# LATEST
	#versions=$(sed ':a;N;$!ba;s/\n/ /g' "$versions")
	echo "All versions:"
	echo "$versions"
	# https://unix.stackexchange.com/a/444864
	echo "List versions:"
	# counter=0
	# tmp=""
	# for i in ${versions//,/ }
	# do
	# 	counter=$(( counter + 1 ))
	# 	if [ "$counter" -gt 3 ]; then
	# 		counter=0
	# 		tmp=$("$i"+"$tmp")
	# 	else
	# 		echo "$tmp"
	# 	fi
	# done
	COUNT=0
	RESULT=""
	for X in $versions
	do
		if [ "${COUNT}" = 2 ]
		then
			RESULT="${X}"
			COUNT=0
		else
			echo "${RESULT}, ${X}"
			RESULT=""
		fi
		COUNT=$((COUNT + 1))
	done
}

#

get_BYOND_version_hardcoded
get_BYOND_versions_list
