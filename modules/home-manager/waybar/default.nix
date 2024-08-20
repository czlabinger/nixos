{pkgs, ...}: let
  waybar-hyprland = pkgs.waybar.overrideAttrs (oldAttrs: {
    mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    postPatch = ''
      # use hyprctl to switch workspaces
      sed -i 's|zext_workspace_handle_v1_activate(workspace_handle_);|const std::string command = "${pkgs.hyprland}/bin/hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());|g' src/modules/wlr/workspace_manager.cpp
    '';
  });
in {

  programs.waybar = {

    enable = true;
    package = waybar-hyprland;
    

    modules = ''
// -*- mode: json -*-

{
	"layer": "bottom",
	"position": "top",
    "margin": "10, 10, 0, 10",

	"modules-left": [
		"custom/arch-icon",
		"hyprland/workspaces",
		"custom/right-arrow-dark",
		"hyprland/window"
	],

	"modules-center": [
	],

	"modules-right": [
		"cava",
		"privacy",
		"tray",
		"mpris",
		"custom/left-arrow-dark",
		"network",
		"custom/left-arrow-light",
		"custom/left-arrow-dark",
		"pulseaudio",
		"custom/left-arrow-light",
		"custom/left-arrow-dark",
		"clock",
		"custom/left-arrow-light",
		"custom/left-arrow-dark",
		"battery",
		"custom/left-arrow-light",
		"custom/left-arrow-dark",
		"custom/swaync",
		"custom/powerbutton"
	],
	/* powerline arrors */

	"custom/left-arrow-dark": {
		"format": "",
		"tooltip": false
	},
	"custom/left-arrow-light": {
		"format": "",
		"tooltip": false
	},
	"custom/right-arrow-dark": {
		"format": "",
		"tooltip": false
	},
	"custom/right-arrow-light": {
		"format": "",
		"tooltip": false
	},

	/* Left */

	"custom/arch-icon": {
		"format": "󰣇",
		"on-click": "chromium https://wiki.archlinux.org/",
		"on-click-right": "chromium https://archlinux.org/packages/",
		"on-click-middle": "chromium https://aur.archlinux.org/",
		"tooltip-format": "Archwiki"
	},

	"custom/fedora-icon":{
		"format": "",
		"on-click": "chromium https://docs.fedoraproject.org/en-US/docs/"
	},

    "hyprland/workspaces": {
        "disable-scroll": true,
        "all-outputs": false,
        "warp-on-scroll": false,
        "format": "{name}: {icon}",
        "format-icons": {
            "1": " ",
            "2": " ",
            "3": " ",
            "4": " ",
            "5": " ",
            "6": " ",
            "7": " ",
            "urgent": " ",
            "focused": " ",
            "default": " "
        }
    },

	"hyprland/window": {
		"format": "{title}",
		"separate-outputs": true,
		"icon": true,
		"rewrite": {
			"(.*) - Chromium": "Chromium"	// xwayland title does not update and it look really ugly
		}
	},

	/* Right */

	"privacy": {
		"icon-spacing": 8,
		"icon-size": 18,
		"transition-duration": 250,
		"modules": [
			{
				"type": "screenshare",
				"tooltip": true,
				"tooltip-icon-size": 24
			},
			{
				"type": "audio-out",
				"tooltip": true,
				"tooltip-icon-size": 24
			},
			{
				"type": "audio-in",
				"tooltip": true,
				"tooltip-icon-size": 24
			}
		]
	},

	"tray": {
		"icon-size": 18,
		"spacing": 8
	},

	"mpris": {
		"format": "{player_icon}",
		"format-paused": "{status_icon}",
		"player-icons": {
			"default": "",
			"mpv": "🎵"
		},
		"status-icons": {
			"paused": ""
		}
		// "ignored-players": ["firefox"]
	},

	"custom/wallpaper-changer": {
		"format": "Change Wallpaper",
		"on-click": "~/.config/hypr/scripts/wallpaperChanger"
	},

	"network": {
		"format-wifi": "{essid} ({signalStrength}%) ",
		"format-ethernet": "{ipaddr}/{cidr} 󰌘",
		"format-disconnected": "󰌙", 
		"tooltip-format-wifi": " {bandwidthDownBytes}   {bandwidthUpBytes}",
		"tooltip-format-ethernet": " {bandwidthDownBytes}   {bandwidthUpBytes}",
		"tooltip-format-disconnected": "Disconnected",
		"on-click": "networkmanager_dmenu",
		"max-length": 50
	},

	"pulseaudio": {
		"format": "{icon} {volume:2}%",
		"format-bluetooth": "{icon}  {volume}%",
		"format-muted": " ",
		"format-icons": {
			"headphones": " ",
			"default": [
				" ",
				" "
			]
		},
		"scroll-step": 5,
		"on-click": "pactl set-sink-mute @DEFAULT_SINK@ toggle",
		"on-click-right": "pavucontrol --tab=3"
	},

    "clock": {
        "format": "{:%d/%m/%y %a %R} ",
        "tooltip-format": "<tt><small>{calendar}</small></tt>",
        "calendar": {
			"mode"          : "year",
			"mode-mon-col"  : 3,
			"weeks-pos"     : "right",
			"on-scroll"     : 1,
			"format": {
				"months":     "<span color='#ffead3'><b>{}</b></span>",
				"days":       "<span color='#ecc6d9'><b>{}</b></span>",
				"weeks":      "<span color='#99ffdd'><b>W{}</b></span>",
				"weekdays":   "<span color='#ffcc66'><b>{}</b></span>",
				"today":      "<span color='#ff6699'><b><u>{}</u></b></span>"
			}
		},
        "actions":  {
			"on-click-right": "mode",
			"on-click-forward": "tz_up",
			"on-click-backward": "tz_down",
			"on-scroll-up": "shift_up",
			"on-scroll-down": "shift_down"
		}
    },
	"battery": {
		"states": {
			"good": 95,
			"warning": 30,
			"critical": 15
		},
		"format": "{icon}  {capacity}%",
		"format-icons": [
			"",
			"",
			"",
			"",
			""
		]
	},

	"custom/swaync": {
	   "tooltip": false,
 	   "format": "{icon}",
 	   "format-icons": {
 	     	"notification": "<span foreground='red'><sup></sup></span>",
 	     	"none": "",
 	     	"dnd-notification": "<span foreground='red'><sup></sup></span>",
 	     	"dnd-none": "",
 	     	"inhibited-notification": "<span foreground='red'><sup></sup></span>",
 	     	"inhibited-none": "",
 	     	"dnd-inhibited-notification": "<span foreground='red'><sup></sup></span>",
 	     	"dnd-inhibited-none": ""
 	   },
 	   "return-type": "json",
 	   "exec-if": "which swaync-client",
 	   "exec": "swaync-client -swb",
 	   "on-click": "swaync-client -t -sw",
 	   "on-click-right": "swaync-client -d -sw",
 	   "escape": true
  	},

	"custom/powerbutton": {
		"format": "󰐥",
		"on-click": "rofi -show power-menu -theme rounded-green-dark -modi 'power-menu:/home/shamokwok/Clone/dotfiles/hypr/scripts/rofi-power-menu'",
		"tooltip": false
	}
}
    '';

    style = ''
@define-color backgroundColor #344454;	/* Blue */
@define-color moduleColor #161c22;		/* Black */

* {
	font-family: DroidSansM Nerd Font;
	font-size: 14px;
	border-radius: 20px;
}

window#waybar {
	background: @backgroundColor;
	color: #fdf6e3;
}

/* Powerline arrows */

#custom-right-arrow-dark {
	color: @moduleColor;
	font-size: 23px;
	border-radius: 0px;
}

#custom-left-arrow-dark {
	color: @moduleColor;
	font-size: 23px;
	border-radius: 0px;
}

#custom-right-arrow-light {
	color: @backgroundColor;
	background: @moduleColor;
	font-size: 23px;
	border-radius: 0px;
}

#custom-left-arrow-light {
	color: @backgroundColor;
	background: @moduleColor;
	font-size: 23px;
	border-radius: 0px;
}

/* Left */

#custom-arch-icon {
	color: #38afc4;
	background: @moduleColor;
	font-size:  20px;
	padding-left: 15px;
	padding-right: 5px;
	border-radius: 20px 0px 0px 20px;
}

#custom-fedora-icon {
	color: #38afc4;
	background: @moduleColor;
	font-size:  20px;
	padding-left: 10px;
	padding-right: 8px;
	border-radius: 20px 0px 0px 20px;
}

/* Workspaces */

#workspaces {
	background: @moduleColor;
	border-radius: 0px;
}

#workspaces button {
	padding: 0 10px;
	color: #fdf6e3;
	border-radius: 0px;
}

#workspaces button.active {
	color: #1bce74;
	border-radius: 0px;
}

#workspaces button:hover {
	box-shadow: inherit;
	text-shadow: inherit;
	border-radius: 0px;
}

#workspaces button:hover {
	background: @moduleColor;
	border: @moduleColor;
	padding: 0 10px;	/* Don't Change it cause it will not look right */
	border-radius: 0px;
}

#window {
	background: @backgroundColor;
	padding-left: 15px;
	border-radius: 0px;
}

/* Right */

#tray {
	background: @moduleColor;
	border-radius: 20px;
	padding-left: 5px;
	padding-right: 5px;
	margin: 5px 4px;
}

#privacy {
	background: @moduleColor;
	border-radius: 20px;
	padding-left: 5px;
	padding-right: 5px;
	margin: 5px 4px;
}

#mpris {
	background: @moduleColor;
	border-radius: 20px;
	padding-left: 10px;
	padding-right: 10px;
	margin: 5px 4px;
}

#custom-wallpaper-changer {
	color: #9678b6;
	background: @moduleColor;
	padding-left: 5px;
	padding-right: 5px;
	border-radius: 0px;
}

#network {
	color: #38afc4;
	background: @moduleColor;
	padding-left: 5px;
	padding-right: 15px;
	border-radius: 0px;
}

#pulseaudio {
	color: #E9B57D;
	background: @moduleColor;
	padding-left: 10px;
	padding-right: 10px;
	border-radius: 0px;
}

#clock {
	color: #38afc4;
	background: @moduleColor;
	padding-left: 5px;
	padding-right: 10px;
	border-radius: 0px;
}

#battery {
	color: #859900;
	background: @moduleColor;
	padding-left: 5px;
	padding-right: 5px;
	border-radius: 0px;
}

#custom-swaync {
	background: @moduleColor;
	padding-left: 5px;
	padding-right: 15px;
	font-size: 17px;
	border-radius: 0px;
}

#custom-powerbutton {
	background: @moduleColor;
	padding-left: 5px;
	padding-right: 15px;
	font-size: 20px;
	border-radius: 0px 20px 20px 0px;
}
    '';

  };
}
