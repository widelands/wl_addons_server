-- =======================================================================
--          Trading Outpost Starting Conditions for the Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _"Trading Outpost",
    -- TRANSLATORS: This is the tooltip for the "Trading Outpost" starting condition
    tooltip = _"This starting condition contains a market as an additional building, where some wares can be bought for gold, quartz and diamonds.",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
    end
       
    prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
            wares = {
                water = 63,
                log = 15,
                reed = 15,
                granite = 15,
                coal = 15,
                ore = 15,
                iron = 15,
                gold = 15,
                quartz = 63,
                diamond = 63,
                buckets = 24,
                basket = 15,
                pick = 9,
                hammer = 9,
                saw = 9,
                scythe = 7,
                shovel = 7,
                felling_ax = 7,
                fire_tongs = 5,
                milking_tongs = 3,
                bread_paddle = 3,
                hook_pole = 3,
                kitchen_tools = 3,
                fishing_net = 3,
                fishing_rod = 3,
                hunting_bow = 3,
                hunting_spear = 3,
                needles = 2,
                armor = 15,
                tabard = 15,
                spear_wooden = 15
            },
            workers = {
                europeans_carrier = 32,
                europeans_builder = 16,
                europeans_farmer_basic = 8,
                europeans_miner_basic = 6,
                europeans_lumberjack_basic = 6,
                europeans_forester_basic = 6,
                europeans_trainer_basic = 4,
                europeans_stonecutter_basic = 3,
                europeans_hunter_basic = 2,
                europeans_fisher_basic = 2,
                europeans_carpenter_basic = 2,
                europeans_charcoal_burner_basic = 2,
                europeans_stonemason_basic = 2,
                europeans_smith_basic = 2,
                europeans_brewer_basic = 1,
                europeans_miller_basic = 1,
                europeans_baker_basic = 1,
                europeans_smelter_basic = 1,
                europeans_weaver_basic = 1,
                europeans_claydigger_basic = 1
          },
            soldiers = {
                [{0,0,0,0}] = 24,
          }
    })
    place_building_in_region(player, "europeans_recruitement_center_basic", sf:region(8), {
    })
    place_building_in_region(player, "europeans_market", sf:region(6), {
    })
    
end
}

pop_textdomain()
return init
