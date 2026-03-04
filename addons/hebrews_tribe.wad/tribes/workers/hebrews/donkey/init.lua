push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_carrier_type {
   name = "hebrews_donkey",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("hebrews_worker", "Donkey"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   ware_hotspot =  { -2, 8 },

   programs = {
      cut_granite = {
         "findobject=attrib:rocks radius:6",
         "walk=object",
         "playsound=sound/stonecutting/stonecutter priority:50% allow_multiple",
         "animate=idle duration:17s500ms",
         "callobject=shrink",
         "createware=granite",
         "return"
      },
      trade_wood = {
         "findspace=size:swim radius:6",
         "walk=coords",
         "animate=idle duration:20s",
         "createware=log",
         "return"
      }
   },

   spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 14, 20 }
      },
      walk = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         directional = true,
         hotspot = { 14, 25 }
      },
      walkload = {
         -- TODO(hessenfarmer): Make animation
         basename = "walk",
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         directional = true,
         hotspot = { 14, 25 }
      },
   },
}

pop_textdomain()
