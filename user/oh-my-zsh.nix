# Copyright 2017 Maximilian Huber <oss@maximilian-huber.de>
# SPDX-License-Identifier: MIT
{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      oh-my-zsh
    ];
    shells = [
      pkgs.zsh
      "/run/current-system/sw/bin/zsh"
    ];
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = ["git"];
    };

    interactiveShellInit = ''
      source ${pkgs.grml-zsh-config}/etc/zsh/zshrc

      zstyle ':prompt:grml:left:items:user' pre '%F{green}%B'
    '';

    promptInit = ""; # Clear this to avoid a conflict with oh-my-zsh
  };
}
