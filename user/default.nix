{ pkgs, config, fetchurl, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  unstableSmall = import <nixos-unstable-small> { config = { allowUnfree = true; }; };
  nixos1909 = import <nixos-1909> { config = { allowUnfree = true; }; };

in
{
  require = [
    ./user.nix
  ];

  environment = {
    interactiveShellInit = ''
      fpath=(${pkgs.kubectx}/share/zsh/site-functions $fpath)
    '';

    variables = {
      BROWSER = "${pkgs.chromium}/bin/chromium-browser";
    };

    systemPackages = with pkgs; [
      xf86_input_wacom
      usbutils
      moreutils

      kdeconnect
      yakuake
      chromium
      firefox
      nixos1909.thunderbird
      korganizer
      akonadi
      slack
      keepassxc
      partition-manager
      jetbrains.idea-ultimate
      git
      git-lfs
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
      unstableSmall.typora

      qrencode
      signal-desktop
      unstable.teams

      libreoffice
      citrix_workspace
      xfce.xfce4-screenshooter
      tesseract
      okular
      gwenview
      ark
      inkscape
      gimp
      kate

      kazam
      vlc
      spotify
      unstable.zoom-us

      pavucontrol
      htop

      unstable.awscli
      azure-cli
      kubectl
      unstable.kubectx
      unstable.kubernetes-helm
      k9s
      adoptopenjdk-hotspot-bin-8

      jmtpfs
      openssl

      python3
      krita
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
