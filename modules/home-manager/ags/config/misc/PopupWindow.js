const { Box, Window } = Widget;


export default ({
    name,
    child,
    hpack = "",
	vpack = "",
	class_name = '',
	showClassName = "",
    hideClassName = "",
    ...props
}) => {
    return Window({
        name,
        visible: false,
        layer: 'overlay',
        ...props,

        child: Box({
            setup: (self) => {
                self.hook(App, (self, currentName, visible) => {
                    if (currentName === name) {
                        self.toggleClassName(hideClassName, !visible);
                    }
                }).keybind("Escape", () => App.closeWindow(name))
                if (showClassName !== "" && hideClassName !== "")
                    self.className = `${showClassName} ${hideClassName}`;
            },
            child: child,
			hpack: hpack,
			vpack: vpack,
			class_name: class_name,
        }),
    });
}
