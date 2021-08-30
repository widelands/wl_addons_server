push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_well_advanced",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Advanced Well"),
   icon = dirname .. "menu.png",
   size = "small",

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 43, 43 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
         hotspot = { 43, 43 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_carrier = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=mining_water",
            "call=mining_water_basic",
            "return=skipped"
         }
      },
      mining_water_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining water because ...
         descname = _"mining water",
         actions = {
            "return=skipped when economy needs water",
            "sleep=duration:60s",
            "animate=working duration:10s",
            "mine=resource_water radius:4 yield:100% when_empty:99%",
            "produce=water"
         }
      },
      mining_water = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining water because ...
         descname = _"mining water",
         actions = {
            "return=skipped unless economy needs water",
            "sleep=duration:5s",
            "animate=working duration:10s",
            "mine=resource_water radius:4 yield:100% when_empty:99%",
            "produce=water"
         }
      },
   },
   
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Water",
      heading = _"Out of Water",
      message = pgettext("europeans_building", "The carrier working at this well can’t find any water in his well."),
      productivity_threshold = 1
   },
}

pop_textdomain()
