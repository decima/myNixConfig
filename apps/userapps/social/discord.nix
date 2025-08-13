{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.decipkgs.discord;
in
{
  options.decipkgs.discord = {
    enable = lib.mkEnableOption "Enable configuration and packages for discord";
  };

  config = lib.mkIf cfg.enable {

    home.packages = [
      pkgs.discord-ptb
    ];
  };

}
