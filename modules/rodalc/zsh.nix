{
  flake.modules.homeManager.rodalc = { pkgs, ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      history.size = 10000;
      history.path = "$HOME/.zsh_history";

      initContent = ''
        source ${pkgs.grml-zsh-config}/etc/zsh/zshrc
        source ${./files/vim.zsh}
      '';

      loginExtra = ''
        if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec uwsm start hyprland.desktop
        fi
      '';
    };
  };
}
