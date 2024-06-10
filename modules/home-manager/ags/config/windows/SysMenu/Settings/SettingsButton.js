import { execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

export default () => {
	return Widget.Button({
 		class_name: "settingsButton systoggles",
    	child: Widget.Icon({
    			icon: 'settings',
			}),
		on_primary_click: () => execAsync(['bash', '-c', 'XDG_CURRENT_DESKTOP="gnome" gnome-control-center', '&']),
	})
}
