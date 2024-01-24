push_textdomain("editor_analyse_map.wad", true)

function is_in(value, t)
   -- Checks wether value is in array t
   for k, v in pairs(t) do
      if v == value then return true end
   end
   return false
end

function get_field_string(f)
   if f.x then
      return _("%1$d/%2$d"):bformat(f.x, f.y)
   end
   return "-"
end

function get_other_data_rt(other_data, percent, calc_rocks)
   -- Collect richtext from field data processed by analyse()
   local rt = ""
   rt = rt .. text_from_table(other_data.build_plots)
   rt = rt .. text_from_table(other_data.trees)
   rt = rt .. text_from_table(other_data.fish_water)
   rt = rt .. text_from_table(other_data.mineable_res, percent)
   rt = rt .. text_from_table(other_data.rocks, false, calc_rocks)
   return rt
end

function get_rocks_rt(amount)
   -- Calculate how much granite and marble can be mined from rocks
   -- Returns richtext
   local total_gr = amount
   local granite = math.floor(total_gr / 1.4) -- 5 out of 7
   local marble = math.floor(total_gr / 3.5)  -- 2 out of 7
   local text_tmp = ""
   text_tmp = text_tmp .. p(_("%1$d granite or:"):bformat(total_gr))
   text_tmp = text_tmp .. p(_("ca. %1$d granite and ca. %2$d marble"):bformat(granite, marble))
   return div("width=180", text_tmp)
end

function table_add(t, k, v)
   -- Initial part of text_from_table()
   -- Adds the key k with value v to table t.
   -- If the key exists the value v will be added to the existing value of k
   if t[k] == nil then
      -- Initialize the key
      t[k] = v
   else
      -- Add a value
      t[k] = t[k] + v
   end
end

function text_from_table(table, percent, calc_rocks)
   -- Use table_add() prior to fill the table
   -- Compose a richtext out of the keys/values in table
   -- percent: If true calculate the percent out of the values
   -- calc_rocks: If true calculate granite and marble results

   local percent = percent or false
   local total = 0
   if percent then
      for k, v in pairs(table) do
         total = total + v
      end
   end
   local text = ""
   for k, v in ordered_pairs(table) do
      local perc_text = ""
      if percent then
         -- TRANSLATORS: A value with percent sign like: (20%)
         perc_text = _("(%1$d%%)"):bformat(math.floor(100 / total * v))
      end
      if calc_rocks then
         v = get_rocks_rt(v)
      end
      local text_tmp = ""
      text_tmp = text_tmp .. p("align=center", img(k)
                        -- TRANSLATORS: First placeholder is a number or string, second placeholder is the prior created percent string
                        -- TRANSLATORS: Result is like: "2 (15%)"
                          .. _("%1$s %2$s"):bformat(tostring(v), perc_text)
                        )
      text = text .. div("padding=3", text_tmp)
   end
   return text
end

function get_plr_table_rt(plrs_data)
   -- Create a table like richtext
   -- plrs_data must be an array containing tables with following keys:
   --  { pl_name = {
   --                resource1 = {
   --                             Start_f  = map_field,
   --                             Amount   = number,
   --                             Distance = number,
   --                             Field    = map_field
   --                            },
   --                resource2 = {
   --                             Start_f   = map_field,
   --                             Amount   = number,
   --                             Distance = number,
   --                             Field    = map_field
   --                            },
   --                .. etc ..
   --              }
   --  }

   local table_text = ""

   if next(plrs_data) ~= nil then

      -- For changing the text colours
      local font_clr_counter = 0
      local font_clrs = {"ffff00", "ffd400"}
      local clr = font_clrs[1]

      -- The widths of the columns. If you want another order you have also to
      -- order the columns (below) accordingly
      -- Columns:          Player      Start Pos.     Found       Amount        Around     Distance
      local col_width = {"width=15%", "width=16%", "width=18%", "width=15%", "width=15%", "width=18%"}
      local rows = ""

      -- Table headers
      rows = rows .. div("width=100%",
                  -- TRANSLATORS: Table header for of player names
                  div(col_width[1], h3(_("Name"))) ..
                  -- TRANSLATORS: Table header for players start field
                  div(col_width[2], p("align=center", h3(_("Position")))) ..
                  -- TRANSLATORS: Table header for resource names
                  div(col_width[3], h3(_("Found"))) ..
                  -- TRANSLATORS: Table header for resource amount
                  div(col_width[4], h3(_("Amount"))) ..
                  -- TRANSLATORS: Table header for fields like "15/30"
                  div(col_width[5], p("align=center",h3(_("Around")))) ..
                  -- TRANSLATORS: Table header for values like "30 Fields"
                  div(col_width[6], p("align=right",h3(_("Distance"))))
                )

      for i, plr_data in ipairs(plrs_data) do
         -- Loop each player
         -- Table data, ordered_pairs() to keep sorting of player names
         for pl, data in ordered_pairs(plr_data) do
            local col1 = ""
            local col2 = ""
            local col3 = ""
            local col4 = ""
            local col5 = ""
            local col6 = ""
            local counter = 0
            font_clr_counter = font_clr_counter + 1
            
            for res, info in ordered_pairs(data) do
               counter = counter + 1
               if counter <= 1 then
                  -- Show player name and starting field only for the first row
                  col1 = col1 .. p_font("color="..clr, pl)
                  col2 = col2 .. p_font("align=center", "color="..clr, get_field_string(info.Start_f))
               end
               -- resource
               col3 = col3 .. p_font("color="..clr, wl.Editor():get_resource_description(res).descname)
               -- resource amount
               col4 = col4 .. p_font("align=right", "color="..clr, info.Amount .. space(20))
               -- resource found at
               col5 = col5 .. p_font("align=center", "color="..clr, get_field_string(info.Field))
               -- distance of resource
               col6 = col6 .. p_font("align=right", "color="..clr, _("%1$d Fields"):bformat(info.Distance))
            end

            -- swap color for each player
            clr=font_clrs[math.fmod(font_clr_counter, 2)+1]

            rows = rows .. div("width=100%",
                                div(col_width[1], col1) ..  -- plr name
                                div(col_width[2], col2) ..  -- plr starting field
                                div(col_width[3], col3) ..  -- resource name
                                div(col_width[4], col4) ..  -- resource amount
                                div(col_width[5], col5) ..  -- around field
                                div(col_width[6], col6)     -- distance to start
                              )
         end
      end
      table_text = table_text .. div("width=100%", rows)
   end

   return div("width=100%", table_text)
end

pop_textdomain()
