-- Soldier strength

function effective_strength(a_min, a_max, h, d, e)
   local a_avg = (a_min + a_max) / 2
   local h_eff = h / (1 - d / 100) / (1 - e / 100)

   return h_eff * a_avg / 1e7
end

function levels_strength(sd, la, lh, ld, le)
   local a_inc = la * sd.attack_incr_per_level
   local a_min = sd.base_min_attack + a_inc
   local a_max = sd.base_max_attack + a_inc
   local h = sd.base_health + lh * sd.health_incr_per_level
   local d = sd.base_defense + ld * sd.defense_incr_per_level
   local e = sd.base_evade + le * sd.evade_incr_per_level

   return effective_strength(a_min, a_max, h, d, e)
end

function soldier_strength(s)
   return levels_strength(s.descr, s.attack_level, s.health_level, s.defense_level, s.evade_level)
end

function max_strength(sd)
   return levels_strength(sd, sd.max_attack_level, sd.max_health_level, sd.max_defense_level, sd.max_evade_level)
end

function min_strength(sd)
   return levels_strength(sd, 0, 0, 0, 0)
end


-- Replicate the C++ calculation of soldier strength for the general statistics
-- (oops, why aren't at least the current statistics exported to lua?)
function soldierstats(l, max)
   return 19 * l * l / (max * max) + 1
end


-- Calculate sum of soldier strengths and stats for building
function soldiersums(b, is_milsite, max_level, sd)
   local st = b:get_soldiers("all")
   local count = 0
   local sum_levels = 0
   local strength = 0
   local stats = 0
   local heroes = 0
   for levels,num in pairs(st) do
      count = count + num
      local current_levels = levels[1] + levels[2] + levels[3] + levels[4]
      sum_levels = sum_levels + num * current_levels
      stats = stats + num * soldierstats(current_levels, max_level)
      if current_levels == max_level then
         heroes = num
      end
      if is_milsite then
         strength = strength + num * levels_strength(sd, levels[2], levels[1], levels[3], levels[4])
      end
   end
   return { count = count, levels = sum_levels, stats = stats, strength = strength, heroes = heroes }
end


-- Conquer area size
function controlled_fields(r)
   -- We calculate with (r - 1) to exclude the borders.
   return 3 * r * (r - 1) + 1
end


-- Generates a richtext format string that can be used as a table row with n_cols columns.
-- The columns will have equal widths, but the first column can be different if the optional
-- pct_first parameter is used to control the target width of the first column in percentage
-- of the available space.
function table_row_format(n_cols, pct_first)
   local wf

   if pct_first == nil then
      wf = 100 // n_cols
   else
      wf = (100 - pct_first) // (n_cols - 1)
   end

   pct_first = 100 - wf * (n_cols - 1)

   local cell_fmt = div("width=%d%%%%", p("align=%s", "%%s"))
   local rv = cell_fmt:bformat(pct_first, "left")
   for i = 2, n_cols do
      rv = rv .. cell_fmt:bformat(wf, "center")
   end

   return p(rv)
end
