{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.decipkgs.vscode;
in
{
  options.decipkgs.vscode = {
    enable = lib.mkEnableOption "Enable configuration and packages for vscode";
  };

  config = lib.mkIf cfg.enable {

    home.packages = [
      pkgs.vscode
    ];

    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [ bbenoist.nix ];
      userSettings = {
        "window.autoDetectColorScheme" = true; # use light theme when os is light
        "files.autoSave" = "afterDelay";
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };
      };

    };
  };

}
