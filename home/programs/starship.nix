{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: let
  inherit (xSettings) appConfig;
in {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";
      format = "[](fg:base_macchiato)$os$username[](bg:peach fg:base_macchiato)$directory[](fg:peach bg:green)$git_branch$git_status[](fg:green bg:sky)$c$rust$golang$nodejs$php$java$kotlin$haskell$python[](fg:sky bg:blue)$docker_context$conda[](fg:blue bg:pink)$time[ ](fg:pink)$line_break$character";
      palette = "catppuccin_mocha";
      palettes = {
        gruvbox_dark = {
          surface1 = "#fbf1c7";
          surface11 = "#000000";
          color_bg1 = "#3c3836";
          color_bg3 = "#665c54";
          sky = "#458588";
          color_aqua = "#689d6a";
          color_green = "#98971a";
          color_orange = "#d65d0e";
          color_purple = "#b16286";
          color_red = "#cc241d";
          color_yellow = "#d79921";
        };
        catppuccin_macchiato = {
          rosewater = "#f4dbd6";
          flamingo = "#f0c6c6";
          pink = "#f5bde6";
          mauve = "#c6a0f6";
          red = "#ed8796";
          maroon = "#ee99a0";
          peach = "#f5a97f";
          yellow = "#eed49f";
          green = "#a6da95";
          teal = "#8bd5ca";
          sky = "#91d7e3";
          sapphire = "#7dc4e4";
          blue = "#8aadf4";
          lavender = "#b7bdf8";
          text = "#cad3f5";
          subtext1 = "#b8c0e0";
          subtext0 = "#a5adcb";
          overlay2 = "#939ab7";
          overlay1 = "#8087a2";
          overlay0 = "#6e738d";
          surface2 = "#5b6078";
          surface1 = "#494d64";
          surface0 = "#363a4f";
          base = "#24273a";
          mantle = "#1e2030";
          crust = "#181926";
        };
        catppuccin_mocha = {
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          mauve = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          base_macchiato = "#24273a";
          mantle = "#181825";
          crust = "#11111b";
        };
      };
      os = {
        disabled = false;
        style = "bg:base_macchiato fg:text";
        symbols = {
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          EndeavourOS = "";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
        };
      };
      username = {
        show_always = true;
        style_user = "bg:base_macchiato fg:text";
        style_root = "bg:color_orange fg:surface1";
        format = "[ $user ]($style)";
      };
      directory = {
        style = "fg:base bg:peach";
        format = "[ $path ]($style)";
        truncation_length = 100;
        truncate_to_repo = false;
        truncation_symbol = "…/";
        substitutions = {
          documents = "󰈙 ";
          downloads = " ";
          Music = "󰝚 ";
          Pictures = " ";
          git = "󰲋 ";
        };
      };
      git_branch = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol $branch ](fg:base bg:green)]($style)";
      };
      git_status = {
        style = "bg:green";
        format = "[[($all_status$ahead_behind )](fg:surface1 bg:green)]($style)";
      };
      nodejs = {
        symbol = "";
        style = "bg:sky";
        format = "[[ $symbol( $version) ](fg:surface1 bg:sky)]($style)";
      };
      c = {
        symbol = " ";
        style = "bg:sky";
        format = "[[ $symbol( $version) ](fg:surface1 bg:sky)]($style)";
      };
      rust = {
        symbol = "";
        style = "bg:sky";
        format = "[[ $symbol( $version) ](fg:surface1 bg:sky)]($style)";
      };
      golang = {
        symbol = "";
        style = "bg:sky";
        format = "[[ $symbol( $version) ](fg:surface1 bg:sky)]($style)";
      };
      php = {
        symbol = "";
        style = "bg:sky";
        format = "[[ $symbol( $version) ](fg:surface1 bg:sky)]($style)";
      };
      java = {
        symbol = " ";
        style = "bg:sky";
        format = "[[ $symbol( $version) ](fg:surface1 bg:sky)]($style)";
      };
      kotlin = {
        symbol = "";
        style = "bg:sky";
        format = "[[ $symbol( $version) ](fg:surface1 bg:sky)]($style)";
      };
      haskell = {
        symbol = "";
        style = "bg:sky";
        format = "[[ $symbol( $version) ](fg:surface1 bg:sky)]($style)";
      };
      python = {
        symbol = "";
        style = "bg:sky";
        format = "[[ $symbol( $version) ](fg:surface1 bg:sky)]($style)";
      };
      docker_context = {
        symbol = "";
        style = "bg:color_bg3";
        format = "[[ $symbol( $context) ](fg:#83a598 bg:color_bg3)]($style)";
      };
      conda = {
        style = "bg:color_bg3";
        format = "[[ $symbol( $environment) ](fg:#83a598 bg:color_bg3)]($style)";
      };
      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:pink";
        format = "[[   $time ](fg:base bg:pink)]($style)";
      };
      line_break = {
        disabled = false;
      };
      character = {
        disabled = false;
        success_symbol = "[](bold fg:color_green)";
        error_symbol = "[](bold fg:color_red)";
        vimcmd_symbol = "[](bold fg:color_green)";
        vimcmd_replace_one_symbol = "[](bold fg:color_purple)";
        vimcmd_replace_symbol = "[](bold fg:color_purple)";
        vimcmd_visual_symbol = "[](bold fg:color_yellow)";
      };
    };
  };
}
