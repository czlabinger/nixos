export default () => {
	return Widget.Button({
        class_name: "powerMenu",
    	child: Widget.Icon({
    			icon: 'power-button', // custom-symbolic.svg
    			css: 'color: green;', // can be colored, like other named icons
			}),
		on_primary_click: () => App.toggleWindow('PowerMenu'),
	})
}
