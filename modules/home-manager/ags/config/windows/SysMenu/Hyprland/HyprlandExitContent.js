import { execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

export default () => {
	return Widget.Box({
		name: 'hyprlandExitContent',
		class_name: 'hyprlandExitContent session-bg',
		vertical: true,
		css: `
        min-width: 1920px; 
        min-height: 1080px;
        `,

		child: Widget.Box({
			
			hpack: 'center',
			vpack: 'center',
			vexpand: true,
			vertical: true,

			children: [
				Widget.Label('You want to exit Hyprland?'),

				Widget.Box({
					
                    vpack: 'center',
                    vertical: true,
					hpack: 'center',

					children: [
						Widget.Button({
							name: 'hyprlandExitNes',
							class_name: 'session-button',
							child: Widget.Label('Yes'),
							on_primary_click: () => execAsync('hyprctl dispatch exit'),
						}),
				
						Widget.Button({
							name: 'hyprlandExitNo',
							class_name: 'session-button',
							child: Widget.Label('No'),
							on_primary_click: () => App.toggleWindow('hyprlandExit'),
						}),
					],
				}),
			],
		})
	})
}
