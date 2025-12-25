push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_druids_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Druid’s House"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      granite = 2,
      planks = 1,
      brick = 3,
      reed = 1,
      cloth = 1,
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1,
      brick = 1
   },

   animation_directory = dirname,
   animations = {
      unoccupied = {hotspot = { 60, 59 }},
      idle = {hotspot = { 60, 59 }},
      working_potion = { hotspot = { 60, 59 }},
      working_elixir = { hotspot = { 60, 59 }},
   },

   aihints = {
      prohibited_till = 1020,
      requires_supporters = true,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
      normal_ai_limit = 4,
   },

   working_positions = {
      gauls_druid = 1,
   },

   inputs = {
      { name = "herbs", amount = 8 },
      { name = "water", amount = 8 },
      { name = "vegetable", amount = 6 },
      { name = "fruit", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=prepare_elixir",
            "call=prepare_potion"
         },
      },
      prepare_elixir = {
         -- TRANSLATORS: Completed/Skipped/Did not start cooking an elixir because ...
         descname = _("cooking an elixir"),
         actions = {
            -- average time total: 30.5 + 27.9 + 3.6 + 10 = 72 sec
            "return=skipped unless economy needs elixir",
            "return=failed unless site has water",
            "return=failed unless site has herbs",
            "return=failed unless site has fruit",
            "callworker=gather_fruit",
            "consume=water herbs fruit",
            "animate=working_elixir duration:27s900ms",
            "produce=elixir",
            "sleep=duration:10s"
         },
      },
      prepare_potion = {
         -- TRANSLATORS: Completed/Skipped/Did not start cooking a potion because ...
         descname = _("cooking a potion"),
         actions = {
            -- average time total: 30.5 + 27.9 + 3.6 + 10 = 72 sec
            "return=skipped unless economy needs potion",
            "return=failed unless site has water",
            "return=failed unless site has herbs",
            "return=failed unless site has vegetable",
            "callworker=walk_to_tree",
            "consume=water herbs vegetable",
            "animate=working_potion duration:27s900ms",
            "produce=potion",
            "sleep=duration:10s"
         },
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Trees"),
      heading = _("Out of Trees or Fruit"),
      message = pgettext("gauls_building", "The druid working at this house isn’t poaching any drinks. You should consider dismantling or destroying the building or building a forester’s hut or an orchard nearby."),
      productivity_threshold = 25
   },
}

pop_textdomain()
