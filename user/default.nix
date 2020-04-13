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
      firefox
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
      restic
      kdialog
      jq
      libsecret
      xdotool
      xclip

      qrencode
      signal-desktop

      libreoffice
      citrix_workspace
      xfce.xfce4-screenshooter
      tesseract
      okular
      ark
      inkscape
      gimp
      kate

      kazam
      vlc
      spotify
      zoom-us

      pavucontrol
      htop
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

  programs.adb.enable = true;
  users.users.hauser.extraGroups = ["adbusers"];

  services.udev.packages = [
    pkgs.android-udev-rules
  ];

}
