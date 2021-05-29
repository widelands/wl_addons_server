push_textdomain("tropics.wad", true)

dirname = path.dirname(__file__)

terrain_affinity = {
   preferred_temperature = 190,
   preferred_humidity = 940,
   preferred_fertility = 170,
   pickiness = 75,
}

wl.Descriptions():new_immovable_type{
   name = "palm_peach_tropic_sapling",
   descname = _ "Peach Palm (Sapling)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:55s",
         "remove=chance:12.21%",
         "grow=palm_peach_tropic_pole",
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
   name = "palm_peach_tropic_pole",
   descname = _ "Peach Palm (Pole)",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:55s",
         "remove=chance:11.69%",
         "grow=palm_peach_tropic_mature",
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
   name = "palm_peach_tropic_mature",
   descname = _ "Peach Palm (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:1m",
         "remove=chance:8.98%",
         "grow=palm_peach_tropic_old",
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
   name = "palm_peach_tropic_old",
   descname = _ "Peach Palm (Old)",
   species = _ "Peach Palm",
   icon = dirname .. "menu.png",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:25m55s",
         "transform=deadtree6 chance:12.02%",
         "seed=palm_peach_tropic_sapling proximity:43%",
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
         hotspot = { 24, 59 },
         sound_effect = {
            path = "sound/animals/bird3",
            priority = "10%"
         },
      }
   },
}

pop_textdomain()
