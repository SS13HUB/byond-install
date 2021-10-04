#!/bin/sh


# BYOND version
imported=$(awk '/^BYOND_MAJOR_HARDCODED/{print $3}' _config.ini)
export BYOND_MAJOR_HARDCODED=$imported;
imported=$(awk '/^BYOND_MINOR_HARDCODED/{print $3}' _config.ini)
export BYOND_MINOR_HARDCODED=$imported;
unset imported;

echo "BYOND_MAJOR_HARDCODED = $BYOND_MAJOR_HARDCODED"
echo "BYOND_MINOR_HARDCODED = $BYOND_MINOR_HARDCODED"
