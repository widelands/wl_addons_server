include("scripting/richtext.lua")
push_textdomain("ui-inspector.wad", true)

function populate_list_entries(list, current, filter, indent, prefix)
	local new_prefix = (prefix or "") .. "\036" .. current.name
	local typename = getmetatable(current).__name

	if filter == nil or current.name:find(filter, 1, true) or typename:find(filter, 1, true) then
		list:add(
			_("%1$s “%2$s”"):bformat(typename, current.name),
			new_prefix,
			nil,     -- icon
			"",      -- tooltip
			false,   -- select this
			indent,
			true     -- enabled
		)
	end

	for i,child in ipairs(current.children) do
		populate_list_entries(list, child, filter, indent + 1, new_prefix)
	end
end

function ui_inspector_refresh()
	push_textdomain("ui-inspector.wad", true)

	local toplevel = (wl.ui.MainMenu or wl.ui.MapView)()
	local window = toplevel:get_child("ui_inspector_window")
	if window == nil then return end

	local filter = window:get_child("filter")
	local list = window:get_child("tree")
	local oldsel = list.selection
	list:clear()
	populate_list_entries(list, toplevel, filter.text, 0)

	if oldsel ~= nil then
		ui_inspector_go_to_item(oldsel, false)
	end
	ui_inspector_selection_changed()

	pop_textdomain()
end

function ui_inspector_get_selected_panel(descriptor)
	local toplevel = (wl.ui.MainMenu or wl.ui.MapView)()

	if descriptor == nil then
		local window = toplevel:get_child("ui_inspector_window")
		local list = window:get_child("tree")
		if list == nil or list.selection == nil then return nil end
		descriptor = list.selection
	end

	local current = nil
	for word in descriptor:gmatch("\036([^\036]*)") do
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

	return current
end

function ui_inspector_go_to_item(entry, clear_filter_if_necessary)
	local toplevel = (wl.ui.MainMenu or wl.ui.MapView)()
	local window = toplevel:get_child("ui_inspector_window")
	local list = window:get_child("tree")
	if list == nil then return nil end

	local check = ui_inspector_get_selected_panel(entry)
	if check == nil then return end

	for i = 1, list.no_of_items do
		if list:get_value_at(i) == entry then
			list:select(i)
			return
		end
	end

	if not clear_filter_if_necessary then return end
	-- Not visible currently, clear the filter to go to this item.
	window:get_child("filter").text = ""
	ui_inspector_refresh()

	for i = 1, list.no_of_items do
		if list:get_value_at(i) == entry then
			list:select(i)
			return
		end
	end
end

function ui_inspector_copy_to_clipboard(prop)
	local panel = ui_inspector_get_selected_panel()
	if panel == nil then return end

	if prop == nil then
		wl.ui.set_clipboard(getmetatable(panel).__name)
	elseif panel[prop] ~= nil then
		wl.ui.set_clipboard(("%1%"):bformat(panel[prop]))
	end
end

function ui_inspector_selection_changed()
	local toplevel = (wl.ui.MainMenu or wl.ui.MapView)()
	local window = toplevel:get_child("ui_inspector_window")
	if window == nil then return end

	local list = window:get_child("tree")
	local status_box_wrapper = window:get_child("status_box_wrapper")
	if list == nil or status_box_wrapper == nil then return end

	local status_box = status_box_wrapper:get_child("status_box", false)
	if status_box then status_box:die() end

	if list.selection == nil then return end

	local icon = (wl.ui.MainMenu and "fsmenu" or "wui") .. "/windows/pin.png"

	push_textdomain("ui-inspector.wad", true)

	local current = ui_inspector_get_selected_panel()
	local children = {}

	if current == nil then
		table.insert(children, {
			widget      = "textarea",
			name        = "heading",
			resizing    = "fullsize",
			text_align  = "left",
			font        = "disabled",
			text        = _("The panel no longer exists."),
		})
	else
		local style_head = wl.ui.MainMenu and "fsmenu_info_panel_heading" or "wui_info_panel_heading"
		local style_para = wl.ui.MainMenu and "fsmenu_info_panel_paragraph" or "wui_info_panel_paragraph"

		table.insert(children, {
			widget      = "box",
			orientation = "horz",
			name        = "headingbox",
			resizing    = "fullsize",
			children = {
				{
					widget      = "button",
					name        = "copy",
					resizing    = "align",
					icon        = icon,
					tooltip     = _("Copy class name"),
					w           = 24,
					h           = 24,
					style       = "menu",
					visual      = "flat",
					on_click    = [[ ui_inspector_copy_to_clipboard() ]],
				},
				{
					widget = "space",
					value  = 4,
				},
				{
					widget      = "textarea",
					name        = "heading",
					resizing    = "fillspace",
					text_align  = "left",
					font        = style_head,
					tooltip     = getmetatable(current).__name,
					text        =
								rt(
									h1(
										styles.as_font(style_head,
											_("%1$s “%2$s”"):bformat(
												styles.as_font(style_head, getmetatable(current).__name),
												styles.as_font(style_para, current.name)
											)
										)
									)
								)
				},
			},
		})

		local function generate_item(key, value)
			local typename = type(value)
			local makelink
			if typename == "string" then
				value = value:gsub("&", "&amp;")
				value = value:gsub("<", "&lt;")
				value = value:gsub(">", "&gt;")
			elseif typename == "table" then
				makelink = ""
				local p = value
				while p ~= nil do
					makelink = "\036" .. p.name .. makelink
					p = p.parent
				end

				typename = getmetatable(value).__name
				value = _("%1$s “%2$s”"):bformat(typename, value.name)
			end
			value = ("%1%"):bformat(value)  -- Convert to pretty-formatted string

			table.insert(children, {
				widget      = "box",
				orientation = "horz",
				name        = "itembox_upper",
				resizing    = "fullsize",
				children = {
					{
						widget      = "button",
						name        = "copy_key",
						resizing    = "align",
						icon        = icon,
						tooltip     = _("Copy property name"),
						w           = 24,
						h           = 24,
						style       = "menu",
						visual      = "flat",
						on_click    = "wl.ui.set_clipboard(\"" .. key .. "\")",
					},
					{
						widget      = "multilinetextarea",
						name        = "item_key",
						resizing    = "fillspace",
						text_align  = "left",
						scroll_mode = "none",
						font        = style_head,
						tooltip     = key,
						text        =
									rt(
										p(
											styles.as_font(style_head, _("%1$s (%2$s):")):bformat(
												styles.as_font(style_head, key),
												styles.as_font(style_para, typename)
											)
										)
									)
					},
				},
			})
			table.insert(children, {
				widget      = "box",
				orientation = "horz",
				name        = "itembox_lower",
				resizing    = "fullsize",
				children = {
					{
						widget = "space",
						value  = 24,
					},
					{
						widget      = "button",
						name        = makelink and "go_to_linked" or "copy_value",
						resizing    = "align",
						icon        = makelink and "images/richtext/arrow-right.png" or icon,
						tooltip     = makelink and _("Go to this item") or _("Copy value"),
						w           = 24,
						h           = 24,
						style       = "menu",
						visual      = "flat",
						on_click    = makelink and ("ui_inspector_go_to_item(\"" .. makelink .. "\", true)") or ("ui_inspector_copy_to_clipboard(\"" .. key .. "\")"),
					},
					{
						widget      = "multilinetextarea",
						name        = "item_value",
						resizing    = "fillspace",
						text_align  = "left",
						scroll_mode = "none",
						font        = style_head,
						tooltip     = value,
						text        =
									rt(
										p(
											styles.as_font(style_head, value)
										)
									)
					},
				},
			})
			table.insert(children, {
				widget = "space",
				value  = 12,
			})
		end

		local properties1 = {
			"name",
			"parent",
		}
		local properties2 = {
			"position_x",
			"position_y",
			"width",
			"height",
			"visible",
			"orientation",
			"datatype",
			"enabled",
			"state",
			"pinned",
			"minimal",
			"scrolling",
			"force_scrolling",
			"show_percent",
			"password",
			"warning",
			"multiline",
			"expanded",
			"active",
			"caret_pos",
			"inner_spacing",
			"min_desired_breadth",
			"max_width",
			"max_height",
			"no_of_items",
			"no_of_rows",
			"no_of_pages",
			"total",
			"value",
			"min_value",
			"max_value",
			"current_page",
			"pagesize",
			"sort_column",
			"sort_descending",
			"title",
			"text",
			"selected_text",
			"selection_index",
			"selection",
			"linked_dropdown",
			"listselect",
		}

		for i,prop in ipairs(properties1) do
			if current[prop] ~= nil then
				generate_item(prop, current[prop])
			end
		end
		if current.parent and current.parent.get_index and current.parent.get_resizing and current.parent.get_align then
			local idx = current.parent:get_index(current)
			if idx ~= nil then
				generate_item("resizing", current.parent:get_resizing(idx))
				generate_item("align", current.parent:get_align(idx))
			end
		end
		for i,prop in ipairs(properties2) do
			if current[prop] ~= nil then
				generate_item(prop, current[prop])
			end
		end
	end

	status_box = status_box_wrapper:create_child({
		widget      = "box",
		orientation = "vert",
		name        = "status_box",
		resizing    = "expandboth",
		children    = children,
	})

	pop_textdomain()
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
						name     = "clear_filter",
						icon     = "images/ui_basic/stop.png",
						tooltip  = _("Clear filter"),
						resizing = "fullsize",
						style    = "menu",
						w        = 24,
						on_click = [[ (wl.ui.MainMenu or wl.ui.MapView)():get_child("ui_inspector_window"):get_child("filter").text = "" ]]
					},
					{
						widget = "space",
						value  = 4,
					},
					{
						widget   = "button",
						name     = "refresh",
						title    = _("Refresh"),
						resizing = "fullsize",
						style    = "primary",
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
						widget      = "listselect",
						name        = "tree",
						resizing    = "expandboth",
						datatype    = "string",
						w           = 440,
						h           = 450,
						on_selected = [[ ui_inspector_selection_changed() ]]
					},
					{
						widget      = "box",
						orientation = "vert",
						name        = "status_box_wrapper",
						resizing    = "expandboth",
						max_x       = 350,
						max_y       = 450,
						scrolling   = true,
						children    = {
						{
							widget      = "panel",
							name        = "padding",
							resizing    = "fullsize",
							w           = 800,
						},
						}
					},
				}
			},
		}
	}
})

ui_inspector_refresh()

pop_textdomain()
