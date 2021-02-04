{ lib, config, pkgs, ... }:

with lib;

{
  options.v4l2 = mkEnableOption "Enable the confguration to use the reflex as a webcam";
  config = mkIf config.v4l2 {
    # 20.03: v4l2loopback 0.12.5 is required for kernel >= 5.5
    # https://github.com/umlaeute/v4l2loopback/issues/257

    # Extra kernel modules
    boot.extraModulePackages = with unstable; [
      config.boot.kernelPackages.v4l2loopback
    ];

    # Register a v4l2loopback device at boot
    boot.kernelModules = [
      "v4l2loopback"
    ];

    boot.extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1 video_nr=9 card_label=v4l2loopback
    '';
  };
}
# https://gist.github.com/TheSirC/93130f70cc280cdcdff89faf8d4e98ab
