{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell 
{
    nativeBuildInputs = with pkgs; [
        basedpyright
        stdenv
        nodejs_23
        python313Full
        (pkgs.python313.withPackages(pypkgs: with pypkgs; [
            pip
            python-lsp-server
            numpy
            pandas
            requests
            # tensorflowWithoutCuda
            plotly
            selenium
            sympy
            scipy
            jsons
            base64io
            datetime
            fastapi
            beautifulsoup4
            annotated-types
            urllib3
            lxml
        ]))
    ];

    shellHook = ''
        cp -R /home/roham/.dotfiles/apps/nvim/python/* /home/roham/.config/nvim/
        trap 'cp -R /home/roham/.dotfiles/apps/nvim/default/* /home/roham/.config/nvim/' EXIT
        
        sed -i 's/status=.*/status="python"/' /home/roham/.dotfiles/status.sh
        zsh
        source /home/roham/.zshrc
    '';
}
