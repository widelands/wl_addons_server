push_textdomain("tribes")

dirname = path.dirname (__file__)

wl.Descriptions():new_immovable_type {
   name = "pond_water",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext ("immovable", "Pond with water"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:7m30s",
         "transform=pond_dry",
      },
      remove_pond = {
         "remove=",
      },
      drain_pond = {
         "transform=pond_dry"
      },
      plant_reed_in_pond = {
         "transform=reedfield_tiny"
      },
   },

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "idle",
         hotspot = {8, 5}
      }
   }
}

pop_textdomain()
