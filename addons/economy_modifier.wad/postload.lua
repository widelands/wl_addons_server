addon_dirname = path.dirname(__file__)

push_textdomain("economy_modifier.wad", true)

-- Step 1: Add target quantity to all wares --

-- Building Materials / Raw Materials --
wl.Descriptions():modify_unit("ware", "water", "target_quantity", "amazons", 32)
wl.Descriptions():modify_unit("ware", "water", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "water", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "water", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "water", "target_quantity", "frisians", 32)

wl.Descriptions():modify_unit("ware", "granite", "target_quantity", "amazons", 64)
wl.Descriptions():modify_unit("ware", "granite", "target_quantity", "atlanteans", 64)
wl.Descriptions():modify_unit("ware", "granite", "target_quantity", "barbarians", 64)
wl.Descriptions():modify_unit("ware", "grout", "target_quantity", "barbarians", 64)
wl.Descriptions():modify_unit("ware", "granite", "target_quantity", "empire", 64)
wl.Descriptions():modify_unit("ware", "marble", "target_quantity", "empire", 64)
wl.Descriptions():modify_unit("ware", "marble_column", "target_quantity", "empire", 64)
wl.Descriptions():modify_unit("ware", "granite", "target_quantity", "frisians", 64)
wl.Descriptions():modify_unit("ware", "clay", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "brick", "target_quantity", "frisians", 64)

wl.Descriptions():modify_unit("ware", "log", "target_quantity", "amazons", 64)
wl.Descriptions():modify_unit("ware", "balsa", "target_quantity", "amazons", 64)
wl.Descriptions():modify_unit("ware", "ironwood", "target_quantity", "amazons", 64)
wl.Descriptions():modify_unit("ware", "log", "target_quantity", "atlanteans", 64)
wl.Descriptions():modify_unit("ware", "planks", "target_quantity", "atlanteans", 64)
wl.Descriptions():modify_unit("ware", "log", "target_quantity", "barbarians", 64)
wl.Descriptions():modify_unit("ware", "blackwood", "target_quantity", "barbarians", 64)
wl.Descriptions():modify_unit("ware", "log", "target_quantity", "empire", 64)
wl.Descriptions():modify_unit("ware", "planks", "target_quantity", "empire", 64)
wl.Descriptions():modify_unit("ware", "log", "target_quantity", "frisians", 64)

wl.Descriptions():modify_unit("ware", "rubber", "target_quantity", "amazons", 64)
wl.Descriptions():modify_unit("ware", "liana", "target_quantity", "amazons", 32)
wl.Descriptions():modify_unit("ware", "rope", "target_quantity", "amazons", 64)
wl.Descriptions():modify_unit("ware", "spider_silk", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "spidercloth", "target_quantity", "atlanteans", 64)
wl.Descriptions():modify_unit("ware", "reed", "target_quantity", "barbarians", 64)
wl.Descriptions():modify_unit("ware", "cloth", "target_quantity", "barbarians", 64)
wl.Descriptions():modify_unit("ware", "wool", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "cloth", "target_quantity", "empire", 64)
wl.Descriptions():modify_unit("ware", "reed", "target_quantity", "frisians", 64)
wl.Descriptions():modify_unit("ware", "fur", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "cloth", "target_quantity", "frisians", 64)
wl.Descriptions():modify_unit("ware", "fur_garment_old", "target_quantity", "frisians", 1)

-- Food (collected) --
wl.Descriptions():modify_unit("ware", "fish", "target_quantity", "amazons", 32)
wl.Descriptions():modify_unit("ware", "fish", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "smoked_fish", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "fish", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "fish", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "fish", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "smoked_fish", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "meat", "target_quantity", "amazons", 32)
wl.Descriptions():modify_unit("ware", "meat", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "smoked_meat", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "meat", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "meat", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "meat", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "smoked_meat", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "honey", "target_quantity", "frisians", 32)

-- Food (farmed) --
wl.Descriptions():modify_unit("ware", "cassavaroot", "target_quantity", "amazons", 32)
wl.Descriptions():modify_unit("ware", "cocoa_beans", "target_quantity", "amazons", 32)
wl.Descriptions():modify_unit("ware", "blackroot", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "corn", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "wheat", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "grape", "target_quantity", "empire", 16)
wl.Descriptions():modify_unit("ware", "wheat", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "barley", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "fruit", "target_quantity", "frisians", 32)
-- Food (processed 1) --
wl.Descriptions():modify_unit("ware", "amazons_bread", "target_quantity", "amazons", 32)
wl.Descriptions():modify_unit("ware", "cornmeal", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "blackroot_flour", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "atlanteans_bread", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "barbarians_bread", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "flour", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "empire_bread", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "bread_frisians", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "honey_bread", "target_quantity", "frisians", 32)

-- Food (processed 2) --
wl.Descriptions():modify_unit("ware", "chocolate", "target_quantity", "amazons", 32)
wl.Descriptions():modify_unit("ware", "beer", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "beer_strong", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "beer", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "wine", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "beer", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "mead", "target_quantity", "frisians", 32)

-- Food (processed 3) --
wl.Descriptions():modify_unit("ware", "ration", "target_quantity", "amazons", 32)
wl.Descriptions():modify_unit("ware", "ration", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "snack", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "meal", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "ration", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "meal", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "ration", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "meal", "target_quantity", "frisians", 32)

-- Mining --
wl.Descriptions():modify_unit("ware", "coal", "target_quantity", "amazons", 64)
wl.Descriptions():modify_unit("ware", "coal", "target_quantity", "atlanteans", 64)
wl.Descriptions():modify_unit("ware", "coal", "target_quantity", "barbarians", 64)
wl.Descriptions():modify_unit("ware", "coal", "target_quantity", "empire", 64)
wl.Descriptions():modify_unit("ware", "coal", "target_quantity", "frisians", 64)
wl.Descriptions():modify_unit("ware", "gold_dust", "target_quantity", "amazons", 16)
wl.Descriptions():modify_unit("ware", "gold_ore", "target_quantity", "atlanteans", 16)
wl.Descriptions():modify_unit("ware", "gold_ore", "target_quantity", "barbarians", 16)
wl.Descriptions():modify_unit("ware", "gold_ore", "target_quantity", "empire", 16)
wl.Descriptions():modify_unit("ware", "gold_ore", "target_quantity", "frisians", 16)
wl.Descriptions():modify_unit("ware", "iron_ore", "target_quantity", "atlanteans", 16)
wl.Descriptions():modify_unit("ware", "iron_ore", "target_quantity", "barbarians", 16)
wl.Descriptions():modify_unit("ware", "iron_ore", "target_quantity", "empire", 16)
wl.Descriptions():modify_unit("ware", "iron_ore", "target_quantity", "frisians", 16)
wl.Descriptions():modify_unit("ware", "quartz", "target_quantity", "amazons", 64)
wl.Descriptions():modify_unit("ware", "quartz", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "diamond", "target_quantity", "atlanteans", 32)

-- Mining (processed) --
wl.Descriptions():modify_unit("ware", "gold", "target_quantity", "amazons", 32)
wl.Descriptions():modify_unit("ware", "gold", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "gold_thread", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "gold", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "gold", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "gold", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "iron", "target_quantity", "atlanteans", 32)
wl.Descriptions():modify_unit("ware", "iron", "target_quantity", "barbarians", 32)
wl.Descriptions():modify_unit("ware", "iron", "target_quantity", "empire", 32)
wl.Descriptions():modify_unit("ware", "iron", "target_quantity", "frisians", 32)
wl.Descriptions():modify_unit("ware", "scrap_iron", "target_quantity", "frisians", 1)
wl.Descriptions():modify_unit("ware", "scrap_metal_mixed", "target_quantity", "frisians", 1)

-- Tools --
wl.Descriptions():modify_unit("ware", "hammer", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "hammer", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "hammer", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "hammer", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "hammer", "target_quantity", "frisians", 8)

wl.Descriptions():modify_unit("ware", "pick", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "pick", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "pick", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "pick", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "pick", "target_quantity", "frisians", 8)

wl.Descriptions():modify_unit("ware", "felling_ax", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "saw", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "felling_ax", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "felling_ax", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "saw", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "felling_ax", "target_quantity", "frisians", 8)

wl.Descriptions():modify_unit("ware", "shovel", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "shovel", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "shovel", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "shovel", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "shovel", "target_quantity", "frisians", 8)

wl.Descriptions():modify_unit("ware", "machete", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "scythe", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "scythe", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "scythe", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "scythe", "target_quantity", "frisians", 8)

wl.Descriptions():modify_unit("ware", "fishing_net", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "hunting_bow", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "fishing_rod", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "hunting_spear", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "fishing_rod", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "hunting_spear", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "fishing_net", "target_quantity", "frisians", 8)
wl.Descriptions():modify_unit("ware", "hunting_spear", "target_quantity", "frisians", 8)

wl.Descriptions():modify_unit("ware", "kitchen_tools", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "bread_paddle", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "bread_paddle", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "kitchen_tools", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "bread_paddle", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "kitchen_tools", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "bread_paddle", "target_quantity", "frisians", 8)
wl.Descriptions():modify_unit("ware", "kitchen_tools", "target_quantity", "frisians", 8)

wl.Descriptions():modify_unit("ware", "chisel", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "firestones", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "needles", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "stone_bowl", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "buckets", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "fire_tongs", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "hook_pole", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "milking_tongs", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "fire_tongs", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "basket", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "fire_tongs", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "basket", "target_quantity", "frisians", 8)
wl.Descriptions():modify_unit("ware", "fire_tongs", "target_quantity", "frisians", 8)
wl.Descriptions():modify_unit("ware", "needles", "target_quantity", "frisians", 8)

-- Armor --
wl.Descriptions():modify_unit("ware", "tunic", "target_quantity", "amazons", 16)
wl.Descriptions():modify_unit("ware", "vest_padded", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "protector_padded", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "armor_wooden", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "helmet_wooden", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "warriors_coat", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "boots_sturdy", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "boots_swift", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "boots_hero", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "shield_steel", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "shield_advanced", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "tabard", "target_quantity", "atlanteans", 16)
wl.Descriptions():modify_unit("ware", "tabard_golden", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "helmet", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "helmet_mask", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "helmet_warhelm", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "armor_helmet", "target_quantity", "empire", 16)
wl.Descriptions():modify_unit("ware", "armor", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "armor_chain", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "armor_gilded", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "fur_garment", "target_quantity", "frisians", 16)
wl.Descriptions():modify_unit("ware", "fur_garment_studded", "target_quantity", "frisians", 8)
wl.Descriptions():modify_unit("ware", "fur_garment_golden", "target_quantity", "frisians", 8)
wl.Descriptions():modify_unit("ware", "helmet", "target_quantity", "frisians", 8)
wl.Descriptions():modify_unit("ware", "helmet_golden", "target_quantity", "frisians", 8)

-- Weapons --
wl.Descriptions():modify_unit("ware", "spear_wooden", "target_quantity", "amazons", 16)
wl.Descriptions():modify_unit("ware", "spear_stone_tipped", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "spear_hardened", "target_quantity", "amazons", 8)
wl.Descriptions():modify_unit("ware", "trident_light", "target_quantity", "atlanteans", 16)
wl.Descriptions():modify_unit("ware", "trident_long", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "trident_steel", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "trident_double", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "trident_heavy_double", "target_quantity", "atlanteans", 8)
wl.Descriptions():modify_unit("ware", "ax", "target_quantity", "barbarians", 16)
wl.Descriptions():modify_unit("ware", "ax_sharp", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "ax_broad", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "ax_bronze", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "ax_battle", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "ax_warriors", "target_quantity", "barbarians", 8)
wl.Descriptions():modify_unit("ware", "spear_wooden", "target_quantity", "empire", 16)
wl.Descriptions():modify_unit("ware", "spear", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "spear_advanced", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "spear_heavy", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "spear_war", "target_quantity", "empire", 8)
wl.Descriptions():modify_unit("ware", "sword_short", "target_quantity", "frisians", 16)
wl.Descriptions():modify_unit("ware", "sword_long", "target_quantity", "frisians", 8)
wl.Descriptions():modify_unit("ware", "sword_broad", "target_quantity", "frisians", 8)
wl.Descriptions():modify_unit("ware", "sword_double", "target_quantity", "frisians", 8)

-- Step 2: Modify programms from productionsites, add "return=skipped unless economy needs X" --

-- Collecting basic resources --
-- Water --
wl.Descriptions():modify_unit("productionsite", "amazons_water_gatherers_hut", "programs", "set", "main", {
         descname = _("gathering water"),
         actions = {
            "return=skipped unless economy needs water",
            "sleep=duration:20s",
            "callworker=fetch_water",
            "produce=water",
            "sleep=duration:10s"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_well", "programs", "set", "main", {
         descname = _("mining water"),
         actions = {
            "return=skipped unless economy needs water",
            "sleep=duration:20s",
            "animate=working duration:20s",
            "mine=resource_water radius:1 yield:100% when_empty:65%",
            "produce=water"
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_well", "programs", "set", "main", {
         descname = _("mining water"),
         actions = {
            "return=skipped unless economy needs water",
            "sleep=duration:20s",
            "animate=working duration:20s",
            "mine=resource_water radius:1 yield:100% when_empty:65%",
            "produce=water"
      }})
wl.Descriptions():modify_unit("productionsite", "empire_well", "programs", "set", "main", {
         descname = _("mining water"),
         actions = {
            "return=skipped unless economy needs water",
            "sleep=duration:20s",
            "animate=working duration:20s",
            "mine=resource_water radius:1 yield:100% when_empty:65%",
            "produce=water"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_well", "programs", "set", "main", {
         descname = _("mining water"),
         actions = {
            "return=skipped unless economy needs water",
            "sleep=duration:20s",
            "animate=working duration:20s",
            "mine=resource_water radius:1 yield:100% when_empty:65%",
            "produce=water"
      }})
      
-- Stone --
wl.Descriptions():modify_unit("productionsite", "amazons_stonecutters_hut", "programs", "set", "main", {
         descname = _("cutting granite"),
         actions = {
            "return=skipped unless economy needs granite",
            "callworker=cut_granite",
            "sleep=duration:10s"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_quarry", "programs", "set", "main", {
         descname = _("quarrying granite"),
         actions = {
            "return=skipped unless economy needs granite",
            "callworker=cut_granite",
            "sleep=duration:18s500ms"
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_quarry", "programs", "set", "main", {
         descname = _("quarrying granite"),
         actions = {
            "return=skipped unless economy needs granite",
            "callworker=cut_granite",
            "sleep=duration:17s500ms"
      }})
wl.Descriptions():modify_unit("productionsite", "empire_quarry", "programs", "set", "mine_granite", {
         descname = _("quarrying granite"),
         actions = {
            "return=skipped unless economy needs granite",
            "callworker=cut_granite",
            "sleep=duration:17s500ms"
      }})
wl.Descriptions():modify_unit("productionsite", "empire_quarry", "programs", "set", "mine_marble", {
         descname = _("quarrying marble"),
         actions = {
            "return=skipped unless economy needs marble",
            "callworker=cut_marble",
            "sleep=duration:17s500ms"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_quarry", "programs", "set", "main", {
         descname = _("quarrying granite"),
         actions = {
            "return=skipped unless economy needs granite",
            "callworker=cut_granite",
            "sleep=duration:17s500ms"
      }})

-- Wood --
wl.Descriptions():modify_unit("productionsite", "amazons_jungle_preservers_hut", "programs", "set", "main", {
         descname = _("planting trees"),
         actions = {
            "return=skipped unless economy needs log",
            "callworker=plant",
            "sleep=duration:9s"
      }})
wl.Descriptions():modify_unit("productionsite", "amazons_rare_tree_cutters_hut", "programs", "set", "harvest_balsa", {
         descname = _("harvesting balsa"),
         actions = {
            "return=skipped unless economy needs balsa",
            "callworker=harvest_balsa",
            "sleep=duration:12s"
      }})
wl.Descriptions():modify_unit("productionsite", "amazons_rare_tree_cutters_hut", "programs", "set", "harvest_ironwood", {
         descname = _("harvesting ironwood"),
         actions = {
            "return=skipped unless economy needs ironwood",
            "callworker=harvest_ironwood",
            "sleep=duration:12s"
      }})
wl.Descriptions():modify_unit("productionsite", "amazons_rare_tree_cutters_hut", "programs", "set", "harvest_rubber", {
         descname = _("harvesting rubber"),
         actions = {
            "return=skipped unless economy needs rubber",
            "callworker=harvest_rubber",
            "sleep=duration:12s"
      }})
wl.Descriptions():modify_unit("productionsite", "amazons_woodcutters_hut", "programs", "set", "main", {
         descname = _("felling trees"),
         actions = {
            "return=skipped unless economy needs log",
            "callworker=harvest",
            "sleep=duration:10s"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_foresters_house", "programs", "set", "main", {
         descname = _("planting trees"),
         actions = {
            "return=skipped unless economy needs log",
            "callworker=plant",
            "sleep=duration:8s"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_woodcutters_house", "programs", "set", "main", {
         descname = _("felling trees"),
         actions = {
            "return=skipped unless economy needs log",
            "callworker=harvest",
            "sleep=duration:20s"
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_lumberjacks_hut", "programs", "set", "main", {
         descname = _("felling trees"),
         actions = {
            "return=skipped unless economy needs log",
            "callworker=harvest",
            "sleep=duration:20s"
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_rangers_hut", "programs", "set", "main", {
         descname = _("planting trees"),
         actions = {
            "return=skipped unless economy needs log",
            "callworker=plant",
            "sleep=duration:11s500ms"
      }})
wl.Descriptions():modify_unit("productionsite", "empire_foresters_house", "programs", "set", "main", {
         descname = _("planting trees"),
         actions = {
            "return=skipped unless economy needs log",
            "callworker=plant",
            "sleep=duration:10s"
      }})
wl.Descriptions():modify_unit("productionsite", "empire_lumberjacks_house", "programs", "set", "main", {
         descname = _("felling trees"),
         actions = {
            "return=skipped unless economy needs log",
            "callworker=harvest",
            "sleep=duration:20s"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_foresters_house", "programs", "set", "main", {
         descname = _("planting trees"),
         actions = {
            "return=skipped unless economy needs log",
            "callworker=plant",
            "sleep=duration:12s"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_woodcutters_house", "programs", "set", "main", {
         descname = _("felling trees"),
         actions = {
            "return=skipped unless economy needs log",
            "callworker=harvest",
            "sleep=duration:20s"
      }})

-- Fish --
wl.Descriptions():modify_unit("productionsite", "amazons_hunter_gatherers_hut", "programs", "set", "fish", {
         descname = _("gathering fish"),
         actions = {
            "return=skipped unless economy needs fish",
            "callworker=fish",
            "sleep=duration:34s"
      }})
wl.Descriptions():modify_unit("productionsite", "amazons_wilderness_keepers_tent", "programs", "set", "breed", {
         descname = _("breeding fish"),
         actions = {
            "return=skipped unless economy needs fish",
            "callworker=breed_fish",
            "sleep=duration:52s500ms"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_fishbreeders_house", "programs", "set", "main", {
         descname = _("breeding fish"),
         actions = {
            "return=skipped unless economy needs fish",
            "callworker=breed",
            "sleep=duration:13s500ms"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_fishers_house", "programs", "set", "main", {
         descname = _("fishing"),
         actions = {
            "return=skipped unless economy needs fish",
            "callworker=fish",
            "sleep=duration:9s500ms"
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_fishers_hut", "programs", "set", "main", {
         descname = _("fishing"),
         actions = {
            "return=skipped unless economy needs fish",
            "callworker=fish",
            "sleep=duration:10s500ms"
      }})
wl.Descriptions():modify_unit("productionsite", "empire_fishers_house", "programs", "set", "main", {
         descname = _("fishing"),
         actions = {
            "return=skipped unless economy needs fish",
            "callworker=fish",
            "sleep=duration:10s"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_fishers_house", "programs", "set", "main", {
         descname = _("fishing"),
         actions = {
            "return=skipped unless economy needs fish",
            "callworker=fish",
            "sleep=duration:16s"
      }})
      
-- Meat --
wl.Descriptions():modify_unit("productionsite", "amazons_hunter_gatherers_hut", "programs", "set", "hunt", {
         descname = _("gathering meat"),
         actions = {
            "return=skipped unless economy needs meat",
            "callworker=hunt",
            "sleep=duration:34s"
      }})
wl.Descriptions():modify_unit("productionsite", "amazons_wilderness_keepers_tent", "programs", "set", "release", {
         descname = _("releasing game"),
         actions = {
            "return=skipped unless economy needs meat",
            "callworker=release_game",
            "sleep=duration:52s500ms"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_hunters_house", "programs", "set", "main", {
         descname = _("hunting"),
         actions = {
            "return=skipped unless economy needs meat",
            "callworker=hunt",
            "sleep=duration:35s"
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_gamekeepers_hut", "programs", "set", "main", {
         descname = _("releasing"),
         actions = {
            "return=skipped unless economy needs meat",
            "callworker=release",
            "sleep=duration:53s"
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_hunters_hut", "programs", "set", "main", {
         descname = _("hunting"),
         actions = {
            "return=skipped unless economy needs meat",
            "callworker=hunt",
            "sleep=duration:35s"
      }})
wl.Descriptions():modify_unit("productionsite", "empire_hunters_house", "programs", "set", "main", {
         descname = _("hunting"),
         actions = {
            "return=skipped unless economy needs meat",
            "callworker=hunt",
            "sleep=duration:35s"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_hunters_house", "programs", "set", "main", {
         descname = _("hunting"),
         actions = {
            "return=skipped unless economy needs meat or economy needs fur",
            "callworker=hunt",
            "sleep=duration:35s",
            "callworker=hunt",
            "sleep=duration:35s",
            "callworker=hunt",
            "sleep=duration:35s",
            "callworker=hunt",
            "sleep=duration:35s",
            "callworker=hunt",
            "sleep=duration:35s",
            "produce=fur"
      }})
      
-- Honey --
wl.Descriptions():modify_unit("productionsite", "frisians_beekeepers_house", "programs", "set", "main", {
         descname = _("making honey"),
         actions = {
            "return=skipped unless economy needs honey",
            "callworker=bees",
            "sleep=duration:45s"
      }})

-- Farming --
wl.Descriptions():modify_unit("productionsite", "amazons_cassava_plantation", "programs", "set", "harvest_cassava", {
         descname = _("harvesting cassava"),
         actions = {
            "return=skipped unless economy needs cassavaroot",
            "callworker=harvest",
            "sleep=duration:4s"
      }})
wl.Descriptions():modify_unit("productionsite", "amazons_cocoa_farm", "programs", "set", "harvest_cocoa", {
         descname = _("harvesting cocoa"),
         actions = {
            "return=skipped unless economy needs cocoa_beans",
            "callworker=harvest",
            "sleep=duration:4s"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_blackroot_farm", "programs", "set", "harvest", {
         descname = _("harvesting blackroot"),
         actions = {
            "return=skipped unless economy needs blackroot",
            "callworker=harvest",
            "sleep=duration:3s"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_farm", "programs", "set", "harvest", {
         descname = _("harvesting corn"),
         actions = {
            "return=skipped unless economy needs corn",
            "callworker=harvest",
            "sleep=duration:4s"
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_farm", "programs", "set", "harvest", {
         descname = _("harvesting wheat"),
         actions = {
            "return=skipped unless economy needs wheat",
            "callworker=harvest",
            "animate=working duration:3s",
            "sleep=duration:1s"
      }})
wl.Descriptions():modify_unit("productionsite", "barbarians_reed_yard", "programs", "set", "harvest", {
         descname = _("harvesting reed"),
         actions = {
            "return=skipped unless economy needs reed",
            "callworker=harvest",
            "sleep=duration:3s"
      }})
wl.Descriptions():modify_unit("productionsite", "empire_farm", "programs", "set", "harvest", {
         descname = _("harvesting wheat"),
         actions = {
            "return=skipped unless economy needs wheat",
            "callworker=harvest",
            "sleep=duration:4s"
      }})
wl.Descriptions():modify_unit("productionsite", "empire_vineyard", "programs", "set", "harvest", {
         descname = _("harvesting grapes"),
         actions = {
            "return=skipped unless economy needs grape",
            "callworker=harvest",
            "sleep=duration:5s"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_collectors_house", "programs", "set", "main", {
         descname = _("gathering berries"),
         actions = {
            "return=skipped unless economy needs fruit",
            "sleep=duration:21s",
            "callworker=harvest"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_farm", "programs", "set", "harvest_barley", {
         descname = _("harvesting barley"),
         actions = {
            "return=skipped unless economy needs barley",
            "callworker=harvest",
            "animate=working duration:40s",
            "sleep=duration:4s",
            "produce=barley"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_reed_farm", "programs", "set", "harvest_reed", {
         descname = _("harvesting reed"),
         actions = {
            "return=skipped unless economy needs reed",
            "callworker=harvestreed",
            "sleep=duration:5s"
      }})

-- Craft --
wl.Descriptions():modify_unit("productionsite", "amazons_rope_weaver_booth", "programs", "set", "main", {
         descname = _("making a rope"),
         actions = {
            "return=skipped unless economy needs rope",
            "consume=liana:2",
            "sleep=duration:20s400ms",
            "animate=working duration:35s",
            "produce=rope"
      }})
wl.Descriptions():modify_unit("productionsite", "atlanteans_mill", "programs", "set", "produce_blackroot_flour", {
         descname = _("grinding blackroot"),
         actions = {
            "return=skipped when site has corn and economy needs cornmeal and not economy needs blackroot_flour",
            "return=skipped unless economy needs blackroot_flour",
            "consume=blackroot",
            "sleep=duration:3s400ms",
            "playsound=sound/mill/mill_turning priority:85% allow_multiple",
            "animate=working duration:15s",
            "produce=blackroot_flour"
      }})
wl.Descriptions():modify_unit("productionsite", "empire_winery", "programs", "set", "main", {
         descname = _("making wine"),
         actions = {
            "return=skipped unless economy needs wine",
            "consume=grape:2",
            "sleep=duration:30s400ms",
            "playsound=sound/empire/winebubble priority:40% allow_multiple",
            "animate=working duration:30s",
            "produce=wine"
      }})


pop_textdomain()
