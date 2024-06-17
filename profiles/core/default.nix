{ self, config, lib, pkgs, ... }:
let inherit (lib) fileContents;
in
{
  imports = [ ../cachix ];

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
      util-linux
      whois
      vim
      openssl
      moreutils

      # archivers
      zip unzip p7zip unrar

      # image tools
      imagemagick
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

    gc.automatic = true;

    optimise.automatic = true;

    settings = {
      auto-optimise-store = true;

      sandbox = true;

      allowed-users = [ "@wheel" ];

      trusted-users = [ "root" "@wheel" ];

      system-features = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
    };

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
