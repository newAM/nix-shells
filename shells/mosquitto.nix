{ mkShell
, cmake
, docbook_xsl
, libxslt
, c-ares
, cjson
, libuuid
, libuv
, libwebsockets
, openssl
, sqlite
, systemd
, cunit
}:

let
  libwebsockets' = libwebsockets.override {
    withExternalPoll = true;
  };
in
mkShell {
  nativeBuildInputs = [
    cmake
    docbook_xsl
    libxslt
  ];

  buildInputs = [
    c-ares
    cjson
    libuuid
    libuv
    libwebsockets'
    openssl
    sqlite
    systemd

    # technically a check input
    cunit
  ];
}
