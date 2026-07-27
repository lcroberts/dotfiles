local sens = -0.5
local natural_scroll = false
if os.getenv("HOSTNAME") == "notascam-mobile" then
	sens = 0
	natural_scroll = true
end

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		numlock_by_default = true,

		follow_mouse = 1,
		touchpad = {
			natural_scroll = natural_scroll,
			scroll_factor = 0.3,
		},
		sensitivity = sens,
	},
})
