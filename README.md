# Cac-Card-on-Nixos #
---------------------

#-------------------#
# Who               #
#-------------------#
For people that what to get a cac reader working with nixOS

#-------------------#
# What              #
#-------------------#
A step by step on what pkgs and services to get for getting a cac card to work. 
Includes how to add the PKCS #11 for firefox to work
"Note it works on librewolf on my device too"

#-------------------#
# Where             #
#-------------------#
For you people with linux based computers

#-------------------#
# When              #
#-------------------#
ASAP

#-------------------#
# Why               #
#-------------------#
Working on windows 11 sucks. 
Therefore working on linux is much eaiser. 
Due to the natural of nixOS being unique to other distroswith the installation of packages this streamlines the process. 

#-------------------#
# How to do it      #
#-------------------#
Packages Needed  
# PC/SC daemon: backend middleware for smart card communication
pcsclite

# CLI tools for listing and debugging smart card readers
pcsc-tools

# Toolkit for interacting with smart cards (e.g., CAC, PIV)
opensc

# CCID protocol USB smart card reader driver
ccid

# NSS CLI tools (e.g., certutil, pk12util) for managing certs
nssTools

Firefox Configurtion 
To set up firefox to recongize your CAC Card
# Note Replace """46dhcpaa.default""" with your actual one
# Do this by entering
ls ~/.mozilla/firefox

# Use this command to add the OpenSC PKCS#11 Module
modutil -dbdir sql:$HOME/.mozilla/firefox/"""46dhcpaa.default""" \
  -add "OpenSC" \
  -libfile /run/current-system/sw/lib/opensc-pkcs11.so

# Verify, by going to the search bar and entering
about:preferences#privacy

# Scroll down to Secuirty Devices you should see
 OpenSC
   |
   --> Cac Module

See if it works now
