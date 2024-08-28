return {
	entry = function()
		local h = cx.active.current.hovered
		if h.cha.is_dir then
			-- os.execute("zoxide add " .. h.url)
			ya.manager_emit("enter", { hovered = true })
		else
			ya.manager_emit("open", { hovered = true })
		end
	end,
}
