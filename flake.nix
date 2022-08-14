{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.x86_64-linux = {
        form = pkgs.callPackage ./pkgs/form { };
      };
      devShells.x86_64-linux = {
        stm32-rs = pkgs.callPackage ./shells/stm32-rs.nix { };
        mosquitto = pkgs.callPackage ./shells/mosquitto.nix { };
      };

      checks.x86_64-linux = {
        inherit (self.devShells.x86_64-linux) stm32-rs mosquitto;

        nixpkgs-fmt = pkgs.runCommand "nixpkgs-fmt" { } ''
          ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt --check ${./.}
          touch $out
        '';

        statix = pkgs.runCommand "statix" { } ''
          ${pkgs.statix}/bin/statix check ${./.}
          touch $out
        '';
      };
    };
}
