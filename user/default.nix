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
      gnupg22
      partition-manager
      idea.idea-ultimate
      git
      curl
      wget
      docker-compose
      exfat

      qrencode
      signal-desktop

      libreoffice
      citrix_workspace
      okular
      ark
      inkscape
      gimp

      kazam
      vlc

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
