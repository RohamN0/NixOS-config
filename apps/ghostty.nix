{ config, pkgs, ... } :

{
    programs.ghostty = {
        enable = true;
        enableZshIntegration = true;
        settings = { 
            title = "Roham";
            font-size = 16;
	        font-family = "Iosevka Nerd Font";
	        background = "1C2021";
	        theme = "GruvboxDarkHard";
	        window-colorspace = "display-p3";
	        adjust-cell-height = "35%";
	        cursor-style = "block";

	        shell-integration-features = "no-cursor,no-title,sudo";
	        mouse-hide-while-typing = true;
	        mouse-scroll-multiplier = 10;
	        window-save-state = "always";
	        window-padding-balance = true;

	        copy-on-select = "clipboard";

            keybind = [
                "ctrl+a>b=quit"
                "ctrl+a>s=new_window"
                "ctrl+a>u=scroll_page_up"
                "ctrl+a>n=scroll_page_down"
                "ctrl+a>m=toggle_maximize"
            ];
        };
    };
}
