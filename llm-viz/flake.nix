{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    nixpkgs-old.url = github:NixOS/nixpkgs/38e5815;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, nixpkgs-old, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    with nixpkgs.legacyPackages.${system};
    let
      scripts = {};
      old = nixpkgs-old.legacyPackages;
    in {
      devShell = mkShellNoCC {
        packages = lib.attrsets.mapAttrsToList writeShellScriptBin scripts ++ [
          old.${system}.odin
          yarn
        ];
      };
    });
}

