# -*- coding: utf-8 -*-

# Authors: @Gesugao-san;
# Licence: MIT

# Usefull links:
# https://www.google.com/search?q=python+parsing+html
# https://stackoverflow.com/a/419185

import urllib2

def say_hello_world():
    print ("Hello world.")

# https://stackoverflow.com/a/3764660
def internet_on():
    try:
        urllib2.urlopen('https://www.byond.com/', timeout=1)
        return True
    except urllib2.URLError as err:
        return False

# Python program to use
# main for function call.
if __name__ == "__main__":
	say_hello_world()
