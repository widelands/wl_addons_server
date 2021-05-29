push_textdomain("tropics.wad", true)

dirname = path.dirname(__file__)

terrain_affinity = {
   preferred_temperature = 175,
   preferred_humidity = 869,
   preferred_fertility = 219,
   pickiness = 67,
}

wl.Descriptions():new_immovable_type{
   name = "lapacho_tropic_sapling",
   descname = _"Lapacho (Sapling)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:59s",
         "remove=chance:12.71%",
         "grow=lapacho_tropic_pole",
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
   name = "lapacho_tropic_pole",
   descname = _"Lapacho (Pole)",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:62s",
         "remove=chance:10.97%",
         "grow=lapacho_tropic_mature",
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
   name = "lapacho_tropic_mature",
   descname = _"Lapacho (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:56s",
         "seed=lapacho_tropic_sapling proximity:66%",
         "remove=chance:9.48%",
         "animate=idle duration:8s",
         "grow=lapacho_tropic_old",
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
   name = "lapacho_tropic_old",
   descname = _"Lapacho (Old)",
   species = _"Lapacho",
   icon = dirname .. "menu.png",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:32m32s",
         "transform=deadtree2 chance:11.52%",
         "seed=lapacho_tropic_sapling proximity:26%",
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
            path = "sound/animals/bird6",
            priority = "9%"
         },
      }
   },
}

pop_textdomain()
