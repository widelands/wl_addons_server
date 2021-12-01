-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Headquarters",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Start the game with your headquarters and a basic recruitement center only. AI might struggling with this condition on smaller maps.",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
    end
       
    prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
            wares = {
                water = 1023,
                log = 255,
                reed = 127,
                granite = 63,
                coal = 63,
                ore = 31,
                cloth = 31,
                blackwood = 31,
                planks = 31,
                spidercloth = 31,
                marble = 31,
                marble_column = 15,
                iron = 7,
                gold = 7,
                quartz = 15,
                diamond = 15,
                buckets = 24,
                basket = 24,
                hammer = 15,
                saw = 15,
                scythe = 15,
                shovel = 12,
                pick = 12,
                felling_ax = 12,
                fire_tongs = 7,
                milking_tongs = 5,
                needles = 5,
                bread_paddle = 5,
                hook_pole = 5,
                kitchen_tools = 5,
                fishing_net = 3,
                fishing_rod = 3,
                hunting_bow = 3,
                hunting_spear = 3,
                armor = 15,
                tabard = 15,
                spear_wooden = 15
            },
            workers = {
                europeans_carrier = 32,
                europeans_builder = 16,
                europeans_trainer_basic = 3,
                europeans_smith_basic = 2
          },
            soldiers = {
                [{0,0,0,0}] = 24,
          }
    })
    place_building_in_region(player, "europeans_recruitement_center_basic", sf:region(6), {
    })
    
end
}

pop_textdomain()
return init
