{
  options.decipkgs.theme = lib.mkOption {
    type = lib.types.str;
    default = "prime";
    description = "The theme to use for the system.";
  };

  options.decipkgs.wallpaper = lib.mkOption {
    type = lib.types.file;
    default = "default";
    description = "The wallpaper to use for the system.";
  };

  options.decipkgs.wallpaperSha256 = lib.mkOption {
    type = lib.types.str;
    default = "default";
    description = "The SHA256 hash of the wallpaper to use for the system.";
  };

  config.imports =
    {
      "prime" = [ ./prime ];
    }
    ."${decipkgs.theme}";

}
