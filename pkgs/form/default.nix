{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "form";
  version = "0.10.0";

  src = fetchFromGitHub {
    owner = "djmcgill";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-cqoc2sTtVdhTAQ65oaJKo1+YMfQu7eHCe8zjRPDz9zg=";
  };

  cargoSha256 = "sha256-dhPp93AH4VlOVJWXMMUwv8b53vLPdBY3WyaXE4kcEm4=";
}
