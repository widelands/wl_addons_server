-- Spiritus rector of all modifications is the-x. Implementation by Nordfriese.
-- The modifications were devised using build-21 and adapted for pre- and post-v1.0 development builds.
-- Therefore, no amazon tweaks yet.

push_textdomain("the-x-mod.wad", true)

D = wl.Descriptions()
-- Some features are available only in builds newer than v1.0
N = (get_build_id():find("1.0") ~= 1)

for i,tribe in ipairs({"atlanteans", "barbarians", "empire", "frisians"}) do
   for j,site in ipairs({"militarysites", "warehouses", "productionsites", "trainingsites"}) do
      include(path.dirname(__file__) .. tribe .. "/" .. site .. ".lua")
   end
end

pop_textdomain()
