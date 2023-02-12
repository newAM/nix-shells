{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux = {
      form = pkgs.callPackage ./pkgs/form {};
    };
    devShells.x86_64-linux = {
      stm32-rs = pkgs.callPackage ./shells/stm32-rs.nix {};
      mosquitto = pkgs.callPackage ./shells/mosquitto.nix {};
    };

    formatter.x86_64-linux = pkgs.alejandra;

    checks.x86_64-linux = let
      nixSrc = nixpkgs.lib.sources.sourceFilesBySuffices ./. [".nix"];
    in {
      inherit (self.devShells.x86_64-linux) stm32-rs mosquitto;

      alejandra = pkgs.runCommand "alejandra" {} ''
        ${pkgs.alejandra}/bin/alejandra --check ${nixSrc}
        touch $out
      '';

      statix = pkgs.runCommand "statix" {} ''
        ${pkgs.statix}/bin/statix check ${nixSrc}
        touch $out
      '';
    };
  };
}
