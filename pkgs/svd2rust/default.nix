{ lib
, rustPlatform
, fetchFromGitHub
, stdenv
, libiconv
}:

rustPlatform.buildRustPackage rec {
  pname = "svd2rust";
  version = "2021-10-22";

  src = fetchFromGitHub {
    owner = "rust-embedded";
    repo = pname;
    rev = "cc9fd063492926a01a1acc13320eb63f2e3a7f8f";
    sha256 = "12xay3mhbjmadjbkiy68fisfcmh6q1mc62ayyn4ily1fac2h4vnn";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    cp ${./Cargo.lock} Cargo.lock
  '';
}
