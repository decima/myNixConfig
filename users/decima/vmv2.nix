{ lib, ... }: {
  # On importe la configuration commune de john
  imports = [ ./default.nix ];


  dconf.settings={
     "org/gnome/desktop/background" = {
      "picture-uri" = ".wallpapers/4";
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # You can add any other configurations that should only apply
  # when the user "decima" is on the "vmv2" machine.
  # For example:
  # home.packages = [ pkgs.htop ];
}