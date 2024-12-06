push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_furnace",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Furnace"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      stone = 3,
      tropicalwood = 2,
      reed = 2,
      cloth = 2,
      diamond =1
   },
   return_on_dismantle = {
      stone = 2,
      tropicalwood = 1,
      cloth = 1,
      diamond =1
   },

   spritesheets = {
      idle = {
         hotspot = {50, 69},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      },
      working_iron = {
         hotspot = {50, 69},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      },
      working_gold = {
         hotspot = {50, 69},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      }
   },
   animations = {
      unoccupied = {
         hotspot = {50, 58}
      }
   },

   aihints = {
      prohibited_till = 780,
      basic_amount = 2,
      very_weak_ai_limit = 3,
      weak_ai_limit = 4,
      normal_ai_limit = 6,
   },

   working_positions = {
      sumatran_smelter = 1
   },

   inputs = {
      { name = "coal", amount = 8 },
      { name = "copper_ore", amount = 5 },
      { name = "iron_ore", amount = 5 },
      { name = "gold_ore", amount = 5 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=smelt_copper",
            "call=smelt_gold",
            "call=smelt_copper",
            "call=smelt_iron"
         },
      },
      smelt_iron = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
         descname = _("smelting iron"),
         actions = {
            -- time: 11.4 + 20 + 3.6 = 35 sec
            "return=skipped unless economy needs iron",
            "consume=coal iron_ore",
            "playsound=sound/metal/furnace priority:50% allow_multiple",
            "animate=working_iron duration:20s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=iron",
            "sleep=duration:11s400ms",
         },
      },
      smelt_copper = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting copper because ...
         descname = _("smelting copper"),
         actions = {
            -- time: 11.4 + 15 + 3.6 = 30 sec
            "return=skipped unless economy needs copper",
            "consume=coal copper_ore",
            "playsound=sound/metal/furnace priority:50% allow_multiple",
            "animate=working_iron duration:15s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=copper",
            "sleep=duration:11s400ms"
         },
      },
      smelt_gold = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
         descname = _("smelting gold"),
         actions = {
            -- time: 11.4 + 25 + 3.6 = 40 sec
            "return=skipped unless economy needs gold",
            "consume=coal gold_ore",
            "playsound=sound/metal/furnace priority:50% allow_multiple",
            "animate=working_gold duration:25s",
            "playsound=sound/metal/goldping priority:60%",
            "produce=gold",
            "sleep=duration:11s400ms"
         },
      },
   },
}

pop_textdomain()
