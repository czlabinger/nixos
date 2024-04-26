import Bar from "./windows/Bar.js";
import PowerMenu from "./windows/PowerMenu/PowerMenu.js";
import HyprlandExit from "./windows/SysMenu/Hyprland/HyprlandExit.js";
import SysMenu from "./windows/SysMenu/SysMenu.js";

App.addIcons(`${App.configDir}/assets/`)

App.config({
    style: "./style.css",
    windows: [
		Bar(),
		PowerMenu(),
		SysMenu(),
		HyprlandExit(),
    ],
})
