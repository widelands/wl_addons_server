local descriptions = wl.Descriptions()
push_textdomain("tribes")
include "tribes/scripting/help/time_strings.lua"

local function set_programs(site, programs)
   for name, program in pairs(programs) do
      descriptions:modify_unit("productionsite", site, "programs", "set", name, program)
   end
end

-- Charcoal
descriptions:modify_unit("tribe", "amazons", "add_worker", "amazons_charcoal_master", 4, nil, nil, {
   helptexts = {
      purpose = pgettext("amazons_worker", "Burns rare trees to produce charcoal more efficiently.")
   }
})

descriptions:modify_unit("worker", "amazons_charcoal_burner", "experience", 15)
descriptions:modify_unit("worker", "amazons_charcoal_burner", "becomes", "amazons_charcoal_master")

descriptions:modify_unit("tribe", "amazons", "add_building", "amazons_rare_tree_kiln", {
   helptexts = {
      -- TRANSLATORS: Lore helptext for an Amazon production site: Rare Tree Kiln
      lore = pgettext("amazons_building", "‘You think you've mastered the art of burning charcoal. But the best charcoal is that which can only be made from rubber when placed in the hottest fire of ironwood. What you've learnt so far, my girl, is barely enough to start learning how to ignite ironwood. You have to start slowly, with the gentle flames of a balsa fire…’"),
      -- TRANSLATORS: Lore author helptext for an Amazon production site: Rare Tree Kiln
      lore_author = pgettext("amazons_building", "Mistress Blackwood, teaching an apprentice"),
      -- TRANSLATORS: Purpose helptext for an Amazon production site: Rare Tree Kiln
      purpose = pgettext("amazons_building", "Burns rare trees into charcoal."),
      -- TRANSLATORS: Performance helptext for an Amazon production site: Rare Tree Kiln
      performance = pgettext("amazons_building", "If fully supplied, the rare tree kiln needs %s on average to produce one lump of coal."):bformat(format_minutes_seconds(1,4))
   }
})

-- descriptions:modify_unit("building", "amazons_charcoal_kiln", "enhancement", "amazons_rare_tree_kiln")
descriptions:modify_unit("building", "amazons_charcoal_kiln", "enhancement", {
   name = "amazons_rare_tree_kiln",
   enhancement_cost = {
      granite = 3,
      quartz = 1,
   },
   enhancement_return_on_dismantle = {
      quartz = 1,
   },
})

local charcoal_programs = include "addons/amazons-txa.wad/programs/charcoal_kiln.lua"
set_programs("amazons_charcoal_kiln", charcoal_programs)


-- Dressmakery
descriptions:modify_unit("productionsite", "amazons_dressmakery", "input", "modify_ware", "rope", 8)
descriptions:modify_unit("productionsite", "amazons_dressmakery", "input", "add_ware", "quartz", 3)

local dress_programs = include "addons/amazons-txa.wad/programs/dressmakery.lua"
set_programs("amazons_dressmakery", dress_programs)


-- Training glade
descriptions:modify_unit("productionsite", "amazons_training_glade", "input", "modify_ware", "fish", 10)
descriptions:modify_unit("productionsite", "amazons_training_glade", "input", "modify_ware", "meat", 10)
descriptions:modify_unit("productionsite", "amazons_training_glade", "input", "modify_ware", "amazons_bread", 8)
descriptions:modify_unit("productionsite", "amazons_training_glade", "input", "modify_ware", "chocolate", 10)

local training_programs = include "addons/amazons-txa.wad/programs/training_glade.lua"
set_programs("amazons_training_glade", training_programs)


-- Rare tree cutter
local rare_tree_programs = include "addons/amazons-txa.wad/programs/rare_tree_cutter.lua"
set_programs("amazons_rare_tree_cutters_hut", rare_tree_programs)

