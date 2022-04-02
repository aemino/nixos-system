{ self, config, lib, pkgs, ... }:
let inherit (lib) fileContents;
in
{
  imports = [ ../cachix ];

  nix.systemFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];

  environment = {

    systemPackages = with pkgs; [
      curl
      wget
      fd
      git
      bottom
      gptfdisk
      iputils
      jq
      manix
      nix-index
      ripgrep
      tealdeer
      usbutils
      utillinux
      whois
      vim
      openssl
    ];

  };

  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      jetbrains-mono
    ];

    fontconfig.defaultFonts = {

      monospace = [ "JetBrains Mono" ];

      sansSerif = [ "Noto Sans" ];

    };
  };

  nix = {

    autoOptimiseStore = true;

    gc.automatic = true;

    optimise.automatic = true;

    useSandbox = true;

    allowedUsers = [ "@wheel" ];

    trustedUsers = [ "root" "@wheel" ];

    extraOptions = ''
      min-free = 536870912
      keep-outputs = true
      keep-derivations = true
      fallback = true
    '';

  };

  # For rage encryption, all hosts need a ssh key pair
  #services.openssh = {
  #  enable = true;
  #  openFirewall = lib.mkDefault false;
  #};

  services.earlyoom.enable = true;

}
