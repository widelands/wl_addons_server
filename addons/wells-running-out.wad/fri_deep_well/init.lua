dirname = path.dirname(__file__)
push_textdomain("wells-running-out.wad", true)

wl.Descriptions():new_productionsite_type {
   name = "frisians_well_deep",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("frisians_building", "Deep Well"),
   icon = dirname .. "menu.png",
   size = "small",

   animation_directory = dirname,
   animations = { idle = { hotspot = { 19, 33 }}},

   aihints = {
      prohibited_till = 540
   },

   working_positions = {
      frisians_well_keeper = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "sleep=duration:40s",
            "mine=resource_water radius:3 yield:100% when_empty:5% experience_on_fail:10%",
            "produce=water"
         }
      },
   },

   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Water"),
      heading = _("Out of Water"),
      message = pgettext("frisians_building", "The carrier working at this deep well can’t find any water in his well."),
      productivity_threshold = 33
   },
}
pop_textdomain()
