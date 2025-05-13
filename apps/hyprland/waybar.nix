{ inputs, config, pkgs, ... }: {
    programs.waybar = {
        enable = true;
        systemd.enable = true;
        package = pkgs.waybar_git;
        settings = [{
            "layer" = "top";
            "position" = "top";
            "mod" = "dock";
            "exclusive" = true;
            "passtrough" = false;
            "gtk-layer-shell" = true;
            "height" = 0;
            "modules-left" = [ "cpu" "memory" ];
            "modules-center" = [ "clock" ];
            "modules-right" = [ "battery" ];

            "clock" = {
                "format" = "{:%a %d %b %H:%M}";
                "tooltip" = false;
            };
            
            "cpu" = {
                "format" = "CPU {usage}%";
                "tooltip" = false;
            };

            "memory" = {
                "format" = "RAM {used:0.1f}G/{total:0.1f}G";
                "tooltip" = false;
            };

            "battery" = {
                "format" = "{capacity}%";
                "format-charging" = "{capacity}%";
                "format-discharging" = "{capacity}%";
                "tooltip" = false;
                "interval" = 30;
            };
        }];

        style = ''
            * {
                font-size: 14px;
                color: #ffffff;
            }

            #waybar {
                background-color: rgba(20, 20, 20, 0.9);
                border-bottom: 2px solid rgba(255, 255, 255, 0.05);
            }
        '';
    };
}
