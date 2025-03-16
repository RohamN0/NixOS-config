{
#test
    inputs = {
        nixpkgs = {
            url = "github:NixOS/nixpkgs/nixos-unstable";
        };
        home-manager.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... }:
    let 
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};

    in {
        nixosConfigurations = {
            roham = lib.nixosSystem {
                inherit system;
                modules = [ ./configuration.nix ];
            };
        };

        devShells = {
            ${system} = {
                python = (import /home/roham/.dotfiles/dev/python.nix { inherit pkgs; });
                c = (import /home/roham/.dotfiles/dev/c++.nix { inherit pkgs; });
            };
        };
        
        # Homa Manager
#       home-managerConfigurations = {
#           roham = home-manager.lib.homeManagerConfiguration {
#               inherit pkgs;
#               modules = [ ./home.nix ];
#           };
#       };
    };
}
