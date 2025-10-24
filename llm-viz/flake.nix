{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    nixpkgs-old.url = github:NixOS/nixpkgs/38e5815;
    mkShell.url = github:jeremyschlatter/mkShell;
  };

  outputs = { self, nixpkgs, nixpkgs-old, mkShell }:
    mkShell.withSystem nixpkgs (pkgs: system: with pkgs; [
      nixpkgs-old.legacyPackages.${system}.odin
      yarn
    ]);
}
