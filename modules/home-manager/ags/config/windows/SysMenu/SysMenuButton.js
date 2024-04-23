export default () => {
	return Widget.Button({
 		class_name: "sysButton",
    	child: Widget.Icon({
    			icon: 'settings',
			}),
		on_primary_click: () => App.toggleWindow('sysmenu'),
	})
}
