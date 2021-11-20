{ lib
, rustPlatform
, fetchFromGitHub
, stdenv
, libiconv
}:

rustPlatform.buildRustPackage rec {
  pname = "svd2rust";
  version = "2021-11-06";

  src = fetchFromGitHub {
    owner = "rust-embedded";
    repo = pname;
    rev = "877196fc7dc2402138559b3fa6a8bc934b9826b6";
    sha256 = "0vahkyha0ri1xkrrdl6q67xdkzn4k7q9ybbrw5ih0k7w8q0xypvg";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    cp ${./Cargo.lock} Cargo.lock
  '';
}
