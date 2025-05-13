{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = { 
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland.url = "github:hyprwm/Hyprland";
        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
        };
        waybar = {
            url = "github:Alexays/Waybar/master";
            inputs.hyprland.follows = "hyprland";
        };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, hyprland, ... }:
    let 
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};

    in {
       nixosConfigurations = {
            roham = lib.nixosSystem {
                inherit system;
                specialArgs = {
                    inherit inputs;
                    inherit hyprland;
                };
                modules = [ 
                    ({ pkgs, ... }: {
                        nixpkgs.overlays = [
                            (_: _: { waybar_git = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar; })
                        ];
                     })
                    ./configuration.nix 
                ];
            };
        };
        
        # Homa Manager
        homeConfigurations."roham" = home-manager.lib.homeManagerConfiguration {
		    inherit pkgs;
            extraSpecialArgs = {
                inherit inputs;
                inherit hyprland;
            };

		    # Specify your home configuration modules here, for example,
		    # the path to your home.nix.
		    modules = [ 
                ({ pkgs, ... }: {
                    nixpkgs.overlays = [
                        (_: _: { waybar_git = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar; })
                    ];
                })
                ./home.nix 
            ];

		    # Optionally use extraSpecialArgs
		    # to pass through arguments to home.nix
		};
        
        devShells = {
            ${system} = {
                python = (import /home/roham/.dotfiles/dev/python.nix { inherit pkgs; });
                cpp = (import /home/roham/.dotfiles/dev/c++.nix { inherit pkgs; });
            };
        };
    };
}
