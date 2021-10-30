{ pkgs ? import ./pins/2021-10-29.nix }:

let
  form = pkgs.callPackage ./pkgs/form { };
  svd2rust = pkgs.callPackage ./pkgs/svd2rust { };
in
pkgs.mkShell
{
  nativeBuildInputs = [
    form
    pkgs.rustfmt
    pkgs.svdtools
    pkgs.unzip
    svd2rust
  ];
}
