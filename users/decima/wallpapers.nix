{ pkgs, lib, ... }:

let
  # Votre liste de fonds d'écran
  wallpapers = [
    (builtins.fetchurl {
      url = "https://w.wallhaven.cc/full/rr/wallhaven-rr8681.jpg";
      sha256 = "sha256:1dll0pymmks99j1zf4qv9lhs00m0c2whyw46n9qpd9h7wn4k2jkb";
    })
    (builtins.fetchurl {
      url = "https://w.wallhaven.cc/full/kx/wallhaven-kxyl17.png";
      sha256 = "sha256:1b5w84s66lf4li7n12zwfvprwr37xivyzk45v8gcbnv6d1asx8z6";
    })
    (builtins.fetchurl {
      url = "https://w.wallhaven.cc/full/1p/wallhaven-1p55dw.png";
      sha256 = "sha256:0kpz4nb9zn13dk1z281gjcziw23m8g1nby95vh043abwfyw21lj8";
    })
    (builtins.fetchurl {
      url = "https://w.wallhaven.cc/full/49/wallhaven-498m61.jpg";
      sha256 = "sha256:1jfwbbyj5h3hx9d2sfa5crizv31xc55bs08k3q2gvafl1sa1avzb";
    })
  ];

in
{
  home.file = lib.listToAttrs (
    lib.imap1 (index: wallpaperPath: {
      name = ".wallpapers/${toString index}";
      value = {
        source = wallpaperPath;
      };
    }) wallpapers
  );
}
