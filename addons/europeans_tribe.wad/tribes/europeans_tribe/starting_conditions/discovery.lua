-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "scripting/infrastructure.lua"
include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"
include "addons/europeans_tribe.wad/scripting/debug.lua"

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
         reed = 16,
         planks = 16,
         granite = 8,
         europeans_lumberjack = 3,
         europeans_forester = 2,
         europeans_soldier = 1,
      },
      {
         reed = 12,
         planks = 12,
         granite = 6,
         marble = 8,
         europeans_stonemason_normal = 2,
         europeans_soldier = 1,
      },
      {
         reed = 16,
         planks = 16,
         granite = 12,
         iron = 6,
         europeans_geologist = 1,
         europeans_miner_basic = 3,
         europeans_smelter_basic = 2,
         europeans_smithy_basic = 1,
         europeans_fisher_basic = 1,
         europeans_soldier = 1,
      },
    })
end
}

pop_textdomain()
return init
