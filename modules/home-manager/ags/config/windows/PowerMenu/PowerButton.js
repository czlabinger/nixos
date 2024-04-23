export default () => {
	return Widget.Button({
        class_name: "powerMenu systoggles",
    	child: Widget.Icon({
    			icon: 'power-button-symbolic',
			}),
		on_primary_click: () => App.toggleWindow('PowerMenu'),
	})
}
