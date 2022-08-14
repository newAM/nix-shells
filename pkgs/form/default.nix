{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "form";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "djmcgill";
    repo = pname;
    rev = "fcb397a39d633ba7fbda057483e0587cef05f25d";
    sha256 = "1jsh0qwpl2n77jdbzq4xxa7jbra5lj2k80aifpwgnlpfx8hmi11z";
  };

  cargoSha256 = "12i5r73gpnkvmsbac87rdwgv01xdpfqjnj9kmmjbixf7cdfhya1l";
}
