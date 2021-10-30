import
  (builtins.fetchTarball {
    name = "nixpkgs-2021-10-30";
    # nix-prefetch-url --unpack <url>
    url = "https://github.com/nixos/nixpkgs/archive/ffcff898a6b7e7875f506ed2f5127a9e57997c13.tar.gz";
    sha256 = "1nngx3j2jwvka9clq5wdvrnsby3vqr948vrl705gsg4bk7lkhjn1";
  })
{ }
