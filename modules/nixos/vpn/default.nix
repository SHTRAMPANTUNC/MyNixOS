{ root
, ...
}:

{
  networking.wireguard.enable = true;
  networking.wg-quick.interfaces.wg0 = {
    autostart = false;
    address = [ "10.8.0.7/24" ];
    privateKeyFile = "${root}/secrets/work-vpn-wg.key";

    peers = [{
      publicKey = "qZgHT/1iZq90cTCAkel1HSEddi6Dv+PDFJExvlPRTzg=";
      allowedIPs = [ "0.0.0.0/0, ::/0" ];
      endpoint = "185.237.225.37:51820";
      persistentKeepalive = 0;
      presharedKeyFile = "${root}/secrets/work-vpn-wg-preshared.key";
    }];
  };
}
