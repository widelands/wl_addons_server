-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Discovery",
    -- TRANSLATORS: This is the tooltip for the "Discovery" starting condition
    tooltip = _"Start the game with three ships on the ocean and only a handful of supplies",
    map_tags = {"seafaring"},

    func = function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    if shared_in_start then
       sf = shared_in_start
    else
       player:allow_workers("all")
    end

    launch_expeditions(player, {
      {
         log = 16,
         reed = 16,
         granite = 16,
         blackwood = 8,
         europeans_lumberjack_basic = 3,
         europeans_forester_basic = 2,
         europeans_carpenter_basic = 1,
         europeans_soldier = 1,
      },
      {
         water = 16,
         reed = 16,
         granite = 16,
         blackwood = 8,
         europeans_farmer_basic = 3,
         europeans_weaver_basic = 1,
         europeans_soldier = 1,
      },
      {
         water = 16,
         clay = 16,
         granite = 16,
         marble = 12,
         marble_column = 16,
         blackwood = 16,
         reed = 8,
         planks = 8,
         iron = 6,
         gold = 4,
         europeans_fishbreeder_basic = 1,
         europeans_stonecutter_basic = 2,
         europeans_stonemason_normal = 2,
         europeans_trainer_basic = 1,
         europeans_geologist = 1,
         europeans_miner_basic = 6,
         europeans_smelter_basic = 2,
         europeans_smith_basic = 1,
         europeans_soldier = 1,
      },
    })
    
    -- Get all trainingsite types
    local trainingsite_types = {}
    local trainingsites = {}
    for i, building in ipairs(wl.Game():get_tribe_description(player.tribe_name).buildings) do
        if (building.type_name == "trainingsite") then
            table.insert(trainingsite_types, building.name)
        end
    end

    for i = 1, 1000 do
        sleep(900000) -- 15 min

        -- collect all ~trainingssites
        for i, building_name in ipairs(trainingsite_types) do
            trainingsites = player:get_buildings(building_name)
            -- if there is more than 1 building of each kind, enhance the first one, to prevent an AI bug
            if #trainingsites > 1 then
                trainingsites[0]:enhance(true)
            end
        end
    end
end
}

pop_textdomain()
return init
