# Services 
  services.pcscd.enable = true;

# Packages Needed         
  nvironment.systemPackages = with pkgs; [
  pcsclite
  pcsc-tools
  opensc
  ccid
  nssTools
];
