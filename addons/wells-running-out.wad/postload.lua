-- Init file of the Water Resource Efficiency add-on
d = wl.Descriptions()
push_textdomain("wells-running-out.wad", true)

---------
-- ATL
---------

descriptions:modify_unit("productionsite", "atlanteans_well", "programs", "set", "main", { descname = _"working", actions = {
            "sleep=duration:20s",
            "animate=working duration:20s",
            "mine=resource_water radius:4 yield:100% when_empty:5%",
            "produce=water"
      }})

---------
-- EMP
---------

descriptions:modify_unit("productionsite", "empire_well", "programs", "set", "main", { descname = _"working", actions = {
            "sleep=duration:20s",
            "animate=working duration:20s",
            "mine=resource_water radius:3 yield:100% when_empty:5%",
            "produce=water"
      }})

---------
-- FRI
---------

descriptions:modify_unit("tribe", "frisians", "add_building", "frisians_well_deep", { helptexts = {
            -- TRANSLATORS: Purpose helptext for a frisian production site: Deep Well
            purpose = pgettext("building", "Draws water out of the deep."),
            -- TRANSLATORS: Performance helptext for a frisian production site: Deep Well
            performance = pgettext("frisians_building", "The deep well needs %s on average to produce one bucket of water."):bformat(ngettext("%d second", "%d seconds", 40):bformat(40))
               }})
descriptions:modify_unit("tribe", "frisians", "add_worker", "frisians_well_keeper", 0, nil, nil, { helptexts = {
            -- TRANSLATORS: Purpose helptext for a frisian worker: Well Keeper
            purpose = pgettext("frisians_worker", "Operates the deep wells.")
               }})
descriptions:modify_unit("productionsite", "frisians_well", "programs", "set", "main", { descname = _"working", actions = {
            "sleep=duration:20s",
            "animate=working duration:20s",
            "mine=resource_water radius:2 yield:50% when_empty:5% experience_on_fail:30%",
            "produce=water"
      }})
descriptions:modify_unit("productionsite", "frisians_well", "enhancement", {
      name = "frisians_well_deep",
      enhancement_cost = {
         brick = 1,
         granite = 1,
         log = 1,
         reed = 1
      },
      enhancement_return_on_dismantle = {
         brick = 1,
      }
})
descriptions:modify_unit("worker", "frisians_carrier", "becomes", "frisians_well_keeper")
descriptions:modify_unit("worker", "frisians_carrier", "experience", 20)

---------
-- BAR
---------

descriptions:modify_unit("tribe", "barbarians", "add_building", "barbarians_well_deep", { helptexts = {
            -- TRANSLATORS: Purpose helptext for a frisian production site: Deep Well
            purpose = pgettext("building", "Draws water out of the deep."),
            -- TRANSLATORS: Performance helptext for a frisian production site: Deep Well
            performance = pgettext("barbarians_building", "The deep well needs %s on average to produce one bucket of water."):bformat(ngettext("%d second", "%d seconds", 40):bformat(40))
               }})
descriptions:modify_unit("tribe", "barbarians", "add_worker", "barbarians_well_keeper", 0, nil, nil, { helptexts = {
            -- TRANSLATORS: Purpose helptext for a frisian worker: Well Keeper
            purpose = pgettext("barbarians_worker", "Operates the deep wells.")
               }})
descriptions:modify_unit("productionsite", "barbarians_well", "programs", "set", "main", { descname = _"working", actions = {
            "sleep=duration:20s",
            "animate=working duration:20s",
            "mine=resource_water radius:2 yield:50% when_empty:5% experience_on_fail:30%",
            "produce=water"
      }})
descriptions:modify_unit("productionsite", "barbarians_well", "enhancement", {
      name = "barbarians_well_deep",
      enhancement_cost = {
         log = 4,
      },
      enhancement_return_on_dismantle = {
         log = 1,
      }
})
descriptions:modify_unit("worker", "barbarians_carrier", "becomes", "barbarians_well_keeper")
descriptions:modify_unit("worker", "barbarians_carrier", "experience", 20)

pop_textdomain()
