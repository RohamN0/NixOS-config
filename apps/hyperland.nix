{ inputs, config, pkgs, ... }: 
{
  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;

    systemd.enable = true;

    plugins = [
        inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
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
        "$mod_SHIFT, Q, exec, firefox" 
        "$mod, G, exec, ghostty"
        ];


        "plugin:borders-plus-plus" = {
            add_borders = 1;
            
            "col.border_1" = "rgb(ffffff)";
            "col.border_2" = "rgb(2222ff)";

            border_size_1 = 10;
            border_size_2 = -1;

            natural_rounding = "yes";
        };
      };
  };
}

