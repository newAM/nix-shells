{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "svd2rust";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "rust-embedded";
    repo = pname;
    rev = "bb9038567402d843fd293e97c71c5256dd2a9b86";
    sha256 = "sha256-SxUL6v9FThH6Q+S3CV4nLRVbAkRSquB11HJrlwV07uw=";
  };

  cargoLock.lockFile = ./Cargo.lock;

  postPatch = ''
    cp ${./Cargo.lock} Cargo.lock
  '';

  meta = with lib; {
    description = "Generate Rust register maps (`struct`s) from SVD files";
    homepage = "https://github.com/rust-embedded/svd2rust";
    changelog = "https://github.com/rust-embedded/svd2rust/blob/v${version}/CHANGELOG.md";
    license = with licenses; [ mit asl20 ];
    maintainers = with maintainers; [ newam ];
  };
}
