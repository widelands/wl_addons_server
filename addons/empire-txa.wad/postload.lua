local descriptions = wl.Descriptions()
push_textdomain("tribes")
include "tribes/scripting/help/time_strings.lua"

local function set_programs(site, programs)
   for name, program in pairs(programs) do
      descriptions:modify_unit("productionsite", site, "programs", "set", name, program)
   end
end

-- workaround: force loading the whole tribe before calling modify_unit() on buildings
-- which would mess up the build menu order by loading the buildings before the tribe
descriptions:modify_unit("tribe", "empire", "descname", _("Easier Empire"))

-- Marblemines (CB#4968)
-- harmonise speed with other mines,
-- will produce slower but more efficiently
local mine_programs = include "addons/empire-txa.wad/programs/marblemine.lua"
set_programs("empire_marblemine", mine_programs)

local deep_programs = include "addons/empire-txa.wad/programs/marblemine_deep.lua"
set_programs("empire_marblemine_deep", deep_programs)


-- Marble column (CB#4969)
 -- production
  -- The Big One: marble column costs only one 1 marble
local stonemason_programs = include "addons/empire-txa.wad/programs/stonemason.lua"
set_programs("empire_stonemasons_house", stonemason_programs)

-- this is in the PR, but it breaks the "Village" starting condition, and add-ons can't modify that...
-- descriptions:modify_unit("productionsite", "empire_stonemasons_house", "input", "modify_ware", "marble", 4)

  -- quarry yields less marble
local quarry_programs = include "addons/empire-txa.wad/programs/quarry.lua"
set_programs("empire_quarry", quarry_programs)

 -- returned marble can be decreased
descriptions:modify_unit("building",
   "empire_fortress", "enhancement_return_on_dismantle", "set", "marble", 2)

descriptions:modify_unit("building",
   "empire_armorsmithy", "return_on_dismantle", "set", "log", 1)
descriptions:modify_unit("building",
   "empire_armorsmithy", "return_on_dismantle", "set", "marble_column", 1)

descriptions:modify_unit("building",
   "empire_weaponsmithy", "return_on_dismantle", "set", "marble_column", 1)


-- Medium buildings buildcosts (CB#4970)
-- now we can use marble for all of them
-- also some redistribution to match level and graphics better
descriptions:modify_unit("building",
   "empire_bakery", "buildcost", "set", "log", 1)
descriptions:modify_unit("building",
   "empire_bakery", "buildcost", "set", "marble", 1)

descriptions:modify_unit("building",
   "empire_brewery", "buildcost", "set", "log", 2)
descriptions:modify_unit("building",
   "empire_brewery", "buildcost", "set", "marble", 1)
descriptions:modify_unit("building",
   "empire_brewery", "return_on_dismantle", "set", "log", 1)

descriptions:modify_unit("building",
   "empire_vineyard", "buildcost", "set", "marble_column", 1)  -- cheaper

-- winery was way too cheap
descriptions:modify_unit("building",
   "empire_winery", "buildcost", "set", "planks", 2)
descriptions:modify_unit("building",
   "empire_winery", "buildcost", "set", "granite", 2)
descriptions:modify_unit("building",
   "empire_winery", "buildcost", "set", "marble_column", 2)
descriptions:modify_unit("building",
   "empire_winery", "return_on_dismantle", "set", "planks", 1)

-- weaving mill too
descriptions:modify_unit("building",
   "empire_weaving_mill", "buildcost", "set", "planks", 1)
descriptions:modify_unit("building",
   "empire_weaving_mill", "buildcost", "set", "granite", 1)
descriptions:modify_unit("building",
   "empire_weaving_mill", "buildcost", "set", "marble", 2)
descriptions:modify_unit("building",
   "empire_weaving_mill", "buildcost", "set", "marble_column", 1)
descriptions:modify_unit("building",
   "empire_weaving_mill", "return_on_dismantle", "set", "log", 2)
descriptions:modify_unit("building",
   "empire_weaving_mill", "return_on_dismantle", "set", "marble", 2)

-- warehouse was too expensive compared to other tribes, only partly fixed by cheaper column
descriptions:modify_unit("building",
   "empire_warehouse", "buildcost", "set", "marble", 2)
descriptions:modify_unit("building",
   "empire_warehouse", "return_on_dismantle", "set", "log", 1)
descriptions:modify_unit("building",
   "empire_warehouse", "return_on_dismantle", "set", "granite", 1)
descriptions:modify_unit("building",
   "empire_warehouse", "return_on_dismantle", "set", "marble", 1)


-- Farms (CB#4967)
-- farm and piggery were way too expensive compared to other tribes
-- and sheepfarm was too cheap compared to them
descriptions:modify_unit("building",
   "empire_farm", "buildcost", "remove", "planks")
descriptions:modify_unit("building",
   "empire_farm", "buildcost", "remove", "marble_column")
descriptions:modify_unit("building",
   "empire_farm", "buildcost", "set", "log", 2)
descriptions:modify_unit("building",
   "empire_farm", "buildcost", "set", "granite", 3)
descriptions:modify_unit("building",
   "empire_farm", "buildcost", "set", "marble", 3)
descriptions:modify_unit("building",
   "empire_farm", "return_on_dismantle", "remove", "planks")
descriptions:modify_unit("building",
   "empire_farm", "return_on_dismantle", "remove", "marble_column")
descriptions:modify_unit("building",
   "empire_farm", "return_on_dismantle", "set", "log", 1)
descriptions:modify_unit("building",
   "empire_farm", "return_on_dismantle", "set", "granite", 2)

descriptions:modify_unit("building",
   "empire_piggery", "buildcost", "remove", "marble_column")
descriptions:modify_unit("building",
   "empire_piggery", "buildcost", "set", "marble", 2)

local piggery_programs = include "addons/empire-txa.wad/programs/piggery.lua"
set_programs("empire_piggery", piggery_programs)

descriptions:modify_unit("building",
   "empire_sheepfarm", "buildcost", "remove", "planks")
descriptions:modify_unit("building",
   "empire_sheepfarm", "buildcost", "set", "marble", 2)
descriptions:modify_unit("building",
   "empire_sheepfarm", "return_on_dismantle", "set", "granite", 1)
descriptions:modify_unit("building",
   "empire_sheepfarm", "return_on_dismantle", "set", "marble", 1)

