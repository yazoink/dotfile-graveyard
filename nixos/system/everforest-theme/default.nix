# to be paired with home-manager theme module
{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.qtquickcontrols2
    libsForQt5.qtgraphicaleffects
    libsForQt5.qtstyleplugin-kvantum
    base16-schemes
    qt5ct
    qt6ct
    adw-gtk3
  ];

  stylix = {
    enable = true;
    targets = {
      nixos-icons.enable = true;
      grub.enable = false;
      console.enable = false;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";

    image = ./wallpaper.png;

    fonts = {
      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 12;
      };
      serif = {
          package = pkgs.cascadia-code;
          name = "Cascadia Code";
      };
      sansSerif = {
          package = pkgs.cascadia-code;
          name = "Cascadia Code";
      };
      monospace = {
          package = pkgs.cascadia-code;
          name = "Cascadia Code";
      };
    };
  };
}
