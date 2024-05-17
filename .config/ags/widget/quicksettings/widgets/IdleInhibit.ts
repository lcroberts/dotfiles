import { SimpleToggleButton } from "../ToggleButton";
import icons from "lib/icons";
import inhibit from "service/idle_inhibit";
const i = inhibit.bind("inhibit_status");

export const IdleInhibit = () =>
  SimpleToggleButton({
    icon: i.as((i) => icons.idle[i ? "disabled" : "enabled"]),
    label: i.as((i) => (i ? "Idle Off" : "Idle On")),
    toggle: () => inhibit.toggle_inhibit(),
    connection: [inhibit, () => inhibit.inhibit_status],
  });
