push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
   name = "europeans_fishbreeder_normal",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("europeans_worker", "Normal Fish Breeder"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   experience = 24,
   becomes = "europeans_fishbreeder_advanced",

   programs = {
      dig = {
         "findspace=size:any radius:8",
         "walk=coords",
         "animate=dig duration:6s",
         "plant=attrib:pond_dry",
         "return"
      },
      check_pond = {
         "findobject=attrib:pond_dry radius:8",
      },
      breed_in_pond = {
         "findobject=attrib:pond_dry radius:8",
         "walk=object",
         "animate=freeing duration:6s",
         "callobject=with_fish",
         "return"
      },
      check_sea = {
         "findspace=size:any radius:8 breed resource:resource_fish",
      },
      breed_in_sea = {
         "findspace=size:any radius:8 breed resource:resource_fish",
         "walk=coords",
         "animate=freeing duration:6s",
         "breed=resource_fish radius:1",
         "return"
      }
   },

   spritesheets = {
      dig = {
         basename = "dig",
         fps = 20,
         frames = 10,
         columns = 5,
         rows = 2,
         hotspot = {15, 20}
      },
   },
   
   animations = {
      idle = {
         hotspot = { 8, 22 }
      },
      freeing = {
         hotspot = { 10, 19 },
         fps = 10
      },
      walk = {
         hotspot = { 11, 23 },
         fps = 20,
         directional = true
      }
   }
}

pop_textdomain()
