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
  programs.kitty = {
    enable = true;
    settings = {
      #font_family = "FantasqueSansM Nerd Font"; <- stylix
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      # background_opacity = 1.0; <- stylix
      confirm_os_window_close = 0;
      linux_display_server = "wayland";
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      enable_audio_bell = "no";
      window_padding_width = 4;
      selection_foreground = "none";
      selection_background = "none";
    };
  };
}
