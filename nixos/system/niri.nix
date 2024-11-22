{pkgs, lib, ...}:
{
  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
    gnome-keyring
    swaybg
    wdisplays
    libnotify
    poweralertd
    #upower-notify
    hyprpicker
    swaylock
    swayidle
    xwayland-satellite
    wl-clipboard
    xclip
    #clipboard-jh
    networkmanagerapplet
    wayland-utils
    gtklock
    kdePackages.qtwayland
  ];
  programs.xwayland.enable = true;
  xdg = {
    autostart.enable = true;
    menus.enable = true;
    mime.enable = true;
    icons.enable = true;
  };
  xdg.portal = {
    config.common.default = [ "gtk" ];
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
  services = {
    dbus.enable = true;
    gnome.gnome-keyring.enable = true;
    clipboard-sync.enable = true;
  };

  environment.sessionVariables = {
    WAYLAND_DISPLAY = "wayland-0";
    XDG_RUNTIME_DIR = "/run/user/1000";
  };

  security.polkit.enable = true;
  security.pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
}
