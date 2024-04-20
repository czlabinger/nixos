import PopupWindow from '../../misc/PopupWindow.js';
import SessionScreen from "./SessionScreen.js";

export default () => PopupWindow({ 
	name: 'PowerMenu',
    visible: false,
    keymode: 'exclusive',
    layer: 'overlay',
    exclusivity: 'ignore',
    child: SessionScreen(),
})
