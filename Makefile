build:
	sudo nixos-rebuild switch --flake .

update:
	nix flake update

hm.build:
	home-manager switch --flake .

hm.install:
	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	nix-channel --update
