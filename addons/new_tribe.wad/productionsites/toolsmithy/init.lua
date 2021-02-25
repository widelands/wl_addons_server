push_textdomain("new_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "newtribe_toolsmithy",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("newtribe_building", "Toolsmithy"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      granite = 3,
      reed = 1
   },
   return_on_dismantle = {
      granite = 2,
      log = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 50, 53 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 50, 53 },
      }
   },

   aihints = {
   },

   working_positions = {
      newtribe_toolsmith = 1
   },

   inputs = {
      { name = "log", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a tool because ...
         descname = _"making a tool",
         actions = {
            "return=skipped unless economy needs tool",
            "consume=log:2",
            "sleep=duration:32s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=tool"
         }
      },
   },
}

pop_textdomain()
