{
    description = "Caddy with replace-response plugin";

    inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

    outputs = inputs @ { self, nixpkgs, ... }: {
        packages.aarch64-linux.default = nixpkgs.legacyPackages.aarch64-linux.caddy.override {
            buildGoModule = args: nixpkgs.legacyPackages.aarch64-linux.buildGoModule ( args // {
                src = ./src;
                vendorHash = "sha256-SMETZB5W7uUGWDDWFQ8Uw7vid/HKLJfsfrzy1qZvOwE=";
                subPackages = [];
            });
        };
    };
}