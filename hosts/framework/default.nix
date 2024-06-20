{ pkgs, inputs, ... }:
{
  # You can import other NixOS modules here
  imports = [
    inputs.hardware.nixosModules.framework-11th-gen-intel

    ./hardware-configuration.nix

    ../common/features
    ../common/features/pipewire.nix
    ../common/features/tlp.nix

    ../common/users/aemino
  ];

  networking.hostName = "framework";

  boot = {
    kernelPackages = pkgs.linuxPackages_6_9;
  };

  programs = {
    light.enable = true;
    dconf.enable = true;
  };

  powerManagement.powertop.enable = true;

  hardware.opengl.enable = true;

  system.stateVersion = "24.05";
}
