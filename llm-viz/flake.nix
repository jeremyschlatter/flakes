{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/38e5815;
    mkShell.url = github:jeremyschlatter/mkShell;
  };

  outputs = { self, nixpkgs, mkShell }:
    mkShell nixpkgs (pkgs: with pkgs; [
      odin
      yarn
    ]);
}
