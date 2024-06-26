import { opt, mkOptions } from "lib/option";
import { distro } from "lib/variables";
import { icon } from "lib/utils";
import icons from "lib/icons";

const options = mkOptions(OPTIONS, {
  autotheme: opt(false),

  wallpaper: {
    resolution: opt<import("service/wallpaper").Resolution>(3840),
    market: opt<import("service/wallpaper").Market>("random"),
  },

  theme: {
    dark: {
      primary: {
        bg: opt("#f2cdcd"),
        fg: opt("#181825"),
      },
      error: {
        bg: opt("#F44336"),
        fg: opt("#FFFFFF"),
      },
      bg: opt("#1e1e2e"),
      fg: opt("#FFFFFF"),
      widget: opt("#FFFFFF"),
      border: opt("#FFFFFF"),
    },
    light: {
      primary: {
        bg: opt("#426ede"),
        fg: opt("#eeeeee"),
      },
      error: {
        bg: opt("#b13558"),
        fg: opt("#eeeeee"),
      },
      bg: opt("#fffffa"),
      fg: opt("#080808"),
      widget: opt("#080808"),
      border: opt("#080808"),
    },

    blur: opt(0),
    scheme: opt<"dark" | "light">("dark"),
    widget: { opacity: opt(94) },
    border: {
      width: opt(1),
      opacity: opt(96),
    },

    shadows: opt(true),
    padding: opt(7),
    spacing: opt(4),
    radius: opt(11),
  },

  transition: opt(200),

  font: {
    size: opt(12),
    name: opt("JetBrains Mono"),
  },

  bar: {
    flatButtons: opt(true),
    position: opt<"top" | "bottom">("top"),
    corners: opt(true),
    transparent: opt(false),
    layout: {
      start: opt<Array<import("widget/bar/Bar").BarWidget>>([
        "launcher",
        "workspaces",
        // "taskbar",
        "expander",
        "messages",
      ]),
      center: opt<Array<import("widget/bar/Bar").BarWidget>>(["date"]),
      end: opt<Array<import("widget/bar/Bar").BarWidget>>([
        "media",
        "expander",
        "systray",
        "colorpicker",
        "screenrecord",
        "system",
        "battery",
        "powermenu",
      ]),
    },
    launcher: {
      icon: {
        colored: opt(true),
        icon: opt(icon(distro.logo, icons.ui.search)),
      },
      label: {
        colored: opt(false),
        label: opt(" Applications"),
      },
      action: opt(() => App.toggleWindow("launcher")),
    },
    date: {
      format: opt("%a %b %e %Y %H:%M:%S"),
      action: opt(() => App.toggleWindow("datemenu")),
    },
    battery: {
      bar: opt<"hidden" | "regular" | "whole">("regular"),
      charging: opt("#00D787"),
      percentage: opt(true),
      blocks: opt(7),
      width: opt(50),
      low: opt(30),
    },
    workspaces: {
      workspaces: opt(10),
    },
    taskbar: {
      iconSize: opt(0),
      monochrome: opt(true),
      exclusive: opt(false),
    },
    messages: {
      action: opt(() => App.toggleWindow("datemenu")),
    },
    systray: {
      ignore: opt(["KDE Connect Indicator", "spotify-client"]),
    },
    media: {
      monochrome: opt(true),
      preferred: opt("spotify"),
      direction: opt<"left" | "right">("right"),
      format: opt("{artists} - {title}"),
      length: opt(40),
    },
    powermenu: {
      monochrome: opt(false),
      action: opt(() => App.toggleWindow("powermenu")),
    },
  },

  launcher: {
    width: opt(0),
    margin: opt(80),
    nix: {
      pkgs: opt("nixpkgs/nixos-unstable"),
      max: opt(8),
    },
    sh: {
      max: opt(16),
    },
    apps: {
      iconSize: opt(62),
      max: opt(6),
      favorites: opt([["floorp", "kitty", "steam", "keepassxc", "spotify"]]),
    },
  },

  overview: {
    scale: opt(9),
    workspaces: opt(10),
    monochromeIcon: opt(true),
  },

  powermenu: {
    sleep: opt("systemctl suspend"),
    reboot: opt("systemctl reboot"),
    logout: opt("pkill Hyprland"),
    shutdown: opt("shutdown now"),
    layout: opt<"line" | "box">("line"),
    labels: opt(true),
  },

  quicksettings: {
    avatar: {
      image: opt(`/var/lib/AccountsService/icons/${Utils.USER}`),
      size: opt(70),
    },
    width: opt(380),
    position: opt<"left" | "center" | "right">("right"),
    networkSettings: opt("nm-connection-editor"),
    media: {
      monochromeIcon: opt(true),
      coverSize: opt(100),
    },
  },

  datemenu: {
    position: opt<"left" | "center" | "right">("center"),
    weather: {
      interval: opt(60_000),
      unit: opt<"metric" | "imperial" | "standard">("metric"),
      key: opt<string>(
        JSON.parse(Utils.readFile(`${App.configDir}/.weather`) || "{}")?.key ||
        "",
      ),
      cities: opt<Array<number>>(
        JSON.parse(Utils.readFile(`${App.configDir}/.weather`) || "{}")
          ?.cities || [],
      ),
    },
  },

  osd: {
    progress: {
      vertical: opt(true),
      pack: {
        h: opt<"start" | "center" | "end">("end"),
        v: opt<"start" | "center" | "end">("center"),
      },
    },
    microphone: {
      pack: {
        h: opt<"start" | "center" | "end">("center"),
        v: opt<"start" | "center" | "end">("end"),
      },
    },
  },

  notifications: {
    position: opt<Array<"top" | "bottom" | "left" | "right">>(["top", "right"]),
    blacklist: opt(["Spotify"]),
    width: opt(440),
  },

  hyprland: {
    gaps: opt(1),
    inactiveBorder: opt("#282828"),
    gapsWhenOnly: opt(true),
  },
});

globalThis["options"] = options;
export default options;
