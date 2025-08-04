-- =======================================================================
--           Init script for debugging.
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)

include "addons/enhanced_debug_scripts.wad/debug.lua"
include "addons/enhanced_debug_scripts.wad/debug_roads.lua"
include "addons/enhanced_debug_scripts.wad/debug_buildings.lua"
include "addons/enhanced_debug_scripts.wad/debug_seafaring.lua"

--observer_mode_team(1)

pop_textdomain()
