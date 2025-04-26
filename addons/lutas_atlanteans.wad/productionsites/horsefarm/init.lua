push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_horsefarm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Horse Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 2,
      granite = 2,
      planks = 3
   },
   return_on_dismantle = {
      log = 1,
      granite = 2,
      planks = 2
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 83, 75 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 83, 75 },
      }
   },

   aihints = {
      prohibited_till = 960,
   },

   working_positions = {
      lutas_atlanteans_horsebreeder = 1
   },

   inputs = {
      { name = "water", amount = 8 },
      { name = "corn", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start breeding horses because ...
         descname = pgettext("lutas_atlanteans_building", "breeding horses"),
         actions = {
            "return=skipped unless economy needs lutas_atlanteans_horse",
            "sleep=duration:15s",
            "consume=corn water",
            "playsound=sound/farm/horse priority:50% allow_multiple",
            "animate=working duration:15s", -- Feeding cute little foals ;)
            "recruit=lutas_atlanteans_horse"
         }
      },
   },
}

pop_textdomain()
