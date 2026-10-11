local function sum_tables(a, b)
   local rv = {}
   for k,v in pairs(a) do
      rv[k] = v
   end
   for k,v in pairs(b) do
      if rv[k] == nil then
         rv[k] = v
      else
         rv[k] = rv[k] + v
      end
   end
   return rv
end

local function total_buildcost(bdesc)
   local bc
   local p = bdesc.enhanced_from
   if p ~= nil and not bdesc.buildable then
      bc = sum_tables(bdesc.enhancement_cost, total_buildcost(p))
   else
      bc = bdesc.buildcost
   end
   return bc
end

local bld_sizes = {"total", "small", "medium", "big", "mine"}

local bld_categories = { "production", "military", "all" }
local function init_bld_row()
   local rv = {}
   for i,c in ipairs(bld_categories) do
      rv[c] = 0
   end
   return rv
end

_player_stats_sizes_and_names_ = {}

local function add_building(names, sizenums, costs, name, desc, count)
   local ctg = "production"
   if desc.type_name == "militarysite" then
      ctg = "military"
   end

   table.insert(names[ctg], name)
   table.insert(names.all, name)

   for w,a in pairs(total_buildcost(desc)) do
      if costs[w] == nil then
         costs[w] = init_bld_row()
      end
      costs[w][ctg] = costs[w][ctg] + a * count
   end

   local size = desc.size
   if desc.is_mine then
      size = "mine"
   end
   sizenums[size][ctg] = sizenums[size][ctg] + count
   sizenums.total[ctg] = sizenums.total[ctg] + count

   if _player_stats_sizes_and_names_[name] == nil then
      _player_stats_sizes_and_names_[name] = {
         size = size,
         dname = desc.descname,
      }
   end
end


local function collect_stats(plr)
   local pbdgs = plr:get_buildings("all")

   local bdgcounts = {}
   local bdgorders = {}
   for i,c in ipairs(bld_categories) do
      bdgorders[c] = { total }
   end

   local buildsize_nums = {}
   for i,s in ipairs(bld_sizes) do
      buildsize_nums[s] = init_bld_row()
   end

   local buildcosts = {}
   buildcosts.total = init_bld_row()
   local bmats = {}


   for bname,blist in pairs(pbdgs) do
      if #blist > 0 then
         bdgcounts[bname] = #blist
         add_building(bdgorders, buildsize_nums, buildcosts, bname, blist[1].descr, #blist)
      end
   end

   for i,c in ipairs(bld_categories) do
      table.sort(bdgorders[c], function(x,y) return bdgcounts[x] > bdgcounts[y] end)
   end

   for s,r in pairs(buildsize_nums) do
      r.all = r.production + r.military
   end

   for m,r in pairs(buildcosts) do
      if m ~= "total" then
         r.all = r.production + r.military
         buildcosts.total.production = buildcosts.total.production + r.production
         buildcosts.total.military = buildcosts.total.military + r.military
      end
      table.insert(bmats, m)
   end
   buildcosts.total.all = buildcosts.total.production + buildcosts.total.military
   table.sort(bmats, function(x,y) return buildcosts[x].all > buildcosts[y].all end)


   local wp = plr:get_produced_wares_count("all")
   local total_prod = 0

   local w0 = {}             -- starting
   if _player_stats_starting_stock_ == nil then
      for k,v in pairs(wp) do
         w0[k] = 0
      end
   else
      w0 = _player_stats_starting_stock_[plr.number]
   end
   w0.total = 0

   local ws = { total = 0 }  -- stock
   local wc = { total = 0 }  -- consumed
   local wo = {}             -- overproduction
   local wtypes = { "total" }
   for k,v in pairs(wp) do
      table.insert(wtypes, k)
      total_prod = total_prod + v
      w0.total = w0.total + w0[k]
      ws[k] = plr:get_wares(k)
      ws.total = ws.total + ws[k]
      wc[k] = v + w0[k] - ws[k]
      wc.total = wc.total + wc[k]
      wo[k] = math.max(ws[k] - w0[k], 0) * 100 / math.max(wc[k], 1)
   end
   wp.total = total_prod
   wo.total = math.max(ws.total - w0.total, 0) * 100 / math.max(wc.total, 1)
   table.sort(wtypes, function(x,y) return wc[x] > wc[y] end)


   return {
      building_counts = bdgcounts,
      building_orders = bdgorders,
      buildingsize_counts = buildsize_nums,
      size_order = bld_sizes,
      buildcosts = buildcosts,
      building_materials_order = bmats,
      wares = {
         starting = w0,
         produced = wp,
         remaining = ws,
         consumed = wc,
         overproduction = wo,
         sort_order = wtypes,
      }
   }
end

return { collect_stats }
