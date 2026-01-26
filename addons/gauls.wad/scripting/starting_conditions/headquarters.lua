-- =======================================================================
--             Headquarters starting conditions for Gauls
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("gauls.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Headquarters"),
   -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
   tooltip = _("Start the game with your headquarters only"),
   func = function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   hq = prefilled_buildings(player, { "gauls_headquarters", sf.x, sf.y,
      wares = {
            log = 58,
            reed = 42,
            granite = 40,
            brick = 33,
            planks = 22,
            cloth = 5,
            clay = 2,
            water = 5,
            wheat = 7,
            wool = 9,
            smoked_meat = 3,
            smoked_fish = 3,
            barbarians_bread = 8,
            meal = 4,
            ration = 11,
            coal = 12,
            copper = 2,
            iron_ore = 5,
            iron = 12,
            gold_ore = 1,
            gold = 2,
            bronze = 2,
            spear = 5,
            pick = 8,
            felling_ax = 4,
            shovel = 10,
            hammer = 14,
            scythe = 5,
            fire_tongs = 2,
            kitchen_tools = 4,
            buckets = 3,
            flail = 1,
            fishing_net = 2,
            basket = 2,
            elixir = 6,
            potion = 1,
            tunic = 5,
        },
        workers = {
            gauls_geologist = 4,
            gauls_carrier = 30,
            gauls_carrier_1 = 10,
            gauls_builder = 5,
            gauls_miner = 2,
            gauls_miner_master = 2,
            gauls_woodcutter = 3,
            gauls_hunter = 1,
            gauls_farmer = 3,
            gauls_toiler = 1,
            gauls_cook = 1,
            gauls_charcoal_burner = 1,
            gauls_smelter = 1,
            gauls_breeder = 1,
            gauls_gardener = 2,
            gauls_craftsman = 1,
            gauls_blacksmith = 1,
            gauls_stonecutter = 2,
            gauls_claydigger = 2,
            gauls_brickmaker = 1,
            gauls_druid = 3,
            gauls_trainer = 3,
      },
         -- Max health: 3, Max attack: 2, Max defense: 3, Max evade: 2
         soldiers = {
            [{0,0,0,0}] = 45,
         }
      })
end
}

pop_textdomain()
return init
