-- Table for exported functions
local functions = {}


-- Soldier strength

local function effective_strength(a_min, a_max, h, d, e)
   local a_avg = (a_min + a_max) / 2
   local h_eff = h / (1 - d / 100) / (1 - e / 100)

   return h_eff * a_avg / 1e7
end

local function levels_strength(sd, la, lh, ld, le)
   local a_inc = la * sd.attack_incr_per_level
   local a_min = sd.base_min_attack + a_inc
   local a_max = sd.base_max_attack + a_inc
   local h = sd.base_health + lh * sd.health_incr_per_level
   local d = sd.base_defense + ld * sd.defense_incr_per_level
   local e = sd.base_evade + le * sd.evade_incr_per_level

   return effective_strength(a_min, a_max, h, d, e)
end

local function soldier_strength(s)
   return levels_strength(s.descr, s.attack_level, s.health_level, s.defense_level, s.evade_level)
end

functions.max_strength = function(sd)
   return levels_strength(sd, sd.max_attack_level, sd.max_health_level, sd.max_defense_level, sd.max_evade_level)
end

functions.min_strength = function(sd)
   return levels_strength(sd, 0, 0, 0, 0)
end


-- Replicate the C++ calculation of soldier strength for the general statistics
-- (oops, why aren't at least the current statistics exported to lua?)
function soldierstats(l, max)
   return 19 * l * l / (max * max) + 1
end


-- Calculate sum of soldier strengths and stats for building
functions.soldiersums = function(b, is_milsite, max_level, sd)
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
functions.controlled_fields = function(r)
   -- We calculate with (r - 1) to exclude the borders.
   return 3 * r * (r - 1) + 1
end


-- Bonuses and penalties to be applied to a single military building
-- The dividers make sure that both the area and the soldier bonuses vary roughly
-- between +25% and -25%.
local median_radius = 9
local area_divider = 12
functions.area_bonus = function(radius)
   return (radius - median_radius) / area_divider
end

local log_mid_strength = 3.5 -- ~(log(12 heroes)+log(1 rookie)/2 ~log(1 hero) ~log(12 rookies)
local strength_divider = 10
functions.soldier_bonus = function(total_strength)
   return (math.log(total_strength) - log_mid_strength) / strength_divider
end

local hq_penalty_radius = 32
local training_penalty_radius = 20
local max_penalty = 0.25
local function apply_penalty(bonus, distance, penalty_radius)
   if distance >= penalty_radius then
      return bonus
   end

   local r = distance / penalty_radius
   local penalty = max_penalty * (1 - r)

   -- positive bonuses are penalised more, already negative bonuses get
   -- reduced penalty to make sure the final score stays positive
   if bonus > 0 then
      bonus = bonus * r
   elseif bonus < 0 then
      penalty = penalty * (1 + bonus)
   end
   return bonus - penalty
end

-- Distance functions
local map_w
local map_h
local function distance(fa, fb)
  -- we don't calculate the effect of even/odd lines, so the result
  -- may be off by ±1, but that's OK for our purposes
  local dx = (fa.x - fb.x) % map_w
  if dx > map_w / 2 then
    dx = map_w - dx
  end
  local dy = (fa.y - fb.y) % map_h
  if dy > map_h / 2 then
    dy = map_h - dy
  end
  return math.max(dx, dy)
end

local starting_positions = {}

local function wait_for_first_warehouse(pidx)
   local game = wl.Game()
   local plr = game.players[pidx]
   local warehouse_types = {}

   for i,building in ipairs(game:get_tribe_description(plr.tribe_name).buildings) do
      if (building.type_name == "warehouse") then
         table.insert(warehouse_types, building.name)
      end
   end

   -- Players who get to build the first warehouse late get exemption from the HQ penalty
   local timeout = game.win_condition_duration * 60 * 1000 / 2
   while starting_positions[pidx] == nil and game.time < timeout do
      sleep(15923)
      for i, building_name in ipairs(warehouse_types) do
         local warehouses = plr:get_buildings(building_name)
         if #warehouses > 0 then
            starting_positions[pidx] = warehouses[1].fields[1]
            break
         end
      end
   end
end

functions.init_startpos = function()
   local game = wl.Game()

   -- these don't really belong here, but we can't initialise them right at the definition,
   -- because this script is also included when checking win conditions for the game setup
   -- window, and wl.Game() is not available at that time
   map_w = game.map.width
   map_h = game.map.height

   for idx,player in ipairs(game.players) do
      local sf = game.map.player_slots[player.number].starting_field
      if sf.immovable ~= nil and sf.immovable.owner == player then
         starting_positions[idx] = sf
      else
         run(wait_for_first_warehouse, idx)
      end
   end
end

-- penalise sites that are close to the starting position
-- will be applied to both the soldier and the area bonuses of the building
functions.apply_hq_penalty = function(pidx, bonus, f)
   if starting_positions[pidx] == nil then
      return(bonus)
   end

   return apply_penalty(bonus, distance(f, starting_positions[pidx]), hq_penalty_radius)
end


-- we have to keep track of disappered training sites too, to prevent cheating by dismantling
-- after local milsites are filled with heroes
local trainingsites = {}
functions.check_trainingsite = function(pidx, f)
   if trainingsites[pidx] == nil then
      trainingsites[pidx] = {}
   end
   if trainingsites[pidx][f.x] == nil then
      trainingsites[pidx][f.x] = {}
   end
   if trainingsites[pidx][f.x][f.y] == nil then
      trainingsites[pidx][f.x][f.y] = f
   end
end

-- penalise sites that are close to training sites
-- will be applied to the soldier bonus of the building
functions.apply_training_penalty = function(pidx, bonus, f)
   if trainingsites[pidx] == nil then
      return(bonus)
   end

   local distance_nearest_trainingsite = training_penalty_radius + 1
   for x,ys in pairs(trainingsites[pidx]) do
      if math.abs(f.x - x) < distance_nearest_trainingsite then
         for y,tf in pairs(ys) do
            if math.abs(f.y - y) < distance_nearest_trainingsite then
               distance_nearest_trainingsite =
                  math.min(distance_nearest_trainingsite, distance(f, tf))
            end
         end
      end
   end

   return apply_penalty(bonus, distance_nearest_trainingsite, training_penalty_radius)
end


-- Final score calculation
functions.score_weighting = function(area, guarded, soldiers, guards)
   return math.exp(math.log(area * guarded) / 6 + math.log(soldiers * guards) / 3)
end


-- Simulate adding a building to a mid-game economy without conquering new fields
local example_economy = {
   area = 4000,
   guarded = 6000,
   soldiers = 450,
   guards = 600,
}
example_economy.points = functions.score_weighting(
   example_economy.area, example_economy.guarded,
   example_economy.soldiers, example_economy.guards)
functions.building_score = function(conquer, strength, a_bonus, s_bonus)
   local bonus = 1 + a_bonus + s_bonus
   local new_points = functions.score_weighting(
      example_economy.area, example_economy.guarded + bonus * conquer,
      example_economy.soldiers, example_economy.guards + bonus * strength)
   return new_points - example_economy.points
end


-- Generates a richtext format string that can be used as a table row with n_cols columns.
-- The columns will have equal widths, but the first column can be different if the optional
-- pct_first parameter is used to control the target width of the first column in percentage
-- of the available space.
functions.table_row_format = function(n_cols, pct_first)
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


return functions
