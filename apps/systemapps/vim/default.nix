  # apps/systemapps/vim/default.nix
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

      environment.systemPackages = with pkgs; [
      vim
      ];
    };
    
  }
