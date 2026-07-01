{
  description = "Gabriel's machines";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nix-darwin,
      home-manager,
      stylix,
      ...
    }:
    let
      mkHost =
        {
          hostname,
          username,
          fullName,
          email,
          system ? "aarch64-darwin",
          darwinModules ? [ ],
          homeModules ? [ ],
        }:
        nix-darwin.lib.darwinSystem {
          inherit system;
          specialArgs = { inherit username hostname; };
          modules = [
            self.darwinModules.default
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                backupFileExtension = "before-nix";
                extraSpecialArgs = { inherit fullName email; };
                users.${username}.imports = [
                  self.homeModules.default
                  stylix.homeModules.stylix
                ]
                ++ homeModules;
              };
            }
          ]
          ++ darwinModules;
        };
    in
    {
      lib.mkHost = mkHost;

      darwinModules.default = ./modules/darwin;
      homeModules.default = ./modules/home;

      darwinConfigurations."Gabriels-MacBook-Pro" = mkHost {
        hostname = "Gabriels-MacBook-Pro";
        username = "gabrielhall";
        fullName = "Gabriel Hall";
        email = "gabriel.hall@cox.net";
      };
    };
}
