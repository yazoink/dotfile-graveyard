{pkgs, ...}:
{
  programs.ags = {
    enable = true;
    configDir = ./config;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
}
