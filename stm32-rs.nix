{ pkgs ? import ./pins/2021-10-29.nix }:

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
