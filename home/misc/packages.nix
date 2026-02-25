
{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = builtins.attrValues {
        inherit
          (pkgs)
          remmina
          citrix-workspace
          ;
      };
}
