{
  config,
  pkgs,
  lib,
  ...
}:

let
  # We use 'config' to check if the option is enabled.
  cfg = config.decipkgs.vim;
in
{
  # 1. Option definitions
  # We declare a new option section for our application.
  options.decipkgs.vim = {
    enable = lib.mkEnableOption "Enable configuration and packages for vim";
  };
  # 2. Configuration
  # This part only applies if 'options.decipkgs.vim.enable' is true.
  config = lib.mkIf cfg.enable {
    # Package installation

    rootCfg.environment.systemPackages = with pkgs; [
    vim
    ];

    # Program configuration via Home-Manager options
    # This is much cleaner than managing the .gitconfig file by hand.
    programs.vim = {
      enable = true;
      # Magic! We read the information from our central configuration.
    };
  };
  
}
