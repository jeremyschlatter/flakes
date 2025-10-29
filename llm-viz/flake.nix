{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    # Selected this commit to grab odin dev-2023-05.
    # There's only a relatively narrow range of odin versions that
    # work with llm-viz. Old odin versions do not accept all of the
    # command line arguments that llm-viz uses. New versions do not
    # accept all of the syntax that llm-viz uses.
    nixpkgs-old.url = github:NixOS/nixpkgs/38e5815;
    mkShell.url = github:jeremyschlatter/mkShell;
  };

  outputs = { self, nixpkgs, nixpkgs-old, mkShell }:
    mkShell nixpkgs (pkgs: system: with pkgs; [
      (nixpkgs-old.legacyPackages.${system}.odin.overrideAttrs (attrs: {
        # This is unnecessary, but it makes `odin version` print the right thing.
        # build_odin.sh used the date of the build as the version stamp.
        # That's misleading when we're building a version that's 2+ years old.
        # Use the tagged version name instead.
        postPatch = attrs.postPatch + ''
          sed -i build_odin.sh -e 's/{ODIN_VERSION=.*}$/{ODIN_VERSION=${attrs.version}}/'
        '';
      }))
      yarn
    ]);
}
