export default () => {
	return Widget.Button({
		name: "hyprland-button",
		class_name: "hyprland-button systoggles",
		child: Widget.Icon({
			icon: "hyprland-symbolic",
		}),
		on_primary_click: () => App.toggleWindow('hyprlandExit'),
	})
}
