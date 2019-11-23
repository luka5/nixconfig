{ pkgs, lib, config, ... }:

{
  require = [
    ./oh-my-zsh.nix
  ];

  users = {
    mutableUsers = true;
    extraUsers.hauser = {
      isNormalUser = true;
      group = "hauser";
      uid = 1001;
      extraGroups = [
        "myconfig"
        "wheel"
        "audio" "video"
        "dialout"
        "input" ]
        ++ pkgs.lib.optional config.virtualisation.virtualbox.host.enable "vboxusers"
        ++ pkgs.lib.optional config.virtualisation.docker.enable "docker"
        ++ pkgs.lib.optional config.networking.networkmanager.enable "networkmanager"
        ;
      home = "/home/hauser";
      createHome = true;
      shell = "/run/current-system/sw/bin/zsh";
      initialPassword = lib.mkForce "hauser";
      openssh.authorizedKeys.keys = [
      ];
    };
    extraGroups.hauser.gid = 1001;
  };

  programs.vim.defaultEditor = true;

  services.xserver.layout = "eu"; # should be part of hardware config
}
