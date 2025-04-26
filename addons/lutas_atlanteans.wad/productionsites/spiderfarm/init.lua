push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_spiderfarm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Spider Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 2,
      granite = 2,
      planks = 2
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 86, 78 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 86, 78 },
      }
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 360
   },

   working_positions = {
      lutas_atlanteans_spiderbreeder = 1
   },

   inputs = {
      { name = "water", amount = 7 },
      { name = "corn", amount = 7 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "return=skipped unless economy needs spider_silk",
            "sleep=duration:25s",
            "consume=corn water",
            "animate=working duration:30s",
            "produce=spider_silk"
         }
      },
   },
}

pop_textdomain()
