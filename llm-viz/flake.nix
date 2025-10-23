{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    with nixpkgs.legacyPackages.${system};
    let
      scripts = {};
    in {
      devShell = mkShellNoCC {
        packages = lib.attrsets.mapAttrsToList writeShellScriptBin scripts ++ [
          (odin.overrideAttrs (attrs: {
            version = "dev-2023-08";
            src = attrs.src.override {
              hash = "sha256-pmgrauhB5/JWBkwrAm7tCml9IYQhXyGXsNVDKTntA0M=";
            };
          }))
          yarn
        ];
      };
    });
}

