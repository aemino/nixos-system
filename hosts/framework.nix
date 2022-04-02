{ suites, lib, ... }:

{
  imports = suites.laptop;

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.initrd.supportedFilesystems = [ "btrfs" ];
  boot.kernelModules = [ "kvm-intel" "vfio_pci" ];
  boot.extraModulePackages = [ ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "btrfs" ];
  boot.kernelParams = [
    # "i915.enable_psr=0"
    "intel_iommu=on"
  ];
  boot.kernel.sysctl = {
    "abi.vsyscall32" = 0;
    "dev.i915.perf_stream_paranoid" = 0;
  };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  fileSystems."/" =
    { device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=nixos" "compress=zstd" "autodefrag" "noatime" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "autodefrag" "noatime" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";

  #services.tlp = {
  #  enable = true;
  #
  #  settings = {
  #    PCIE_ASPM_ON_BAT = "powersupersave";
  #  };
  #};

  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;

  networking.wireless.iwd = {
    enable = true;

    settings = {
      Network.EnableIPv6 = true;
    };
  };

  networking.useDHCP = false;
  networking.interfaces.wlan0.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/Los_Angeles";
}
