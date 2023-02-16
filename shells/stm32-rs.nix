{pkgs, ...}: let
  form = pkgs.callPackage ../pkgs/form {};
  svd2html = pkgs.callPackage ../pkgs/svd2html {};
in
  pkgs.mkShell
  {
    nativeBuildInputs = [
      form
      svd2html
      pkgs.python3
      pkgs.python3Packages.jinja2
      pkgs.python3Packages.pyyaml
      pkgs.rustfmt
      pkgs.svd2rust
      pkgs.svdtools
      pkgs.unzip
    ];
  }
