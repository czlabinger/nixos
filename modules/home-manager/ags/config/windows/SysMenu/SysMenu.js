import PopupWindow from "../../misc/PopupWindow.js";
import SysMenuContent from "./SysMenuContent.js";

export default () => PopupWindow({
    keymode: 'exclusive',
    anchor: ['right', 'top', 'bottom'],
    name: 'sysmenu',
	hpack: 'center',
	vpack: 'start',
	class_name: 'sysmenu',
    showClassName: 'sysmenu-show',
    hideClassName: 'sysmenu-hide',
    child: SysMenuContent(),
});
