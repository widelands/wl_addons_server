push_textdomain("tropics.wad", true)

dirname = path.dirname(__file__)

terrain_affinity = {
   preferred_temperature = 175,
   preferred_humidity = 875,
   preferred_fertility = 241,
   pickiness = 85,
}

wl.Descriptions():new_immovable_type{
   name = "corymbia_tropic_sapling",
   descname = _"Corymbia (Sapling)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:64s",
         "remove=chance:10.64%",
         "grow=corymbia_tropic_pole",
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
   name = "corymbia_tropic_pole",
   descname = _"Corymbia (Pole)",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:66s",
         "remove=chance:9.37%",
         "grow=corymbia_tropic_mature",
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
         hotspot = { 12, 30 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "corymbia_tropic_mature",
   descname = _"Corymbia (Mature)",
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:69s",
         "seed=corymbia_tropic_sapling proximity:34%",
         "remove=chance:8.93%",
         "grow=corymbia_tropic_old",
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
         hotspot = { 18, 53 }
      }
   },
}

wl.Descriptions():new_immovable_type{
   name = "corymbia_tropic_old",
   descname = _"Corymbia (Old)",
   species = _"Corymbia",
   icon = dirname .. "menu.png",
   size = "small",

   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:31m57s",
         "transform=deadtree4 chance:9.22%",
         "seed=corymbia_tropic_sapling proximity:30%",
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
         hotspot = { 24, 67 },
         sound_effect = {
            path = "sound/animals/crickets1",
            priority = "14%"
         },
      }
   },
}

pop_textdomain()
