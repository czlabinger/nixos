import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';

const { execAsync } = Utils;
const { Gdk, Gtk } = imports.gi;

const SessionButton = (name, icon, command, props = {}, colorid = 0) => {
    const buttonDescription = Widget.Revealer({
        vpack: 'end',
        transition: 'slide_down',
        revealChild: false,
        child: Widget.Label({
            className: 'txt-smaller session-button-desc',
            label: name,
        }),
    });
    return Widget.Button({
        onClicked: command,
        className: `session-button session-color-${colorid}`,
        
		child: Widget.Icon({
			icon: icon,
		}),

		onHover: (button) => {
            const display = Gdk.Display.get_default();
            const cursor = Gdk.Cursor.new_from_name(display, 'pointer');
            button.get_window().set_cursor(cursor);
            buttonDescription.revealChild = true;
        },
        onHoverLost: (button) => {
            const display = Gdk.Display.get_default();
            const cursor = Gdk.Cursor.new_from_name(display, 'default');
            button.get_window().set_cursor(cursor);
            buttonDescription.revealChild = false;
        },
        setup: (self) => self
            .on('focus-in-event', (self) => {
                buttonDescription.revealChild = true;
                self.toggleClassName('session-button-focused', true);
            })
            .on('focus-out-event', (self) => {
                buttonDescription.revealChild = false;
                self.toggleClassName('session-button-focused', false);
            })
        ,
        ...props,
    });
}


export default () => {
    const lockButton = SessionButton(
		'Lock', 
		'lock-symbolic', 
		() => { 
			App.closeWindow('PowerMenu'); 
			execAsync(['loginctl', 'lock-session']).catch(print) 
		}, {}, 1);

    const logoutButton = SessionButton(
		'Logout', 
		'logout-symbolic', 
		() => { 
			App.closeWindow('PowerMenu'); 
			execAsync(['bash', '-c', 'pkill Hyprland || pkill sway || pkill niri || loginctl terminate-user $USER']).catch(print) 
		}, {}, 2);

    const sleepButton = SessionButton(
		'Sleep', 
		'sleep-symbolic', 
		() => { 
			App.closeWindow('PowerMenu'); 
			execAsync(['bash', '-c', 'systemctl suspend || loginctl suspend']).catch(print) 
		}, {}, 3);

    const hibernateButton = SessionButton(
		'Hibernate', 
		'hibernate-symbolic', 
		() => { 
			App.closeWindow('PowerMenu'); 
			execAsync(['bash', '-c', 'systemctl hibernate || loginctl hibernate']).catch(print) 
		}, {}, 4);

    const shutdownButton = SessionButton(
		'Shutdown', 
		'power-button-symbolic', 
		() => { 
			App.closeWindow('PowerMenu'); 
			execAsync(['bash', '-c', 'systemctl poweroff || loginctl poweroff']).catch(print) 
		}, {}, 5);

    const rebootButton = SessionButton(
		'Reboot', 
		'reboot-symbolic', 
		() => { 
			App.closeWindow('PowerMenu'); 
			execAsync(['bash', '-c', 'systemctl reboot || loginctl reboot']).catch(print) 
		}, {}, 6);

    const cancelButton = SessionButton(
		'Cancel', 
		'close-symbolic', 
		() => App.closeWindow('PowerMenu'), 
		{ className: 'session-button-cancel' }, 7);

    const sessionDescription = Widget.Box({
        vertical: true,
        css: 'margin-bottom: 0.682rem;',
        children: [
            Widget.Label({
                className: 'txt-title txt',
                label: 'Session',
            }),
            Widget.Label({
                justify: Gtk.Justification.CENTER,
                className: 'txt-small txt',
                label: 'Use arrow keys to navigate.\nEnter to select, Esc to cancel.'
            }),
        ]
    });
    const SessionButtonRow = (children) => Widget.Box({
        hpack: 'center',
        className: 'spacing-h-15',
        children: children,
    });
    const sessionButtonRows = [
        SessionButtonRow([lockButton, logoutButton, sleepButton]),
        SessionButtonRow([hibernateButton, shutdownButton, rebootButton]),
        SessionButtonRow([cancelButton]),
    ]
    return Widget.Box({
        className: 'session-bg',
        css: `
        min-width: 1920px; 
        min-height: 1080px;
        `,
        vertical: true,
        children: [
            Widget.EventBox({
                onPrimaryClick: () => App.closeWindow('PowerMenu'),
                onSecondaryClick: () => App.closeWindow('PowerMenu'),
                onMiddleClick: () => App.closeWindow('PowerMenu'),
            }),
            Widget.Box({
                hpack: 'center',
				vpack: 'center',
                vexpand: true,
                vertical: true,
                children: [
                    Widget.Box({
                        vpack: 'center',
                        vertical: true,
                        className: 'spacing-v-15',
                        children: [
                            sessionDescription,
                            ...sessionButtonRows,
                        ]
                    })
                ]
            })
        ],
        setup: (self) => self
            .hook(App, (_b, name, visible) => {
                if (visible) lockButton.grab_focus();
            })
        ,
    });
}
