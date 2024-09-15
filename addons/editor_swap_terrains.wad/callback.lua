function editor_swap_terrains_action(bidir)
	local map = wl.Editor and wl.Editor().map or wl.Game().map
	local window = wl.ui.MapView():get_child("swap_terrains_plugin_window")

	local progressbarbox = window:get_child("progressbarbox")
	local progressbar = progressbarbox:get_child("progress")
	progressbar.state = 0
	progressbar.total = map.width
	progressbarbox.visible = true

	local t1 = window:get_child("list1").selection
	local t2 = window:get_child("list2").selection
	if t1 == nil or t2 == nil or t1 == t2 then return end

	for x = 0, map.width - 1 do
		for y = 0, map.height - 1 do
			local f = map:get_field(x, y)
			if               f.terr == t1 then f.terr = t2
			elseif bidir and f.terr == t2 then f.terr = t1 end
			if               f.terd == t1 then f.terd = t2
			elseif bidir and f.terd == t2 then f.terd = t1 end
		end
		progressbar.state = x
		window:force_redraw()
	end

	progressbarbox.visible = false
end
