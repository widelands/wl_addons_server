push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_weaving_mill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Weaving Mill"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 3,
      granite = 4,
      planks = 2
   },
   return_on_dismantle = {
      log = 1,
      granite = 3,
      planks = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 66, 71 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 66, 71 },
      }
   },

   aihints = {
      prohibited_till = 480,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      lutas_atlanteans_weaver = 1
   },

   inputs = {
      { name = "spider_silk", amount = 8 },
      { name = "gold_thread", amount = 4 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 3 * 44 = 132 sec
            "call=produce_spidercloth",
            "call=produce_tabard",
            "call=produce_tabard_golden",
         }
      },
      produce_spidercloth = {
         -- TRANSLATORS: Completed/Skipped/Did not start weaving spidercloth because ...
         descname = _("weaving spidercloth"),
         actions = {
            -- time: 20.4 + 20 + 3.6 = 44 sec
            "return=skipped unless economy needs spidercloth",
            "consume=spider_silk",
            "sleep=duration:20s400ms",
            "playsound=sound/mill/weaving priority:90%",
            "animate=working duration:20s",
            "produce=spidercloth"
         }
      },
      produce_tabard = {
         -- TRANSLATORS: Completed/Skipped/Did not start tailoring a tabard because ...
         descname = _("tailoring a tabard"),
         actions = {
            -- time: 20.4 + 20 + 3.6 = 44 sec
            "return=skipped unless economy needs tabard",
            "sleep=duration:20s400ms",
            "consume=spider_silk",
            "playsound=sound/mill/weaving priority:90%",
            "animate=working duration:20s",
            "produce=tabard"
         }
      },
      produce_tabard_golden = {
         -- TRANSLATORS: Completed/Skipped/Did not start tailoring a golden tabard because ...
         descname = _("tailoring a golden tabard"),
         actions = {
            -- time: 20.4 + 20 + 3.6 = 44 sec
            "return=skipped unless economy needs tabard_golden",
            "sleep=duration:20s400ms",
            "consume=spider_silk gold_thread:2", -- one gold more to balance double trident
            "playsound=sound/mill/weaving priority:90%",
            "animate=working duration:20s",
            "produce=tabard_golden"
         }
      },
   },
}

pop_textdomain()
