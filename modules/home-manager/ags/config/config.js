import Bar from "./windows/Bar.js";
import PowerMenu from "./windows/PowerMenu/PowerMenu.js";

App.addIcons(`${App.configDir}/assets`)

App.config({
    style: "./style.css",
    windows: [
        Bar(),
		PowerMenu(),
    ],
})
