push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname (__file__)

wl.Descriptions():new_immovable_type {
   name = "pond_dry",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext ("immovable", "Dry Pond"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:30m",
         "remove=",
      },
      remove_pond = {
         "remove="
      },
      fill_pond = {
         "transform=pond_water"
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
