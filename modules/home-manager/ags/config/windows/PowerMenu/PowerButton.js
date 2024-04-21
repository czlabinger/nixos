export default () => {
	return Widget.Button({
        class_name: "powerMenu",
    	child: Widget.Icon({
    			icon: 'power-button',
			}),
		on_primary_click: () => App.toggleWindow('PowerMenu'),
	})
}
