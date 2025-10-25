{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    mkShell.url = github:jeremyschlatter/mkShell;
  };

  outputs = { self, nixpkgs, mkShell }:
    mkShell.noCC nixpkgs (pkgs: with pkgs; [
      yarn
    ]);
}

