{
  inputs.nixpkgs-old.url = github:NixOS/nixpkgs/38e5815;

  outputs = { self, nixpkgs, nixpkgs-old, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    with nixpkgs.legacyPackages.${system};
    {
      devShell = mkShellNoCC {
        packages = [
          nixpkgs-old.legacyPackages.${system}.odin
          yarn
        ];
      };
    });
}
