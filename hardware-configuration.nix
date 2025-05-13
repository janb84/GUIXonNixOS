# Hardware configuration for NixOS

{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot.initrd.availableKernelModules = [ "xchi_pci" "sr_mod" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  # The root partition is mounted at /
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  # The boot partition is mounted at /boot
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  # Intentionally empty, as we don't want to swap on this system
  swapDevices = [ ];
}