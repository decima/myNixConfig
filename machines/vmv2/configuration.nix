# Machine-specific configuration for vmv2.
{ config, pkgs, inputs, ... }: {
  imports = [
    # Import the common machine settings
    ../commons/machine.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Networking
  networking.hostName = "vmv2";
  networking.networkmanager.enable = true;

  # Desktop Environment
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define the user for this machine and import their Home-Manager config.
  users.users.decima = {
    isNormalUser = true;
    description = "decima";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data were taken.
  system.stateVersion = "25.05";
}