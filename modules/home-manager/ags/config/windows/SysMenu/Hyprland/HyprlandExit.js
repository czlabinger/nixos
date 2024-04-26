import PopupWindow from "../../../misc/PopupWindow.js";
import HyprlandExitContent from "./HyprlandExitContent.js";

export default () => PopupWindow({
    keymode: 'exclusive',
    anchor: ['right', 'top', 'bottom'],
    name: 'hyprlandExit',
	class_name: 'hyprlandExit',
    showClassName: 'hyprlandExit-show',
    hideClassName: 'hyprlandExit-hide',
    child: HyprlandExitContent(),
});
