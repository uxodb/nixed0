{ config, pkgs, inputs, lib, xSettings, ...}:

let
  inherit (xSettings) appConfig;
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  
  wayland.windowManager.hyprland = {
    enable = false;
    systemd.enable = lib.mkForce false;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [ 
    #   inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    #   inputs.dynamicpointer.packages.${pkgs.system}.hypr-dynamic-cursors
    #   inputs.hypr-plugins.packages.${pkgs.system}.hyprexpo
    #   # pkgs.hyprlandPlugins.hyprfocus
    ];
    settings = {
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "fuzzel";
      "$screenshot" = "flameshot gui";
      "$screencast" = "wl-screenrec -g \"$(slurp)\"";
      "$lock" = "hyprlock";
      exec-once = [
        "$terminal"
        "hyprpaper"
        "hyprpanel"
        "pypr"
        "flameshot"
      ];
      monitor = [
        "DP-1, 2560x1440@144, 0x0, 1"
        "DP-2, 1920x1080@60, 2560x0, 1"
      ];
      general = {
        gaps_in = 4;
        gaps_out = 15;
        border_size = 2;
        "col.active_border" = "$peach $mauve 45deg";
        "col.inactive_border" = "$lavender $green 45deg;";
        # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };
      group = {
        "col.border_active" = "$peach $mauve 45deg";
        "col.border_inactive" = "$lavender $green 45deg";
        "col.border_locked_active" = "$peach $mauve 45deg";
        "col.border_locked_inactive" = "$lavender $green 45deg";
      };
      decoration = {
        rounding = 3;
        active_opacity = 0.7;
        inactive_opacity = 0.5;
        dim_inactive = true;
        dim_strength = 0.3;
        dim_special = 0.3;
        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = true;
          popups = true;
          ignore_opacity = true;
          xray = false;
          special = true;
        };
        shadow = {
          enabled = false;
        };
      };
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default, slidefade 30%"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "master";
      };
      misc = {
        # font_family = "";
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;
      };
      cursor = {
        enable_hyprcursor = false;
      };
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, L, exec, $lock"
        "Alt_L, grave, exec, $screenshot"
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo," #dwindle
        "$mainMod, J, togglesplit," #dwindle
        "$mainMod, F, fullscreen,"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ] ++ (
          builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mainMod, code:1${toString i}, workspace, ${toString ws}"
            "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ])
        9)
      );
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];
      bindl = [
        " , XF86AudioNext, exec, playerctl next"
        " , XF86AudioPause, exec, playerctl play-pause"
        " , XF86AudioPlay, exec, playerctl play-pause"
        " , XF86AudioPrev, exec, playerctl previous"
      ];
      windowrule = [
        "suppress_event maximize, match:class .*"
        "no_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0"
      ];
    };
  };
}

