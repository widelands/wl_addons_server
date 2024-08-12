-- =======================================================================
--          Trading Outpost Starting Conditions for the Europeans
-- =======================================================================

include "addons/europeans_trading.wad/tribes/scripting/starting_conditions.lua"

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
           
    place_building(player, sf.x, sf.y, 0, "europeans_headquarters")
    set_starting_warecount(player)
    
    place_building_in_region(player, "europeans_market_agricultur", sf:region(12), {
    })
    place_building_in_region(player, "europeans_market_craft", sf:region(12), {
    })
    place_building_in_region(player, "europeans_market_wood", sf:region(12), {
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
