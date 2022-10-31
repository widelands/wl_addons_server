-- =======================================================================
--           Init script for debugging.
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)

include "addons/enhanced_debug_scripts.wad/debug.lua"

set_seafaring(0, false)
observer_mode_team(1)

pop_textdomain()
