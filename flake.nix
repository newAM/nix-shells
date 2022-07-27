{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let pkgs = import nixpkgs { system = "x86_64-linux"; }; in {
    packages.x86_64-linux = {
      form = pkgs.callPackage ./pkgs/form { };
    };
    devShells.x86_64-linux = {
      stm32-rs = pkgs.callPackage ./shells/stm32-rs.nix { };
      mosquitto = pkgs.callPackage ./shells/mosquitto.nix { };
    };
  };
}
