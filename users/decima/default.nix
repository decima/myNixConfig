{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ../user.nix
    ./wallpapers.nix
  ];

  user = {
    name = "Decima";
    email = "h.larget@gmail.com";
    editor = "vim";
  };

  decipkgs.git.enable = true;
  decipkgs.vscode.enable = true;
  decipkgs.zsh.enable = true;

  home.username = "decima";
  home.homeDirectory = "/home/decima";

  dconf = {
    settings = {
      "org/gnome/mutter" = {
        "edge-tiling" = true;
      };
      "org/gnome/desktop/interface" = {
        "accent-color" = "pink";
        "color-scheme" = "default";
      };
      "org/gtk/Settings/Debug" = {
        "enable-inspector-keybinding" = true;
      };
    };
  };

}
