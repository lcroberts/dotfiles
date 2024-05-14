import PanelButton from "../PanelButton";
import options from "options";
import { sh, range } from "lib/utils";

const hyprland = await Service.import("hyprland");
const { workspaces } = options.bar.workspaces;

const dispatch = (arg: string | number) => {
  sh(`hyprctl dispatch workspace ${arg}`);
};

// const Workspaces = (ws: number) =>
//   Widget.Box({
//     children: range(ws || 20).map((i) =>
//       Widget.Label({
//         attribute: i,
//         vpack: "center",
//         label: `${i}`,
//         setup: (self) =>
//           self.hook(hyprland, () => {
//             self.toggleClassName("active", hyprland.active.workspace.id === i);
//             self.toggleClassName(
//               "occupied",
//               (hyprland.getWorkspace(i)?.windows || 0) > 0,
//             );
//           }),
//       }),
//     ),
//     setup: (box) => {
//       if (ws === 0) {
//         box.hook(hyprland.active.workspace, () =>
//           box.children.map((btn) => {
//             btn.visible = hyprland.workspaces.some(
//               (ws) => ws.id === btn.attribute,
//             );
//           }),
//         );
//       }
//     },
//   });

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
          onScrollUp: () => dispatch("+1"),
          onScrollDown: () => dispatch("-1"),
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

export default (monitor) => Workspaces(monitor);
