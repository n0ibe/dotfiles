{
  description = "noib3's dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/1.1.13.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, ... }@inputs: with inputs;
  let
    colorscheme = "tokyonight";
    font = "Inconsolata Nerd Font";
  in
  {
    nixosConfigurations.skunk = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/skunk/configuration.nix
        nixos-hardware.nixosModules.apple-t2
        solaar.nixosModules.default
      ];
      specialArgs = {
        inherit colorscheme font;
      };
    };

    homeConfigurations."noib3@skunk" = home-manager.lib.homeManagerConfiguration {
      modules = [
        ./home.nix
        ./modules/programs/vivid.nix
        ./modules/services/skhd.nix
      ];

      extraSpecialArgs = rec {
        inherit colorscheme font;
        machine = "skunk";
      };

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [
          inputs.nur.overlay
        ];
      };
    };
  };

  nixConfig = {
    # Binary caches.
    extra-substituters = [
      "https://cache.soopy.moe"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.soopy.moe-1:0RZVsQeR+GOh0VQI9rvnHz55nVXkFardDqfm4+afjPo="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
