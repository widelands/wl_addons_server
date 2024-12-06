push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
   name = "sumatran_hunter",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("sumatran_worker", "Hunter"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

--    buildcost = {
--      sumatran_carrier = 1,
--      spear = 1,
--      crocodile_jacket = 1
--    },

    experience = 30,
    becomes = "sumatran_hunter_chief",

   programs = {
      hunt = {
         "findobject=type:bob radius:12 attrib:eatable",
         "walk=object",
         "animate=idle duration:1s500ms",
         "removeobject",
         "createware=meat",
         "return"
      },
      fish = {
         "findspace=size:any radius:9 resource:resource_fish",
         "walk=coords",
         "playsound=sound/fisher/fisher_throw_net priority:50% allow_multiple",
         "mine=resource_fish radius:1",
         "animate=idle duration:1s",
         "playsound=sound/fisher/fisher_pull_net priority:50% allow_multiple",
         "createware=fish",
         "return"
      },
   },

   spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 10, 21 }
      },
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 9, 32 }
      },
      walkload = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 9, 32 }
      },
   },
}

pop_textdomain()

