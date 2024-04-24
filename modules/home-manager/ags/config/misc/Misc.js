import Utils from 'resource:///com/github/Aylur/ags/utils.js';
import Network from 'resource:///com/github/Aylur/ags/service/network.js';

export const distroID = Utils.exec(`bash -c 'cat /etc/os-release | grep "^ID=" | cut -d "=" -f 2'`).trim();

export function getDistroIcon() {
	if(distroID == 'nixos') return 'nixos';
	if(distroID == 'arch') return 'arch';	
	if(distroID == 'ubuntu') return 'ubuntu';
	return 'linux';
}

export function NetworkIndicator() {
	return Widget.Stack({
		transition: 'slide_up_down',
		class_name: 'network-indicator',
		children: {
			'disabled': Widget.Icon({ icon: 'wifi-off-symbolic' }),
			'disconnected': Widget.Icon({ icon: 'wifi-disconnected-symbolic' }),
			'connecting': Widget.Icon({ icon: 'wifi-connecting-symbolic' }),
			'0': Widget.Icon({ icon: 'wifi-0-symbolic' }),
			'1': Widget.Icon({ icon: 'wifi-1-symbolic' }),
			'2': Widget.Icon({ icon: 'wifi-2-symbolic' }),
			'3': Widget.Icon({ icon: 'wifi-3-symbolic' }),
		},
		setup: (self) => self.hook(Network, (stack) => {
			if (!Network.wifi) {
				stack.show = 'disabled';
			}
			if (Network.wifi.internet == 'connected') {
				let strength = Math.ceil(Network.wifi.strength / 25);
				if (strength == 4) {
					strength = 3;
				}
				stack.shown = String(strength);
			}
			else if (["disconnected", "connecting"].includes(Network.wifi.internet)) {
				stack.shown = Network.wifi.internet;
			}
		}),
	});
}

export default () => {}
