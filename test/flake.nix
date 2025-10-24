{
  inputs.mkShell.url = github:jeremyschlatter/mkShell;

  outputs = { self, nixpkgs, mkShell }:
    mkShell nixpkgs (pkgs: with pkgs; [
      cowsay
    ]);
}

