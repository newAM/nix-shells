{ lib
, rustPlatform
, fetchCrate
, stdenv
, libiconv
}:

rustPlatform.buildRustPackage rec {
  pname = "svdtools";
  version = "0.2.4";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-OyZqJRmP9MSXAOhBasV2tiI0wp2uXDPnGXPoaKfYDh0=";
  };

  cargoSha256 = "sha256-rUS1aN4KqGW0PdR6kCjtgOmrEeIMocx1xP9ZowrFEGk=";
}
