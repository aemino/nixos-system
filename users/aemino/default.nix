{ hmUsers, pkgs, ... }:
{
  home-manager.users = { inherit (hmUsers) aemino; };

  users.users.aemino = {
    home = "/home/aemino";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ];
    uid = 1000;
    hashedPassword = "$6$iofgoVig$v33Pjt3OvT/raT.ILoKp4NUYVC81V6M8zfoeO/EcyGdZkQYUleED3M.Fn0WAnJPNPWcgjlhkVPgkWkeuMPKGi1";

    shell = pkgs.fish;
  };
}
