{ pkgs ? import
    (builtins.fetchTarball {
      name = "nixpkgs-2021-10-16";
      # nix-prefetch-url --unpack <url>
      url = "https://github.com/nixos/nixpkgs/archive/b1c9da88495de94950463e31f584af0d42419123.tar.gz";
      sha256 = "0mvxy99c2hrsh872p6cvvgbngskvgm5h42rgykn2va01x63ndzha";
    })
    { }
}:
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
