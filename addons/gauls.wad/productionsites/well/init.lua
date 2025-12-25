push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_well",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Well"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 1,
      granite = 2,
      planks = 1,
   },
   return_on_dismantle = {
      granite = 1,
      log = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 19, 33 },
      },
   },

   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 19, 33 }
      },
      working = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 19, 33 }
      },
   },

   aihints = {
      basic_amount = 1
   },

   working_positions = {
      gauls_water_carrier = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 11.4 + 15 + 3.6 = 30 sec
            -- average time if water resource is depleted:
            --   (65 * (30) + 35 * (26.4 + 10)) / 65 = 49.6 sec
            "sleep=duration:11s400ms",
            "animate=working duration:15s",
            "mine=resource_water radius:1 yield:100% when_empty:65%",
            "produce=water",
         }
      },
   },

   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Water"),
      heading = _("Out of Water"),
      message = pgettext("gauls_building", "The carrier working at this well can’t find any water in his well."),
      productivity_threshold = 33
   },
}

pop_textdomain()
