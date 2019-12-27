{ pkgs, ... }: {
  require = [
    ./user.nix
  ];

  environment = {
    variables = {
      BROWSER = "${pkgs.chromium}/bin/chromium-browser";
    };

    systemPackages = with pkgs; [
      yakuake
      chromium
      thunderbird
      slack
      keepassxc

      idea.idea-ultimate
      git
      curl
      wget

      qrencode
    ];

  };

  virtualisation = {
    virtualbox = {
        host.enable = true;
    };

    docker = {
        enable = true;
        extraOptions = "--data-root /home/docker";
    };
  };

}
