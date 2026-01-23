addon_dirname = path.dirname(__file__)
push_textdomain("more_expensive_soldiers.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

----------------
-- Barbarians --
----------------

wl.Descriptions():modify_unit("tribe", "barbarians", "add_ware", "fur", 0, 5, 1, { helptexts = { purpose =
                  _"This shield is used for defense training."
               }})
wl.Descriptions():modify_unit("tribe", "barbarians", "add_ware", "fur_garment", 4, 5, 1, { helptexts = { purpose =
                  _"This shield is used for defense training."
               }})
wl.Descriptions():modify_unit("tribe", "barbarians", "add_worker", "barbarians_dressmaker", 5, nil, nil, { helptexts = { purpose =
                  _"Produces clothing for your soldiers."
               }})
wl.Descriptions():modify_unit("ware", "ax", "target_quantity", "barbarias", 5)
wl.Descriptions():modify_unit("worker", "barbarians_weaver", "experience", 8)
wl.Descriptions():modify_unit("worker", "barbarians_weaver", "becomes", "barbarians_dressmaker")

wl.Descriptions():modify_unit("tribe", "barbarians", "add_building", "barbarians_sewing_workshop", { helptexts = { 
                  -- TRANSLATORS: Purpose help text for a Gallic production site: Sewing Workshop
                  purpose = pgettext("gauls_building", "Produces clothing for your soldiers."),
               }})

wl.Descriptions():modify_unit("productionsite", "barbarians_cattlefarm", "programs", "set", "rearing_cattle", {
         -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
         descname = _("rearing cattle"),
         actions = {
            -- time total: 15 + 15 = 30 sec
            "sleep=duration:15s",
            "return=skipped unless economy needs barbarians_ox",
            "consume=wheat water",
            "playsound=sound/farm/ox priority:50% allow_multiple",
            "animate=working duration:15s", 
            "recruit=barbarians_ox"
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_cattlefarm", "programs", "set", "producing_fur", {
         -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
         descname = _("producing fur"),
         actions = {
            -- time total: 15 + 30 = 45 sec
            "sleep=duration:15s",
            "return=skipped unless economy needs fur",
            "consume=wheat water",
            "playsound=sound/farm/ox priority:50% allow_multiple",
            "animate=working duration:30s", 
            "produce=fur"
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_cattlefarm", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=rearing_cattle",
            "call=producing_fur",
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_barracks", "input", "modify_ware", "ax", 6)
wl.Descriptions():modify_unit("productionsite", "barbarians_barracks", "input", "add_ware", "fur_garment", 6)
wl.Descriptions():modify_unit("productionsite", "barbarians_barracks", "input", "add_ware", "snack", 6)
wl.Descriptions():modify_unit("productionsite", "barbarians_barracks", "input", "add_ware", "fish", 6)
wl.Descriptions():modify_unit("productionsite", "barbarians_barracks", "input", "add_ware", "meat", 6)
wl.Descriptions():modify_unit("productionsite", "barbarians_barracks", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("barbarians_building", "recruiting soldier"),
         actions = {
            -- time total: 80 sec
            "return=skipped unless economy needs barbarians_soldier",
            "consume=ax fur_garment fish,meat snack barbarians_recruit",
            "sleep=duration:60s",
            "recruit=barbarians_soldier",
            "sleep=duration:20s"
      }})

wl.Descriptions():modify_unit("productionsite", "barbarians_ax_workshop", "input", "add_ware", "log", 6)
wl.Descriptions():modify_unit("productionsite", "barbarians_ax_workshop", "programs", "set", "produce_ax", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging an ax because ...
         descname = _("forging an ax"),
         actions = {
            -- time: 23.4 + 22 + 9 + 3.6 = 58 sec
            "return=skipped unless economy needs ax",
            "consume=coal iron log", -- log added
            "sleep=duration:23s400ms",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:22s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=ax"
      }})

wl.Descriptions():modify_unit("productionsite", "barbarians_warmill", "input", "add_ware", "log", 6)
wl.Descriptions():modify_unit("productionsite", "barbarians_warmill", "programs", "set", "produce_ax", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging an ax because ...
         descname = _("forging an ax"),
         actions = {
            -- time: 23.4 + 22 + 9 + 3.6 = 58 sec
            "return=skipped unless economy needs ax",
            "consume=coal iron log", -- log added
            "sleep=duration:23s400ms",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:22s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=ax"
      }})

------------
-- Empire --
------------

-- wooden spear completely removed from recruitment, remains only as a tool for trainers 
wl.Descriptions():modify_unit("ware", "spear_wooden", "target_quantity", "empire", 1) 
wl.Descriptions():modify_unit("ware", "spear", "target_quantity", "empire", 5)
wl.Descriptions():modify_unit("ware", "armor_helmet", "target_quantity", "empire", 5)
wl.Descriptions():modify_unit("ware", "spear", "preciousness", "empire", 1)
wl.Descriptions():modify_unit("productionsite", "empire_barracks", "input", "modify_ware", "armor_helmet", 6)
wl.Descriptions():modify_unit("productionsite", "empire_barracks", "input", "add_ware", "spear", 6)
wl.Descriptions():modify_unit("productionsite", "empire_barracks", "input", "add_ware", "wine", 6)
wl.Descriptions():modify_unit("productionsite", "empire_barracks", "input", "add_ware", "meal", 6)
wl.Descriptions():modify_unit("productionsite", "empire_barracks", "input", "add_ware", "meat", 6)
wl.Descriptions():modify_unit("productionsite", "empire_barracks", "input", "add_ware", "fish", 6)
wl.Descriptions():modify_unit("productionsite", "empire_barracks", "input", "remove_ware", "spear_wooden")
wl.Descriptions():modify_unit("productionsite", "empire_barracks", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("empire_building", "recruiting soldier"),
         actions = {
            -- time total: 80 sec
            "return=skipped unless economy needs empire_soldier",
            "consume=armor_helmet spear wine meal meat,fish empire_recruit",
            "sleep=duration:60s",
            "recruit=empire_soldier",
            "sleep=duration:20s"
      }})


----------------
-- Atlanteans --
----------------

wl.Descriptions():modify_unit("ware", "tabard", "target_quantity", "atlanteans", 5)
wl.Descriptions():modify_unit("ware", "trident_light", "target_quantity", "atlanteans", 5)
wl.Descriptions():modify_unit("productionsite", "atlanteans_barracks", "input", "modify_ware", "tabard", 6)
wl.Descriptions():modify_unit("productionsite", "atlanteans_barracks", "input", "modify_ware", "trident_light", 6)
wl.Descriptions():modify_unit("productionsite", "atlanteans_barracks", "input", "add_ware", "atlanteans_bread", 6)
wl.Descriptions():modify_unit("productionsite", "atlanteans_barracks", "input", "add_ware", "smoked_meat", 6)
wl.Descriptions():modify_unit("productionsite", "atlanteans_barracks", "input", "add_ware", "smoked_fish", 6)
wl.Descriptions():modify_unit("productionsite", "atlanteans_barracks", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("atlanteans_building", "recruiting soldier"),
         actions = {
            -- time total: 80 sec
            "return=skipped unless economy needs atlanteans_soldier",
            "consume=tabard trident_light atlanteans_bread smoked_meat,smoked_fish:2 atlanteans_recruit",
            "sleep=duration:60s",
            "recruit=atlanteans_soldier",
            "sleep=duration:20s"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_weaving_mill", "programs", "set", "produce_tabard", {
         -- TRANSLATORS: Completed/Skipped/Did not start tailoring a tabard because ...
         descname = _("tailoring a tabard"),
         actions = {
            -- time: 20.4 + 20 + 3.6 = 44 sec
            "return=skipped unless economy needs tabard",
            "consume=spider_silk:2", -- spider silk added
            "sleep=duration:20s400ms",
            "playsound=sound/mill/weaving priority:90%",
            "animate=working duration:20s",
            "produce=tabard"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_weaponsmithy", "programs", "set", "produce_trident_light", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a light trident because ...
         descname = _("forging a light trident"),
         actions = {
            -- time: 21.4 + 25 + 4 + 3.6 = 54 sec
            "return=skipped unless economy needs trident_light",
            "sleep=duration:21s400ms",
            "consume=iron coal planks", -- coal added
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:25s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:4s",
            "produce=trident_light"
      }})


--------------
-- Frisians --
--------------

wl.Descriptions():modify_unit("ware", "sword_short", "target_quantity", "frisians", 5)
wl.Descriptions():modify_unit("ware", "fur_garment", "target_quantity", "frisians", 5)
wl.Descriptions():modify_unit("productionsite", "frisians_barracks", "input", "modify_ware", "sword_short", 6)
wl.Descriptions():modify_unit("productionsite", "frisians_barracks", "input", "modify_ware", "fur_garment", 6)
wl.Descriptions():modify_unit("productionsite", "frisians_barracks", "input", "add_ware", "meal", 6)
wl.Descriptions():modify_unit("productionsite", "frisians_barracks", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("frisians_building", "recruiting soldier"),
         actions = {
            -- time total: 80 sec
            "return=skipped unless economy needs frisians_soldier",
            "consume=sword_short fur_garment meal frisians_carrier",
            "animate=working duration:60s",
            "recruit=frisians_soldier",
            "sleep=duration:20s"
      }})

-------------
-- Amazons --
-------------

wl.Descriptions():modify_unit("ware", "spear_wooden", "target_quantity", "amazons", 5)
wl.Descriptions():modify_unit("ware", "tunic", "target_quantity", "amazons", 5)
wl.Descriptions():modify_unit("productionsite", "amazons_initiation_site", "input", "remove_ware", "amazons_bread")
wl.Descriptions():modify_unit("productionsite", "amazons_initiation_site", "input", "remove_ware", "fish")
wl.Descriptions():modify_unit("productionsite", "amazons_initiation_site", "input", "remove_ware", "meat")
wl.Descriptions():modify_unit("productionsite", "amazons_initiation_site", "input", "add_ware", "chocolate", 8)
wl.Descriptions():modify_unit("productionsite", "amazons_initiation_site", "input", "add_ware", "ration", 8)
wl.Descriptions():modify_unit("productionsite", "amazons_initiation_site", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("amazons_building", "recruiting soldier"),
         actions = {
            -- time total: 20 + 60 = 80 sec
            "return=skipped unless economy needs amazons_soldier",
            "consume=spear_wooden tunic chocolate:2 ration:2 amazons_carrier",
            "animate=working duration:60s",
            "recruit=amazons_soldier",
            "sleep=duration:20s"
      }})
wl.Descriptions():modify_unit("productionsite", "amazons_stone_workshop", "input", "add_ware", "balsa", 4)
wl.Descriptions():modify_unit("productionsite", "amazons_stone_workshop", "programs", "set", "produce_spear_wooden", {
         -- TRANSLATORS: Completed/Skipped/Did not start making a wooden spear because ...
         descname = _("making a wooden spear"),
         actions = {
            -- time: 30.4 + 35 + 3.6 = 69 sec
            "return=skipped unless economy needs spear_wooden",
            "consume=ironwood balsa", -- balsa added
            "sleep=duration:30s400ms",
            "animate=working duration:35s",
            "produce=spear_wooden"
      }})


for i, trb in ipairs(wl.Descriptions().tribes_descriptions) do
   if trb.name == "lutas_atlanteans" then
-----------------------
-- Lutas’ Atlanteans --
-----------------------

wl.Descriptions():modify_unit("productionsite", "lutas_atlanteans_barracks", "input", "modify_ware", "tabard", 6)
wl.Descriptions():modify_unit("productionsite", "lutas_atlanteans_barracks", "input", "modify_ware", "trident_light", 6)
wl.Descriptions():modify_unit("productionsite", "lutas_atlanteans_barracks", "input", "add_ware", "atlanteans_bread", 6)
wl.Descriptions():modify_unit("productionsite", "lutas_atlanteans_barracks", "input", "add_ware", "smoked_meat", 6)
wl.Descriptions():modify_unit("productionsite", "lutas_atlanteans_barracks", "input", "add_ware", "smoked_fish", 6)
wl.Descriptions():modify_unit("productionsite", "lutas_atlanteans_barracks", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("atlanteans_building", "recruiting soldier"),
         actions = {
            -- time total: 80 sec
            "return=skipped unless economy needs lutas_atlanteans_soldier",
            "consume=tabard trident_light atlanteans_bread smoked_meat,smoked_fish:2 lutas_atlanteans_recruit",
            "sleep=duration:60s",
            "recruit=lutas_atlanteans_soldier",
            "sleep=duration:20s"
      }})
wl.Descriptions():modify_unit("productionsite", "lutas_atlanteans_weaving_mill", "programs", "set", "produce_tabard", {
         -- TRANSLATORS: Completed/Skipped/Did not start tailoring a tabard because ...
         descname = _("tailoring a tabard"),
         actions = {
            -- time: 20.4 + 20 + 3.6 = 44 sec
            "return=skipped unless economy needs tabard",
            "consume=spider_silk:2",
            "sleep=duration:20s400ms",
            "playsound=sound/mill/weaving priority:90%",
            "animate=working duration:20s",
            "produce=tabard"
      }})
wl.Descriptions():modify_unit("productionsite", "lutas_atlanteans_weaponsmithy", "programs", "set", "produce_trident_light", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a light trident because ...
         descname = _("forging a light trident"),
         actions = {
            -- time: 21.4 + 25 + 4 + 3.6 = 54 sec
            "return=skipped unless economy needs trident_light",
            "sleep=duration:21s400ms",
            "consume=iron coal planks",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:25s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:4s",
            "produce=trident_light"
      }})
wl.Descriptions():modify_unit("productionsite", "lutas_atlanteans_temple", "programs", "set", "upgrade_soldier_health_0", {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("lutas_atlanteans_building", "upgrading soldier health from level 0 to level 1"),
         actions = {
            "checksoldier=soldier:health level:0", -- Fails when aren't any soldier of level 0 health
            "return=failed unless site has smoked_fish,smoked_meat,atlanteans_bread:2",
            "consume=smoked_fish,smoked_meat,atlanteans_bread:2", -- tabard removed, basic soldier already have it and it is two times more expensive
            "callworker=attract_shells",
            "checksoldier=soldier:health level:0", -- Because the soldier can be expelled by the player
            "train=soldier:health level:1"
      }})
wl.Descriptions():modify_unit("productionsite", "lutas_atlanteans_temple", "input", "remove_ware", "tabard")

   elseif trb.name == "sumatrans" then
---------------
-- Sumatrans --
---------------

wl.Descriptions():modify_unit("productionsite", "sumatran_tribal_gathering", "input", "modify_ware", "crocodile_jacket", 6)
wl.Descriptions():modify_unit("productionsite", "sumatran_tribal_gathering", "input", "modify_ware", "spear", 6)
wl.Descriptions():modify_unit("productionsite", "sumatran_tribal_gathering", "input", "modify_ware", "meal", 6)
wl.Descriptions():modify_unit("productionsite", "sumatran_tribal_gathering", "input", "add_ware", "palm_wine", 6)
wl.Descriptions():modify_unit("productionsite", "sumatran_tribal_gathering", "input", "add_ware", "machete", 6)
wl.Descriptions():modify_unit("productionsite", "sumatran_tribal_gathering", "programs", "set", "recruit_warrior", {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting warrior because ...
         descname = _("recruiting warrior"),
         actions = {
            -- time: 40 + 20 = 60 sec
            "return=skipped unless economy needs sumatran_soldier",
            "consume=crocodile_jacket spear machete palm_wine:2 sumatran_recruit",
            "animate=working duration:40s",
            "recruit=sumatran_soldier",
            "sleep=duration:20s"
      }})
wl.Descriptions():modify_unit("productionsite", "sumatran_sewing_workshop", "programs", "set", "produce_crocodile_jacket", {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing crocodile jacket because ...
         descname = _("sewing crocodile jacket"),
         actions = {
            -- time: 1.4 + 35 + 3.6 + 15 = 55 sec
            "return=skipped unless economy needs crocodile_jacket",
            "return=failed unless site has cloth:2",
            "return=failed unless site has crocodile_skin:2",
            "consume=cloth:2 crocodile_skin:2", -- one cloth added
            "sleep=duration:1s400ms",
            "animate=working duration:35s",
            "produce=crocodile_jacket",
            "sleep=duration:15s"
      }})


   elseif trb.name == "gauls" then
-----------
-- Gauls --
-----------

wl.Descriptions():modify_unit("productionsite", "gauls_barracks", "input", "modify_ware", "tunic", 6)
wl.Descriptions():modify_unit("productionsite", "gauls_barracks", "input", "modify_ware", "spear", 6)
wl.Descriptions():modify_unit("productionsite", "gauls_barracks", "input", "add_ware", "meal", 6)
wl.Descriptions():modify_unit("productionsite", "gauls_barracks", "input", "add_ware", "elixir", 6)
wl.Descriptions():modify_unit("productionsite", "gauls_barracks", "input", "add_ware", "potion", 6)
wl.Descriptions():modify_unit("productionsite", "gauls_barracks", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting warrior because ...
         descname = pgettext("gauls_building", "recruiting warrior"),
         actions = {
            -- time total: 80 sec
            "return=skipped unless economy needs gauls_soldier",
            "consume=spear tunic meal elixir potion gauls_recruit",
            "animate=working duration:60s",
            "recruit=gauls_soldier",
            "sleep=duration:20s"
      }})

   end
end
pop_textdomain()
