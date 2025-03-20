{
    inputs = {
        nixpkgs = {
            url = "github:NixOS/nixpkgs/nixos-unstable";
        };
        home-manager.url = "github:nix-community/home-manager";
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
                cpp = (import /home/roham/.dotfiles/dev/c++.nix { inherit pkgs; });
            };
        };
        
        # Homa Manager
        homeConfigurations."roham" = home-manager.lib.homeManagerConfiguration {
		    inherit pkgs;

		    # Specify your home configuration modules here, for example,
		    # the path to your home.nix.
		    modules = [ ./home.nix ];

		    # Optionally use extraSpecialArgs
		    # to pass through arguments to home.nix
		  };
    };
}
