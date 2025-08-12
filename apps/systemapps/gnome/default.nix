# apps/systemapps/vim/default.nix
{
  config,
  pkgs,
  lib,
  ...
}:

let
  # We use 'config' to check if the option is enabled.
  cfg = config.decipkgs.gnome;
in
{
  # 1. Option definitions
  # We declare a new option section for our application.
  options.decipkgs.gnome = {
    enable = lib.mkEnableOption "Enable configuration and packages for vim";
  };
  # 2. Configuration
  # This part only applies if 'options.decipkgs.vim.enable' is true.
  config = lib.mkIf cfg.enable {
    # Package installation

    services.desktopManager.gnome.enable = true;

    environment.systemPackages = with pkgs; [
      gnome-tweaks
      
    ];
  };
  
  
}