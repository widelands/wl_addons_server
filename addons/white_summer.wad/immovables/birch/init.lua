push_textdomain("white_summer.wad")

dirname = path.dirname(__file__)

terrain_affinity_birch = {
   preferred_temperature = 80,
   preferred_humidity = 650,
   preferred_fertility = 600,
   pickiness = 55,
}

wl.Descriptions():new_immovable_type{
   name = "birch_summer_sapling",
   descname = _"Birch (Sapling)",
   size = "small",
   terrain_affinity = terrain_affinity_birch,
   programs = {
      main = {
         "animate=idle duration:45s",
         "remove=chance:12%",
         "grow=birch_summer_pole",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "birch_sapling",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 5, 12 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "birch_summer_pole",
   descname = _"Birch (Pole)",
   size = "small",

   terrain_affinity = terrain_affinity_birch,
   programs = {
      main = {
         "animate=idle duration:45s",
         "remove=chance:9%",
         "grow=birch_summer_mature",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "birch_pole",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 12, 28 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "birch_summer_mature",
   descname = _"Birch (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity_birch,
   programs = {
      main = {
         "animate=idle duration:55s",
         "seed=birch_summer_sapling proximity:78%",
         "remove=chance:7%",
         "grow=birch_summer_old",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "birch_mature",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 18, 48 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "birch_summer_old",
   descname = _"Birch (Old)",
   species = _"Birch",
   icon = dirname .. "birch_menu.png",
   size = "small",

   terrain_affinity = terrain_affinity_birch,
   programs = {
      main = {
         "animate=idle duration:18m57s",
         "transform=deadtree2 chance:10.22%",
         "seed=birch_summer_sapling proximity:25%",
      },
      fall = {
         "remove=",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "birch_old",
         fps = 7,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 23, 59 },
         sound_effect = {
            path = "sound/animals/bird4",
            priority = "10%"
         },
      }
   },
}

pop_textdomain()
