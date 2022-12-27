{ pkgs, ... }:

let
  form = pkgs.callPackage ../pkgs/form { };
in
pkgs.mkShell
{
  nativeBuildInputs = [
    form
    pkgs.python3
    pkgs.python3Packages.jinja2
    pkgs.python3Packages.pyyaml
    pkgs.rustfmt
    pkgs.svd2rust
    pkgs.svdtools
    pkgs.unzip
  ];
}
