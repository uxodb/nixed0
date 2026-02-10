{ config, pkgs, lib, xSettings, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        # include=~/.config/fuzzel/green.ini
        # output=<not set>
        # font="FantasqueSansM Nerd Font"; <- stylix
        # dpi-aware=auto
        use-bold="yes";
        prompt="\"> \"";
        # placeholder=
        icon-theme="hicolor";
        icons-enabled="yes";
        hide-before-typing="no";
        fields="filename,name,generic";
        # password-character=*
        # filter-desktop="no";
        match-mode="fzf";
        sort-result="yes";
        match-counter="no";
        # delayed-filter-ms=300
        # delayed-filter-limit=20000
        # show-actions=no
        terminal="kitty";
        # launch-prefix=<not set>
        list-executables-in-path="no";
        anchor="center";
        # x-margin=0
        # y-margin=0
        # lines=15
        # width=30
        # tabs=8
        # horizontal-pad=40
        # vertical-pad=8
        # inner-pad=0
        image-size-ratio=0.5;
        #line-height=<use font metrics>
        letter-spacing=0;
        layer="overlay";
        exit-on-keyboard-focus-loss="yes";
        # cache=<not set> /dev/null
        # render-workers=<number of logical CPUs>
        # match-workers=<number of logical CPUs>
      };
    };
  };
}
