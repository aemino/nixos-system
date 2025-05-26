{ pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./direnv.nix
    ./fish.nix
    ./git.nix
    ./helix.nix
  ];

  home.packages = with pkgs; [
    (btop.override {
      rocmSupport = true;
    })
    eza # better ls
    dua # disk usage analyzer
    vimv-rs # file renamer

    # archive
    zip
    unzip

    # nix
    nixd # lsp
    nixfmt-rfc-style # fmt
  ];
}
