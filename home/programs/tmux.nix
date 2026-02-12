{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {
  programs.tmux = {
    enable = true;
    sensibleOnTop = true;
    plugins = [
      # pkgs.tmuxPlugins.sensible
      pkgs.tmuxPlugins.resurrect
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_window_left_separator "█"
          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_middle_separator "  █"

          set -g @catppuccin_window_default_fill "number"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#{pane_current_path}"

          set -g @catppuccin_status_modules_right "application session date_time"
          set -g @catppuccin_status_left_separator  ""
          set -g @catppuccin_status_right_separator " "
          set -g @catppuccin_status_fill "all"
          set -g @catppuccin_status_connect_separator "yes"
        '';
      }
    ];
    extraConfig = ''
      set -g base-index 1
      set -g pane-base-index 1
    '';
  };
}
