{ inputs, config, pkgs, ... }: {
    wayland.windowManager.hyprland = {
        settings = { 
          "plugin:borders-plus-plus" = {
            add_borders = 1;
                
            "col.border_1" = "rgb(ffffff)";
            "col.border_2" = "rgb(2222ff)";

            border_size_1 = 1;
            border_size_2 = -1;

            natural_rounding = "yes";
        };
      };
    };
}
