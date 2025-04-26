push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_mill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Mill"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 3,
      granite = 3,
      planks = 2
   },
   return_on_dismantle = {
      log = 1,
      granite = 2,
      planks = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 63, 68 },
      },
   },

   spritesheets = {
      working = {
         fps = 25,
         frames = 19,
         columns = 10,
         rows = 2,
         hotspot = { 63, 68 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 660
   },

   working_positions = {
      lutas_atlanteans_miller = 1
   },

   inputs = {
      { name = "corn", amount = 6 },
      { name = "blackroot", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 22 + 22 = 44 sec
            "call=produce_cornmeal",
            "call=produce_blackroot_flour",
         }
      },
      produce_cornmeal = {
         -- TRANSLATORS: Completed/Skipped/Did not start grinding corn because ...
         descname = _("grinding corn"),
         actions = {
            -- time: 3.4 + 15 + 3.6 = 22 sec
            "return=skipped when site has blackroot and economy needs blackroot_flour and not economy needs cornmeal",
            "return=skipped unless economy needs cornmeal",
            "sleep=duration:3s400ms",
            "consume=corn",
            "playsound=sound/mill/mill_turning priority:85% allow_multiple",
            "animate=working duration:15s",
            "produce=cornmeal"
         }
      },
      produce_blackroot_flour = {
         -- TRANSLATORS: Completed/Skipped/Did not start grinding blackroot because ...
         descname = _("grinding blackroot"),
         actions = {
            -- time: 3.4 + 15 + 3.6 = 22 sec
            -- No check whether we need blackroot_flour because blackroots cannot be used for anything else.
            "return=skipped when site has corn and economy needs cornmeal and not economy needs blackroot_flour",
            "sleep=duration:3s400ms",
            "consume=blackroot",
            "playsound=sound/mill/mill_turning priority:85% allow_multiple",
            "animate=working duration:15s",
            "produce=blackroot_flour"
         }
      },
   },
}

pop_textdomain()
