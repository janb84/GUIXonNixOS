# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use DHCP and IPv6 by default.
  networking = {
    enableIPv6 = true;
    useDHCP = true;
  };

  services.qemuGuest.enable = true;
  
  services.guix.enable = true;

  # List services that you want to enable:
  environment.systemPackages = with pkgs; [
    #for smb share
    cifs-utils

    #for building
    git
    python3 
    libtool
    autoconf
    automake
    pkg-config
    gnumake
    cmake
    clang
	];

  #nixos channel version
  system.stateVersion = "24.11";
}

