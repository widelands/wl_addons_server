push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_workshop_weapons",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Weapons Workshop"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      stone = 3,
      tropicalwood = 3,
      palmleaves = 1,
      reed = 3
   },
   return_on_dismantle = {
      stone = 2,
      tropicalwood = 2,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 57, 76 },
      },
      unoccupied = {
         hotspot = { 57, 76 },
      },
   },
   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 57, 64 }
      },
      working = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 57, 75 }
      }
   },

   aihints = {
      prohibited_till = 1140,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 4,
      normal_ai_limit = 6,
   },

   working_positions = {
      sumatran_craftsman_experienced = 1,
      sumatran_craftsman = 1
   },

   inputs = {
      { name = "sandedwood", amount = 8 },
      { name = "iron", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("making spear"),
         actions = {
            -- time total: 20 + 3.6 + 11.4 = 35 sec
            "return=skipped unless economy needs spear",
            "return=failed unless site has sandedwood",
            "return=failed unless site has iron",
            "consume=sandedwood iron",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:15s",
            "playsound=sound/smiths/sharpening priority:90%",
            "produce=spear",
            "sleep=duration:6s400ms",
         }
      },
   },
}

pop_textdomain()
