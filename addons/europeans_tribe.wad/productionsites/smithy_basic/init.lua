push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_smithy_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Smithy"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
      name = "europeans_smithy_level_1",
      enhancement_cost = {
         planks = 1,
         cloth = 1,
         brick = 1,
         grout = 1
      },
      enhancement_return_on_dismantle = {
         log = 1,
         granite = 1
      }
   },

   buildcost = {
      planks = 3,
      reed = 3,
      granite = 1
   },
   return_on_dismantle = {
      log = 3,
      granite = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 57, 76 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 57, 76 },
      },
      unoccupied = {
         pictures = path.list_files(dirname .. "unoccupied_??.png"),
         hotspot = { 57, 76 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 57, 76 },
         fps = 10
      },
   },

   aihints = {},

   working_positions = {
      europeans_smith_basic = 1
   },

   inputs = {
      { name = "planks", amount = 4 },
      { name = "coal", amount = 4 },
      { name = "iron", amount = 4 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_buckets",
            "call=produce_shovel",
            "call=produce_saw",
            "call=produce_hammer",
            "call=produce_pick",
            "call=produce_basket",
            "call=produce_felling_ax",
            "call=produce_fire_tongs",
            "call=produce_scythe",
            "call=produce_milking_tongs",
            "call=produce_needles",
            "call=produce_bread_paddle",
            "call=produce_hook_pole"
         }
      },
      produce_buckets = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
         descname = _"making a pair of buckets",
         actions = {
            "return=skipped unless economy needs buckets",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=buckets:2"
         }
      },
      produce_shovel = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
         descname = _"making a shovel",
         actions = {
            "return=skipped unless economy needs shovel",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=shovel:2"
         }
      },
      produce_saw = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
         descname = _"making a saw",
         actions = {
            "return=skipped unless economy needs saw",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=saw:2"
         }
      },
      produce_hammer = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
         descname = _"making a hammer",
         actions = {
            "return=skipped unless economy needs hammer",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=hammer:2"
         }
      },
      produce_pick = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
         descname = _"making a pick",
         actions = {
            "return=skipped unless economy needs pick",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=pick:2"
         }
      },
      produce_basket = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
         descname = _"making a basket",
         actions = {
            "return=skipped unless economy needs basket",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=basket:2"
         }
      },
      produce_felling_ax = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
         descname = _"making a felling ax",
         actions = {
            "return=skipped unless economy needs felling_ax",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=felling_ax:2"
         }
      },
      produce_fire_tongs = {
         -- TRANSLATORS: Completed/Skipped/Did not start making fire tongs because ...
         descname = _"making fire tongs",
         actions = {
            "return=skipped unless economy needs fire_tongs",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=fire_tongs:2"
         }
      },
      produce_scythe = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
         descname = _"making a scythe",
         actions = {
            "return=skipped unless economy needs scythe",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=scythe:2"
         }
      },
      produce_milking_tongs = {
         -- TRANSLATORS: Completed/Skipped/Did not start making milking tongs because ...
         descname = _"making milking tongs",
         actions = {
            "return=skipped unless economy needs milking_tongs",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=milking_tongs:2"
         }
      },
      produce_needles = {
         -- TRANSLATORS: Completed/Skipped/Did not start making milking tongs because ...
         descname = _"making needles",
         actions = {
            "return=skipped unless economy needs needles",
            "consume=iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=needles:2"
         }
      },
      produce_bread_paddle = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a bread paddle because ...
         descname = _"making a bread paddle",
         actions = {
            "return=skipped unless economy needs bread_paddle",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=bread_paddle:2"
         }
      },
      produce_hook_pole = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hook pole because ...
         descname = _"making a hook pole",
         actions = {
            "return=skipped unless economy needs hook_pole",
            "consume=planks coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:60s",
            "produce=hook_pole:2"
         }
      }
   },
}

pop_textdomain()
