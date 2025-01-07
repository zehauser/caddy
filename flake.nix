{
  description = "Caddy with replace-response plugin";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs =
    inputs@{ self, nixpkgs, ... }:
    {
      packages.aarch64-linux.default = nixpkgs.legacyPackages.aarch64-linux.caddy.override {
        buildGoModule =
          args:
          nixpkgs.legacyPackages.aarch64-linux.buildGoModule (
            args
            // {
              pname = "caddy-pluginated";
              version = "0.1.0";

              src = ./src;

              vendorHash = "sha256-DwdLy8XX2HGTbhb97Nt/gwtHeId4haQU68ZRBgWGcW4=";
              subPackages = [ ];
            }
          );
      };
    };
}
