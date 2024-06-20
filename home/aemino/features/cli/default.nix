{
  pkgs,
  ...
} : {
  imports = [
    ./bash
    ./fish
  ];

  home.packages = with pkgs; [
    btop # system resources viewer
    eza # better ls

    # nix
    nixd # lsp
    nixfmt-rfc-style # fmt
  ];
}