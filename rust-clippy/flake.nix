{
  outputs =
    { mkShell, nixpkgs, ... }:
    mkShell nixpkgs (pkgs: {
      packages = with pkgs; [
        rustup
        zlib
      ];
    });
}
