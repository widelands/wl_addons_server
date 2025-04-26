push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_smelting_works",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Smelting Works"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      granite = 4,
      planks = 1,
      spidercloth = 1
   },
   return_on_dismantle = {
      granite = 3
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 62, 76 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 62, 76 },
      }
   },

   aihints = {
      prohibited_till = 1080,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3
   },

   working_positions = {
      lutas_atlanteans_smelter = 1
   },

   inputs = {
      { name = "coal", amount = 8 },
      { name = "iron_ore", amount = 8 },
      { name = "gold_ore", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 3 * 64 = 192 sec
            "call=smelt_iron",
            "call=smelt_gold",
            "call=smelt_iron_2",
         }
      },
      -- 2 identical programs for iron to prevent unnecessary skipping penalty
      smelt_iron = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
         descname = _("smelting iron"),
         actions = {
            -- time: 25.4 + 35 + 3.6 = 64 sec
            "return=skipped unless economy needs iron",
            "sleep=duration:25s400ms",
            "consume=iron_ore coal",
            "playsound=sound/metal/fizzle priority:15% allow_multiple",
            "animate=working duration:35s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=iron"
         }
      },
      smelt_iron_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
         descname = _("smelting iron"),
         actions = {
            -- time: 25.4 + 35 + 3.6 = 64 sec
            "return=skipped unless economy needs iron",
            "sleep=duration:25s400ms",
            "consume=iron_ore coal",
            "playsound=sound/metal/fizzle priority:15% allow_multiple",
            "animate=working duration:35s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=iron"
         }
      },
      smelt_gold = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
         descname = _("smelting gold"),
         actions = {
            -- time: 25.4 + 35 + 3.6 = 64 sec
            "return=skipped unless economy needs gold",
            "sleep=duration:25s400ms",
            "consume=gold_ore coal",
            "playsound=sound/metal/fizzle priority:15% allow_multiple",
            "animate=working duration:35s",
            "playsound=sound/metal/goldping priority:60%",
            "produce=gold"
         }
      },
   },
}

pop_textdomain()
