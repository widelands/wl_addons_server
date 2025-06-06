push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_low_coalmine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Low Coal Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   enhancement = {
        name = "lutas_atlanteans_coalmine",
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
      prohibited_till = 960
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
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _("mining coal"),
         actions = {
            -- time total: 37.8 + 7 * (10 + 3.6) = 133 sec
            "return=skipped unless economy needs coal",
            "sleep=duration:37s800ms",
            "consume=smoked_fish,smoked_meat:2 atlanteans_bread:2",
            -- after having the food the miners are working 7 times
            -- each cycle lasts 10 seconds for mining and producing coal
            -- and 3.6 seconds to deliver the coal to the flag
            -- calling the subroutine "mine_produce" has the effect
            -- that even when depleted the mine has 7 working cycles
            -- as no call cycle is skipped due to a failed mine command
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
            "call=mine_produce",
         },
      },
      mine_produce = {
         descname = _("mining coal"),
         actions = {
            "animate=working duration:10s",
            "mine=resource_coal radius:3 yield:35% when_empty:5%",
            "produce=coal",
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=smoked_fish,smoked_meat:2 atlanteans_bread:2",
            "produce=coal:7",
         }
      },
   },

   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Coal"),
      heading = _("Main Coal Vein Exhausted"),
      message =
         pgettext("lutas_atlanteans_building", "This coal mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}

pop_textdomain()
