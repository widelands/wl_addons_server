addon_dirname = path.dirname(__file__)
descriptions = wl.Descriptions()
push_textdomain("frisians-economy-ultra.wad", true)

--------------------------------------------------------------------------------
--                                Immovables
--------------------------------------------------------------------------------

descriptions:modify_unit("tribe", "frisians", "add_immovable", "ryefield_harvested")
descriptions:modify_unit("tribe", "frisians", "add_immovable", "ryefield_ripe")
descriptions:modify_unit("tribe", "frisians", "add_immovable", "ryefield_medium")
descriptions:modify_unit("tribe", "frisians", "add_immovable", "ryefield_small")
descriptions:modify_unit("tribe", "frisians", "add_immovable", "ryefield_tiny")

--------------------------------------------------------------------------------
--                                  Wares
--------------------------------------------------------------------------------

descriptions:modify_unit("tribe", "frisians", "add_ware", "salt", 1)
descriptions:modify_unit("tribe", "frisians", "add_ware", "rye", 1)
descriptions:modify_unit("tribe", "frisians", "add_ware", "rye_flour", 1)
descriptions:modify_unit("tribe", "frisians", "add_ware", "barley_flour", 1)

--------------------------------------------------------------------------------
--                                 Workers
--------------------------------------------------------------------------------

descriptions:modify_unit("worker", "frisians_farmer", "programs", "set", "plant_rye", {
         "findspace=size:any radius:3 space",
         "walk=coords",
         "animate=planting duration:6s",
         "plant=attrib:seed_rye",
         "animate=planting duration:6s",
         "return"
      })
descriptions:modify_unit("worker", "frisians_farmer", "programs", "set", "harvest_rye", {
         "findobject=attrib:ripe_rye radius:3",
         "walk=object",
         "animate=harvesting duration:10s",
         "callobject=harvest",
         "animate=gathering duration:4s",
         "createware=rye",
         "return"
      })

descriptions:modify_unit("tribe", "frisians", "add_worker", "frisians_salter", 2)
descriptions:modify_unit("tribe", "frisians", "add_worker", "frisians_miller", 2)

--------------------------------------------------------------------------------
--                               New Production Sites
--------------------------------------------------------------------------------

descriptions:modify_unit("tribe", "frisians", "add_building", "frisians_salt_works")
descriptions:modify_unit("tribe", "frisians", "add_building", "frisians_barley_mill")
descriptions:modify_unit("tribe", "frisians", "add_building", "frisians_rye_mill")
descriptions:modify_unit("tribe", "frisians", "add_building", "frisians_rye_farm")

--------------------------------------------------------------------------------
--                                Production Sites
--------------------------------------------------------------------------------

descriptions:modify_unit("productionsite", "frisians_smokery", "input", "add_ware", "salt", 6)
descriptions:modify_unit("productionsite", "frisians_smokery", "programs", "set", "smoke_fish", { descname = _"smoking fish", actions = {
            "return=skipped unless economy needs smoked_fish",
            "consume=fish:2 salt log",
            "sleep=duration:16s",
            "animate=working duration:30s",
            "produce=smoked_fish:2"
      }})
descriptions:modify_unit("productionsite", "frisians_smokery", "programs", "set", "smoke_meat", { descname = _"smoking meat", actions = {
            "return=skipped when site has fish:2 and economy needs smoked_fish",
            "return=skipped unless economy needs smoked_meat",
            "consume=meat:2 salt log",
            "sleep=duration:16s",
            "animate=working duration:30s",
            "produce=smoked_meat:2"
      }})
descriptions:modify_unit("productionsite", "frisians_smokery", "programs", "set", "work", { descname = _"working", actions = {
            "call=smoke_fish",
            "call=smoke_meat"
      }})

descriptions:modify_unit("productionsite", "frisians_bakery", "input", "remove_ware", "barley")
descriptions:modify_unit("productionsite", "frisians_bakery", "input", "modify_ware", "water", 5)
descriptions:modify_unit("productionsite", "frisians_bakery", "input", "add_ware", "barley_flour", 5)
descriptions:modify_unit("productionsite", "frisians_bakery", "input", "add_ware", "rye_flour", 5)
descriptions:modify_unit("productionsite", "frisians_bakery", "programs", "set", "work", { descname = _"baking bread", actions = {
            "return=skipped unless economy needs bread_frisians or workers need experience",
            "consume=water barley_flour rye_flour",
            "sleep=duration:20s",
            "animate=working duration:20s",
            "produce=bread_frisians"
      }})

descriptions:modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "remove_ware", "barley")
descriptions:modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "modify_ware", "water", 5)
descriptions:modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "modify_ware", "honey", 4)
descriptions:modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "add_ware", "barley_flour", 5)
descriptions:modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "add_ware", "rye_flour", 5)
descriptions:modify_unit("productionsite", "frisians_honey_bread_bakery", "programs", "set", "bake_honey", { descname = _"baking honey bread", actions = {
            "return=skipped unless economy needs honey_bread or workers need experience",
            "consume=water barley_flour rye_flour honey",
            "sleep=duration:20s",
            "animate=working duration:25s",
            "produce=honey_bread"
      }})
descriptions:modify_unit("productionsite", "frisians_honey_bread_bakery", "programs", "set", "bake_normal", { descname = _"baking bread", actions = {
            "return=skipped unless economy needs bread_frisians or workers need experience",
            "consume=water barley_flour rye_flour",
            "sleep=duration:20s",
            "animate=working duration:20s",
            "produce=bread_frisians"
      }})
descriptions:modify_unit("productionsite", "frisians_honey_bread_bakery", "programs", "set", "work", { descname = _"working", actions = {
            "call=bake_honey",
            "call=bake_normal"
      }})

pop_textdomain()
