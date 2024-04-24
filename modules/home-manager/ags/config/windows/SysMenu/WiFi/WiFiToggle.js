import { NetworkIndicator } from '../../../misc/Misc.js';
import Network from 'resource:///com/github/Aylur/ags/service/network.js';

export default () => {
	return Widget.Button({
		name: 'wifi-button',
		class_name: 'wifi-button systoggles',
		child: NetworkIndicator(),

		onClicked: () => Network.toggleWifi(),
	})
}
