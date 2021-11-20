import
  (builtins.fetchTarball {
    name = "nixpkgs-2021-11-19";
    # nix-prefetch-url --unpack <url>
    url = "https://github.com/nixos/nixpkgs/archive/fa9d6c3d9328e84787451c05170cf816295aa630.tar.gz";
    sha256 = "1qd6drz39akzd249hczx0nc8rg9m9zggf1x7by2fvh3gw5in5ckr";
  })
{ }
