{ config, pkgs, inputs, xSettings, ... }:
let
   inherit (xSettings) username;
in {

  imports = [
    ./app
    ./theming.nix
    ./packages.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
    overlays = [ 
      inputs.hyprpanel.overlay 
      (import ../overlay/manix.nix)
    ];
  };

  # for manix overlay
  manual.json.enable = true;

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;
  xdg.userDirs.createDirectories = true;

}
