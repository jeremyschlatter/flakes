{
  outputs =
    { mkShell, nixpkgs, ... }:
    mkShell nixpkgs (pkgs: with pkgs; [
      tree-sitter
    ]);
}
