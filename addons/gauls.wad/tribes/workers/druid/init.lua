push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "gauls_druid",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("gauls_worker", "Druid"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

    buildcost = {
      gauls_carrier = 1,
      tunic = 1
    },

    programs = {
      check_tree = {
         "findobject=attrib:tree radius:8"
      },
      walk_to_tree = {
         -- time: 7.2 - 39.6 sec, average 24.5 sec + 6 sec
         "findobject=attrib:tree radius:8",
         "walk=object",
         "animate=harvest duration:5s",
         "animate=idle duration:1s",
         "return"
      },
      gather_fruit = {
         -- time: 7.2 - 39.6 sec, average 24.5 sec + 6 sec
         "findobject=attrib:ripe_bush radius:8",
         "walk=object",
         "animate=harvest duration:5s",
         "callobject=harvest",
         "animate=idle duration:1s",
         "return"
      }
   },

  animations = {
      idle = {
         hotspot = { 6, 21 },
      },
      harvest = {
         basename = "idle",
         hotspot = { 6, 21 },
      }
   },
   spritesheets = {
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 10, 23 }
      }
   }
}

pop_textdomain()
