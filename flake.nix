{
  description = "A flake for NixOS for GUIX";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-24.11;

  outputs = { self, nixpkgs }: {
      nixosConfigurations = {
        #defines the x86_64-linux system
        x86_64 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
          ];
        };
        #defines aarch64-linux system
        aarch64 = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            ./configuration.nix
          ];
        };
    };
  };
}