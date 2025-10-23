{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    nixpkgs-2023-08.url = github:NixOS/nixpkgs/release-23.05;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, nixpkgs-2023-08, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    with nixpkgs.legacyPackages.${system};
    let
      scripts = {};
      old = nixpkgs-2023-08.legacyPackages.${system};
    in {
      devShell = mkShellNoCC {
        packages = lib.attrsets.mapAttrsToList writeShellScriptBin scripts ++ [
          old.odin

#           ((odin.override {
#             llvmPackages = llvmPackages_17;
#           }).overrideAttrs (attrs: {
#             version = "dev-2023-08";
#             src = attrs.src.override {
#               hash = "sha256-pmgrauhB5/JWBkwrAm7tCml9IYQhXyGXsNVDKTntA0M=";
#             };
#             patches = [];
#             postPatch = ''
#               substituteInPlace src/build_settings.cpp \
#                 --replace-fail "arm64-apple-macosx" "arm64-apple-darwin"
#               patchShebangs --build build_odin.sh
#             '';
#           }))

          yarn
        ];
      };
    });
}

