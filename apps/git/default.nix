# apps/git/default.nix
# A Home-Manager module to configure everything related to git.
{
  config,
  pkgs,
  lib,
  ...
}:

let
  # We use 'config' to check if the option is enabled.
  cfg = config.decipkgs.git;
in
{
  # 1. Option definitions
  # We declare a new option section for our application.
  options.decipkgs.git = {
    enable = lib.mkEnableOption "Enable configuration and packages for git";
  };

  # 2. Configuration
  # This part only applies if 'options.decipkgs.git.enable' is true.
  config = lib.mkIf cfg.enable {

    # Package installation
    home.packages = [
      pkgs.git
      pkgs.tig # An excellent git repository viewer for the console
    ];

    # Program configuration via Home-Manager options
    # This is much cleaner than managing the .gitconfig file by hand.
    programs.git = {
      enable = true;

      # Magic! We read the information from our central configuration.
      userName = config.user.name;
      userEmail = config.user.email;

      aliases = {
        logadog = "log --all --decorate --oneline --graph";
        br = "branch";
        co = "checkout";
        st = "status";
        tempo = "commit -a -m tempo";
        su = "submodule update --init --recursive";
        cp = "cherry-pick";
        please = "push --force-with-lease --force-if-includes";
        master = "!git checkout master && git pull && git checkout -";
      };
      extraConfig = {
        core.editor = config.user.editor;
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        #url."git@github.com".insteadOf = "https://github.com";
        "tig \"bind\"".generic = [
          "r !git rebase -i %(commit)^"
          ''p @sh -c "echo -n %(commit) | xclip"''
        ];

      };
    };
  };
}
