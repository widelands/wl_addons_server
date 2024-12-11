push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type{
   name = "palm_leaves",
   descname = _("Palm Leaves"),
   animation_directory = path.dirname(__file__),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:5m",
         "remove="
      },
      harvest = {
         "remove=",
      }
   },
   animations = {
      idle = {
         hotspot = { 20, 14 },
      },
   }
}

pop_textdomain()
