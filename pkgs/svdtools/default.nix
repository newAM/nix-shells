{ lib
, rustPlatform
, fetchFromGitHub
, stdenv
, libiconv
}:

rustPlatform.buildRustPackage rec {
  pname = "svdtools";
  version = "2022-01-15";

  src = fetchFromGitHub {
    owner = "stm32-rs";
    repo = pname;
    rev = "c49f3cd18a21e16796b898bb20aa0ba85cbc3d0f";
    sha256 = "0cd2nkymrz5cxvv23jl7wsljhsqvmzr48lk90sd344nxpygdpvxm";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    cp ${./Cargo.lock} Cargo.lock
  '';
}
