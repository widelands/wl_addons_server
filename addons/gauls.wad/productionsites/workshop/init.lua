push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_workshop",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Workshop"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      granite = 2,
      planks = 2,
      brick = 1,
      reed = 2
   },
   return_on_dismantle = {
      granite = 2,
      planks = 1,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 60, 68 },
      },
   },

   spritesheets = {
      working = {
         fps = 25,
         frames = 19,
         columns = 10,
         rows = 2,
         hotspot = { 60, 68 },
      },
   },

   aihints = {
      prohibited_till = 180,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2,
      normal_ai_limit = 2,
   },

   working_positions = {
      gauls_craftsman = 1
   },

   inputs = {
      { name = "log", amount = 6 },
      { name = "planks", amount = 6 },
      { name = "iron", amount = 6 },
      { name = "reed", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 12 * 59 = 708 sec
            "call=produce_fire_tongs",
            "call=produce_felling_ax",
            "call=produce_buckets",
            "call=produce_basket",
            "call=produce_hammer",
            "call=produce_kitchen_tools",
            "call=produce_pick",
            "call=produce_scythe",
            "call=produce_shovel",
            "call=produce_fishing_net",
            "call=produce_flail",
            "call=produce_shield",
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
            "consume=iron log",
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
            "consume=log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=buckets"
         }
      },
      produce_basket = {
         -- TRANSLATORS: Completed/Skipped/Did not start making basket because ...
         descname = _("making basket"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs basket",
            "consume=reed:2",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=basket"
         }
      },
      produce_hammer = {
         -- TRANSLATORS: Completed/Skipped/Did not start making hammer because ...
         descname = _("making hammer"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs hammer",
            "consume=iron log",
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
            "consume=iron log",
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
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=pick"
         }
      },
      produce_scythe = {
         -- TRANSLATORS: Completed/Skipped/Did not start making scythe because ...
         descname = _("making scythe"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs scythe",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=scythe"
         }
      },
      produce_shovel = {
         -- TRANSLATORS: Completed/Skipped/Did not start making shovel because ...
         descname = _("making shovel"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs shovel",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=shovel"
         }
      },
      produce_fishing_net = {
         -- TRANSLATORS: Completed/Skipped/Did not start making fishing net because ...
         descname = _("making fishing net"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs fishing_net",
            "consume=reed:2",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=fishing_net"
         }
      },
      produce_flail = {
         -- TRANSLATORS: Completed/Skipped/Did not start making flail because ...
         descname = _("making flail"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs flail",
            "consume=log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=flail"
         }
      },
      produce_shield = {
         -- TRANSLATORS: Completed/Skipped/Did not start making wooden shield because ...
         descname = _("making wooden shield"),
         actions = {
            -- time: 55.4 + 3.6 = 59 sec
            "return=skipped unless economy needs shield_wooden",
            "consume=planks",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:55s400ms",
            "produce=shield_wooden"
         }
      },
   },
}

pop_textdomain()
