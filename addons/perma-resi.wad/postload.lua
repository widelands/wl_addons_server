push_textdomain("tribes")

descriptions = wl.Descriptions()

function set_miner_prg(name, r, what)
   descriptions:modify_unit("worker", name, "programs", "set", "remove_resi_" .. what, {
      "findobject=attrib:resi attrib:" .. what .. " radius:" .. r .. " no_notify",
      "removeobject"
   })
end

function set_univ_miner_prgs(name, r)
   set_miner_prg(name, r, "coal")
   set_miner_prg(name, r, "gold")
   set_miner_prg(name, r, "iron")
   set_miner_prg(name, r, "stones")
end

function set_water_prg(tribe)
   set_miner_prg(tribe .. "_carrier", 1, "water")

   descriptions:modify_unit("productionsite", tribe .. "_well",
      "programs", "set", "main", {
         descname = _"working",
         actions = {
            "sleep=duration:20s",
            "animate=working duration:20s",
            "mine=resource_water radius:1 yield:100% when_empty:65%",
            "produce=water",
            "callworker=remove_resi_water on failure complete",
   }})
end


-- Amazons --
-------------
set_miner_prg("amazons_gold_digger", 1, "gold")
set_miner_prg("amazons_stonecutter", 1, "stones")

descriptions:modify_unit("productionsite", "amazons_gold_digger_dwelling",
   "programs", "set", "main", {
      descname = _"mining gold",
      actions = {
         "return=skipped unless economy needs gold_dust",
         "consume=ration water:5",
         "sleep=duration:45s",
         "animate=working duration:20s",
         "mine=resource_gold radius:1 yield:100% when_empty:5%",
         "produce=gold_dust",
         "callworker=remove_resi_gold on failure complete",
}})

descriptions:modify_unit("productionsite", "amazons_stonemine", "programs",
   "set", "mine_produce", {
      descname = _"mining granite",
      actions = {
         "animate=working duration:10s",
         "mine=resource_stones radius:1 yield:100% when_empty:20%",
         "produce=granite",
         "callworker=remove_resi_stones on failure complete",
}})


-- Atlanteans --
----------------
set_water_prg("atlanteans")
set_univ_miner_prgs("atlanteans_miner", 4)

descriptions:modify_unit("productionsite", "atlanteans_coalmine", "programs",
   "set", "mine_produce", {
      descname = _"mining coal",
      actions = {
         "animate=working duration:10s",
         "mine=resource_coal radius:4 yield:100% when_empty:5%",
         "produce=coal",
         "callworker=remove_resi_coal on failure complete",
}})

  -- crystal mine (3 produce programs) --
descriptions:modify_unit("productionsite", "atlanteans_crystalmine", "programs",
   "set", "a_mine_produce_granite", {
      descname = _"mining granite",
      actions = {
         "animate=working duration:15s",
         "mine=resource_stones radius:4 yield:100% when_empty:5%",
         "produce=granite",
         "callworker=remove_resi_stones on failure complete",
}})
descriptions:modify_unit("productionsite", "atlanteans_crystalmine", "programs",
   "set", "a_mine_produce_quartz", {
      descname = _"mining quartz",
      actions = {
         "animate=working duration:10s",
         "mine=resource_stones radius:4 yield:100% when_empty:5%",
         "produce=quartz",
         "callworker=remove_resi_stones on failure complete",
}})
descriptions:modify_unit("productionsite", "atlanteans_crystalmine", "programs",
   "set", "a_mine_produce_diamond", {
      descname = _"mining diamonds",
         actions = {
         "animate=working duration:25s",
         "mine=resource_stones radius:4 yield:100% when_empty:5%",
         "produce=diamond",
         "callworker=remove_resi_stones on failure complete",
}})
  -- end crystal mine --

descriptions:modify_unit("productionsite", "atlanteans_goldmine", "programs",
   "set", "mine_produce", {
      descname = _"mining gold",
      actions = {
         "animate=working duration:22s",
         "mine=resource_gold radius:4 yield:100% when_empty:5%",
         "produce=gold_ore",
         "callworker=remove_resi_gold on failure complete",
}})

descriptions:modify_unit("productionsite", "atlanteans_ironmine", "programs",
   "set", "mine_produce", {
      descname = _"mining iron",
      actions = {
         "animate=working duration:14s",
         "mine=resource_iron radius:4 yield:100% when_empty:5%",
         "produce=iron_ore",
         "callworker=remove_resi_iron on failure complete",
}})


-- Barbarians --
----------------
set_water_prg("barbarians")

set_univ_miner_prgs("barbarians_miner", 2)
set_univ_miner_prgs("barbarians_miner_chief", 2)
set_univ_miner_prgs("barbarians_miner_master", 2)

  -- coal --
descriptions:modify_unit("productionsite", "barbarians_coalmine", "programs",
   "set", "mine_produce", {
      descname = _"mining coal",
      actions = {
         "animate=working duration:10s",
         "mine=resource_coal radius:2 yield:33.33% when_empty:5% experience_on_fail:17%",
         "produce=coal",
         "callworker=remove_resi_coal on failure complete",
}})
descriptions:modify_unit("productionsite", "barbarians_coalmine_deep", "programs",
   "set", "mine_produce", {
      descname = _"mining coal",
      actions = {
         "animate=working duration:9s500ms",
         "mine=resource_coal radius:2 yield:66.66% when_empty:5% experience_on_fail:17%",
         "produce=coal",
         "callworker=remove_resi_coal on failure complete",
}})
descriptions:modify_unit("productionsite", "barbarians_coalmine_deeper", "programs",
   "set", "mine_produce", {
      descname = _"mining coal",
      actions = {
         "animate=working duration:7s",
         "mine=resource_coal radius:2 yield:100% when_empty:10% experience_on_fail:2%",
         "produce=coal",
         "callworker=remove_resi_coal on failure complete",
}})

  -- gold --
descriptions:modify_unit("productionsite", "barbarians_goldmine", "programs",
   "set", "main", {
      descname = _"mining gold",
      actions = {
         "return=skipped unless economy needs gold_ore",
         "consume=ration",
         "sleep=duration:45s",
         "animate=working duration:20s",
         "mine=resource_gold radius:2 yield:33.33% when_empty:5% experience_on_fail:17%",
         "produce=gold_ore",
         "callworker=remove_resi_gold on failure complete",
}})
descriptions:modify_unit("productionsite", "barbarians_goldmine_deep", "programs",
   "set", "mine_produce", {
      descname = _"mining gold",
      actions = {
         "animate=working duration:9s500ms",
         "mine=resource_gold radius:2 yield:66.66% when_empty:5% experience_on_fail:17%",
         "produce=gold_ore",
         "callworker=remove_resi_gold on failure complete",
}})
descriptions:modify_unit("productionsite", "barbarians_goldmine_deeper", "programs",
   "set", "mine_produce", {
      descname = _"mining gold",
      actions = {
         "animate=working duration:9s",
         "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:2%",
         "produce=gold_ore",
         "callworker=remove_resi_gold on failure complete",
}})

  -- granite --
descriptions:modify_unit("productionsite", "barbarians_granitemine", "programs",
   "set", "mine_produce", {
      descname = _"mining granite",
      actions = {
         "animate=working duration:10s",
         "mine=resource_stones radius:2 yield:100% when_empty:5% experience_on_fail:2%",
         "produce=granite",
         "callworker=remove_resi_stones on failure complete",
}})

  -- iron --
descriptions:modify_unit("productionsite", "barbarians_ironmine", "programs",
   "set", "main", {
      descname = _"mining iron",
      actions = {
         "return=skipped unless economy needs iron_ore",
         "consume=ration",
         "sleep=duration:45s",
         "animate=working duration:20s",
         "mine=resource_iron radius:2 yield:33.33% when_empty:5% experience_on_fail:17%",
         "produce=iron_ore",
         "callworker=remove_resi_iron on failure complete",
}})
descriptions:modify_unit("productionsite", "barbarians_ironmine_deep", "programs",
   "set", "mine_produce", {
      descname = _"mining iron",
      actions = {
         "animate=working duration:9s500ms",
         "mine=resource_iron radius:2 yield:66.66% when_empty:5% experience_on_fail:17%",
         "produce=iron_ore",
         "callworker=remove_resi_iron on failure complete",
}})
descriptions:modify_unit("productionsite", "barbarians_ironmine_deeper", "programs",
   "set", "mine_produce", {
      descname = _"mining iron",
      actions = {
         "animate=working duration:10s",
         "mine=resource_iron radius:2 yield:100% when_empty:10% experience_on_fail:2%",
         "produce=iron_ore",
         "callworker=remove_resi_iron on failure complete",
}})


-- Empire --
------------
set_water_prg("empire")

set_univ_miner_prgs("empire_miner", 2)
set_univ_miner_prgs("empire_miner_master", 2)

descriptions:modify_unit("productionsite", "empire_coalmine", "programs",
   "set", "mine_produce", {
   descname = _"mining coal",
   actions = {
      "animate=working duration:14s",
      "mine=resource_coal radius:2 yield:50% when_empty:5% experience_on_fail:17%",
      "produce=coal",
      "callworker=remove_resi_coal on failure complete",
}})
descriptions:modify_unit("productionsite", "empire_coalmine_deep", "programs",
   "set", "mine_produce", {
   descname = _"mining coal",
   actions = {
      "animate=working duration:8s",
      "mine=resource_coal radius:2 yield:100% when_empty:5% experience_on_fail:2%",
      "produce=coal",
      "callworker=remove_resi_coal on failure complete",
}})

descriptions:modify_unit("productionsite", "empire_goldmine", "programs",
   "set", "mine_produce", {
   descname = _"mining gold",
   actions = {
      "animate=working duration:21s",
      "mine=resource_gold radius:2 yield:50% when_empty:5% experience_on_fail:17%",
      "produce=gold_ore",
      "callworker=remove_resi_gold on failure complete",
}})
descriptions:modify_unit("productionsite", "empire_goldmine_deep", "programs",
   "set", "mine_produce", {
   descname = _"mining gold",
   actions = {
      "animate=working duration:13s",
      "mine=resource_gold radius:2 yield:100% when_empty:5% experience_on_fail:2%",
      "produce=gold_ore",
      "callworker=remove_resi_gold on failure complete",
}})

descriptions:modify_unit("productionsite", "empire_ironmine", "programs",
   "set", "mine_produce", {
   descname = _"mining iron",
   actions = {
      "animate=working duration:14s",
      "mine=resource_iron radius:2 yield:50% when_empty:5% experience_on_fail:17%",
      "produce=iron_ore",
      "callworker=remove_resi_iron on failure complete",
}})
descriptions:modify_unit("productionsite", "empire_ironmine_deep", "programs",
   "set", "mine_produce", {
   descname = _"mining iron",
   actions = {
      "animate=working duration:10s",
      "mine=resource_iron radius:2 yield:100% when_empty:5% experience_on_fail:2%",
      "produce=iron_ore",
      "callworker=remove_resi_iron on failure complete",
}})

descriptions:modify_unit("productionsite", "empire_marblemine", "programs",
   "set", "a_mine_produce_granite", {
   descname = _"mining granite",
   actions = {
      "animate=working duration:10s500ms",
      "mine=resource_stones radius:2 yield:50% when_empty:5% experience_on_fail:17%",
      "produce=granite",
      "callworker=remove_resi_stones on failure complete",
}})
descriptions:modify_unit("productionsite", "empire_marblemine", "programs",
   "set", "a_mine_produce_marble", {
   descname = _"mining marble",
   actions = {
      "animate=working duration:10s500ms",
      "mine=resource_stones radius:2 yield:50% when_empty:5% experience_on_fail:17%",
      "produce=marble",
      "callworker=remove_resi_stones on failure complete",
}})
descriptions:modify_unit("productionsite", "empire_marblemine_deep", "programs",
   "set", "mine_produce_granite", {
   descname = _"mining granite",
   actions = {
      "animate=working duration:7s800ms",
      "mine=resource_stones radius:2 yield:100% when_empty:5% experience_on_fail:2%",
      "produce=granite",
      "callworker=remove_resi_stones on failure complete",
}})
descriptions:modify_unit("productionsite", "empire_marblemine_deep", "programs",
   "set", "mine_produce_marble", {
   descname = _"mining marble",
   actions = {
      "animate=working duration:7s800ms",
      "mine=resource_stones radius:2 yield:100% when_empty:5% experience_on_fail:2%",
      "produce=marble",
      "callworker=remove_resi_stones on failure complete",
}})


-- Frisians --
--------------
set_water_prg("frisians")

set_univ_miner_prgs("frisians_miner", 3)
set_univ_miner_prgs("frisians_miner_master", 3)

descriptions:modify_unit("productionsite", "frisians_coalmine", "programs",
   "set", "mine_produce", {
   descname = _"mining coal",
   actions = {
      "animate=working duration:15s",
      "mine=resource_coal radius:3 yield:50% when_empty:5% experience_on_fail:20%",
      "produce=coal",
      "callworker=remove_resi_coal on failure complete",
}})
descriptions:modify_unit("productionsite", "frisians_coalmine_deep", "programs",
   "set", "mine_produce", {
   descname = _"mining coal",
   actions = {
      "animate=working duration:8s700ms",
      "mine=resource_coal radius:3 yield:100% when_empty:10% experience_on_fail:5%",
      "produce=coal",
      "callworker=remove_resi_coal on failure complete",
}})

descriptions:modify_unit("productionsite", "frisians_goldmine", "programs",
   "set", "main", {
   descname = _"mining gold",
   actions = {
      "return=skipped unless economy needs gold_ore",
      "consume=ration",
      "sleep=duration:45s",
      "animate=working duration:20s",
      "mine=resource_gold radius:3 yield:50% when_empty:5% experience_on_fail:20%",
      "produce=gold_ore",
      "callworker=remove_resi_gold on failure complete",
}})
descriptions:modify_unit("productionsite", "frisians_goldmine_deep", "programs",
   "set", "mine_produce", {
   descname = _"mining gold",
   actions = {
      "animate=working duration:12s200ms",
      "mine=resource_coal radius:3 yield:100% when_empty:10% experience_on_fail:5%",
      "produce=gold_ore",
      "callworker=remove_resi_gold on failure complete",
}})

descriptions:modify_unit("productionsite", "frisians_ironmine", "programs",
   "set", "mine_produce", {
   descname = _"mining iron",
   actions = {
      "animate=working duration:20s",
      "mine=resource_iron radius:3 yield:50% when_empty:5% experience_on_fail:20%",
      "produce=iron_ore",
      "callworker=remove_resi_iron on failure complete",
}})
descriptions:modify_unit("productionsite", "frisians_ironmine_deep", "programs",
   "set", "mine_produce", {
   descname = _"mining iron",
   actions = {
      "animate=working duration:8s700ms",
      "mine=resource_coal radius:3 yield:100% when_empty:10% experience_on_fail:5%",
      "produce=iron_ore",
      "callworker=remove_resi_iron on failure complete",
}})

descriptions:modify_unit("productionsite", "frisians_rockmine", "programs",
   "set", "a_mine_produce_granite", {
   descname = _"mining granite",
   actions = {
      "animate=working duration:21s",
      "mine=resource_stones radius:3 yield:50% when_empty:5% experience_on_fail:20%",
      "produce=granite",
      "callworker=remove_resi_stones on failure complete",
}})
descriptions:modify_unit("productionsite", "frisians_rockmine_deep", "programs",
   "set", "mine_produce_granite", {
   descname = _"mining granite",
   actions = {
      "animate=working duration:8s700ms",
      "mine=resource_coal radius:3 yield:100% when_empty:10% experience_on_fail:5%",
      "produce=granite",
      "callworker=remove_resi_stones on failure complete",
}})

--------

pop_textdomain()

