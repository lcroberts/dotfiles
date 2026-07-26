hl.layer_rule({
    name = "dms-no-anim",
    match = { namespace = "^(dms)$" },
    no_anim = true,
})

hl.window_rule({ name = "smile-float", match = { title = "Smile" }, float = true })
hl.window_rule({ name = "kitty-ws", match = { class = "^(kitty)$" }, workspace = "1 silent" })
hl.window_rule({ name = "ghostty-ws", match = { class = "^(ghostty)$" }, workspace = "1 silent" })
hl.window_rule({ name = "firefox-ws", match = { class = ".*(firefox).*" }, workspace = "2 silent" })
hl.window_rule({ name = "discord-ws", match = { class = ".*(discord).*" }, workspace = "3 silent" })
hl.window_rule({ name = "vesktop-ws", match = { class = ".*(vesktop).*" }, workspace = "3 silent" })
hl.window_rule({ name = "spotify-ws", match = { class = ".*(Spotify).*" }, workspace = "4 silent" })

local float_titles = { ".*OneDriveGUI.*", ".*Open File.*", ".*Save File.*", ".*Steam Settings.*" }
for _, t in ipairs(float_titles) do
    hl.window_rule({ name = "float-title-" .. string.gsub(t, "[^%w]", ""), match = { title = t }, float = true })
end

local float_classes = { ".*xdg-desktop-portal-gtk.*", ".*xdg-desktop-portal-kde.*", "^(.*org.freedesktop.impl.portal.*)", ".*steam.*", ".*org.kde.dolphin.*", "^(org.quickshell)$" }
for _, c in ipairs(float_classes) do
    hl.window_rule({ name = "float-class-" .. string.gsub(c, "[^%w]", ""), match = { class = c }, float = true })
end

hl.window_rule({ name = "steam-tile", match = { title = ".*Steam.*" }, float = false })
