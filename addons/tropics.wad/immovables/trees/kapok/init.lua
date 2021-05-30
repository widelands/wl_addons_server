push_textdomain("tropics.wad", true)

dirname = path.dirname(__file__)

terrain_affinity = {
   preferred_temperature = 200,
   preferred_humidity = 965,
   preferred_fertility = 201,
   pickiness = 76,
}

wl.Descriptions():new_immovable_type{
   name = "kapok_tropic_sapling",
   descname = _"Kapok (Sapling)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:51s",
         "remove=chance:10.94%",
         "grow=kapok_tropic_pole",
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
         hotspot = { 5, 15 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "kapok_tropic_pole",
   descname = _"Kapok (Pole)",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:52s",
         "remove=chance:10.23%",
         "grow=kapok_tropic_mature",
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
         hotspot = { 12, 35 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "kapok_tropic_mature",
   descname = _"Kapok (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:62s",
         "seed=kapok_tropic_sapling proximity:45%",
         "remove=chance:9.91%",
         "grow=kapok_tropic_old",
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
         hotspot = { 19, 56 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "kapok_tropic_old",
   descname = _"Kapok (Old)",
   species = _"Kapok Tree",
   icon = dirname .. "menu.png",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:30m59s",
         "transform=deadtree2 chance:11.22%",
         "seed=kapok_tropic_sapling proximity:24%",
      },
      fall = {
         "remove=",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "old",
         fps = 9,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 26, 71 },
         sound_effect = {
            path = "sound/animals/bird2",
            priority = "9%"
         },
      }
   },
}

pop_textdomain()
