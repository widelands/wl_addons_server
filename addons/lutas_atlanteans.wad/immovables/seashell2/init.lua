push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type{
   name = "seashell2",
   descname = _("Lutas’ Seashell"),
   size = "none",
   programs = {
      main = {
         "animate=idle duration:20m",
         "remove="
      },
      harvest = {
         "remove=",
      }
   },
   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 26, 32 },
      },
   }
}

pop_textdomain()
