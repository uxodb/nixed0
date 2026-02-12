{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    crate2nix = {
      url = "github:kolloch/crate2nix";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    crate2nix,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      crateName = "pomodoro-cli";

      inherit
        (import "${crate2nix}/tools.nix" {inherit pkgs;})
        generatedCargoNix
        ;

      project =
        import (generatedCargoNix {
          name = crateName;
          src = pkgs.fetchFromGitHub {
            owner = "jkallio";
            repo = "pomodoro-cli";
            rev = "v.1.2.5";
            sha256 = "1iqbi938mkbn6vqf55ga5v7x5pnh54wybp1v1dmsdhzc4yymw84p";
          };
        }) {
          inherit pkgs;
          defaultCrateOverrides =
            pkgs.defaultCrateOverrides
            // {
              # Crate dependency overrides go here
            };
        };
    in {
      packages.${crateName} = project.rootCrate.build;

      defaultPackage = self.packages.x86_64-linux.${crateName};

      devShell = pkgs.mkShell {
        inputsFrom = builtins.attrValues self.packages.x86_64-linux;
        buildInputs = [pkgs.cargo pkgs.rust-analyzer pkgs.clippy];
      };
    });
}
