local functions = {}

functions.wares_to_str = function(wares)
   local tsv = "ware\tproduced\tconsumed\tremaining\toverproduction\n"
   if _player_stats_starting_stock_ == nil then
      for i,w in ipairs(wares.sort_order) do
         tsv = tsv ..
            string.bformat("%s\t%d\t%d\t%d\t%.0f%%\n",
               w, wares.produced[w], wares.consumed[w], wares.remaining[w], wares.overproduction[w]
            )
      end
   else
      tsv = "ware\tstarting\tproduced\tconsumed\tremaining\toverproduction\n"
      for i,w in ipairs(wares.sort_order) do
         tsv = tsv ..
            string.bformat("%s\t%d\t%d\t%d\t%d\t%.0f%%\n",
               w, wares.starting[w], wares.produced[w], wares.consumed[w], wares.remaining[w], wares.overproduction[w]
            )
      end
   end
   return tsv
end

functions.buildings_to_str = function(header, t, order)
   local tsv = string.bformat("%s\tproduction\tmilitary\tall\n", header)
   for i,k in ipairs(order) do
      tsv = tsv .. string.bformat("%s\t%d\t%d\t%d\n", k, t[k].production, t[k].military, t[k].all)
   end
   return tsv
end

functions.buildingcounts_to_str = function(header, counts, order)
   local tsv = string.bformat("%s\tsize\tcount\n", header)
   for i,k in ipairs(order) do
      tsv = tsv .. string.bformat(
         "%s\t%s\t%d\n", k, _player_stats_sizes_and_names_[k].size, counts[k])
   end
   return tsv
end


local function table_text_size()
   -- This is horribly ugly.
   -- The text_size() function should be available to lua, as well as a function to query
   -- the size of a given font style directly.
   -- Also the table text font is hidden inside the table style, so we use label_wui
   -- as an approximation. All style fonts should be available to lua.
   local ts = { string.find(styles.as_font("label_wui", ""), "size=([0-9]*) ") }
   ts = ts[3]
   return {
      fontsize = ts,
      numbercolumn = 5 * ts,
      percentcolumn = 6 * ts,
      longname = 20 * ts,
      shortname = 10 * ts,
      height = math.min(36 * ts, wl.ui.MapView().height * 0.8),
   }
end

local function pad(n)
   return string.bformat("%5d", n)
end

functions.wares_to_table = function(wares)
   push_textdomain("player_stats.wad", true)
   local ts = table_text_size()

   local rv = {
      widget = "table",
      name = "wares_table",
      datatype = "int",
      columns = {
         { w = ts.longname, align = "left", title = _("Ware") },
         { w = ts.numbercolumn, align = "right", title = _("Starting") },
         { w = ts.numbercolumn, align = "right", title = _("Produced") },
         { w = ts.numbercolumn, align = "right", title = _("Consumed") },
         { w = ts.numbercolumn, align = "right", title = _("Remaining") },
         { w = ts.percentcolumn, align = "right", title = _("Overproduction") },
      },
      rows = {},
      h = ts.height,
   }

   local g = wl.Game()

   for i,w in ipairs(wares.sort_order) do
      local wname
      if w == "total" then
         wname = _("Total")
      else
         wname = g:get_ware_description(w).descname
      end
      rv.rows[i] = {
         value = i,
         text_0 = wname,
         text_1 = pad(wares.starting[w]),
         text_2 = pad(wares.produced[w]),
         text_3 = pad(wares.consumed[w]),
         text_4 = pad(wares.remaining[w]),
         text_5 = string.bformat("%5.0f%%", wares.overproduction[w]),
      }
   end

   if _player_stats_starting_stock_ == nil then
      table.remove(rv.columns, 2)
      for i,r in ipairs(rv.rows) do
         r.text_1 = r.text_2
         r.text_2 = r.text_3
         r.text_3 = r.text_4
         r.text_4 = r.text_5
         r.text_5 = nil
      end
   end

   pop_textdomain()
   return rv
end

functions.buildcosts_to_table = function(bc, order)
   push_textdomain("player_stats.wad", true)
   local ts = table_text_size()
   local rv = {
      widget = "table",
      name = "buildcosts_table",
      datatype = "int",
      columns = {
         { w = ts.longname, align = "left", title = _("Building material") },
         { w = ts.numbercolumn, align = "right", title = _("Prodsites") },
         { w = ts.numbercolumn, align = "right", title = _("Milsites") },
         { w = ts.numbercolumn, align = "right", title = _("All") },
      },
      rows = {},
      h = ts.height,
   }
   local g = wl.Game()
   for i,w in ipairs(order) do
      local name
      if w == "total" then
         name = _("Total")
      else
         name = g:get_ware_description(w).descname
      end
      rv.rows[i] = {
         value = i,
         text_0 = name,
         text_1 = pad(bc[w].production),
         text_2 = pad(bc[w].military),
         text_3 = pad(bc[w].all),
      }
   end
   pop_textdomain()
   return rv
end

functions.buildingsizes_table = function(bdgs, order)
   push_textdomain("player_stats.wad", true)
   local ts = table_text_size()
   local rv = {
      widget = "table",
      name = "buildingsizes_table",
      datatype = "int",
      columns = {
         { w = ts.shortname, align = "center", title = _("Building size") },
         { w = ts.numbercolumn, align = "right", title = _("Prodsites") },
         { w = ts.numbercolumn, align = "right", title = _("Milsites") },
         { w = ts.numbercolumn, align = "right", title = _("All") },
      },
      rows = {},
      h = ts.height,
   }
   local g = wl.Game()
   for i,s in ipairs(order) do
      rv.rows[i] = {
         value = i,
         text_1 = pad(bdgs[s].production),
         text_2 = pad(bdgs[s].military),
         text_3 = pad(bdgs[s].all),
      }
      if s == "total" then
         rv.rows[i].text_0 = _("Total")
      else
         rv.rows[i].icon_0 = "images/wui/overlays/" .. s .. "_1.png"
      end
   end
   pop_textdomain()
   return rv
end

push_textdomain("player_stats.wad", true)
local translated_sizes = {
   small = _("Small"),
   medium = _("Medium"),
   big = _("Big"),
   mine = _("Mine"),
}
pop_textdomain()

functions.buildingcounts_to_table = function(bdgs, order)
   push_textdomain("player_stats.wad", true)
   local ts = table_text_size()
   local rv = {
      widget = "table",
      name = "buildings_table",
      datatype = "int",
      columns = {
         { w = ts.longname, align = "left", title = _("Building") },
         { w = ts.fontsize * 7, align = "center", title = _("Size") },
         { w = ts.numbercolumn, align = "right", title = _("Count") },
      },
      rows = {},
      h = ts.height,
   }
   local g = wl.Game()
   for i,b in ipairs(order) do
      rv.rows[i] = {
         value = i,
         text_0 = _player_stats_sizes_and_names_[b].dname,
         text_1 = translated_sizes[_player_stats_sizes_and_names_[b].size],
         text_2 = pad(bdgs[b]),
      }
   end
   pop_textdomain()
   return rv
end


functions.statbox = function(what, main_content, clipboard_txt)
   push_textdomain("player_stats.wad", true)
   rv = {
      widget = "box",
      name = what .. "box",
      orientation = "vertical",
      children = {
         main_content,
         {
            widget = "button",
            name = what .. "_to_clipboard",
            align = "center",
            title = _("Copy to clipboard"),
            on_click = "wl.ui.set_clipboard([[" .. clipboard_txt .. "]])",
         }  
      }
   }
   pop_textdomain()
   return rv
end


return functions
