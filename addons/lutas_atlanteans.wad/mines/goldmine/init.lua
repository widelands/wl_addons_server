push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_goldmine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Gold Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   buildcost = {
      log = 7,
      planks = 4,
      spidercloth = 1
   },
   return_on_dismantle = {
      log = 3,
      planks = 2
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 53, 61 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 53, 61 },
      },
      empty = {
         hotspot = { 53, 61 },
      },
   },

   aihints = {
      prohibited_till = 1500
   },

   working_positions = {
      lutas_atlanteans_miner = 3
   },

   inputs = {
      { name = "smoked_fish", amount = 10 },
      { name = "smoked_meat", amount = 6 },
      { name = "atlanteans_bread", amount = 10 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining gold because ...
         descname = _("mining gold"),
         actions = {
            -- time total: 40.2 + 3 * (22 + 3.6) = 117 sec
            "return=skipped unless economy needs gold_ore",
            "sleep=duration:40s200ms",
            "consume=smoked_fish,smoked_meat:2 atlanteans_bread:2",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
         }
      },
      mine_produce = {
         descname = _("mining gold"),
         actions = {
            "animate=working duration:22s",
            "mine=resource_gold radius:4 yield:100% when_empty:5%",
            "produce=gold_ore",
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=smoked_fish,smoked_meat:2 atlanteans_bread:2",
            "produce=gold_ore:3",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Gold"),
      heading = _("Main Gold Vein Exhausted"),
      message =
         pgettext("lutas_atlanteans_building", "This gold mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider dismantling or destroying it."),
   },
}

pop_textdomain()
