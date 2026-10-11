local collect_stats = include(path.dirname(__file__) .. "collect_stats.lua")[1]
local h = include(path.dirname(__file__) .. "output_helpers.lua")


local function buildings_tabpanel(pstats)
   local rv = {
      widget = "tabpanel",
      name = "buildingtabs",
      tabs = {},
   }

   rv.tabs[1] = {
      name = "prodsites",
      title = _("Production Sites"),
      panel = h.statbox(
         "prodsites",
         h.buildingcounts_to_table(pstats.building_counts, pstats.building_orders.production),
         h.buildingcounts_to_str("productionsite", pstats.building_counts, pstats.building_orders.production)
      )
   }
   rv.tabs[2] = {
      name = "milsites",
      title = _("Military Sites"),
      panel = h.statbox(
         "milsites",
         h.buildingcounts_to_table(pstats.building_counts, pstats.building_orders.military),
         h.buildingcounts_to_str("military site", pstats.building_counts, pstats.building_orders.military)
      )
   }
   rv.tabs[3] = {
      name = "all_buildings",
      title = _("All Buildings"),
      panel = h.statbox(
         "all_buildings",
         h.buildingcounts_to_table(pstats.building_counts, pstats.building_orders.all),
         h.buildingcounts_to_str("building", pstats.building_counts, pstats.building_orders.all)
      )
   }

   return rv
end


function one_player_stats_panel(p)
   local game = wl.Game()

   push_textdomain("player_stats.wad", true)

   local stats = collect_stats(p)

   local waresbox = h.statbox("wares", h.wares_to_table(stats.wares), h.wares_to_str(stats.wares))
   local wares_note
   if _player_stats_starting_stock_ == nil then
      wares_note = _("Note: Consumed wares are approximated by subtracting remaining from " ..
                     "produced, because neither it, nor starting stock is available directly.")
   else
      wares_note = _("Note: Consumed wares include lost and destroyed wares too, because it " ..
                     "is not available directly, so it is calculated by subtracting remaining " ..
                     "from produced + starting.")
   end

   table.insert(waresbox.children, {
      widget = "multilinetextarea",
      name = "wares_note",
      w = 100,  -- overridden by resizing=fullsize, but needs a starting value
      h = 10,   -- overridden by resizing=fullsize, but needs a starting value
      text_align = "left",
      resizing = "fullsize",
      scroll_mode = "none",
      font = "wui_info_panel_paragraph",
      text = wares_note,
   })

   local buildingspanel = buildings_tabpanel(stats)

   local buildsizebox = h.statbox(
      "buildingsizes", 
      h.buildingsizes_table(stats.buildingsize_counts, stats.size_order),
      h.buildings_to_str("building size", stats.buildingsize_counts, stats.size_order)
   )

   local buildcostbox = h.statbox(
      "buildcosts", 
      h.buildcosts_to_table(stats.buildcosts, stats.building_materials_order),
      h.buildings_to_str("building material", stats.buildcosts, stats.building_materials_order)
   )

   local tabs = {
      name = "playertab_" .. p.number,
      title = p.name,
      panel = {
         widget = "tabpanel",
         name = "player_" .. p.number .. "_tabs",
         tabs = {
            {
               name = "wares",
               title = _("Wares"),
               panel = waresbox,
            },
            {
               name = "buildings",
               title = _("Buildings"),
               panel = buildingspanel,
            },
            {
               name = "building_sizes",
               title = _("Building Sizes"),
               panel = buildsizebox,
            },
            {
               name = "buildcosts",
               title = _("Buildcosts"),
               panel = buildcostbox,
            },
         },
      },
   }

   pop_textdomain()

   return tabs
end


function show_player_stats()
   local game = wl.Game()
   local mv = wl.ui.MapView()

   local info_window_name = "player_stats"
   local w = mv.windows[info_window_name]
   if w then
      w:close()
      return
   end

   push_textdomain("player_stats.wad", true)

   local tabs = {}

   local ipidx = nil
   local ipteam = -1
   local teams = {}

   local gametime = game.time

   -- We only show stats for players that the interactive user can see:
   --  + if the user is inactive or see_all is enabled, then all players,
   --  + if the user is an active player in a team, then teammates,
   --  + otherwise only the player's own
   -- So we first have to check players and teams.

   if game.interactive_player ~= 0 then
      for i,p in ipairs(game.players) do
         -- collect team membership
         if p.team > 0 then
            if teams[p.team] == nil then
               teams[p.team] = { i }
            else
               table.insert(teams[p.team], i)
            end
         end

         -- check interactive player
         if p.number == game.interactive_player then
            -- check whether player is active, or can see all
            if not p.see_all and not p.defeated and p.end_result == 255 then
               ipidx = i

               if p.team > 0 then
                  -- player is on a team, keep collecting memberships
                  ipteam = p.team
               else
                  -- player is alone, we don't need team info
                  break
               end

            end
         end  -- interactive player

      end
   end

   if ipidx == nil then
      -- no or inactive interactive player, show all players
      for i,p in ipairs(game.players) do
         tabs[i] = one_player_stats_panel(p)
      end
   else
      if ipteam > 0 and #teams[ipteam] > 1 then
         -- player has teammates, show them all
         for ti,pi in ipairs(teams[ipteam]) do
            tabs[ti] = one_player_stats_panel(game.players[pi])
         end
      else
         -- player is alone, show only own stats
         tabs = one_player_stats_panel(game.players[ipidx]).panel.tabs
      end
   end

   local hours = gametime // (3600 * 1000)
   local minutes = gametime // (60 * 1000) % 60
   local seconds = gametime // 1000 % 60
   -- TRANSLATORS: Gametime as hours:minutes, e.g. 2:30
   local timestr = _("%1$d:%2$02d:%3$02d"):bformat(hours, minutes, seconds)

   mv:create_child({
      widget = "unique_window",
      registry = info_window_name,
      name = info_window_name,
      title = _("Player Statistics at gametime %s"):bformat(timestr),
      content = {
         widget = "tabpanel",
         name = "playerstat_tabs",
         active = tabs[1].name,
         tabs = tabs,
      },
   })

   pop_textdomain()
end

