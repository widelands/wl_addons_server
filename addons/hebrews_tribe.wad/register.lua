-- register.lua for the Hebrew Tribe add-on
-- This file registers all tribe descriptions (buildings, wares, workers,
-- immovables) with the Widelands engine when the add-on is loaded.

-- Collect all register.lua files from the tribes/ subdirectory tree.
-- Each register.lua returns a table of description names to register.

-- Helper: recursively find and execute register.lua files
local function collect_registrations(basepath)
   local result = {}
   -- The engine's include mechanism handles path resolution
   -- We register each component type separately
   return result
end

-- Register the tribe itself
return {
   -- The order matters: wares and workers must be registered before
   -- buildings that reference them.

   -- Wares
   "tribes/wares/branch/register.lua",
   "tribes/wares/log/register.lua",
   "tribes/wares/granite/register.lua",
   "tribes/wares/clay/register.lua",
   "tribes/wares/water/register.lua",
   "tribes/wares/wheat/register.lua",
   "tribes/wares/wheat_grains/register.lua",
   "tribes/wares/flour/register.lua",
   "tribes/wares/bread_hebrews/register.lua",
   "tribes/wares/fish/register.lua",
   "tribes/wares/meat/register.lua",
   "tribes/wares/olives/register.lua",
   "tribes/wares/olive_oil/register.lua",
   "tribes/wares/grape/register.lua",
   "tribes/wares/wine/register.lua",
   "tribes/wares/copper_ore/register.lua",
   "tribes/wares/copper/register.lua",
   "tribes/wares/gold_ore/register.lua",
   "tribes/wares/gold_leaf/register.lua",
   "tribes/wares/menorah/register.lua",
   "tribes/wares/sheep/register.lua",
   "tribes/wares/wool/register.lua",
   "tribes/wares/fur/register.lua",
   "tribes/wares/yarn/register.lua",
   "tribes/wares/cloth/register.lua",
   "tribes/wares/pick/register.lua",
   "tribes/wares/hammer/register.lua",
   "tribes/wares/fishing_rod/register.lua",
   "tribes/wares/zizit/register.lua",
   "tribes/wares/tallit_katan/register.lua",
   "tribes/wares/tefilin/register.lua",
   "tribes/wares/tallit/register.lua",
   "tribes/wares/tunic/register.lua",
   "tribes/wares/slingshot/register.lua",
   "tribes/wares/dagger/register.lua",

   -- Workers
   "tribes/workers/hebrews/carrier/register.lua",
   "tribes/workers/hebrews/ferry/register.lua",
   "tribes/workers/hebrews/donkey/register.lua",
   "tribes/workers/hebrews/builder/register.lua",
   "tribes/workers/hebrews/stonemason/register.lua",
   "tribes/workers/hebrews/branch_collector/register.lua",
   "tribes/workers/hebrews/miner/register.lua",
   "tribes/workers/hebrews/geologist/register.lua",
   "tribes/workers/hebrews/scout/register.lua",
   "tribes/workers/hebrews/shipwright/register.lua",
   "tribes/workers/hebrews/fisher/register.lua",
   "tribes/workers/hebrews/farmer/register.lua",
   "tribes/workers/hebrews/shepherd/register.lua",
   "tribes/workers/hebrews/smelter/register.lua",
   "tribes/workers/hebrews/talmid/register.lua",
   "tribes/workers/hebrews/talmid_chacham/register.lua",
   "tribes/workers/hebrews/recruit/register.lua",
   "tribes/workers/hebrews/soldier/register.lua",

   -- Ships
   "tribes/ships/hebrews/register.lua",

   -- Immovables
   "tribes/immovables/shipconstruction_hebrews/register.lua",

   -- Buildings: Warehouses
   "tribes/buildings/warehouses/hebrews/headquarters/register.lua",
   "tribes/buildings/warehouses/hebrews/headquarters_tent/register.lua",
   "tribes/buildings/warehouses/hebrews/warehouse/register.lua",
   "tribes/buildings/warehouses/hebrews/port/register.lua",

   -- Buildings: Production sites
   "tribes/buildings/productionsites/hebrews/branch_collectors_hut/register.lua",
   "tribes/buildings/productionsites/hebrews/fishers_hut/register.lua",
   "tribes/buildings/productionsites/hebrews/shepherds/register.lua",
   "tribes/buildings/productionsites/hebrews/well/register.lua",
   "tribes/buildings/productionsites/hebrews/quarry/register.lua",
   "tribes/buildings/productionsites/hebrews/clay_pit/register.lua",
   "tribes/buildings/productionsites/hebrews/brick_kiln/register.lua",
   "tribes/buildings/productionsites/hebrews/clearing_tent/register.lua",
   "tribes/buildings/productionsites/hebrews/spinning_mill/register.lua",
   "tribes/buildings/productionsites/hebrews/zizijot_makers_hut/register.lua",
   "tribes/buildings/productionsites/hebrews/scouts_house/register.lua",
   "tribes/buildings/productionsites/hebrews/mill/register.lua",
   "tribes/buildings/productionsites/hebrews/bakery/register.lua",
   "tribes/buildings/productionsites/hebrews/butchery/register.lua",
   "tribes/buildings/productionsites/hebrews/weaving_mill/register.lua",
   "tribes/buildings/productionsites/hebrews/winery/register.lua",
   "tribes/buildings/productionsites/hebrews/dressmakery/register.lua",
   "tribes/buildings/productionsites/hebrews/clay_furnace/register.lua",
   "tribes/buildings/productionsites/hebrews/gold_beater/register.lua",
   "tribes/buildings/productionsites/hebrews/workshop/register.lua",
   "tribes/buildings/productionsites/hebrews/sofers_workshop/register.lua",
   "tribes/buildings/productionsites/hebrews/weaponsmithy/register.lua",
   "tribes/buildings/productionsites/hebrews/donkeyfarm/register.lua",
   "tribes/buildings/productionsites/hebrews/machane/register.lua",
   "tribes/buildings/productionsites/hebrews/initiation_site/register.lua",
   "tribes/buildings/productionsites/hebrews/farm/register.lua",
   "tribes/buildings/productionsites/hebrews/oliveplant/register.lua",
   "tribes/buildings/productionsites/hebrews/yeshiva/register.lua",
   "tribes/buildings/productionsites/hebrews/solomons_harbour/register.lua",
   "tribes/buildings/productionsites/hebrews/coppermine/register.lua",
   "tribes/buildings/productionsites/hebrews/goldmine/register.lua",
   "tribes/buildings/productionsites/hebrews/goldmine_deep/register.lua",
   "tribes/buildings/productionsites/hebrews/granitemine/register.lua",
   "tribes/buildings/productionsites/hebrews/threshing_floor/register.lua",
   "tribes/buildings/productionsites/hebrews/vineyard/register.lua",
   "tribes/buildings/productionsites/hebrews/smelting_works/register.lua",
   "tribes/buildings/productionsites/hebrews/shipyard/register.lua",

   -- Buildings: Training sites
   "tribes/buildings/trainingsites/hebrews/trainingcamp/register.lua",
   "tribes/buildings/trainingsites/hebrews/yeshiva/register.lua",

   -- Buildings: Military sites
   "tribes/buildings/militarysites/hebrews/tent_small/register.lua",
   "tribes/buildings/militarysites/hebrews/massada/register.lua",

   -- Buildings: Markets
   "tribes/buildings/markets/hebrews/market/register.lua",

   -- Tribe initialization (must be last)
   "tribes/initialization/hebrews/init.lua",
}
