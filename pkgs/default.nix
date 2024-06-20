# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: { phosphor-icons = pkgs.callPackage ./data/fonts/phosphor-icons { }; }
