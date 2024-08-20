const hyprland = await Service.import('hyprland')

const switch_workspace = (ws) => hyprland.messageAsync(`dispatch workspace ${ws}`)

const labels = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十"];

const Workspaces = () => Widget.Box({
  children: Array.from({ length: 10 }, (_, i) => (i + 1)).map((i) => Widget.Button({
    attribute: {id: i},
    label: `${labels[i - 1]}`,
    class_name: 'workspace-button',
    on_primary_click: () => switch_workspace(i),
  }).hook(hyprland.active.workspace, (self) => {
    self.toggleClassName('workspace-button-active', hyprland.active.workspace.id === self.attribute.id)
  })),
})

export default Workspaces
