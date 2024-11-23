push_textdomain("white_summer.wad")

dirname = path.dirname(__file__)

terrain_affinity_pine = {
   preferred_temperature = 75,
   preferred_humidity = 700,
   preferred_fertility = 400,
   pickiness = 65,
}

wl.Descriptions():new_immovable_type{
   name = "pine_summer_sapling",
   descname = _"Pine (Sapling)",
   size = "small",
   terrain_affinity = terrain_affinity_pine,
   programs = {
      main = {
         "animate=idle duration:54s",
         "remove=chance:10.64%",
         "grow=pine_summer_pole",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "pine_sapling",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 5, 15 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "pine_summer_pole",
   descname = _"Pine (Pole)",
   size = "small",

   terrain_affinity = terrain_affinity_pine,
   programs = {
      main = {
         "animate=idle duration:71s",
         "remove=chance:6.37%",
         "grow=pine_summer_mature",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "pine_pole",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 12, 30 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "pine_summer_mature",
   descname = _"Pine (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity_pine,
   programs = {
      main = {
         "animate=idle duration:74s",
         "seed=pine_summer_sapling proximity:34%",
         "remove=chance:6.93%",
         "grow=pine_summer_old",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "pine_mature",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 18, 53 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "pine_summer_old",
   descname = _"Pine (Old)",
   species = _"Pine",
   icon = dirname .. "pine_menu.png",
   size = "small",

   terrain_affinity = terrain_affinity_pine,
   programs = {
      main = {
         "animate=idle duration:31m57s",
         "transform=deadtree4 chance:9.22%",
         "seed=pine_summer_sapling proximity:30%",
      },
      fall = {
         "remove=",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "pine_old",
         fps = 9,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 24, 67 },
         sound_effect = {
            path = "sound/animals/crickets1",
            priority = "10%"
         },
      }
   },
}

pop_textdomain()
