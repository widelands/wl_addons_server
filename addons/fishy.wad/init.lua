-- Init file of the Fishy add-on
if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
local f
local max = egbase:get_resource_description("resource_fish").max_amount
for x = 0, egbase.map.width - 1 do
   for y = 0, egbase.map.height - 1 do
      f = egbase.map:get_field(x, y)
      if (not f.resource) or (f.resource == "resource_fish") then
         f.resource = "resource_fish"
         f.resource_amount = max
      end
   end
end
