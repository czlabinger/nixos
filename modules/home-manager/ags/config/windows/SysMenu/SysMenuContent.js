import { getDistroIcon } from "../../misc/Misc.js";
import PowerButton from "../PowerMenu/PowerButton.js";
import HyprlandButton from "./Hyprland/HyprlandButton.js";
import WiFiToggle from "./WiFi/WiFiToggle.js";
import BrigtnessService from "../../services/BrightnessService.js"


const togglesBox = Widget.Box({
    hpack: 'center',
	class_name: 'toggles-box',
    children: [
        WiFiToggle(),
		PowerButton(),
		HyprlandButton(),
    ]
})

const brigtnessSlider = Widget.Box({
	hpack: 'center',
	class_name: 'brightness-slider',
	css: "min-width: 15rem",
	children: [
		Widget.Label("Brightness: "),
		Widget.Slider({
			hexpand: true,
			draw_value: false,
			min: 0,
			max: 1,
			on_change: ({ value }) => BrigtnessService.screen_value = value,
			setup: self => self.hook(BrigtnessService, () => {
            	self.value = BrigtnessService.screen_value || 0
        	}),		
		}),
	],
})

export default () => {
	return Widget.Box({
		name: 'sysmenu-content',
		class_name: 'sysmenu-content',
		vpack: 'start',
		vertical: true,
		children: [
			Widget.Box({
				children: [
					Widget.Icon({
						hpack: 'center',
						name: 'sysmenu-icon',
						class_name: 'sysmenu-icon',
            			icon: getDistroIcon(),
        			}),
				],
			}),

			togglesBox,
			brigtnessSlider,
		],
	})
}
