push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_smokery",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Smokery"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      granite = 4,
      planks = 1,
      spidercloth = 1
   },
   return_on_dismantle = {
      granite = 3
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 54, 74 },
      },

   },

   spritesheets = {
      working = {
         fps = 20,
         frames = 5,
         columns = 5,
         rows = 1,
         hotspot = { 54, 74 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 780,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      lutas_atlanteans_smoker = 1
   },

   inputs = {
      { name = "fish", amount = 4 },
      { name = "meat", amount = 4 },
      { name = "log", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 3 * 68 = 204 sec
            "call=smoke_fish",
            "call=smoke_meat",
            "call=smoke_fish_2",
         }
      },
      smoke_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start smoking meat because ...
         descname = _("smoking meat"),
         actions = {
            -- time: 30.8 + 30 + 2 * 3.6 = 68
            "return=skipped unless economy needs smoked_meat",
            "sleep=duration:30s",
            "consume=meat:2 log",
            "animate=working duration:30s800ms",
            "produce=smoked_meat:2"
         }
      },
      -- 2 identical programs for fish to prevent unnecessary skipping penalty
      smoke_fish = {
         -- TRANSLATORS: Completed/Skipped/Did not start smoking fish because ...
         descname = _("smoking fish"),
         actions = {
            -- time: 30.8 + 30 + 2 * 3.6 = 68
            "return=skipped unless economy needs smoked_fish",
            "sleep=duration:30s",
            "consume=fish:2 log",
            "animate=working duration:30s800ms",
            "produce=smoked_fish:2"
         }
      },
      smoke_fish_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start smoking fish because ...
         descname = _("smoking fish"),
         actions = {
            -- time: 30.8 + 30 + 2 * 3.6 = 68
            "return=skipped unless economy needs smoked_fish",
            "sleep=duration:30s",
            "consume=fish:2 log",
            "animate=working duration:30s800ms",
            "produce=smoked_fish:2"
         }
      },
   },
}

pop_textdomain()
