push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_leaves_gatherers_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Leaves Gatherer’s Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 3
   },
   return_on_dismantle = {
      log = 2
   },

   animation_directory = dirname,
   animations = {
--      unoccupied = {hotspot = { 56, 58 }},
      idle = {hotspot = { 56, 58 }}
   },

   aihints = {
      prohibited_till = 240,
      requires_supporters = true,
      basic_amount = 3,
      very_weak_ai_limit = 3,
      weak_ai_limit = 4,
      normal_ai_limit = 6,
      normal_ai_limit = 8,
   },

   working_positions = {
      sumatran_leaves_gatherer = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start gathering leaves because ...
         descname = _("gathering leaves"),
         actions = {
            "call=gather_palm",
            "call=gather_cassava",
            "call=gather_cassava",
         }
      },
      gather_palm = {
         -- TRANSLATORS: Completed/Skipped/Did not start gathering palm leaves because ...
         descname = _("gathering palm leaves"),
         actions = {
            "callworker=gather_palm",
            "sleep=duration:9s"
         }
      },
      gather_cassava = {
         -- TRANSLATORS: Completed/Skipped/Did not start gathering cassava leaves because ...
         descname = _("gathering cassava leaves"),
         actions = {
            "callworker=gather_cassava",
            "sleep=duration:9s"
         }
      },
   },
}

pop_textdomain()
