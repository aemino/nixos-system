{ suites, lib, ... }:

{
  imports = suites.laptop;

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.initrd.supportedFilesystems = [ ];
  boot.kernelModules = [ "kvm-intel" "vfio_pci" ];
  boot.extraModulePackages = [ ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ ];
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

  services.tlp = {
   enable = true;

   settings = {
     PCIE_ASPM_ON_BAT = "powersupersave";
   };
  };

  services.logind = {
    lidSwitch = "suspend-then-hibernate";
  };

  systemd.sleep.extraConfig = "HibernateDelaySec=30m";

  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;

  networking = {
    # nameservers = [ "127.0.0.1" "::1" ];
    nameservers = [ "1.1.1.1" "1.0.0.1" ];

    useDHCP = false;
    interfaces.wlan0.useDHCP = true;

    resolvconf.enable = false;
    dhcpcd.extraConfig = "nohook resolv.conf";

    wireless.iwd = {
      enable = true;

      settings = {
        Network.EnableIPv6 = true;
      };
    };
  };

  # services.dnscrypt-proxy2 = {
  #   enable = true;
  #   settings = {
  #     # ipv6_servers = true;
  #     require_dnssec = true;

  #     sources.public-resolvers = {
  #       urls = [
  #         "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
  #         "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
  #       ];
  #       cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
  #       minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
  #     };

  #     server_names = [ "cloudflare" "cloudflare-ipv6" ];
  #   };
  # };

  # systemd.services.dnscrypt-proxy2.serviceConfig = {
  #   StateDirectory = "dnscrypt-proxy";
  # };

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/Los_Angeles";
}
