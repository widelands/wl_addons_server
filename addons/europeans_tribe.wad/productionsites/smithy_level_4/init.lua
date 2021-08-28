push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_smithy_level_4",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Smithy Level 4"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
        name = "europeans_smithy_level_5",
        enhancement_cost = {
          planks = 2,
          brick = 1,
          grout = 1,
          marble_column = 1,
          diamond = 1
        },
        enhancement_return_on_dismantle = {
          planks = 1,
          granite = 1,
          marble = 1,
          diamond = 1
        },
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 58, 61 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
         hotspot = { 58, 61 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_smith_normal = 1,
      europeans_smith_advanced = 1
   },

   inputs = {
      { name = "planks", amount = 8 },
      { name = "spidercloth", amount = 8 },
      { name = "armor", amount = 8 },
      { name = "coal", amount = 8 },
      { name = "iron", amount = 8 },
      { name = "gold", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_buckets",
            "call=produce_shovel",
            "call=produce_saw",
            "call=produce_hammer",
            "call=produce_pick",
            "call=produce_felling_ax",
            "call=produce_fire_tongs",
            "call=produce_scythe",
            "call=produce_basket",
            "call=produce_milking_tongs",
            "call=produce_needles",
            "call=produce_fishing_rod",
            "call=produce_fishing_net",
            "call=produce_hunting_bow",
            "call=produce_hunting_spear",
            "call=produce_bread_paddle",
            "call=produce_hook_pole",
            "call=produce_spear_wooden",
            "call=produce_helmet_mask",
            "call=produce_spear_advanced",
            "call=produce_armor_chain",
            "call=produce_shield_steel",
            "call=produce_ax_broad",
            "call=produce_sword_broad",
            "call=produce_armor_gilded",
            "call=produce_shield_advanced",
            "call=produce_tabard_golden",
            "call=produce_idle",
            "return=skipped"
         }
      },
      produce_idle = {
         -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
         descname = _"idle program",
         actions = {
            "return=skipped when economy needs buckets",
            "return=skipped when economy needs shovel",
            "return=skipped when economy needs saw",
            "return=skipped when economy needs hammer",
            "return=skipped when economy needs pick",
            "return=skipped when economy needs felling_ax",
            "return=skipped when economy needs fire_tongs",
            "return=skipped when economy needs scythe",
            "return=skipped when economy needs basket",
            "return=skipped when economy needs milking_tongs",
            "return=skipped when economy needs needles",
            "return=skipped when economy needs fishing_rod",
            "return=skipped when economy needs fishing_net",
            "return=skipped when economy needs hunting_bow",
            "return=skipped when economy needs hunting_spear",
            "return=skipped when economy needs bread_paddle",
            "return=skipped when economy needs hook_pole",
            "return=skipped when economy needs spear_wooden",
            "return=skipped when economy needs helmet_mask",
            "return=skipped when economy needs spear_advanced",
            "return=skipped when economy needs armor_chain",
            "return=skipped when economy needs shield_steel",
            "return=skipped when economy needs ax_broad",
            "return=skipped when economy needs armor_gilded",
            "return=skipped when economy needs tabard_golden",
            "return=skipped when economy needs shield_advanced",
            "return=skipped when economy needs sword_broad",
            "consume=coal iron",
            "sleep=duration:60s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:30s",
            "produce=scrap_iron"
         }
      },
      produce_basket = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
         descname = _"making a basket",
         actions = {
            "return=skipped unless economy needs basket or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=basket:3"
         }
      },
      produce_bread_paddle = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a bread paddle because ...
         descname = _"making a bread paddle",
         actions = {
            "return=skipped unless economy needs bread_paddle or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=bread_paddle:3"
         }
      },
      produce_buckets = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
         descname = _"making a pair of buckets",
         actions = {
            "return=skipped unless economy needs buckets or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=buckets:3"
         }
      },
      produce_felling_ax = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
         descname = _"making a felling ax",
         actions = {
            "return=skipped unless economy needs felling_ax or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=felling_ax:3"
         }
      },
      produce_fire_tongs = {
         -- TRANSLATORS: Completed/Skipped/Did not start making fire tongs because ...
         descname = _"making fire tongs",
         actions = {
            "return=skipped unless economy needs fire_tongs or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=fire_tongs:3"
         }
      },
      produce_fishing_net = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a fishing net because ...
         descname = _"making a fishing net",
         actions = {
            "return=skipped unless economy needs fishing_net or workers need experience",
            "consume=spidercloth:3",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=fishing_net:3"
         }
      },
       produce_fishing_rod = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a fishing rod because ...
         descname = _"making a fishing rod",
         actions = {
            "return=skipped unless economy needs fishing_rod or workers need experience",
            "consume=planks spidercloth",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=fishing_rod:3"
         }
      },
      produce_hammer = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
         descname = _"making a hammer",
         actions = {
            "return=skipped unless economy needs hammer or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=hammer:3"
         }
      },
      produce_hook_pole = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hook pole because ...
         descname = _"making a hook pole",
         actions = {
            "return=skipped unless economy needs hook_pole or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=hook_pole:3"
         }
      },
      produce_hunting_bow = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hunting bow because ...
         descname = _"making a hunting bow",
         actions = {
            "return=skipped unless economy needs hunting_bow or workers need experience",
            "consume=planks spidercloth",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=hunting_bow:3"
         }
      },
      produce_hunting_spear = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hunting spear because ...
         descname = _"making a hunting spear",
         actions = {
            "return=skipped unless economy needs hunting_spear or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=hunting_spear:3"
         }
      },
      produce_milking_tongs = {
         -- TRANSLATORS: Completed/Skipped/Did not start making milking tongs because ...
         descname = _"making milking tongs",
         actions = {
            "return=skipped unless economy needs milking_tongs or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=milking_tongs:3"
         }
      },
      produce_needles = {
         -- TRANSLATORS: Completed/Skipped/Did not start making milking tongs because ...
         descname = _"making needles",
         actions = {
            "return=skipped unless economy needs needles or workers need experience",
            "consume=iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=needles:3"
         }
      },
      produce_pick = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
         descname = _"making a pick",
         actions = {
            "return=skipped unless economy needs pick or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=pick:3"
         }
      },
      produce_saw = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
         descname = _"making a saw",
         actions = {
            "return=skipped unless economy needs saw or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=saw:3"
         }
      },
      produce_scythe = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
         descname = _"making a scythe",
         actions = {
            "return=skipped unless economy needs scythe or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=scythe:3"
         }
      },
      produce_shovel = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
         descname = _"making a shovel",
         actions = {
            "return=skipped unless economy needs shovel or workers need experience",
            "consume=planks coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=shovel:3"
         }
      },
      produce_spear_wooden = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
         descname = _"forging a wooden spear",
         actions = {
            "return=skipped unless economy needs spear_wooden or workers need experience",
            "consume=planks",
            "sleep=duration:5s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:20s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:5s",
            "produce=spear_wooden"
         }
      },
      produce_helmet_mask = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
         descname = _"forging a mask",
         actions = {
            "return=skipped when economy needs spear_advanced and not economy needs helmet_mask",
            "return=skipped when economy needs armor_chain and not economy needs helmet_mask",
            "return=skipped when economy needs shield_steel and not economy needs helmet_mask",
            "return=skipped when economy needs ax_broad and not economy needs helmet_mask",
            "return=skipped when economy needs armor_gilded and not economy needs helmet_mask",
            "return=skipped when economy needs tabard_golden and not economy needs helmet_mask",
            "return=skipped when economy needs shield_advanced and not economy needs helmet_mask",
            "return=skipped when economy needs sword_broad and not economy needs helmet_mask",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs iron",
            "consume=coal iron",
            "sleep=duration:10s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:30s",
            "produce=helmet_mask"
         }
      },
      produce_spear_advanced = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
         descname = _"forging an advanced spear",
         actions = {
            "return=skipped when economy needs helmet_mask and not economy needs spear_advanced",
            "return=skipped when economy needs armor_chain and not economy needs spear_advanced",
            "return=skipped when economy needs shield_steel and not economy needs spear_advanced",
            "return=skipped when economy needs ax_broad and not economy needs spear_advanced",
            "return=skipped when economy needs armor_gilded and not economy needs spear_advanced",
            "return=skipped when economy needs tabard_golden and not economy needs spear_advanced",
            "return=skipped when economy needs shield_advanced and not economy needs spear_advanced",
            "return=skipped when economy needs sword_broad and not economy needs spear_advanced",
            "return=skipped when economy needs planks",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs iron",
            "consume=planks coal iron",
            "sleep=duration:5s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:30s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:5s",
            "produce=spear_advanced"
         }
      },
      produce_armor_chain = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of chain armor because ...
         descname = _"forging a suit of chain armor",
         actions = {
            "return=skipped when economy needs helmet_mask and not economy needs armor_chain",
            "return=skipped when economy needs spear_advanced and not economy needs armor_chain",
            "return=skipped when economy needs shield_steel and not economy needs armor_chain",
            "return=skipped when economy needs ax_broad and not economy needs armor_chain",
            "return=skipped when economy needs armor_gilded and not economy needs armor_chain",
            "return=skipped when economy needs tabard_golden and not economy needs armor_chain",
            "return=skipped when economy needs shield_advanced and not economy needs armor_chain",
            "return=skipped when economy needs sword_broad and not economy needs armor_chain",
            "return=skipped when economy needs armor",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs iron",
            "consume=armor coal iron",
            "sleep=duration:10s",
            "animate=working duration:30s",
            "produce=armor_chain"
         }
      },
      produce_shield_steel = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
         descname = _"forging a steel shield",
         actions = {
            "return=skipped when economy needs helmet_mask and not economy needs shield_steel",
            "return=skipped when economy needs spear_advanced and not economy needs shield_steel",
            "return=skipped when economy needs armor_chain and not economy needs shield_steel",
            "return=skipped when economy needs ax_broad and not economy needs shield_steel",
            "return=skipped when economy needs armor_gilded and not economy needs shield_steel",
            "return=skipped when economy needs tabard_golden and not economy needs shield_steel",
            "return=skipped when economy needs shield_advanced and not economy needs shield_steel",
            "return=skipped when economy needs sword_broad and not economy needs shield_steel",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs iron",
            "consume=coal:2 iron:2",
            "sleep=duration:10s",
            "animate=working duration:30s",
            "produce=shield_steel"
         }
      },
      produce_ax_broad = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
         descname = _"forging a broad ax",
         actions = {
            "return=skipped when economy needs helmet_mask and not economy needs ax_broad",
            "return=skipped when economy needs spear_advanced and not economy needs ax_broad",
            "return=skipped when economy needs armor_chain and not economy needs ax_broad",
            "return=skipped when economy needs shield_steel and not economy needs ax_broad",
            "return=skipped when economy needs armor_gilded and not economy needs ax_broad",
            "return=skipped when economy needs tabard_golden and not economy needs ax_broad",
            "return=skipped when economy needs shield_advanced and not economy needs ax_broad",
            "return=skipped when economy needs sword_broad and not economy needs ax_broad",
            "return=skipped when economy needs planks",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs iron",
            "consume=planks coal:2 iron:2",
            "sleep=duration:5s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:30s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:5s",
            "produce=ax_broad"
         }
      },
      produce_armor_gilded = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of gilded armor because ...
         descname = _"forging a suit of gilded armor",
         actions = {
            "return=skipped when economy needs helmet_mask and not economy needs armor_gilded",
            "return=skipped when economy needs spear_advanced and not economy needs armor_gilded",
            "return=skipped when economy needs armor_chain and not economy needs armor_gilded",
            "return=skipped when economy needs shield_steel and not economy needs armor_gilded",
            "return=skipped when economy needs ax_broad and not economy needs armor_gilded",
            "return=skipped when economy needs tabard_golden and not economy needs armor_gilded",
            "return=skipped when economy needs shield_advanced and not economy needs armor_gilded",
            "return=skipped when economy needs sword_broad and not economy needs armor_gilded",
            "return=skipped when economy needs armor",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs iron",
            "return=skipped when economy needs gold",
            "consume=armor coal iron gold",
            "sleep=duration:10s",
            "animate=working duration:30s",
            "produce=armor_gilded"
         }
      },
      produce_tabard_golden = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of golden tabard because ...
         descname = _"forging a suit of golden tabard",
         actions = {
            "return=skipped when economy needs helmet_mask and not economy needs tabard_golden",
            "return=skipped when economy needs spear_advanced and not economy needs tabard_golden",
            "return=skipped when economy needs armor_chain and not economy needs tabard_golden",
            "return=skipped when economy needs shield_steel and not economy needs tabard_golden",
            "return=skipped when economy needs ax_broad and not economy needs tabard_golden",
            "return=skipped when economy needs armor_gilded and not economy needs tabard_golden",
            "return=skipped when economy needs shield_advanced and not economy needs tabard_golden",
            "return=skipped when economy needs sword_broad and not economy needs tabard_golden",
            "return=skipped when economy needs spidercloth and not economy needs tabard_golden",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs iron",
            "return=skipped when economy needs gold",
            "consume=spidercloth coal iron gold",
            "sleep=duration:10s",
            "animate=working duration:30s",
            "produce=tabard_golden"
         }
      },
      produce_shield_advanced = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
         descname = _"forging an advanced shield",
         actions = {
            "return=skipped when economy needs helmet_mask and not economy needs shield_advanced",
            "return=skipped when economy needs spear_advanced and not economy needs shield_advanced",
            "return=skipped when economy needs armor_chain and not economy needs shield_advanced",
            "return=skipped when economy needs shield_steel and not economy needs shield_advanced",
            "return=skipped when economy needs ax_broad and not economy needs shield_advanced",
            "return=skipped when economy needs armor_gilded and not economy needs shield_advanced",
            "return=skipped when economy needs tabard_golden and not economy needs shield_advanced",
            "return=skipped when economy needs sword_broad and not economy needs shield_advanced",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs iron",
            "return=skipped when economy needs gold",
            "consume=coal:2 iron:2 gold",
            "sleep=duration:10s",
            "animate=working duration:30s",
            "produce=shield_advanced"
         }
      },      
      produce_sword_broad = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a broadsword because ...
         descname = _"forging a broadsword",
         actions = {
            "return=skipped when economy needs helmet_mask and not economy needs sword_broad",
            "return=skipped when economy needs spear_advanced and not economy needs sword_broad",
            "return=skipped when economy needs armor_chain and not economy needs sword_broad",
            "return=skipped when economy needs shield_steel and not economy needs sword_broad",
            "return=skipped when economy needs ax_broad and not economy needs sword_broad",
            "return=skipped when economy needs armor_gilded and not economy needs sword_broad",
            "return=skipped when economy needs tabard_golden and not economy needs sword_broad",
            "return=skipped when economy needs shield_advanced and not economy needs sword_broad",
            "return=skipped when economy needs planks",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs iron",
            "consume=planks coal:2 iron:2",
            "sleep=duration:5s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:30s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:5s",
            "produce=sword_broad"
         },
      },
   },
}

pop_textdomain()
