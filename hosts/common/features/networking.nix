{
  networking = {
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      # "1.1.1.1"
      # "1.0.0.1"
    ];

    wireless.iwd = {
      enable = true;
      settings = {
        Network.EnableIPv6 = true;
      };
    };
  };
}
