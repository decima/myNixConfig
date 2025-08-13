{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.decipkgs.minecraft;
in
{
  options.decipkgs.minecraft = {
    enable = lib.mkEnableOption "Enable configuration and packages for Minecraft";
  };

  config = lib.mkIf cfg.enable {

    home.packages = [
      pkgs.prismlauncher
    ];
  };

}
