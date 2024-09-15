local im_zero = "snowman"
local im = "ruin1"

local map = wl.Editor().map
local mv = wl.ui.MapView()

if mv:get_child("set_marker_window").visible == false then
   mv:get_child("set_marker_window").visible = true
   if #HISTORY == 0 then
      mv:get_child("undo_button").enabled = false
   else
      mv:get_child("undo_button").enabled = true
   end
end

local function reset_history()
   HISTORY = {}
   mv:get_child("undo_button").enabled = false
   mv:get_child("undo_button").style = "menu"
end

function set_markers()
   HISTORY = {}
   local x_step = tonumber(mv:get_child("distance_x_dropdown").selection)
   local y_step = tonumber(mv:get_child("distance_y_dropdown").selection)

   for x = 0, map.width-1, x_step do
      for y = 0, map.height-1, y_step do
         local f = map:get_field(x,y)
         -- Place and save to HISTORY only if there is no immovable yet
         if not f.immovable then
            table.insert(HISTORY, f)
            map:place_immovable(im, f)
         end
      end
   end
   -- Replace the immovable at field 0/0
   map:place_immovable(im_zero, map:get_field(0,0))

   mv:get_child("undo_button").enabled = true
end

function history_back()
   for i, f in ipairs(HISTORY) do
      if f.immovable then
         f.immovable:remove()
      end
   end
   reset_history()
end

function remove_markers()
   local f = ""
   for x = 0, map.width-1 do
      for y = 0, map.height-1 do
         f = map:get_field(x,y)
         if f.immovable and f.immovable.descr.name == im then
            f.immovable:remove()
         end
      end
   end
   f = map:get_field(0,0)
   if f.immovable then f.immovable:remove() end
   reset_history()
end
