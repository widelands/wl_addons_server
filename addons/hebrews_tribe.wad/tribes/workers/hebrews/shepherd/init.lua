push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "hebrews_shepherd",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("hebrews_worker", "Shepherd"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      hebrews_carrier = 1,
      branch = 1,
   },

   programs = {
      release = {
         "findspace=size:any radius:3",
         "walk=coords",
         "animate=releasein duration:2s",
         "createbob=sheep",
         "animate=releaseout duration:2s",
         "return"
      },
      hunt = {
         "findobject=type:bob radius:13 attrib:kosher",
         "walk=object",
         "animate=idle duration:1s",
         "removeobject",
         "createware=sheep2",
         "return"
      },
      sheer = {
         "findobject=type:bob radius:13 attrib:kosher",
         "walk=object",
         "animate=idle duration:1s",
         "createware=wool",
         "return"
      }
   },

   animations = {
      idle = {
         hotspot = { 14, 22 }
      },
   },
   spritesheets = {
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 15, 22 }
      },
      releasein = {
         fps = 5,
         frames = 10,
         rows = 4,
         columns = 3,
         hotspot = { 15, 22 }
      },
      releaseout = {
         fps = 5,
         frames = 10,
         rows = 4,
         columns = 3,
         hotspot = { 15, 22 }
      }
   }
}

pop_textdomain()
