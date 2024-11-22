{pkgs, ...}:
{
  home.file.".config/niri/config.kdl".source = ./config.kdl;

  /*services.swayidle = {
    enable = true;
    systemdTarget = "niri-session.target";
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.gtklock}/bin/gtklock --daemonize";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.gtklock}/bin/gtklock --daemonize";
      }
      {
        timeout = 600;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
        resumeCommand = "${pkgs.niri}/bin/niri output '*' dpms on";
      }
    ];
  };*/
  /*programs.swaylock = {
    enable = true;
    }; */

  /*home.sessionVariables = {
    WAYLAND_DISPLAY = "wayland-0";
    XDG_RUNTIME_DIR = "/run/user/1000/";
  };*/

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "${pkgs.niri}/bin/niri output '*' dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "gtklock";
      };
      listener = [
        {
          timeout = 900;
          on-timeout = "gtklock";
        }
        {
          timeout = 1200;
          on-timeout = "${pkgs.niri}/bin/niri msg action power-off-monitors";
          on-resume = "${pkgs.niri}/bin/niri output '*' dpms on";
        }
      ];
    };
  };
}
