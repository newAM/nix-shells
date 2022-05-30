{
  inputs.nixpkgs.url = "github:newam/nixpkgs/svd2rust";

  outputs = { self, nixpkgs }: let pkgs = import nixpkgs { system = "x86_64-linux"; }; in {
    devShells.x86_64-linux.stm32-rs = pkgs.callPackage ./shells/stm32-rs.nix { };
  };
}
