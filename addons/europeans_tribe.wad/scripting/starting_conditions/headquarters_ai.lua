-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Headquarters (AI optimized)",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"AI optimized starting condition, not for human player.",
    func =  function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
        player:allow_buildings("all")
    end

    prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
        wares = {
            log = 128,
            reed = 128,
            granite = 128,
            blackwood = 64,
            cloth = 64,
            grout = 64,
            planks = 32,
            brick = 32,
            marble = 32,
            marble_column = 32,
            quartz = 32,
            diamond = 16,
            water = 64,
            coal = 64,
            ore = 16,
            iron = 4,
            gold = 4,
            buckets = 16,
            basket = 16
        },
        workers = {
            europeans_geologist = 1,
            europeans_carrier = 32,
            europeans_carrier_1 = 16,
            europeans_carrier_2 = 8,
            europeans_carrier_3 = 4,
            europeans_trader = 4,
            europeans_builder = 32,
            europeans_worker_advanced = 12,
            europeans_worker_normal = 16,
            europeans_worker_basic = 24,
            europeans_miner_advanced = 6,
            europeans_miner_normal = 6,
            europeans_miner_basic = 6,
            europeans_lumberjack_advanced = 4,
            europeans_lumberjack_normal = 4,
            europeans_lumberjack_basic = 4,
            europeans_forester_advanced = 4,
            europeans_forester_normal = 4,
            europeans_forester_basic = 4,
            europeans_gardener_advanced = 4,
            europeans_gardener_normal = 4,
            europeans_gardener_basic = 4,
            europeans_trainer_advanced = 4,
            europeans_trainer_normal = 4,
            europeans_trainer_basic = 4,
            europeans_stonecutter_advanced = 4,
            europeans_stonecutter_normal = 4,
            europeans_stonecutter_basic = 4,
            europeans_shipwright_advanced = 1,
            europeans_shipwright_normal = 1,
            europeans_shipwright_basic = 1,
            europeans_terraformer_advanced = 1,
            europeans_terraformer_normal = 1,
            europeans_terraformer_basic = 1
      },
        soldiers = {
            [{0,0,0,0}] = 32,
      }
    })
    
    -- Delay of 15 min between actions
    local time_min = 15
    for i = 0, 2688 do
        doing_ai_stuff (player, i)
               
        sleep(time_min * 60000)
    end
    reset_player_warehouse_policy(player)
end
}

pop_textdomain()
return init
