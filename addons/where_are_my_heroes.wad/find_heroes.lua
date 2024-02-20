
local i_plr
for p_idx, player in pairs(wl.Game().players) do
   if player.number == wl.Game().interactive_player then
      i_plr = player
      break
   end
end

local soldier_descr = wl.Game():get_worker_description(i_plr.tribe.soldier)
local hero = {soldier_descr.max_health_level,
              soldier_descr.max_attack_level,
              soldier_descr.max_defense_level,
              soldier_descr.max_evade_level
             }

local sold_buildings = {}
for name, b_array in pairs(i_plr:get_buildings("all")) do
   for i, b in ipairs(b_array) do
      if b.descr.type_name == "warehouse" or b.descr.type_name == "militarysite" then
         table.insert(sold_buildings, b)
      end
   end
end

for i, building in ipairs(sold_buildings) do
   local nr_heroes = building:get_soldiers(hero)
   if nr_heroes > 0 then
      local text = ngettext("%1$d Hero is stationed here.", "%1$d Heroes are stationed here.", nr_heroes)
      local title = ngettext("%1$d Hero", "%1$d Heroes", nr_heroes)

      text = div("width=100%", div("float=left padding_r=6",p(img(building.descr.icon_name))).. styles.as_font("wui_message_paragraph", text:bformat(nr_heroes)))
      i_plr:send_to_inbox(title:bformat(nr_heroes), text, {field = building.fields[1], popup = true, icon = building.descr.icon_name})
   end
end
