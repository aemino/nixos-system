{ pkgs, ... }:

with pkgs;
let
  global-python-packages = python-packages: with python-packages; [
    numpy
    scipy
    matplotlib
  ];
  python-with-packages = python3.withPackages global-python-packages;
in
{
  environment.systemPackages = with pkgs; [
    python-with-packages
  ];
}
