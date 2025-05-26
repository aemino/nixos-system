{ pkgs, config, ... }:
{
  users.users.aemino = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "audio"
      "video"
    ];

    hashedPassword = "$6$iofgoVig$v33Pjt3OvT/raT.ILoKp4NUYVC81V6M8zfoeO/EcyGdZkQYUleED3M.Fn0WAnJPNPWcgjlhkVPgkWkeuMPKGi1";

    packages = [ pkgs.home-manager ];
  };

  home-manager.users.aemino = import ../../../../home/aemino/${config.networking.hostName}.nix;
}
