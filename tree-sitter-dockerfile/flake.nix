{
  outputs =
    { mkShell, nixpkgs, ... }:
    mkShell nixpkgs (pkgs: {
      packages = with pkgs; [
        tree-sitter
      ];
    });
}
