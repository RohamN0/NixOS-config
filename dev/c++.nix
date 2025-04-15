{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell 
{
    nativeBuildInputs = with pkgs; [
        stdenv
        ncurses
        llvmPackages_14.clang-tools
    ];

    shellHook = ''
        cp -R /home/roham/.dotfiles/apps/nvim/c++/* /home/roham/.config/nvim/
        trap 'cp -R /home/roham/.dotfiles/apps/nvim/default/* /home/roham/.config/nvim/' EXIT
        
        sed -i 's/^status=.*/status="c++"/' /home/roham/.dotfiles/status.sh
        zsh
        source /home/roham/.zshrc
    '';
}
