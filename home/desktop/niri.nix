{
  config,
  lib,
  pkgs,
  ...
}: { 

  programs.niri.settings = {
    # Input configuration
    input = {
      keyboard = {
        xkb = {
          layout = "us,ru";
          options = "grp:win_space_toggle";
        };
        numlock = true;
      };

      mouse = {
        accel-speed = 0.1;
        accel-profile = "adaptive";
        scroll-factor = 0.9;
        middle-emulation = true;
      };

      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "90%";
      };

      workspace-auto-back-and-forth = true;
    };

    # Output configuration
    outputs = {

      # External HDMI display
      "HDMI-A-1" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 74.973;
        };
        scale = 1.0;
        position = {
          x = 0;
          y = 0;
        };
      };
    };

    # Layer rules
    layer-rules = [
      {
        matches = [
          {
            namespace = "^wallpaper$";
          }
        ];
        place-within-backdrop = true;
      }
      {
        matches = [
          {
            namespace = "^launcher";
          }
        ];
        shadow = {
          enable = true;
          softness = 40;
          spread = 5;
          offset = {
            x = 0;
            y = 5;
          };
          draw-behind-window = true;
          color = "#00000050";
        };
      }
    ];

    # Window rules
    window-rules = [
      {
        matches = [
          {
            app-id = "qalculate-gtk";
          }
        ];
        open-maximized = true;
      }
      {
        matches = [
          {
            app-id = "calcure";
          }
        ];
        open-maximized = true;
      }
      {
        matches = [
          {
            app-id = "television-launcher";
          }
        ];
        default-column-width = {
          proportion = 0.8;
        };
        open-floating = true;
        tiled-state = true;
        default-window-height = {
          fixed = 700;
        };
        shadow = {
          enable = true;
          softness = 40;
          spread = 5;
          offset = {
            x = 0;
            y = 5;
          };
          draw-behind-window = true;
          color = "#00000050";
        };
      }
      {
        matches = [
          {
            title = "Television Picker";
          }
        ];
        default-column-width = {
          proportion = 0.8;
        };
        open-floating = true;
        tiled-state = true;
        default-window-height = {
          fixed = 700;
        };
        shadow = {
          enable = true;
          softness = 40;
          spread = 5;
          offset = {
            x = 0;
            y = 5;
          };
          draw-behind-window = true;
          color = "#00000050";
        };
      }
      # Transparency rules
      {
        matches = [
          {
            is-active = true;
          }
        ];
        opacity = 0.98;
      }
      {
        matches = [
          {
            is-active = false;
          }
        ];
        opacity = 0.98;
      }
      # Ensure no CSD for specific apps
      {
        matches = [
          {
            app-id = "^org\\.wezfurlong\\.wezterm$";
          }
        ];
      }
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
      }
    ];

    # Hotkey overlay
    hotkey-overlay = {
      skip-at-startup = true;
    };

    # Other settings
    prefer-no-csd = true;

    # Gestures
    gestures = {
      dnd-edge-view-scroll = {
        trigger-width = 30;
        delay-ms = 100;
        max-speed = 1500;
      };
      dnd-edge-workspace-switch = {
        trigger-height = 50;
        delay-ms = 100;
        max-speed = 1500;
      };
      hot-corners = {
        enable = false;
      };
    };

    # Overview
    overview = {
      zoom = 0.6;
      workspace-shadow = {
        enable = false;
      };
    };

    # Layout configuration
    layout = {
      shadow = {
        softness = 10;
        spread = 5;
        offset = {
          x = 0;
          y = 5;
        };
        draw-behind-window = false;
        color = "#090D1270";
        inactive-color = "#00000054";
      };

      background-color = "transparent";
      gaps = 12;
      struts = {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
      };
      center-focused-column = "never";

      preset-column-widths = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
        { proportion = 1.0; }
      ];

      default-column-width = {
        proportion = 0.5;
      };

      preset-window-heights = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
        { proportion = 1.0; }
        { fixed = 720; }
      ];
    };

    # Startup programs
    spawn-at-startup = [
      { command = [ "alacritty" ]; }
    ];

    # Screenshot path
    screenshot-path = "~/Screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png";

    # Key bindings
    binds = with config.lib.niri.actions; {
      # Focus navigation
      "Mod+Left".action = focus-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Up".action = focus-window-up;
      "Mod+Down".action = focus-window-down;
      "Mod+H".action = focus-column-left;
      "Mod+L".action = focus-column-right;
      "Mod+K".action = focus-window-up;
      "Mod+J".action = focus-window-down;
      "Mod+Tab".action = focus-workspace-previous;
      "Alt+Tab".action = focus-window-previous;

      # Window & Column Manipulation
      "Mod+Q".action = close-window;
      "Mod+V".action = toggle-window-floating;
      "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;
      "Mod+Comma".action = consume-or-expel-window-left;
      "Mod+Period".action = consume-or-expel-window-right;

      # Move column
      "Mod+Ctrl+Left".action = move-column-left;
      "Mod+Ctrl+Right".action = move-column-right;
      "Mod+Ctrl+Down".action = move-column-to-workspace-down;
      "Mod+Ctrl+Up".action = move-column-to-workspace-up;
      "Mod+Ctrl+H".action = move-column-left;
      "Mod+Ctrl+L".action = move-column-right;
      "Mod+Ctrl+J".action = move-column-to-workspace-down;
      "Mod+Ctrl+K".action = move-column-to-workspace-up;

      # Move window
      "Mod+Ctrl+S".action = move-window-up-or-to-workspace-up;
      "Mod+Ctrl+A".action = move-window-down-or-to-workspace-down;

      # Maximize
      "Mod+F".action = maximize-column;
      "Mod+Shift+F".action = fullscreen-window;
      "Mod+Z".action = toggle-column-tabbed-display;
      "Mod+Shift+C".action = center-column;
      "Mod+R".action = switch-preset-column-width;
      "Mod+Shift+R".action = switch-preset-window-height;
      "Mod+Ctrl+R".action = reset-window-height;
      "Mod+Minus".action = set-column-width "-10%";
      "Mod+Equal".action = set-column-width "+10%";
      "Mod+Shift+Minus".action = set-window-height "-10%";
      "Mod+Shift+Equal".action = set-window-height "+10%";

      # Workspace Navigation (Dynamic)
      "Mod+Alt+Up".action = move-workspace-up;
      "Mod+Alt+Down".action = move-workspace-down;
      "Mod+Shift+Up".action = focus-workspace-up;
      "Mod+Shift+Down".action = focus-workspace-down;

      # Workspace Navigation (Numeric)
      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+5".action = focus-workspace 5;
      "Mod+6".action = focus-workspace 6;
      "Mod+7".action = focus-workspace 7;
      "Mod+8".action = focus-workspace 8;
      "Mod+9".action = focus-workspace 9;
      "Mod+0".action = focus-workspace 10;

      "Mod+Return".action = spawn "alacritty";
      "Mod+D".action = spawn ["rofi" "-mode" "drun"];
      "Mod+B".action = spawn "firefox";

      # Mouse & Trackpad Scroll Bindings
      "Mod+WheelScrollDown" = {
        action = focus-workspace-down;
        cooldown-ms = 50;
      };
      "Mod+WheelScrollUp" = {
        action = focus-workspace-up;
        cooldown-ms = 50;
      };
      "Mod+WheelScrollRight" = {
        action = focus-column-right;
        cooldown-ms = 100;
      };
      "Mod+WheelScrollLeft" = {
        action = focus-column-left;
        cooldown-ms = 100;
      };

      # Multimedia & Hardware Controls
      "XF86AudioRaiseVolume" = {
        action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+";
        allow-when-locked = true;
      };
      "XF86AudioLowerVolume" = {
        action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-";
        allow-when-locked = true;
      };
      "XF86AudioMute" = {
        action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        allow-when-locked = true;
      };
      "XF86AudioMicMute" = {
        action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
        allow-when-locked = true;
      };
      "XF86MonBrightnessUp" = {
        action = spawn "brightnessctl" "set" "+5%";
        allow-when-locked = true;
      };
      "XF86MonBrightnessDown" = {
        action = spawn "brightnessctl" "set" "5%-";
        allow-when-locked = true;
      };
      "XF86AudioPlay" = {
        action = spawn "playerctl" "play-pause";
        allow-when-locked = true;
      };
      "XF86AudioNext" = {
        action = spawn "playerctl" "next";
        allow-when-locked = true;
      };
      "XF86AudioPrev" = {
        action = spawn "playerctl" "previous";
        allow-when-locked = true;
      };

      # Overview
      "Mod+X" = {
        action = toggle-overview;
        repeat = false;
      };
    };
  };
}
