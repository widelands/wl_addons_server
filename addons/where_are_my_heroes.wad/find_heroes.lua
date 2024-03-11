-- Get interactive player
local i_plr
for p_idx, player in pairs(wl.Game().players) do
   if player.number == wl.Game().interactive_player then
      i_plr = player
      break
   end
end

local soldier_descr = wl.Game():get_worker_description(i_plr.tribe.soldier)

-- Get the values defining a hero
local hero = {soldier_descr.max_health_level,
              soldier_descr.max_attack_level,
              soldier_descr.max_defense_level,
              soldier_descr.max_evade_level
             }


-- Send to inbox
-- 'field' needs to be an extra argument because getting the field is different
-- for buildings and ships
local function send(nr_heroes, field, obj)
   local text = ngettext("%1$d Hero is sitting here twiddling thumbs.", "%1$d Heroes are sitting here twiddling thumbs.", nr_heroes)
   local title = ngettext("%1$d Hero", "%1$d Heroes", nr_heroes)

   text = div("width=100%", div("float=left padding_r=6",p(img(obj.descr.icon_name))).. styles.as_font("wui_message_paragraph", text:bformat(nr_heroes)))
   i_plr:send_to_inbox(title:bformat(nr_heroes), text, {field = field, popup = true, icon = obj.descr.icon_name})
end

-- Warehouses and military sites
for name, b_array in pairs(i_plr:get_buildings("all")) do
   for i, building in ipairs(b_array) do
      if building.exists then
         if building.descr.type_name == "warehouse" or building.descr.type_name == "militarysite" then
            local nr_heroes = building:get_soldiers(hero)
            if nr_heroes > 0 then
               send(nr_heroes, building.fields[1], building)
            end
         end
      end
   end
end

-- Helper for checking if a warships soldier is a hero
local function is_hero(soldier)
   if soldier.health_level == hero[1] and
      soldier.attack_level == hero[2] and
      soldier.defense_level == hero[3] and
      soldier.evade_level == hero[4] then
      return true
   end
   return false
end
-- Warships
for i, ship in ipairs(i_plr:get_ships()) do
   if ship.exists and ship.type == "warship" and ship.state == "exp_waiting" then
      local nr_heroes = 0
      -- A warship can contain only workers of type soldier
      for i, soldier in ipairs(ship:get_workers("")) do
         if is_hero(soldier) then
            nr_heroes = nr_heroes + 1
         end
      end
      if nr_heroes > 0 then
         send(nr_heroes, ship.field, ship)
      end
   end
end
