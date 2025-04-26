{ config, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        autocd = true;
        history.size = 10000;
        initExtra = ''
            export Status=$(cat /home/roham/.dotfiles/status.sh | grep 'status=' | cut -d '=' -f2 | tr -d '"')
            [[ ! -f ${/home/roham/.p10k.zsh} ]] || source ${/home/roham/.p10k.zsh}

            bindkey '^P' history-beginning-search-backward
            bindkey '^N' history-beginning-search-forward
            bindkey '^J' forward-word
            bindkey '^H' backward-word
        '';
        shellAliases = {
            ll = "ls -l";
            close = "kill -9 $PPID && sed -i 's/status=.*/status='default'/' /home/roham/.dotfiles/status.sh && exit";
        };

        zplug = {
            enable = true;
            plugins = [
                { name = "zsh-users/zsh-autosuggestions"; }
                { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
                { name = "zsh-users/zsh-completions"; }
                { name = "zsh-users/zsh-syntax-highlighting"; tags = [ from:github ]; }
                { name = "zsh-users/zsh-history-substring-search"; tags = [ from:github defer:2 ]; }
                { name = "djui/alias-tips"; tags = [ from:github ]; }
            ];
        };
    };
}
