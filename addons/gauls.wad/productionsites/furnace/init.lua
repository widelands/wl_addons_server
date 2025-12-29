push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_furnace",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Furnace"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      granite = 3,
      planks = 2,
      brick = 2,
      reed = 1,
   },
   return_on_dismantle = {
      granite = 2,
      planks = 1,
      brick = 1
   },

    animations = {
      unoccupied = {
         hotspot = {44, 58},
      },
      idle = {
         hotspot = { 44, 58 },
      },
      smelting_iron = {
         basename = "smelting_iron",
         hotspot = { 44, 58 },
      },
      smelting_gold = {
         basename = "smelting_gold",
         hotspot = { 44, 58 },
      },
      smelting_bronze = {
         basename = "smelting_bronze",
         hotspot = { 44, 58 },
      },
      smelting_copper = {
         basename = "smelting_copper",
         hotspot = { 44, 58 },
      },
    },

   aihints = {
      prohibited_till = 1140,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 4,
      normal_ai_limit = 5,
   },

   working_positions = {
      gauls_smelter = 1
   },

   inputs = {
      { name = "coal", amount = 8 },
      { name = "copper_ore", amount = 5 },
      { name = "iron_ore", amount = 5 },
      { name = "gold_ore", amount = 5 },
      { name = "tin_ore", amount = 5 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time: (6 + 2) * 23 + (3 + 2) * 28 = 184 + 140 = 324
            "call=smelt_iron",
            "call=smelt_bronze",
            "call=smelt_gold",
            "call=smelt_copper",
            "call=smelt_iron",
            "call=smelt_iron",
         },
      },
      smelt_iron = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
         descname = _("smelting iron"),
         actions = {
            -- time: 8.8 + 30 + 7.2 = 46 sec
            "return=skipped unless economy needs iron",
            "consume=coal:2 iron_ore:2",
            "playsound=sound/metal/furnace priority:50% allow_multiple",
            "animate=smelting_iron duration:30s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=iron:2",
            "sleep=duration:8s800ms",
         },
      },
      smelt_copper = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting copper because ...
         descname = _("smelting copper"),
         actions = {
            -- time: 8.8 + 30 + 7.2 = 46 sec
            "return=skipped unless economy needs copper",
            "consume=coal:2 copper_ore:2",
            "playsound=sound/metal/furnace priority:50% allow_multiple",
            "animate=smelting_copper duration:30s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=copper:2",
            "sleep=duration:8s800ms"
         },
      },
      smelt_bronze = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting bronze because ...
         descname = _("smelting bronze"),
         actions = {
            -- time: 13.2 + 60 + 10.8 = 84 sec
            "return=skipped unless economy needs bronze",
            "consume=coal:3 copper_ore:2 tin_ore",
            "playsound=sound/metal/furnace priority:50% allow_multiple",
            "animate=smelting_bronze duration:60s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=bronze:3",
            "sleep=duration:13s200ms"
         },
      },
      smelt_gold = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
         descname = _("smelting gold"),
         actions = {
            -- time: 13.8 + 35 + 7.2 = 56 sec
            "return=skipped unless economy needs gold",
            "consume=coal:2 gold_ore:2",
            "playsound=sound/metal/furnace priority:50% allow_multiple",
            "animate=smelting_gold duration:35s",
            "playsound=sound/metal/goldping priority:60%",
            "produce=gold:2",
            "sleep=duration:13s800ms"
         },
      },
   },
}

pop_textdomain()
