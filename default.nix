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

    ];

  };

  programs.zsh.enable = true;
  programs.zsh.interactiveShellInit = ''
    source ${pkgs.grml-zsh-config}/etc/zsh/zshrc

    zstyle ':prompt:grml:left:items:user' pre '%F{green}%B'
  '';
  programs.zsh.promptInit = "";


  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.docker.extraOptions = "--data-root /home/docker";

}
