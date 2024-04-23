import { getDistroIcon } from "../../misc/Misc.js";
import PowerButton from "../PowerMenu/PowerButton.js";

const togglesBox = Widget.Box({
    hpack: 'center',
	class_name: 'toggles-box',
    children: [
        //ToggleIconWifi(),
        //ToggleIconBluetooth(),

		PowerButton(),
    ]
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
		],
	})
}
