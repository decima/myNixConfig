{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.decipkgs.zsh;
in
{
  options.decipkgs.zsh = {
    enable = lib.mkEnableOption "Enable Zsh with Oh My Zsh";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;

      enableCompletion = true;

      oh-my-zsh = {
        enable = true;
        theme = "gnzh";
        plugins = [
          "git"
          "sudo"
          "kubectl"
          "kubectx"
        ];
      };

      initContent = ''
        alias ll='ls -l'
      '';
    };
  };
}
