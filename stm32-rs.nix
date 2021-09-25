{ pkgs ? import
    (builtins.fetchTarball {
      name = "nixpkgs-newam-svdtools";
      # nix-prefetch-url --unpack <url>
      url = "https://github.com/newAM/nixpkgs/archive/9a0a796347f041a42afc286cd89b23633e17a095.tar.gz";
      sha256 = "1kb29kngny5pknnp02smh5sr9vq10kzpv1msypcvyzk3g22djh49";
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
