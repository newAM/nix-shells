{ pkgs ? import ./pins/2021-11-19.nix }:

let
  form = pkgs.callPackage ./pkgs/form { };
in
pkgs.mkShell
{
  nativeBuildInputs = [
    form
    pkgs.rustfmt
    pkgs.svd2rust
    pkgs.svdtools
    pkgs.unzip
  ];
}
