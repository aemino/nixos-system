{ inputs, ... }:
{
  # You can import other NixOS modules here
  imports = [
    inputs.hardware.nixosModules.framework-amd-ai-300-series

    ./hardware-configuration.nix

    ../common/features
    ../common/features/pipewire.nix
    ../common/features/steam.nix

    ../common/users/aemino
  ];

  networking.hostName = "framework";

  services.fwupd.enable = true;

  programs = {
    light.enable = true;
    dconf.enable = true;
  };

  system.stateVersion = "25.05";
}
