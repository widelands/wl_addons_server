push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_smithy_level_1",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Smithy Level 1"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
        name = "europeans_smithy_level_2",
        enhancement_cost = {
          blackwood = 2,
          cloth = 1,
          quartz = 1
        },
        enhancement_return_on_dismantle = {
          blackwood = 1,
          planks = 1,
          quartz = 1
        },
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
      europeans_smith_basic = 2
   },

   inputs = {
      { name = "planks", amount = 6 },
      { name = "spidercloth", amount = 4 },
      { name = "coal", amount = 6 },
      { name = "iron", amount = 6 }
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
            "call=produce_felling_ax",
            "call=produce_fire_tongs",
            "call=produce_scythe",
            "call=produce_basket",
            "call=produce_milking_tongs",
            "call=produce_needles",
            "call=produce_fishing_rod",
            "call=produce_fishing_net",
            "call=produce_hunting_bow",
            "call=produce_hunting_spear",
            "call=produce_bread_paddle",
            "call=produce_hook_pole",
            "call=produce_idle",
            "return=skipped"
         }
      },
      produce_basket = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
         descname = _"making a basket",
         actions = {
            "return=skipped unless economy needs basket",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=basket:4"
         }
      },
      produce_bread_paddle = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a bread paddle because ...
         descname = _"making a bread paddle",
         actions = {
            "return=skipped unless economy needs bread_paddle",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=bread_paddle:4"
         }
      },
      produce_buckets = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
         descname = _"making a pair of buckets",
         actions = {
            "return=skipped unless economy needs buckets",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=buckets:4"
         }
      },
      produce_felling_ax = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
         descname = _"making a felling ax",
         actions = {
            "return=skipped unless economy needs felling_ax",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=felling_ax:4"
         }
      },
      produce_fire_tongs = {
         -- TRANSLATORS: Completed/Skipped/Did not start making fire tongs because ...
         descname = _"making fire tongs",
         actions = {
            "return=skipped unless economy needs fire_tongs",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=fire_tongs:4"
         }
      },
      produce_fishing_net = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a fishing net because ...
         descname = _"making a fishing net",
         actions = {
            "return=skipped unless economy needs fishing_net",
            "consume=spidercloth:4",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=fishing_net:4"
         }
      },
      produce_fishing_rod = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a fishing rod because ...
         descname = _"making a fishing rod",
         actions = {
            "return=skipped unless economy needs fishing_rod",
            "consume=planks:2 spidercloth:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=fishing_rod:4"
         }
      },
      produce_hammer = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
         descname = _"making a hammer",
         actions = {
            "return=skipped unless economy needs hammer",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=hammer:4"
         }
      },
      produce_hook_pole = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hook pole because ...
         descname = _"making a hook pole",
         actions = {
            "return=skipped unless economy needs hook_pole",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=hook_pole:4"
         }
      },
      produce_hunting_bow = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hunting bow because ...
         descname = _"making a hunting bow",
         actions = {
            "return=skipped unless economy needs hunting_bow",
            "consume=planks:2 spidercloth:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=hunting_bow:4"
         }
      },
      produce_hunting_spear = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hunting spear because ...
         descname = _"making a hunting spear",
         actions = {
            "return=skipped unless economy needs hunting_spear",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=hunting_spear:4"
         }
      },
      produce_milking_tongs = {
         -- TRANSLATORS: Completed/Skipped/Did not start making milking tongs because ...
         descname = _"making milking tongs",
         actions = {
            "return=skipped unless economy needs milking_tongs",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=milking_tongs:4"
         }
      },
      produce_needles = {
         -- TRANSLATORS: Completed/Skipped/Did not start making milking tongs because ...
         descname = _"making needles",
         actions = {
            "return=skipped unless economy needs needles",
            "consume=iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=needles:4"
         }
      },
      produce_pick = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
         descname = _"making a pick",
         actions = {
            "return=skipped unless economy needs pick",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=pick:4"
         }
      },
      produce_saw = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
         descname = _"making a saw",
         actions = {
            "return=skipped unless economy needs saw",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=saw:4"
         }
      },
      produce_scythe = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
         descname = _"making a scythe",
         actions = {
            "return=skipped unless economy needs scythe",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=scythe:4"
         }
      },
      produce_shovel = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
         descname = _"making a shovel",
         actions = {
            "return=skipped unless economy needs shovel",
            "consume=planks:2 coal:2 iron:2",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:75s",
            "produce=shovel:4"
         }
      },
      produce_idle = {
         -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
         descname = _"idle program",
         actions = {
            "return=skipped when economy needs buckets",
            "return=skipped when economy needs shovel",
            "return=skipped when economy needs saw",
            "return=skipped when economy needs hammer",
            "return=skipped when economy needs pick",
            "return=skipped when economy needs felling_ax",
            "return=skipped when economy needs fire_tongs",
            "return=skipped when economy needs scythe",
            "return=skipped when economy needs basket",
            "return=skipped when economy needs milking_tongs",
            "return=skipped when economy needs needles",
            "return=skipped when economy needs fishing_rod",
            "return=skipped when economy needs fishing_net",
            "return=skipped when economy needs hunting_bow",
            "return=skipped when economy needs hunting_spear",
            "return=skipped when economy needs bread_paddle",
            "return=skipped when economy needs hook_pole",
            "return=skipped when economy needs planks",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs iron",
            "sleep=duration:90s",
            "consume=planks:3 coal:3 iron:3",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:15s",
            "produce=basket",
            "sleep=duration:30s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:15s",
            "produce=buckets",
            "sleep=duration:30s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:15s",
            "produce=shovel",
            "sleep=duration:30s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:15s",
            "produce=saw",
            "sleep=duration:30s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:15s",
            "produce=hammer",
            "sleep=duration:30s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:15s",
            "produce=fire_tongs",
            "sleep=duration:30s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:15s",
            "produce=pick",
            "sleep=duration:30s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:15s",
            "produce=felling_ax",
            "sleep=duration:30s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:15s",
            "produce=scythe"
         }
      }
   },
}

pop_textdomain()
