{
  inputs,
  ...
}: {
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

  system.stateVersion = "24.05";
}
