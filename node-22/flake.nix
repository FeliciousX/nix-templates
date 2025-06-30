{
  description = "Node 22 Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs
    , flake-utils
    , ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        nativeBuildInputs = with pkgs; [ nodejs ];
        # buildInputs = with pkgs; [ ];
      in
      {
        devShells.default = pkgs.mkShell {
          inherit nativeBuildInputs;
          NPM_CONFIG_PREFIX = "~/.npm-22";
        };
      }
    );
}
