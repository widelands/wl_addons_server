push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_weaponsmithy",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Weapon Smithy"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      granite = 2,
      planks = 4,
      spidercloth = 1,
      quartz = 1
   },
   return_on_dismantle = {
      log = 1,
      granite = 1,
      planks = 2
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 56, 67 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 56, 67 },
      }
   },

   aihints = {
      prohibited_till = 1440
   },

   working_positions = {
      lutas_atlanteans_weaponsmith = 1
   },

   inputs = {
      { name = "planks", amount = 8 },
      { name = "coal", amount = 8 },
      { name = "iron", amount = 8 },
      { name = "gold", amount = 8 },
      { name = "diamond", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 54 + 4 * 81 = 378 sec
            "call=produce_trident_light",
            "call=produce_trident_long",
            "call=produce_trident_steel",
            "call=produce_trident_diamond_double",
            "call=produce_trident_heavy_double",
         }
      },
      produce_trident_light = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a light trident because ...
         descname = _("forging a light trident"),
         actions = {
            -- time: 21.4 + 25 + 4 + 3.6 = 54 sec
            "return=skipped unless economy needs trident_light",
            "sleep=duration:21s400ms",
            "consume=iron planks",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:25s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:4s",
            "produce=trident_light"
         }
      },
      produce_trident_long = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a long trident because ...
         descname = _("forging a long trident"),
         actions = {
            -- time: 32.4 + 41 + 4 + 3.6 = 81 sec
            "return=skipped unless economy needs trident_long",
            "sleep=duration:32s400ms",
            "consume=iron coal planks",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:41s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:4s",
            "produce=trident_long"
         }
      },
      produce_trident_steel = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a steel trident because ...
         descname = _("forging a steel trident"),
         actions = {
            -- time: 32.4 + 41 + 4 + 3.6 = 81 sec
            "return=skipped unless economy needs trident_steel",
            "sleep=duration:32s400ms",
            "consume=iron:2 coal planks",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:41s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:4s",
            "produce=trident_steel"
         }
      },
      produce_trident_diamond_double = {
      -- TRANSLATORS: Completed/Skipped/Did not start forging a diamond double trident because ...
      descname = _"forging a diamond double trident", 
      actions = {
            -- time: 32.4 + 41 + 4 + 3.6 = 81 sec
            "return=skipped unless economy needs trident_diamond_double",
            "sleep=duration:32s400ms",
            "consume=iron coal:2 diamond:2 planks", -- replaced one gold with two diamonds to improve balance of soldiers without gold
                                                    -- and to increase need for crystals which is very low
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:41s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:4s",
            "produce=trident_diamond_double"
         }
      },
      produce_trident_heavy_double = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a heavy double trident because ...
         descname = _("forging a heavy double trident"),
         actions = {
            -- time: 32.4 + 41 + 4 + 3.6 = 81 sec
            "return=skipped unless economy needs trident_heavy_double",
            "sleep=duration:32s400ms",
            "consume=iron coal:2 diamond:2 planks gold", -- replaced one iron with two diamonds to increase need for crystals 
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:41s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:4s",
            "produce=trident_heavy_double"
         }
      },
   },
}

pop_textdomain()
