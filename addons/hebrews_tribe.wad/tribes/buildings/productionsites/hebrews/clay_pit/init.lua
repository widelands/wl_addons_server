push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_clay_pit",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("hebrews_building", "Clay Pit"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      granite = 3,
   },
   return_on_dismantle = {
      granite = 1
   },

   animations = {
      idle = {
         hotspot = { 48, 54 },
      },
      working = {
         hotspot = { 48, 54 },
      },
      unoccupied = {
         hotspot = { 48, 54 },
      },
   },

   aihints = {
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      basic_amount = 1,
   },

   working_positions = {
      hebrews_talmid = 1
   },

   inputs = {
      { name = "water", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start making clay because ...
         descname = _("making clay"),
         actions = {

            "return=skipped unless economy needs clay",
            -- Fish-producing aqua farms and charcoal burners houses can stop working if the clay pits do so
            "return=failed unless site has water",
            "callworker=dig",
            "consume=water",
            "sleep=duration:22s",
            "animate=working duration:17s",
            "sleep=duration:1s",
            "produce=clay"
         },
      },
   },
   out_of_resource_notification = {
      -- TRANSLATORS: Short for "No Level Ground" for clay pits
      title = _("No Ground"),
      heading = _("No Level Ground"),
      message = pgettext ("hebrews_building", "The clay digger working at this clay pit can't find any level ground in his work area. Consider dismantling this clay pit and rebuilding it somewhere else."),
      productivity_threshold = 33
   },
}

pop_textdomain()
