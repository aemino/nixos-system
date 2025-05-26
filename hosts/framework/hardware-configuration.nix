{ lib, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      systemd-boot.consoleMode = "max";
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "thunderbolt"
        "usb_storage"
        "sd_mod"
      ];

      kernelModules = [ ];
      supportedFilesystems = [ "bcachefs" ];
    };

    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nix_root";
    fsType = "bcachefs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
    options = [
      "umask=0077" # https://discourse.nixos.org/t/nixos-install-with-custom-flake-results-in-boot-being-world-accessible/34555/14
    ];
  };

  swapDevices = [ { device = "/dev/disk/by-label/nix_swap"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlan0.useDHCP = lib.mkDefault true;

  # don't wait on dhcpcd when booting
  networking.dhcpcd.wait = "background";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.bluetooth.enable = true;
}
