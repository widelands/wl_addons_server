push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_toolsmithy",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Toolsmithy"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      granite = 2,
      planks = 2,
      spidercloth = 1
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 56, 61 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 56, 61 },
      }
   },

   aihints = {
      prohibited_till = 180,
      forced_after = 600,
      basic_amount = 1,
   },

   working_positions = {
      lutas_atlanteans_toolsmith = 1
   },

   inputs = {
      { name = "log", amount = 6 },
      { name = "spider_silk", amount = 4 },
      { name = "iron", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 12 * 71 = 852 sec
            "call=produce_fire_tongs",
            "call=produce_hunting_bow",
            "call=produce_pick",
            "call=produce_hammer",
            "call=produce_saw",
            "call=produce_shovel",
            "call=produce_scythe",
            "call=produce_bread_paddle",
            "call=produce_hook_pole",
            "call=produce_buckets",
            "call=produce_spider_tongs",
            "call=produce_fishing_net",
         }
      },
      produce_bread_paddle = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a bread paddle because ...
         descname = _("making a bread paddle"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs bread_paddle",
            "sleep=duration:32s400ms",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=bread_paddle"
         }
      },
      produce_buckets = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
         descname = _("making a pair of buckets"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs buckets",
            "sleep=duration:32s400ms",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=buckets"
         }
      },
      produce_fire_tongs = {
         -- TRANSLATORS: Completed/Skipped/Did not start making fire tongs because ...
         descname = _("making fire tongs"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs fire_tongs",
            "sleep=duration:32s400ms",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=fire_tongs"
         }
      },
      produce_fishing_net = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a fishing net because ...
         descname = _("making a fishing net"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs fishing_net",
            "sleep=duration:32s400ms",
            "consume=spider_silk:2",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=fishing_net"
         }
      },
      produce_hammer = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
         descname = _("making a hammer"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs hammer",
            "sleep=duration:32s400ms",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=hammer"
         }
      },
      produce_hook_pole = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hook pole because ...
         descname = _("making a hook pole"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs hook_pole",
            "sleep=duration:32s400ms",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=hook_pole"
         }
      },
      produce_hunting_bow = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hunting bow because ...
         descname = _("making a hunting bow"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs hunting_bow",
            "sleep=duration:32s400ms",
            "consume=log spider_silk",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=hunting_bow"
         }
      },
      produce_spider_tongs = {
         -- TRANSLATORS: Completed/Skipped/Did not start making spider tongs because ...
         descname = _("making spider tongs"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs spider_tongs",
            "sleep=duration:32s400ms",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=spider_tongs"
         }
      },
      produce_pick = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
         descname = _("making a pick"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs pick",
            "sleep=duration:32s400ms",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=pick"
         }
      },
      produce_saw = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
         descname = _("making a saw"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs saw",
            "sleep=duration:32s400ms",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=saw"
         }
      },
      produce_scythe = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
         descname = _("making a scythe"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs scythe",
            "sleep=duration:32s400ms",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=scythe"
         }
      },
      produce_shovel = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
         descname = _("making a shovel"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs shovel",
            "sleep=duration:32s400ms",
            "consume=iron log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s",
            "produce=shovel"
         }
      },
   },
}

pop_textdomain()
