{
  flake.modules.homeManager.rodalc = { pkgs, ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      history.size = 10000;
      history.path = "$HOME/.zsh_history";

      plugins = [
        {
          name = "grml-zsh-config";
          src = pkgs.grml-zsh-config;
          file = "etc/zsh/zshrc";
        }
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = ./files;
          file = "p10k.zsh";
        }
        {
          name = "vim-mode";
          src = ./files;
          file = "vim.zsh";
        }
      ];

      loginExtra = ''
        if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec uwsm start hyprland.desktop
        fi
      '';
    };
  };
}
