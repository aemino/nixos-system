{ pkgs, ... }:
let
  pythonEnv = pkgs.python313;
in
{
  home.packages = with pkgs; [
    pythonEnv
    uv
    ruff
  ];
}
