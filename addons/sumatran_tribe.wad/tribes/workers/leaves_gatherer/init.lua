push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "sumatran_leaves_gatherer",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("sumatran_worker", "Leaves Gatherer"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      sumatrans_carrier = 1,
      machete = 1,
   },

   programs = {
      gather_cassava = {
         "findobject=attrib:cassava_leaves radius:10",
         "walk=object",
         "animate=gathering duration:6s",
         "callobject=harvest",
         "animate=gathering duration:1s",
         "createware=cassavaleaves",
         "return"
      },
      gather_palm = {
         "findobject=attrib:leaves radius:10",
         "walk=object",
         "animate=gathering duration:6s",
         "callobject=harvest",
         "animate=gathering duration:1s",
         "createware=palmleaves",
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
