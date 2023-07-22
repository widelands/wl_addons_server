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
local buttonw = listw // 2

local spacing = 16
local buttonh = 28

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
				widget      = "box",
				name        = "buttons_box",
				orientation = "horz",
				resizing    = "fullsize",
				children    = {
					{
						widget = "inf_space",
					},
					{
						widget   = "button",
						name     = "ok_unidir",
						title    = _("Replace"),
						tooltip  = _("Globally replace all occurrences of the left terrain with the right terrain"),
						style    = "primary",
						w        = buttonw,
						h        = buttonh,
						on_click = [[ include("addons/editor_swap_terrains.wad/callback.lua"); editor_swap_terrains_action(false) ]],
					},
					{
						widget = "inf_space",
					},
					{
						widget   = "button",
						name     = "ok_bidir",
						title    = _("Swap"),
						tooltip  = _("Globally swap the two selected terrains"),
						style    = "primary",
						w        = buttonw,
						h        = buttonh,
						on_click = [[ include("addons/editor_swap_terrains.wad/callback.lua"); editor_swap_terrains_action(true) ]],
					},
					{
						widget = "inf_space",
					},
				},
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
