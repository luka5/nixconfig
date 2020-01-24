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
        "wheel"
        "audio" "video"
        "dialout"
        "input" ]
        ++ pkgs.lib.optional config.virtualisation.virtualbox.host.enable "vboxusers"
        ++ pkgs.lib.optional config.virtualisation.docker.enable "docker"
        ++ pkgs.lib.optional config.networking.networkmanager.enable "networkmanager"
        ;
      home = "/home/hauser";
      shell = pkgs.zsh;
      createHome = true;
      initialPassword = lib.mkForce "hauser";
    };
    extraGroups.hauser.gid = 1001;
  };

  programs.vim.defaultEditor = true;

  services.xserver.layout = "eu";
}

