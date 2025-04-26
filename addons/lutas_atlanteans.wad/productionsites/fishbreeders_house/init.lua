push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_fishbreeders_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Fish Breeder’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 1,
      planks = 1,
      granite = 1
   },
   return_on_dismantle = {
      granite = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 40, 50 },
      },
   },

   aihints = {
      needs_water = true,
      basic_amount = 3,
      prohibited_till = 540,
      forced_after = 900,
--      supports_production_of = { "fish" },
   },

   working_positions = {
      lutas_atlanteans_fishbreeder = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start breeding fish because ...
         descname = _("breeding fish"),
         actions = {
            "callworker=breed",
            "sleep=duration:13s500ms"
         }
      },
   },

   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fish"),
      heading = _("Out of Fish"),
      message = pgettext("lutas_atlanteans_building", "The fish breeder working out of this fish breeder’s house can’t find any water where he can breed fish in his work area. Remember that you can only regenerate your fish resources if there ever were some fish in the vicinity in the first place."),
      productivity_threshold = 50
   },
   -- Translators: Productivity tooltip for Atlantean fish breeders when all water fields are already full of fish
   resource_not_needed_message = _("The fishing grounds are full");
}

pop_textdomain()
