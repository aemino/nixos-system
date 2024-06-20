{ pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./fish.nix
  ];

  home.packages = with pkgs; [
    vim # editor
    btop # system resources viewer
    eza # better ls

    # archive
    zip
    unzip

    # nix
    nixd # lsp
    nixfmt-rfc-style # fmt
  ];
}
