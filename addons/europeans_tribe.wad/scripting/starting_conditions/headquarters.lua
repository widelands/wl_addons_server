-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Headquarters",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Start the game with your headquarters only",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
    end
       
    prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
            wares = {
                water = 256,
                log = 192,
                reed = 80,
                granite = 64,
                coal = 64,
                iron = 48,
                cloth = 32,
                blackwood = 32,
                planks = 32,
                ore = 32,
                spidercloth = 32,
                grout = 32,
                brick = 32,
                marble = 32,
                quartz = 32,
                marble_column = 24,
                diamond = 24,
                gold = 4,
                buckets = 16,
                basket = 16,
                hammer = 12,
                saw = 12,
                shovel = 8,
                pick = 8,
                scythe = 6,
                fire_tongs = 4,
                felling_ax = 4,
                bread_paddle = 2,
                fishing_net = 2,
                fishing_rod = 2,
                hook_pole = 2,
                hunting_bow = 2,
                hunting_spear = 2,
                milking_tongs = 2,
            },
            workers = {
                europeans_carrier = 32,
                europeans_builder = 16,
                europeans_trainer_basic = 3,
                europeans_smith_basic = 2
          },
            soldiers = {
                [{0,0,0,0}] = 16,
          }
    })
    place_building_in_region(player, "europeans_recruitement_center_basic", sf:region(6), {
    })
    
end
}

pop_textdomain()
return init
