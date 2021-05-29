push_textdomain("tropics.wad", true)

dirname = path.dirname(__file__)

terrain_affinity = {
   preferred_temperature = 210,
   preferred_humidity = 990,
   preferred_fertility = 202,
   pickiness = 84,
}

wl.Descriptions():new_immovable_type{
   name = "mangrove_tropic_sapling",
   descname = _"Mangrove (Sapling)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:50s",
         "remove=chance:12.44%",
         "grow=mangrove_tropic_pole",
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
         hotspot = { 9, 12 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "mangrove_tropic_pole",
   descname = _"Mangrove (Pole)",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:49s",
         "remove=chance:10.89%",
         "grow=mangrove_tropic_mature",
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
         hotspot = { 14, 20 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "mangrove_tropic_mature",
   descname = _"Mangrove (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:29s",
         "remove=chance:7.98%",
         "seed=mangrove_tropic_sapling proximity:56%",
         "animate=idle duration:29s",         
         "grow=mangrove_tropic_old",
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
         hotspot = { 21, 31 },
         sound_effect = {
            path = "sound/animals/crickets1",
            priority = "12%"
         },
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "mangrove_tropic_old",
   descname = _"Mangrove (Old)",
   species = _"Mangrove",
   icon = dirname .. "menu.png",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:22m45s",
         "transform=deadtree1 chance:10.33%",
         "seed=mangrove_tropic_sapling proximity:30%",
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
         hotspot = { 26, 40 },
         sound_effect = {
            path = "sound/animals/frog",
            priority = "11%"
         },
      }
   },
}

pop_textdomain()
