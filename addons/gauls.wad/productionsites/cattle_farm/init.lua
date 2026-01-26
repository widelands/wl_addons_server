push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_cattle_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Cattle Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 1,
      granite = 1,
      planks = 2,
      brick = 2,
      reed = 2,
      cloth = 1,
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1,
      brick = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 57, 80 },
      },
      working = {
         basename = "idle", 
         hotspot = { 57, 80 },
      },
   },

   aihints = {
      prohibited_till = 600,
      basic_amount = 1,
   },

   working_positions = {
      gauls_breeder = 1
   },

   inputs = {
      { name = "water", amount = 8 },
      { name = "straw", amount = 8 },
      { name = "wheat", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=breed_ox",
            "call=produce_milk",
            "call=breed_ox",
         },
      },
      breed_ox = {
         -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
         descname = pgettext("gauls_building", "rearing cattle"),
         actions = {
            -- time total: 15 + 15 = 30 sec
            "return=skipped unless economy needs gauls_carrier_1",
            "consume=wheat water straw",
            "playsound=sound/farm/ox priority:50% allow_multiple",
            "animate=working duration:15s", 
            "recruit=gauls_carrier_1",
            "sleep=duration:15s",
         }
      },
      produce_milk = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing milk because ...
         descname = pgettext("gauls_building", "producing milk"),
         actions = {
            -- time total: 2 * (15 + 3.6) + 15 = 52.2 sec (26 sec/item) / 3 * (15 + 3.6) + 10 = 65.8 sec (22 sec/item)
            "return=skipped unless economy needs milk",
            "consume=wheat water straw",
            "playsound=sound/farm/ox priority:50% allow_multiple",
            "animate=working duration:15s", 
            "produce=milk",
            "animate=working duration:15s", 
            "produce=milk",
            "animate=working duration:15s", 
            "return=completed unless economy needs meat and unless economy needs smoked_meat",
            "produce=meat",
            "sleep=duration:10s"
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=wheat water straw",
            "produce=milk:2",
         }
      },
   },
}

pop_textdomain()
