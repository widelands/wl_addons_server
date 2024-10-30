include("scripting/richtext.lua")
push_textdomain("ui-inspector.wad", true)

function gather_list_entries(array, current, filter, indent, prefix)
	local new_prefix = (prefix or "") .. "\036" .. current.name
	local typename = getmetatable(current).__name

	if filter == nil or current.name:find(filter, 1, true) or typename:find(filter, 1, true) then
		table.insert(array, {
			value = new_prefix,
			label = _("%1$s “%2$s”"):bformat(typename, current.name),
			indent = indent,
		})
	end

	for i,child in ipairs(current.children) do
		gather_list_entries(array, child, filter, indent + 1, new_prefix)
	end
end

function ui_inspector_refresh()
	local toplevel = (wl.ui.MainMenu or wl.ui.MapView)()
	local window = toplevel:get_child("ui_inspector_window")
	if window == nil then return end

	local list = window:get_child("tree")
	if list then list:die() end

	list = window:get_child("filter")
	local array = {}
	gather_list_entries(array, toplevel, list.text, 0)

	list = window:get_child("tree_wrapper")
	list:create_child({
		widget      = "listselect",
		name        = "tree",
		resizing    = "expandboth",
		datatype    = "string",
		entries     = array,
		w           = 430,
		on_selected = [[ ui_inspector_selection_changed() ]]
	})
	ui_inspector_selection_changed()
end

function ui_inspector_selection_changed()
	local toplevel = (wl.ui.MainMenu or wl.ui.MapView)()
	local window = toplevel:get_child("ui_inspector_window")
	if window == nil then return end

	local list = window:get_child("tree")
	local status_panel = window:get_child("status_panel")
	if list == nil or status_panel == nil then return end

	local text = ""
	if list.selection ~= nil then
		local current = nil
		for word in list.selection:gmatch("\036([^\036]*)") do
			if current == nil then
				if word == toplevel.name then
					current = toplevel
				else
					break
				end
			else
				current = current:get_child(word, false)
				if not current then
					break
				end
			end
		end

		if current == nil then
			text = p(styles.as_font("disabled", _("The panel no longer exists.")))
		else
			local style_head = wl.ui.MainMenu and "fsmenu_info_panel_heading" or "wui_info_panel_heading"
			local style_para = wl.ui.MainMenu and "fsmenu_info_panel_paragraph" or "wui_info_panel_paragraph"

			-- text = p(styles.as_font(wl.ui.MainMenu and "fsmenu_game_setup_headings" or "game_summary_title", _("%1$s %2$s"):bformat(getmetatable(current).__name, styles.as_font(style_head, current.name))))
			text = h1(
				styles.as_font(style_head,
					_("%1$s “%2$s”"):bformat(
						styles.as_font(style_head, getmetatable(current).__name),
						styles.as_font(style_para, current.name)
					)
				)
			)

			local properties = {
				"position_x",
				"position_y",
				"width",
				"height",
				"visible",
				"datatype",
				"enabled",
				"state",
				"pinned",
				"minimal",
				"show_percent",
				"password",
				"warning",
				"multiline",
				"expanded",
				"active",
				"caret_pos",
				"no_of_items",
				"no_of_rows",
				"total",
				"value",
				"min_value",
				"max_value",
				"sort_column",
				"sort_descending",
				"title",
				"text",
				"selected_text",
				"selection_index",
				"selection",
				-- TODO: Alignment and resizing in parent box
			}
			for i,prop in ipairs(properties) do
				if current[prop] ~= nil then
					local escaped_value = current[prop]
					local typename = type(escaped_value)
					if typename == "string" then
						escaped_value = escaped_value:gsub("&", "&amp;")
						escaped_value = escaped_value:gsub("<", "&lt;")
						escaped_value = escaped_value:gsub(">", "&gt;")
					end

					text = text .. p(
						styles.as_font(style_head, _("%1$s (%2$s): %3$s")):bformat(
							styles.as_font(style_head, prop),
							styles.as_font(style_para, typename),
							styles.as_font(style_para, ("%1%"):bformat(escaped_value))
						)
					)
				end
			end
		end
	end
	status_panel.text = rt(text)
end

local toplevel = (wl.ui.MainMenu or wl.ui.MapView)()
toplevel:create_child({
	widget   = "unique_window",
	name     = "ui_inspector_window",
	registry = "ui_inspector_window",
	title    = _("UI Inspector"),
	content  = {
		widget      = "box",
		orientation = "vert",
		name        = "main_box",
		spacing     = 8,
		children    = {
			{
				widget      = "box",
				orientation = "horz",
				name        = "hbox1",
				resizing    = "fullsize",
				spacing     = 8,
				children    = {
					{
						widget     = "editbox",
						name       = "filter",
						resizing   = "expandboth",
						tooltip    = _("Filter by name or class"),
						on_changed = [[ ui_inspector_refresh() ]]
					},
					{
						widget   = "button",
						name     = "refresh",
						title    = _("Refresh"),
						resizing = "fullsize",
						on_click = [[ ui_inspector_refresh() ]]
					},
				},
			},
			{
				widget      = "box",
				orientation = "horz",
				name        = "hbox2",
				resizing    = "expandboth",
				children    = {
					{
						widget      = "box",
						name        = "tree_wrapper",
						orientation = "horz",
						resizing    = "expandboth",
					},
					{
						widget      = "multilinetextarea",
						name        = "status_panel",
						resizing    = "expandboth",
						scroll_mode = "normal",
						text_align  = "left",
						text        = "",
						w           = 320,
						h           = 400,
					},
				}
			},
		}
	}
})

ui_inspector_refresh()

pop_textdomain()
