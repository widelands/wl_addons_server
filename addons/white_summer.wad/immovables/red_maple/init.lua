push_textdomain("white_summer.wad")

dirname = path.dirname(__file__)

terrain_affinity_red_maple = {
   preferred_temperature = 120,
   preferred_humidity = 400,
   preferred_fertility = 400,
   pickiness = 73,
}

wl.Descriptions():new_immovable_type{
   name = "red_maple_summer_sapling",
   descname = _"Red Maple (Sapling)",
   size = "small",
   terrain_affinity = terrain_affinity_red_maple,
   programs = {
      main = {
         "animate=idle duration:64s",
         "remove=chance:10.64%",
         "grow=red_maple_summer_pole",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "red_maple_sapling",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 5, 15 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "red_maple_summer_pole",
   descname = _"Red Maple (Pole)",
   size = "small",

   terrain_affinity = terrain_affinity_red_maple,
   programs = {
      main = {
         "animate=idle duration:66s",
         "remove=chance:9.37%",
         "grow=red_maple_summer_mature",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "red_maple_pole",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 12, 30 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "red_maple_summer_mature",
   descname = _"Red Maple (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity_red_maple,
   programs = {
      main = {
         "animate=idle duration:69s",
         "seed=red_maple_summer_sapling proximity:34%",
         "remove=chance:8.93%",
         "grow=red_maple_summer_old",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "red_maple_mature",
         fps = 8,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 18, 53 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "red_maple_summer_old",
   descname = _"Red Maple (Old)",
   species = _"Red Maple",
   icon = dirname .. "red_maple_menu.png",
   size = "small",

   terrain_affinity = terrain_affinity_red_maple,
   programs = {
      main = {
         "animate=idle duration:31m57s",
         "transform=deadtree4 chance:9.22%",
         "seed=red_maple_summer_sapling proximity:30%",
      },
      fall = {
         "remove=",
      },
   },
   spritesheets = {
      idle = {
         directory = dirname,
         basename = "red_maple_old",
         fps = 9,
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 24, 55 },
         sound_effect = {
            path = "sound/animals/crickets1",
            priority = "10%"
         },
      }
   },
}

pop_textdomain()
