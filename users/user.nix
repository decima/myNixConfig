{ lib, ... }: {

  # Import the applications hub here.
  # This makes all application modules available to every user.
  imports = [
    ../apps/userapps
  ];

  # --- Definition of mandatory options ---
  options.user = {
    name = lib.mkOption {
      type = lib.types.str;
      description = "The user's full name (mandatory).";
      # By NOT providing a "default" value, this option becomes mandatory.
      # Nix will throw an error if it's not set.
    };
    email = lib.mkOption {
      type = lib.types.str;
      description = "The user's email address (mandatory).";
    };
    editor = lib.mkOption {
      type = lib.types.str;
      default = "vim"; # Default editor, can be overridden by the user.
      description = "The user's preferred text editor.";
    };
  };
}
