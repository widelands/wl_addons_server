-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Headquarters (with terraforming)",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Start the game with your headquarters only. Disabled seafaring because of lack of compatibility with terraforming (diking of water bodies).",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
    end
    
    player:forbid_buildings{"europeans_port", "europeans_shipyard_basic", "europeans_shipyard_normal", "europeans_shipyard_advanced"}
       
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
            water = 64,
            coal = 64,
            ore = 16,
            marble_column = 8,
            iron = 4,
            gold = 4,
            quartz = 16,
            diamond = 16,
            buckets = 16,
            basket = 16,
            armor_wooden = 8,
            boots_wooden = 8,
            helmet_wooden = 8,
            spear_wooden = 8
        },
        workers = {
            europeans_geologist = 1,
            europeans_carrier = 32,
            europeans_builder = 32,
            europeans_worker_basic = 32,
            europeans_farmer_basic = 16,
            europeans_miner_basic = 12,
            europeans_trader = 8,
            europeans_trainer_basic = 8,
            europeans_lumberjack_basic = 6,
            europeans_forester_basic = 6,
            europeans_stonecutter_basic = 4,
            europeans_claydigger_basic = 4,
            europeans_terraformer_basic = 4
      },
        soldiers = {
            [{0,0,0,0}] = 24,
      }
    })
    
end
}

pop_textdomain()
return init
