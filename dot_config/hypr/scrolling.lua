local mainMod = "SUPER"

hl.config({
    general = {
        layout = "scrolling"
    }
})

hl.bind(mainMod .. " + R", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + M", hl.dsp.layout("colresize 100%"))

hl.bind(mainMod .. " + minus", hl.dsp.layout("colresize -0.1"))
hl.bind(mainMod .. " + equal", hl.dsp.layout("colresize +0.1"))
hl.bind(mainMod .. " + left", hl.dsp.layout("colresize -0.1"))
hl.bind(mainMod .. " + right", hl.dsp.layout("colresize +0.1"))

hl.bind(mainMod .. " + up", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0% 100"))
hl.bind(mainMod .. " + down", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0% -100"))
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0% 100"))
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0% -100"))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("swapcol r"))

hl.bind(mainMod .. " + bracketleft", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + bracketright", hl.dsp.window.move({ direction = "r" }))
