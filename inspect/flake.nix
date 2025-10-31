{
  inputs.mkShell.url = github:jeremyschlatter/mkShell;

  outputs = { self, nixpkgs, mkShell }:
    mkShell.noCC nixpkgs (pkgs: with pkgs; [
      uv
    ]);
}

