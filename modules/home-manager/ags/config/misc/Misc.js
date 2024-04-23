import Utils from 'resource:///com/github/Aylur/ags/utils.js';

export const distroID = Utils.exec(`bash -c 'cat /etc/os-release | grep "^ID=" | cut -d "=" -f 2'`).trim();

export function getDistroIcon() {
	if(distroID == 'nixos') return 'nixos-symbolic';
	if(distroID == 'arch') return 'arch-symbolic';	
	if(distroID == 'ubuntu') return 'ubuntu-symbolic';
	return 'linux-symbolic';
}

export default () => {}
