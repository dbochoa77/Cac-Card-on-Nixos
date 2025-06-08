#################################
# Services Needed to be Enabled #
#################################
  services.pcscd.enable = true;

###################
# Packages Needed #
###################
 environment.systemPackages = with pkgs; [
# Cac Card Tools
  pcsclite
  pcsc-tools
  opensc
  ccid
  nssTools
];
