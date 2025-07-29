# Cac Card on Nixos 

## Overview
This guide shows how to get a CAC reader to work on **NixOS**

## Who is this for?
Anyone using Linux with the nix language

## Why               
---------------------
Working on windows 11 sucks. NixOS allows a cleaner package management. 

## What you'll need 
1. Install required Packages
2. Enable the smart card daemon
3. Add the PKCS#11 module to Firefox 

--- 

## Packages Needed 
- **pcsclite** – PC/SC daemon backend (smart card communication)  
- **pcsc-tools** – CLI utilities for listing and debugging readers  
- **opensc** – Toolkit for CAC/PIV card interaction  
- **ccid** – CCID protocol driver for USB readers  
- **nssTools** – NSS CLI utilities (`modutil`, `certutil`, etc.) for certificate management  

Install them ini your 'environment.systemPacakges'

## Enable Daemon 
```bash
sudo systemctl enable pcscd.socketk
sudo systemctl start pcscd.socket
```

## Configure Firefox

### 1. Find your profile directory

```bash
ls ~/.mozilla/firefox
Example:
```
46dhcpaa.default
```

###
- Note Replace """46dhcpaa.default""" with your actual one

### 2. Add the OpenSC PKCS#11 module
```bash
modutil -dbdir sql:$HOME/.mozilla/firefox/46dhcpaa.default \
  add "OpenSC" \
  libfile /run/current-system/sw/lib/opensc-pkcs11.so
```

### 3. Verify in Firefox

1. Open `about:preferences#privacy` in the URL bar  
2. Scroll to **Security Devices**  
3. You should see:  
   ```
   OpenSC  →  CAC Module
   ```

---

## Test

Insert your CAC card and attempt to log in. If the module is correctly installed, your certificates will be detected.

---

