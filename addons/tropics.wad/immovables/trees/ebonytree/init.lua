push_textdomain("tropics.wad", true)

dirname = path.dirname(__file__)

terrain_affinity = {
   preferred_temperature = 195,
   preferred_humidity = 960,
   preferred_fertility = 203,
   pickiness = 72,
}

wl.Descriptions():new_immovable_type{
   name = "ebony_tropic_sapling",
   descname = _"Ebonytree (Sapling)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:55s",
         "remove=chance:14.41%",
         "grow=ebony_tropic_pole",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "sapling",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 5, 12 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "ebony_tropic_pole",
   descname = _"Ebonytree (Pole)",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:55s",
         "remove=chance:12.89%",
         "grow=ebony_tropic_mature",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "pole",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 12, 28 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "ebony_tropic_mature",
   descname = _"Ebonytree (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m",
         "remove=chance:8.98%",
         "grow=ebony_tropic_old",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "mature",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 18, 48 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "ebony_tropic_old",
   descname = _"Ebonytree (Old)",
   species = _"Ebonytree",
   icon = dirname .. "menu.png",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:28m12s",
         "transform=deadtree2 chance:10.12%",
         "seed=ebony_tropic_sapling proximity:40%",
      },
      fall = {
         "remove=",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "old",
         fps = 10,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 24, 60 },
         sound_effect = {
            path = "sound/animals/bird4",
            priority = "8%"
         },
      }
   },
}

pop_textdomain()
