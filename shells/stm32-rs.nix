{ pkgs, ... }:

let
  form = pkgs.callPackage ../pkgs/form { };
  svd2rust = pkgs.callPackage ../pkgs/svd2rust { };
in
pkgs.mkShell
{
  nativeBuildInputs = [
    form
    pkgs.python3
    pkgs.python3Packages.pyyaml
    pkgs.rustfmt
    pkgs.svdtools
    pkgs.unzip
    svd2rust
  ];
}
