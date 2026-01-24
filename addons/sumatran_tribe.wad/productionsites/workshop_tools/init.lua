push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_workshop_tools",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Tools Workshop"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
      name = "sumatran_workshop_weapons",
      enhancement_cost = {
         log = 1,
         tropicalwood = 3,
         reed = 1
      },
      enhancement_return_on_dismantle = {
         tropicalwood = 2
      }
   },

   buildcost = {
      log = 1,
      granite = 3,
      palmleaves = 1,
      reed = 2
   },
   return_on_dismantle = {
      granite = 2,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 57, 76 },
      },
      unoccupied = {
         hotspot = { 57, 76 },
      },
   },
   spritesheets = {
      working = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 57, 64 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 57, 64 }
      }
   },

   aihints = {
      prohibited_till = 180,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 1,
   },

   working_positions = {
      sumatran_craftsman_experienced = 1
   },

   inputs = {
      { name = "sandedwood", amount = 5 },
      { name = "iron", amount = 5 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=produce_fire_tongs",
            "call=produce_felling_ax",
            "call=produce_buckets",
            "call=produce_hammer",
            "call=produce_kitchen_tools",
            "call=produce_pick",
            "call=produce_machete",
            "call=produce_shovel",
         }
      },
      produce_fire_tongs = {
         -- TRANSLATORS: Completed/Skipped/Did not start making fire tongs because ...
         descname = _("making fire tongs"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs fire_tongs",
            "consume=iron",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=fire_tongs"
         }
      },
      produce_felling_ax = {
         -- TRANSLATORS: Completed/Skipped/Did not start making felling ax because ...
         descname = _("making felling ax"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs felling_ax",
            "consume=iron sandedwood",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=felling_ax"
         }
      },
      produce_buckets = {
         -- TRANSLATORS: Completed/Skipped/Did not start making buckets because ...
         descname = _("making buckets"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs buckets",
            "consume=iron sandedwood",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=buckets"
         }
      },
      produce_hammer = {
         -- TRANSLATORS: Completed/Skipped/Did not start making hammer because ...
         descname = _("making hammer"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs hammer",
            "consume=iron sandedwood",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=hammer"
         }
      },
      produce_kitchen_tools = {
         -- TRANSLATORS: Completed/Skipped/Did not start making kitchen tools because ...
         descname = _("making kitchen tools"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs kitchen_tools",
            "consume=iron sandedwood",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=kitchen_tools"
         }
      },
      produce_pick = {
         -- TRANSLATORS: Completed/Skipped/Did not start making pick because ...
         descname = _("making pick"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs pick",
            "consume=iron sandedwood",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=pick"
         }
      },
      produce_machete = {
         -- TRANSLATORS: Completed/Skipped/Did not start making machete because ...
         descname = _("making machete"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs machete",
            "consume=iron sandedwood",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=machete"
         }
      },
      produce_shovel = {
         -- TRANSLATORS: Completed/Skipped/Did not start making shovel because ...
         descname = _("making shovel"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs shovel",
            "consume=iron sandedwood",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=shovel"
         }
      },
   },
}

pop_textdomain()
