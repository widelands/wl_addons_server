push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__) .. "../"

wl.Descriptions():new_immovable_type {
   name = "lutas_atlanteans_resi_none",
   -- TRANSLATORS: This is a resource name used in lists of resources
   descname = pgettext("resource_indicator", "No Resources"),
   icon = dirname .. "pics/none.png",
   programs = {
      main = {
         "animate=idle duration:10m",
         "remove="
      }
   },
   spritesheets = {
      idle = {
         directory = dirname .. "pics",
         basename = "none",
         hotspot = {10, 36},
         frames = 4,
         columns = 2,
         rows = 2
      }
   }
}

pop_textdomain()
