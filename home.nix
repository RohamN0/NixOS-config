{ config, pkgs, inputs,  ... }:

{
  imports = 
    [
        /home/roham/.dotfiles/apps/tmux.nix
        /home/roham/.dotfiles/apps/zsh.nix
        /home/roham/.dotfiles/apps/ghostty.nix
        /home/roham/.dotfiles/apps/texlive.nix
        /home/roham/.dotfiles/apps/hyperland.nix
    ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "roham";
  home.homeDirectory = "/home/roham";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
    '')

    (pkgs.writeShellScriptBin "dev-python" ''
        cd /home/roham/.dotfiles
        nix develop --impure .\#python
    '')

    (pkgs.writeShellScriptBin "dev-cpp" ''
        cd /home/roham/.dotfiles
        nix develop --impure .\#cpp
    '')

   (pkgs.writeShellScriptBin "home-manager-update" ''
        cd /home/roham/.dotfiles
        home-manager switch --impure --flake .
   '')

   (pkgs.writeShellScriptBin "update" ''
        cd /home/roham/.dotfiles
        nixos-rebuild switch --flake .#roham --use-remote-sudo
   '')

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/roham/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "neovim";
  };
 
  programs.zsh.enable = true;
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
