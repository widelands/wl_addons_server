local map = wl.Editor().map
local mv = wl.ui.MapView()

-- Approximately the time needed for each field
local time_per_field = 0.0037

if mv:get_child("height_options_window").visible == false then
   mv:get_child("height_options_window").visible = true
end

local function show_error(text)
   -- Opens error window with given text

   include("addons/editor_height_tools.wad/error_window.lua")
   
   mv:get_child("error_window"):get_child("error_text").text = text
   mv:get_child("error_window").visible = true

end

local function is_valid_user_data(x, y)
   -- Validates the coordinates x and y
   -- Returns true if all is fine, false otherwise

   if x == nil or y == nil then
      show_error(_("A coordinate can't be read.\nMake sure you have entered a valid coordinate in form of 20,34"))
      return false
   end

   if x > map.width or y > map.height then
      -- This a bit sloppy, but for a user a map has a width of e.g. 64 fields, not map.width - 1
      -- If a user enters e.g. 64,64 the error message is therefore omitted.
      show_error(_("The coordinates exceeds the map height or width!\nPlease enter valid coordinates!"))
      return false
   end

   return true
end

local function get_xy_from_string(s)
   -- Get separated values from a string like "10,15"
   -- This takes also spaces into account, e.g. if a user enters " 5 , 6 "
   -- Negative values are silently ignored: "-4, -6" results in x=4 y=6
   -- Returns x and y or nil if validation fails

   local _, _, x, y = string.find(s, "(%d+)%s*,%s*(%d+)")
   x = tonumber(x)
   y = tonumber(y)
   if not is_valid_user_data(x,y) then return nil end
   return x, y
end

function handle_marker(x1, y1, x2, y2)
   -- Removes and places markers (ruin1) at given coordinates
   -- Needs at least x1 and y1

   if __AREA_MARKER_1 and __AREA_MARKER_1.exists then
      __AREA_MARKER_1:remove()
   end
   if __AREA_MARKER_2 and __AREA_MARKER_2.exists then
      __AREA_MARKER_2:remove()
   end

   if not mv:get_child("place_im").state then return end

   if not x2 then
      -- Second coordinates missing, this must be a hexagonal area,
      -- place immovable at center field.
      __AREA_MARKER_1 = map:place_immovable("ruin1", map:wrap_field(x1, y1))
   else
      -- Rectangular area, place two immovables
      __AREA_MARKER_1 = map:place_immovable("ruin1", map:wrap_field(x1, y1))
      __AREA_MARKER_2 = map:place_immovable("ruin1", map:wrap_field(x2, y2))
   end
end

function mountain_rect_area()
   -- Get values for a rectangle entered by the user and 
   -- gather the fields in this area

   local x1, y1 = get_xy_from_string(mv:get_child("top_left_xy").text)
   local x2, y2 = get_xy_from_string(mv:get_child("bottom_right_xy").text)

   if not x1 or not x2 then return end

   -- The given area may span map boundaries.
   -- Just add the value to map.width and map.height,
   -- map:wrap_field() takes care of correct wrapping
   if x1 > x2 then x2 = map.width + x2 end
   if y1 > y2 then y2 = map.height + y2 end

   handle_marker(x1, y1, x2, y2)

   local fields = {}
   for x=x1, x2 do
      for y=y1, y2 do
         table.insert(fields, map:wrap_field(x,y))
      end
   end
   auto_mountains(fields)
end

function mountain_hex_area()
   -- Get values for a hexagonal area entered by a user and
   -- gather the fields

   local center_x, center_y = get_xy_from_string(mv:get_child("center_xy").text)

   if not center_x then return end

   handle_marker(center_x, center_y)

   local radius = mv:get_child("radius").value
   local center = map:wrap_field(center_x, center_y)
   local fields = center:region(radius)

   auto_mountains(fields)
end

function set_height(fields)
   -- Set height of all fields of a map to the given value entered by the user
   local height = mv:get_child("set_height_spinbox").value
   for x=0, map.width -1 do
      for y=0, map.height-1 do
         local f = map:get_field(x,y)
         f.height=height
      end
   end
end

function auto_mountains(fields)
   -- Main function for applying random heights to mountainous fields.
   -- The idea is to calculate the distance of a mountain field to a
   -- non mountain field and use this distance to calculate the
   -- maximum height. A field can be 5 steps higher than his neighboring
   -- fields without influencing the height of neighboring fields. So for
   -- a mountain field with a distance of 1 field from a non mountain field the
   -- max height is 5. The more a field is inside a mountain the height can
   -- be calculated as: max_field_height = distance * 5
   -- But the height of non mountain fields has also be to considered.
   -- Naming it base_height the formula get:
   -- max_mountain_height = base_height + (distance * 5)
   -- This does not solve all issues: Probably there are non mountain fields
   -- with different heights around a mountain, which base_height should be used?
   -- To solve this we have to find ALL non mountain
   -- fields around a mountain field and compare the distances.
   -- The base_height with the shorter distance is the max_base_height we need
   -- to calculate the max_height:
   -- max_mountain_height = max_base_height + (distance * 5)

   -- Gather all mountainous terrains
   local ter_descr = wl.Descriptions().terrain_descriptions
   local mountain_terrains = {}
   for i, descr in ipairs(ter_descr) do
      for j, res in ipairs(descr.valid_resources) do
         if res.name == "resource_coal" or
            res.name == "resource_iron" or
            res.name == "resource_gold" or
            res.name == "resource_stones" then
            table.insert(mountain_terrains, descr.name)
         end
      end
   end
   
   local function is_mountainous(ter)
      -- Helper function
      -- Returns true if this terrain is mountainous, false otherwise
      for i, t in ipairs(mountain_terrains) do
         if ter == t then
            return true
         end
      end
      return false
   end

   local function is_whole_mountain(f)
      -- Checks wether this field is surrounded by mountainous terrain,
      if is_mountainous(f.terr) and
         is_mountainous(f.terd) and
         is_mountainous(f.ln.terr) and
         is_mountainous(f.tln.terd) and
         is_mountainous(f.tln.terr) and
         is_mountainous(f.trn.terd) then
         return true
      end
      return false
   end

   local function find_height(field, new_field_heights)
      -- This searches fields around given field and tries to find
      -- base_height and the distance
      -- new_field_heights is a reference to a table, no need to return it.

      local min_height = 60          -- Start at max possible height of map
      local distance = 1
      local base_height_found = false 
      while not base_height_found do
         -- Create a hollow region
         local search_fields = field:region(distance, distance - 1)
         for i, f in ipairs(search_fields) do
            -- go through the search_fields of region
            if not is_whole_mountain(f) then
               -- border of a mountain found
               if f.height < min_height then
                  if new_field_heights[field] then
                     -- if this field was already calculated
                     if distance > new_field_heights[field].distance then
                        -- and the distance is greater than already found
                        break
                     end
                  end
                  -- Store new values or change base_height and distance
                  new_field_heights[field]={
                                             base_height = f.height,
                                             distance = distance,
                                             max_height = f.height + (distance * 5),
                                            }
                  min_height = f.height
               end
            end
         end
         distance = distance + 1
         if distance == 12 then
            -- Stop searching. 12 is max_map_height / 5
            -- A greater value increases the amount of search_fields drastically and
            -- also the needed time.
            base_height_found = true
         end
      end
   end
   
   -- Gather all mountainous fields of given area
   -- This has to be done here, because mountain_hex_area uses field:region()
   -- and thus the mountain_fields can't be gathered over there
   local mountain_fields = {}
   for i, f in ipairs(fields) do
      if is_whole_mountain(f) then
         table.insert(mountain_fields, f)
      end
   end

   if (#mountain_fields*time_per_field) > 2 then
      -- Needs approximately more than 2 sec.
      local ok = wl.ui.show_messagebox(_("Warning"), 
         _("This will change the height of %1$d fields! Approximately this last more than %2$d sec.\nThe editor does not react for this time.\nClick 'Cancel' to define a smaller area. Before clicking OK be sure to save the map!"):bformat(#mountain_fields, #mountain_fields*time_per_field)
         )
      if not ok then return end
   end   
   
   local new_field_heights = {}
   for i, m_field in ipairs(mountain_fields) do
      find_height(m_field, new_field_heights)
   end

   -- Apply found heights
   for f, data in pairs(new_field_heights) do
      local max_height = data.max_height
      local base_height = data.base_height + 3

      if base_height > 60 then base_height = 60 end

      local wanted_height = mv:get_child("max_width_spinbox").value
      if max_height >= wanted_height then
         max_height = wanted_height

         -- If wanted_height is smaller than this max_height use base_height
         max_height = wanted_height < base_height and base_height or max_height
      end

      -- Make sure mountain terrain fields of mountain borders get
      -- an additional height. Looks nicer.
      f.raw_height = math.random(base_height, max_height)
   end

   map:recalculate()

   collectgarbage()
end
