{ inputs, config, pkgs, ... }:
let
    hyprlandPkg = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in {
   imports = [
        ./borders-plus-plus.nix
        ./waybar.nix
   ];
   wayland.windowManager.hyprland = {
        enable = true;
        # Setting flake version
        package = hyprlandPkg.hyprland;
        portalPackage = hyprlandPkg.xdg-desktop-portal-hyprland;

        # Plugins
        plugins = [
            inputs.hyprland-plugins.packages."${pkgs.stdenv.hostPlatform.system}".borders-plus-plus
            inputs.waybar.packages."${pkgs.stdenv.hostPlatform.system}".default
        ];

        settings = {
            "$mod" = "SUPER";

            bindm = [
              # mouse movements
              "$mod, mouse:272, movewindow"
              "$mod, mouse:273, resizewindow"
              "$mod ALT, mouse:272, resizewindow"
            ];
            bind = [ 
                "$mod, F, exec, firefox" 
                "$mod, G, exec, ghostty"
                "$mod, Q, killactive"
                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
            ];
            windowrule = [
                "workspace 2, class:firefox"
            ];
         };
      };
}
