{
  imports = [
    ./hardware-configuration.nix

    ../common/features
    ../common/features/pipewire.nix
    ../common/features/steam.nix

    ../common/users/aemino
  ];

  networking.hostName = "terra";

  programs = {
    light.enable = true;
    dconf.enable = true;
  };

  system.stateVersion = "25.11";
}
