{
  lib,
  rustPlatform,
  fetchCrate,
}:
rustPlatform.buildRustPackage rec {
  pname = "svd2html";
  version = "0.1.2";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-j1xRDGnWRQp5hPokXNXr+7dvDwQFqN93hFFuSuhNQw0=";
  };

  cargoHash = "sha256-sGnKVf7TBf8ATHsewHT3NQSDNEhVItEkCwQkLlKcG38=";
}
