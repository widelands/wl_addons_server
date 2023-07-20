push_textdomain("editor_swap_terrains.wad", true)

local all_terrains = {}
for i,terrain in ipairs(wl.Descriptions().terrain_descriptions) do
	table.insert(all_terrains, {
		value = terrain.name,
		label = terrain.descname,
		icon  = terrain.representative_image,
	})
end
all_terrains[1].select = true

local listw = wl.ui.MapView().width // 3
local listh = wl.ui.MapView().height // 2

local spacing = 16
local buttonh = 24

wl.ui.MapView():create_child({
	widget   = "unique_window",
	registry = "swap_terrains_plugin_window",
	name     = "swap_terrains_plugin_window",
	title    = _("Swap Terrains"),
	x        = wl.ui.MapView().width  // 6,
	y        = wl.ui.MapView().height // 4,
	content  = {
		widget      = "box",
		orientation = "vert",
		name        = "main_box",
		children    = {
			{
				widget      = "box",
				orientation = "horz",
				name        = "hbox",
				children    = {
					{
						widget      = "listselect",
						datatype    = "string",
						name        = "list1",
						w           = listw,
						h           = listh,
						entries     = all_terrains,
						resizing    = "expandboth",
					},
					{
						widget = "space",
						value  = spacing,
					},
					{
						widget      = "listselect",
						datatype    = "string",
						name        = "list2",
						w           = listw,
						h           = listh,
						entries     = all_terrains,
						resizing    = "expandboth",
					},
				}
			},
			{
				widget = "space",
				value  = spacing,
			},
			{
				widget   = "button",
				name     = "ok",
				title    = _("Swap"),
				tooltip  = _("Swap the two selected terrains"),
				style    = "primary",
				w        = listw,
				h        = buttonh,
				on_click = [[
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
							if     f.terr == t1 then f.terr = t2
							elseif f.terr == t2 then f.terr = t1 end
							if     f.terd == t1 then f.terd = t2
							elseif f.terd == t2 then f.terd = t1 end
						end
						progressbar.state = x
						window:force_redraw()
					end

					progressbarbox.visible = false
				]]
			},
			{
				widget      = "box",
				name        = "progressbarbox",
				orientation = "vert",
				resizing    = "fullsize",
				children    = {
					{
						widget = "space",
						value  = spacing,
					},
					{
						widget       = "progressbar",
						name         = "progress",
						orientation  = "horz",
						total        = 1,
						state        = 0,
						show_percent = true,
						h            = buttonh,
						resizing     = "fullsize",
					},
				},
			},
		}
	}
})
wl.ui.MapView():get_child("swap_terrains_plugin_window"):get_child("progressbarbox").visible = false

pop_textdomain()
