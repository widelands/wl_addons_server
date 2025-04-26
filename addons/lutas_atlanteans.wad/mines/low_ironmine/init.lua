push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_low_ironmine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Low Iron Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   enhancement = {
        name = "lutas_atlanteans_ironmine",
        enhancement_cost = {
            log = 3,
            planks = 3
        },
        enhancement_return_on_dismantle = {
            log = 1,
            planks = 1
        },
   },

   buildcost = {
      log = 5,
      planks = 2,
      spidercloth = 1
   },
   return_on_dismantle = {
      log = 2,
      planks = 2
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 53, 61 },
      },
      working = {
         basename = "idle", 
         hotspot = { 53, 61 },
      },
      empty = {
         hotspot = { 53, 61 },
      },
   },

   aihints = {
      prohibited_till = 1020
   },

   working_positions = {
      lutas_atlanteans_miner = 2
   },

   inputs = {
      { name = "smoked_fish", amount = 4 },
      { name = "smoked_meat", amount = 4 },
      { name = "atlanteans_bread", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining iron because ...
         descname = _("mining iron"),
         actions = {
            -- time total: 37 + 5 * (14 + 3.6) = 125 sec
            "return=skipped unless economy needs iron_ore",
            "sleep=duration:37s",
            "consume=smoked_fish,smoked_meat:2 atlanteans_bread:2",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
         },
      },
      mine_produce = {
         descname = _("mining iron"),
         actions = {
            "animate=working duration:14s",
            "mine=resource_iron radius:3 yield:35% when_empty:5%",
            "produce=iron_ore",
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=smoked_fish,smoked_meat:2 atlanteans_bread:2",
            "produce=iron_ore:5",
         }
      },
   },

   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Iron"),
      heading = _("Main Iron Vein Exhausted"),
      message =
         pgettext("lutas_atlanteans_building", "This iron mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}

pop_textdomain()
