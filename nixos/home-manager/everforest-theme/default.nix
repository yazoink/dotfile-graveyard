# depends on system theme module
{pkgs, lib, ...}:
  let
    everforestIcons = import ./everforest-icons.nix {
      inherit pkgs;
    };
    everforestCursors = import ./everforest-cursors.nix {
      inherit pkgs;
    };
  in
{
  stylix = {
    targets = {
      mako.enable = true;
      waybar.enable = false;
      wofi.enable = false;
      gtk.enable = true;
      firefox.enable = true;
      hyprland.enable = true;
      btop.enable = true;
      alacritty.enable = true;
      hyprpaper.enable = lib.mkForce false;
    };

    cursor = {
      name = "everforest-cursors";
      package = everforestCursors;
      size = 32;
    };
  };

  home.file = {
    ".icons/Everforest-Dark".source = "${everforestIcons}/Everforest-Dark";
    ".icons/everforest-cursors".source = lib.mkForce "${everforestCursors}/everforest-cursors";
    ".config/qt5ct/qt5ct.conf".source = ./qt5ct.conf;
    ".config/qt6ct/qt6ct.conf".source = ./qt6ct.conf;
    ".config/vesktop/themes/my.theme.css".source = ./my.theme.css;
  };

  gtk = {
    enable = true;
    iconTheme.package = everforestIcons;
    iconTheme.name = "Everforest-Dark";
  };
  

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=KvLibadwaita
    '';
    "Kvantum/KvLibadwaita".source = ./KvLibadwaita;
  };

  programs = {
    hyprlock.extraConfig = ''
      background {
	      path = screenshot
	      color = rgba(61, 72, 77, 1)

	      blur_passes = 3
	      blur_size = 1
      }

      input-field {
	      size = 200 30
	      outline_thickness = 0
	      dots_size = 0.3
	      dots_center = true
	      font_family = Cascadia Code
	      outer_color = rgba(61, 72, 77, 1)
	      inner_color = rgba(61, 72, 77, 1)
	      font_color = rgba(211, 198, 170, 1)
	      fade_on_empty = false
	      placeholder_text = 
	      check_color = rgba(219, 188, 127, 1)
	      fail_color = rgba(230, 126, 128, 1)
	      fail_text = <i><b>Wrong password</b></i>
      }

      label {
	  text = $TIME
	  text_align = center
	  color = rgba(211, 198, 170, 1)
	  font_size = 45
	  font_family = Cascadia Code Bold

	  position = 0, 80
	  halign = center
	  valign = center
      }
    '';
    
    waybar.style = ''
      @define-color base00 #2f383e;
      @define-color base01 #374247;
      @define-color base02 #4a555b;
      @define-color base03 #859289;
      @define-color base04 #9da9a0;
      @define-color base05 #d3c6aa;
      @define-color base06 #e4e1cd;
      @define-color base07 #fdf6e3;
      @define-color base08 #7fbbb3;
      @define-color base09 #d699b6;
      @define-color base0A #dbbc7f;
      @define-color base0B #83c092;
      @define-color base0C #e69875;
      @define-color base0D #a7c080;
      @define-color base0E #e67e80;
      @define-color base0F #eaedc8;

      * {
	font-family: "Cascadia Code", "Font Awesome 6 Free";
	font-size: 16px;
	padding: 0px;
	margin: 0px;
      }

      #workspaces button {
	color: @base05;
	padding-left: 0.5em;
	padding-right: 0.5em;
      }

      #workspaces button:hover {
	background-color: @base00;
      }

      #memory,
      #cpu,
      #temperature,
      #wireplumber,
      #battery,
      #backlight,
      #tray {
	padding-left: 0.5em;
	padding-right: 0.5em;
      }

      .modules-left #workspaces button.focused,
      .modules-left #workspaces button.active {
	border-bottom: 2px solid @base0D;
      }

      tooltip {
	background: @base00;
	border: 2px solid @base0D;
      }

      tooltip label {
	color: @base05;
      }
    '';

    wofi.style = ''
      * {
	font-family: "Cascadia Code";
	font-size: 16px;
	border: none;
	border-radius: 7.5px;
	outline: none;
      }

      window {
	  margin: 3px;
	  border: 2px solid #a7c080;
      }

      #input {
	  margin: 3px;
      }

      #inner-box {
	  margin: 3px;
      }

      #outer-box {
	  margin: 3px;
      }

      #scroll {
	  margin: 3px;
      }

      #text {
	  margin: 3px;
      }
    '';
  };
}
