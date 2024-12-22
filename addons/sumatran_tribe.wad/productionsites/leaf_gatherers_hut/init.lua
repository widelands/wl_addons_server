push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_leaf_gatherers_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Leaf Gatherer’s Hut"),
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
      basic_amount = 5,
      very_weak_ai_limit = 5,
      weak_ai_limit = 8,
      normal_ai_limit = 12,
   },

   working_positions = {
      sumatran_leaf_gatherer = 1
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
            "return=skipped unless economy needs palmleaves",
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
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Leaves"),
      heading = _("Out of Leaves"),
      message = pgettext("sumatran_building", "The leaf gatherer working at this hut can’t find any leaves in her work area. You should consider dismantling or destroying the building or building a palm planter’s hut or cassava fields nearby."),
      productivity_threshold = 40
   },
}

pop_textdomain()
