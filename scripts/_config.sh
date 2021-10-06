#!/usr/bin/env sh
# -*- coding: utf-8 -*-

# Authors: @Gesugao-san;
# Licence: MIT

# Usefull links:
# https://superuser.com/q/1338991
# https://stackoverflow.com/q/5725296

BYONDUrl="http://www.byond.com/download/build/"
saveFile="./tmp.txt"

# magenta="\033[35m"
# green="\033[32m"
# def="\033[0m"

# BYOND version
get_BYOND_version_hardcoded() {
	imported=$(awk '/^BYOND_MAJOR_HARDCODED/{print $3}' _config.ini)
	export BYOND_MAJOR_HARDCODED=$imported;
	imported=$(awk '/^BYOND_MINOR_HARDCODED/{print $3}' _config.ini)
	export BYOND_MINOR_HARDCODED=$imported;
	unset imported;
	echo "BYOND_MAJOR_HARDCODED = $BYOND_MAJOR_HARDCODED"
	echo "BYOND_MINOR_HARDCODED = $BYOND_MINOR_HARDCODED"
}

get_BYOND_versions_list() {
	# TODO: ping to http://www.byond.com/
	SAVE_TO_FILE=$1
	# https://sed.js.org/index.html
	versions=$(echo "cat //html/body/pre/a" |
	xmllint --html --shell $BYONDUrl |
	sed '/^\/\s>/d' |
	sed '/^\s-------/d' |
	sed '/"[a-z?/]/d' |
	sed 's/^[^"]*"\([^"]*\)\/".*/\1/')
	# 354
	# 355
	# ...
	# 514
	# 515
	# LATEST
	echo "versions: $versions"
	echo "Versions in file \"$SAVE_TO_FILE\"."
}

#

get_BYOND_version_hardcoded
get_BYOND_versions_list $saveFile

