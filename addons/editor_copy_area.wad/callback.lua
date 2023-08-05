local map = wl.Editor and wl.Editor().map or wl.Game().map
local window = wl.ui.MapView():get_child("copy_area_plugin_window")

local src_rect = {x = window:get_child("src_x").value, y = window:get_child("src_y").value, w = window:get_child("src_w").value, h = window:get_child("src_h").value}
local dst_rect = {x = window:get_child("dst_x").value, y = window:get_child("dst_y").value, w = window:get_child("dst_w").value, h = window:get_child("dst_h").value}

for _,key in ipairs({"x", "y", "w", "h"}) do
	if src_rect[key] == nil or dst_rect[key] == nil then
		return
	end
end

-- Check for overlap, allowing for map wraparound.
-- Each rectangle on the Infinite map becomes 4 rectangles on the Cropped map (some of them may be zero-size though).
local function convert_rects(r)
	local inf = {x1 = r.x, y1 = r.y, x2 = r.x + r.w, y2 = r.y + r.h}

	local cropped_tl = {
		x1 = inf.x1,
		y1 = inf.y1,
		x2 = math.min(inf.x2, map.width ),
		y2 = math.min(inf.y2, map.height)
	}
	local cropped_br = {
		x1 = 0,
		y1 = 0,
		x2 = math.max(inf.x2 - map.width , 0),
		y2 = math.max(inf.y2 - map.height, 0),
	}
	local cropped_bl = {
		x1 = 0,
		x2 = cropped_tl.x2,
		y1 = cropped_br.y1,
		y2 = cropped_br.y2,
	}
	local cropped_tr = {
		x1 = cropped_br.x1,
		x2 = cropped_br.x2,
		y1 = 0,
		y2 = cropped_tl.y2,
	}

	return cropped_tl, cropped_br, cropped_bl, cropped_tr
end

local function overlaps(r1, r2)
	if r1.x1 == r1.x2 or r1.y1 == r1.y2 or r2.x1 == r2.x2 or r2.y1 == r2.y2 then return false end  -- Zero-size rect
	if r1.x2 <= r2.x1 or r2.x2 <= r1.x1 or r1.y2 <= r2.y1 or r2.y2 <= r1.y1 then return false end  -- Far apart
	return true
end

local function contains(r, p)
	return p.x >= r.x and p.x < r.x + r.w and p.y >= r.y and p.y < r.y + r.h
end

local cropped_src = table.pack(convert_rects(src_rect))
local cropped_dst = table.pack(convert_rects(dst_rect))
for i,r1 in ipairs(cropped_src) do
	for j,r2 in ipairs(cropped_dst) do
		if overlaps(r1, r2) then
			push_textdomain("editor_copy_area.wad", true)
			wl.ui.show_messagebox(_("Overlap"), _("The two rectangles must not overlap."))
			pop_textdomain()
			return
		end
	end
end

local progressbarbox = window:get_child("progressbarbox")
local progressbar = progressbarbox:get_child("progress")
progressbar.state = 0
progressbar.total = src_rect.w
progressbarbox.visible = true

for dx = 0, src_rect.w - 1 do
	for dy = 0, src_rect.h - 1 do
		local f1 = map:get_field(src_rect.x + dx, src_rect.y + dy)
		local f2 = map:get_field(dst_rect.x + dx, dst_rect.y + dy)

		-- Terrains and height
		f2.terd = f1.terd
		f2.terr = f1.terr
		f2.raw_height = f1.height

		-- Immovables
		if f2.immovable then f2.immovable:remove() end
		if f1.immovable then map:place_immovable(f1.immovable.descr.name, f2) end

		-- Resources
		f2.resource = f1.resource
		f2.initial_resource_amount = f1.initial_resource_amount
		f2.resource_amount = f1.resource_amount

		-- Critters
		-- TODO Currently not implemented :(
	end
	progressbar.state = dx
	window:force_redraw()
end
progressbar.state = src_rect.w
window:force_redraw()

-- Port spaces
for i,port in ipairs(map.port_spaces) do
	if contains(dst_rect, port) then map:set_port_space(port.x, port.y, false) end
end
for i,port in ipairs(map.port_spaces) do
	if contains(src_rect, port) then map:set_port_space((port.x + dst_rect.x - src_rect.x) % map.width, (port.y + dst_rect.y - src_rect.y) % map.height, true) end
end

map:recalculate()

progressbarbox.visible = false
