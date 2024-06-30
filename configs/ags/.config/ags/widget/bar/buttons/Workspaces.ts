import { sh } from "lib/utils";

const hyprland = await Service.import("hyprland");

const dispatch = (arg: string | number) => {
  sh(`hyprctl dispatch workspace ${arg}`);
};

function Workspaces(monitor = 0) {
  const activeId = hyprland.active.workspace.bind("id");
  const workspaces = hyprland.bind("workspaces").as((ws) =>
    ws
      .filter(({ id }) => id > 0)
      .filter(({ id }) => hyprland.getWorkspace(id)?.monitorID == monitor)
      .sort((a, b) => a.id - b.id)
      .map(({ id }) =>
        Widget.Button({
          on_clicked: () => dispatch(id),
          child: Widget.Label(`${id}`),
          class_name: activeId.as((i) => `${i === id ? "focused" : ""}`),
        }),
      ),
  );

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces,
  });
}

export default (monitor: number | undefined) => Workspaces(monitor);
