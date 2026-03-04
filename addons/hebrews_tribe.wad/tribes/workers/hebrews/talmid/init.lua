push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "hebrews_talmid",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("hebrews_worker", "Talmid"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   programs = {
      dig = {
         "findspace=size:any radius:4",
         "walk=coords",
         "animate=idle duration:8s",
         "plant=attrib:pond_dry",
         "return"
      },
      plant = {
         "findspace=size:any radius:1",
         "walk=coords",
         "animate=idle duration:5s",
         "plant=attrib:seed_grapes",
         "animate=idle duration:5s",
         "return"
      },
      harvest = {
         "findobject=attrib:ripe_grapes radius:1",
         "walk=object",
         "animate=idle duration:8s",
         "callobject=harvest",
         "animate=idle duration:2s",
         "createware=grape",
         "return"
      },
      plant_olives = {
         "findspace=size:any radius:4",
         "walk=coords",
         "animate=idle duration:5s",
         "plant=attrib:seed_olives",
         "animate=idle duration:5s",
         "return"
      },
      harvest_olives = {
         "findobject=attrib:ripe_olives radius:4",
         "walk=object",
         "animate=idle duration:8s",
         "callobject=harvest",
         "animate=idle duration:2s",
         "createware=olives",
         "return"
      },
      clear = {
         "findobject=attrib:tree radius:6",
         "walk=object",
         "playsound=sound/woodcutting/woodcutting priority:100% allow_multiple",
         "animate=idle duration:15s",
         "playsound=sound/woodcutting/tree_falling priority:100%",
         "callobject=fall",
         "animate=idle duration:2s",
         "createware=log",
         "return"
      }
   },

   animations = {
      idle = {
         hotspot = { 6, 23 }
      },
   },

   spritesheets = {
      walk = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         directional = true,
         hotspot = { 9, 23 }
      },
      walkload = {
         basename = "walk",
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         directional = true,
         hotspot = { 9, 23 }
      },
   },
}

pop_textdomain()
