push_textdomain("white_summer.wad")

dirname = path.dirname(__file__)

terrain_affinity_linden = {
   preferred_temperature = 105,
   preferred_humidity = 700,
   preferred_fertility = 550,
   pickiness = 75,
}

wl.Descriptions():new_immovable_type{
   name = "linden_summer_sapling",
   descname = _"Linden (Sapling)",
   size = "small",
   terrain_affinity = terrain_affinity_linden,
   programs = {
      main = {
         "animate=idle duration:64s",
         "remove=chance:10.64%",
         "grow=linden_summer_pole",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "linden_sapling",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 5, 15 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "linden_summer_pole",
   descname = _"Linden (Pole)",
   size = "small",

   terrain_affinity = terrain_affinity_linden,
   programs = {
      main = {
         "animate=idle duration:66s",
         "remove=chance:9.37%",
         "grow=linden_summer_mature",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "linden_pole",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 12, 30 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "linden_summer_mature",
   descname = _"Linden (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity_linden,
   programs = {
      main = {
         "animate=idle duration:69s",
         "seed=linden_summer_sapling proximity:34%",
         "remove=chance:8.93%",
         "grow=linden_summer_old",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "linden_mature",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 18, 53 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "linden_summer_old",
   descname = _"Linden (Old)",
   species = _"Linden",
   icon = dirname .. "linden_menu.png",
   size = "small",

   terrain_affinity = terrain_affinity_linden,
   programs = {
      main = {
         "animate=idle duration:31m57s",
         "transform=deadtree4 chance:9.22%",
         "seed=linden_summer_sapling proximity:30%",
      },
      fall = {
         "remove=",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "linden_old",
         fps = 9,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 24, 67 },
         sound_effect = {
            path = "sound/animals/crickets1",
            priority = "14%"
         },
      }
   },
}

pop_textdomain()
