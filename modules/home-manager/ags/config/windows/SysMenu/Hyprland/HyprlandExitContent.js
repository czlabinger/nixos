import { execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

export default () => {
	return Widget.Box({
		name: 'hyprlandExitContent',
		class_name: 'hyprlandExitContent session-bg',
		hpack: 'center',
		css: `
        min-width: 1920px; 
        min-height: 1080px;
        `,

		children: [
			Widget.Label('You want to exit Hyprland?'),
			Widget.Button({
				name: 'hyprlandExitNes',
				child: Widget.Label('Yes'),
				on_primary_click: () => execAsync('hyprctl dispatch exit'),
			}),
			Widget.Button({
				name: 'hyprlandExitNo',
				child: Widget.Label('No'),
				on_primary_click: () => App.toggleWindow('hyprlandExit'),
			})
		],
	})
}
