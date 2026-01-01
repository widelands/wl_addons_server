push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "gauls_gardener_experienced",
   -- TRANSLATORS: This is a worker name used in lists of workers, please use a female form
   descname = pgettext("gauls_worker", "Experienced Gardener"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,


   programs = {
        check_space = {
            "findspace=size:any radius:6 avoid:field saplingsearches:8"
        },
        plant_tree = {
         -- steps from building to rock: 2-9, average 5.5
         -- min. worker time: 2 * 2 * 1.8 + 12 = 19.2 sec
         -- max. worker time: 2 * 9 * 1.8 + 12 = 44.4 sec
         -- avg. worker time: 2 * 5.5 * 1.8 + 12 = 31.8 sec
            "findspace=size:any radius:6 avoid:field saplingsearches:8",
            "walk=coords",
            "animate=dig duration:10s",
            "plant=attrib:fruit_tree_sapling",
            "animate=gathering duration:2s",
            "return"
        },
        plant_juniper = {
         -- steps from building to rock: 2-9, average 5.5
         -- min. worker time: 2 * 2 * 1.8 + 12 = 19.2 sec
         -- max. worker time: 2 * 9 * 1.8 + 12 = 44.4 sec
         -- avg. worker time: 2 * 5.5 * 1.8 + 12 = 31.8 sec
            "findspace=size:any radius:6 avoid:field saplingsearches:8",
            "walk=coords",
            "animate=dig duration:10s",
            "plant=attrib:seed_juniper",
            "animate=gathering duration:2s",
            "return"
        },
        plant_herbs = {
         -- steps from building: 2-5, average 11.2
         -- avg. worker time: 11.2 + 8 = 19.2 sec
         "findspace=size:any radius:2 space",
         "walk=coords",
         "animate=dig duration:5s",
         "plant=attrib:seed_herbs",
         "animate=gathering duration:3s",
         "return"
      },
      plant_vegetable = {
         -- steps from building: 2-5, average 11.2
         -- avg. worker time: 11.2 + 8 = 19.2 sec
         "findspace=size:any radius:2 space",
         "walk=coords",
         "animate=dig duration:5s",
         "plant=attrib:seed_vegetable",
         "animate=gathering duration:3s",
         "return"
      },
      gather_fruit = {
         -- steps from building to rock: 2-9, average 5.5
         -- min. worker time: 2 * 2 * 1.8 + 6 = 13.2 sec
         -- max. worker time: 2 * 9 * 1.8 + 6 = 38.4 sec
         -- avg. worker time: 2 * 5.5 * 1.8 + 6 = 25.8 sec
         "findobject=attrib:ripe_bush radius:6",
         "walk=object",
         "animate=gathering duration:5s",
         "callobject=harvest",
         "animate=gathering duration:1s",
         "createware=fruit",
         "return"
      },
      harvest_herbs = {
         -- steps from building: 2-5, average 11.2
         -- avg. worker time: 11.2 + 6 = 17.2 sec
         "findobject=attrib:ripe_herbs radius:2",
         "walk=object",
         "animate=gathering duration:5s",
         "callobject=harvest",
         "animate=gathering duration:1s",
         "createware=herbs",
         "return"
      },
      harvest_vegetable = {
         -- steps from building: 2-5, average 11.2
         -- avg. worker time: 11.2 + 6 = 17.2 sec
         "findobject=attrib:ripe_vegetable radius:2",
         "walk=object",
         "animate=gathering duration:5s",
         "callobject=harvest",
         "animate=gathering duration:1s",
         "createware=vegetable",
         "return"
      }
   },

   animation_directory = dirname,
   ware_hotspot = {0, 29},
   spritesheets = {
      walk = {
         directional = true,
         hotspot = {17, 28},
         fps = 15,
         frames = 30,
         columns = 6,
         rows = 5
      },
      walkload = {
         directional = true,
         hotspot = {17, 31},
         fps = 15,
         frames = 30,
         columns = 6,
         rows = 5
      },
      idle = {
         basename = "walk_se",
         hotspot = {17, 28},
         fps = 15,
         frames = 30,
         columns = 6,
         rows = 5
      },
      dig = {
         basename = "gathering",
         hotspot = {11, 18},
         fps = 15,
         frames = 15,
         columns = 5,
         rows = 3
      },
      gathering = {
         hotspot = {11, 18},
         fps = 15,
         frames = 15,
         columns = 5,
         rows = 3
      }
   },
}

pop_textdomain()
