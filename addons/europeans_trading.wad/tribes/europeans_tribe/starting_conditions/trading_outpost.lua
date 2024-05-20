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
            log = 128,
            reed = 128,
            granite = 128,
            water = 64,
            blackwood = 64,
            cloth = 64,
            grout = 64,
            planks = 32,
            brick = 32,
            marble = 32,
            coal = 32,
            quartz = 8,
            diamond = 8,
            marble_column = 8,
            coin_copper = 16,
            coin_silver = 8,
            coin_gold = 8,
            buckets = 16,
            basket = 16,
        },
        workers = {
            europeans_geologist = 1,
            europeans_carrier = 32,
            europeans_carrier_1 = 16,
            europeans_carrier_2 = 8,
            europeans_carrier_3 = 8,
            europeans_trader = 6,
            europeans_builder = 16,
            europeans_worker_advanced = 8,
            europeans_worker_normal = 8,
            europeans_worker_basic = 8,
            europeans_miner_advanced = 2,
            europeans_miner_normal = 2,
            europeans_miner_basic = 2,
            europeans_lumberjack_advanced = 1,
            europeans_lumberjack_normal = 1,
            europeans_lumberjack_basic = 1,
            europeans_forester_advanced = 1,
            europeans_forester_normal = 1,
            europeans_forester_basic = 1,
            europeans_gardener_advanced = 1,
            europeans_gardener_normal = 1,
            europeans_gardener_basic = 1,
            europeans_trainer_advanced = 1,
            europeans_trainer_normal = 1,
            europeans_trainer_basic = 1,
            europeans_stonecutter_advanced = 1,
            europeans_stonecutter_normal = 1,
            europeans_stonecutter_basic = 1,
      },
        soldiers = {
            [{0,0,0,0}] = 24,
      }
    })
    place_building_in_region(player, "europeans_market_log", sf:region(12), {
    })
    place_building_in_region(player, "europeans_market_reed", sf:region(12), {
    })
    place_building_in_region(player, "europeans_store_big", sf:region(12), {
    })
    place_building_in_region(player, "europeans_store_small", sf:region(12), {
    })
    place_building_in_region(player, "europeans_trading_post", sf:region(12), {
    })
    place_trade_pole(player, sf:region(12))
end
}

pop_textdomain()
return init
