{ config, pkgs, inputs, lib, xSettings, ...}:

let
  inherit (xSettings) appConfig;
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = lib.mkForce false;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [ 
      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    settings = {
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "fuzzel";
      exec-once = [
        "$terminal"
        "waybar"
      ];
      monitor = [
        # "DP-1, 2560x1440@144, 0x0, 1"
        # "DP-2, 1920x1080@60, 2560x0, 1"
        "Virtual-1, 1920x1080@60, auto, 1"
      ];
      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 2;
        # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
      };
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
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
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo," #dwindle
        "$mainMod, J, togglesplit," #dwindle
          
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
      ] ++ (
          builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mainMod, code:1${toString i}, workspace, ${toString ws}"
            "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ])
        9)
      );
    };
  };
}

