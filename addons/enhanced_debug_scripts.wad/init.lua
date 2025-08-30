-- =======================================================================
--           Init script for debugging.
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)

include "addons/enhanced_debug_scripts.wad/debug.lua"
include "addons/enhanced_debug_scripts.wad/debug_map.lua"
include "addons/enhanced_debug_scripts.wad/debug_roads.lua"
include "addons/enhanced_debug_scripts.wad/debug_buildings.lua"
include "addons/enhanced_debug_scripts.wad/debug_buildcosts.lua"
include "addons/enhanced_debug_scripts.wad/debug_seafaring.lua"
include "addons/enhanced_debug_scripts.wad/debug_militarysites.lua"
include "addons/enhanced_debug_scripts.wad/debug_warehouses.lua"

pop_textdomain()
