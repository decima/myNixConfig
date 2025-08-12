# machines/machine.nix
# This file contains common settings shared by all machines in your setup.
{ pkgs, ... }:
{
  imports = [
    # Import the applications hub.
    ../../apps/systemapps
  ];
  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # Often useful to have enabled by default
  };

  # Allow unfree packages globally
  nixpkgs.config.allowUnfree = true;

  # Enable core services
  services.openssh.enable = true;
  services.printing.enable = true;

  # Enable flakes and nix-command
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    wget
    curl
    gnumake
  ];
  decipkgs.vim.enable = true;
  decipkgs.gnome.enable = true;
  # The default shell is now managed per-user on each machine,
  # or by the user's own home-manager configuration.
}
