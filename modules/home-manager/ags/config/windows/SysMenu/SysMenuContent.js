import { getDistroIcon } from "../../misc/Misc.js";
import PowerButton from "../PowerMenu/PowerButton.js";

const togglesBox = Widget.Box({
    hpack: 'center',
    children: [
        //ToggleIconWifi(),
        //ToggleIconBluetooth(),
        PowerButton(),
    ]
})

export default () => {
	return Widget.Box({
		name: 'sysmenu-content',
		css: 'min-width: 35rem;',
		vexpand: true,
		hexpand: true,
		children: [
        	Widget.Icon({
				name: 'sysmenu-icon',
				css: '',
            	icon: getDistroIcon(),
        	}),
			togglesBox,
		],
	})
}
