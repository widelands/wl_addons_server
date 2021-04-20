addon_dirname = path.dirname(__file__)
descriptions = wl.Descriptions()
push_textdomain("frisians-economy-ultra.wad", true)

--------------------------------------------------------------------------------
--                                Immovables
--------------------------------------------------------------------------------

descriptions:modify_unit("tribe", "frisians", "add_immovable", "ryefield_harvested", { helptexts = { purpose =
                  _"This rye field has been harvested."
               }})
descriptions:modify_unit("tribe", "frisians", "add_immovable", "ryefield_ripe", { helptexts = { purpose =
                  _"This rye field is ready for harvesting."
               }})
descriptions:modify_unit("tribe", "frisians", "add_immovable", "ryefield_medium", { helptexts = { purpose =
                  _"This rye field is flowering. Beekeepers can use it to produce honey."
               }})
descriptions:modify_unit("tribe", "frisians", "add_immovable", "ryefield_small", { helptexts = { purpose =
                  _"This rye field is growing."
               }})
descriptions:modify_unit("tribe", "frisians", "add_immovable", "ryefield_tiny", { helptexts = { purpose =
                  _"This rye field has just been planted."
               }})

--------------------------------------------------------------------------------
--                                  Wares
--------------------------------------------------------------------------------

descriptions:modify_unit("tribe", "frisians", "add_ware", "salt", 1, nil, 1, { helptexts = { purpose =
                  _"Salt is washed from the sea and used to conserve meat and fish."
               }})
descriptions:modify_unit("tribe", "frisians", "add_ware", "rye", 1, nil, 1, { helptexts = { purpose =
                  _"Rye is used to bake bread. It needs to be ground into flour first."
               }})
descriptions:modify_unit("tribe", "frisians", "add_ware", "rye_flour", 1, nil, 2, { helptexts = { purpose =
                  _"After being ground to flour, rye can be used to bake bread."
               }})
descriptions:modify_unit("tribe", "frisians", "add_ware", "barley_flour", 1, 15, 2, { helptexts = { purpose =
                  _"After being ground to flour, barley can be used to bake bread."
               }})
descriptions:modify_unit("tribe", "frisians", "add_ware", "leather", 4, 10, 2, { helptexts = { purpose =
                  _"Fur can be tanned into leather, which is needed to produce garments."
               }})

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

descriptions:modify_unit("tribe", "frisians", "add_worker", "frisians_salter", 2, nil, nil, { helptexts = { purpose =
                  _"The salter washes salt from the shores of the sea."
               }})
descriptions:modify_unit("tribe", "frisians", "add_worker", "frisians_miller", 2, nil, nil, { helptexts = { purpose =
                  _"The miller grinds barley and rye into flour."
               }})
descriptions:modify_unit("tribe", "frisians", "add_worker", "frisians_tanner", 3, nil, nil, { helptexts = { purpose =
                  _"The tanner tans furs to produce leather."
               }})

--------------------------------------------------------------------------------
--                               New Production Sites
--------------------------------------------------------------------------------

descriptions:modify_unit("tribe", "frisians", "add_building", "frisians_salt_works", { helptexts = {
                  purpose = _"The salter working at the salt works washes salt from the sea.",
                  note    = _"The salter needs water within its work area.",
               }})
descriptions:modify_unit("tribe", "frisians", "add_building", "frisians_tannery", { helptexts = { purpose =
                  _"The tannery tans fur into leather."
               }})
descriptions:modify_unit("tribe", "frisians", "add_building", "frisians_barley_mill", { helptexts = { purpose =
                  _"The barley mill grinds barley into barley flour."
               }})
descriptions:modify_unit("tribe", "frisians", "add_building", "frisians_rye_mill", { helptexts = { purpose =
                  _"The rye mill grinds rye into rye flour."
               }})
descriptions:modify_unit("tribe", "frisians", "add_building", "frisians_rye_farm", { helptexts = { purpose =
                  _"The rye farm sows and harvests rye."
               }})

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
descriptions:modify_unit("productionsite", "frisians_smokery", "programs", "set", "main", { descname = _"working", actions = {
            "call=smoke_fish",
            "call=smoke_meat"
      }})

descriptions:modify_unit("productionsite", "frisians_bakery", "input", "remove_ware", "barley")
descriptions:modify_unit("productionsite", "frisians_bakery", "input", "modify_ware", "water", 5)
descriptions:modify_unit("productionsite", "frisians_bakery", "input", "add_ware", "barley_flour", 5)
descriptions:modify_unit("productionsite", "frisians_bakery", "input", "add_ware", "rye_flour", 5)
descriptions:modify_unit("productionsite", "frisians_bakery", "programs", "set", "main", { descname = _"baking bread", actions = {
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
descriptions:modify_unit("productionsite", "frisians_honey_bread_bakery", "programs", "set", "main", { descname = _"working", actions = {
            "call=bake_honey",
            "call=bake_normal"
      }})

descriptions:modify_unit("productionsite", "frisians_sewing_room", "input", "modify_ware", "fur", 5)
descriptions:modify_unit("productionsite", "frisians_sewing_room", "input", "add_ware", "leather", 5)
descriptions:modify_unit("productionsite", "frisians_sewing_room", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing fur garment because ...
         descname = _"sewing fur garment",
         actions = {
            "return=skipped unless economy needs fur_garment or workers need experience",
            "consume=fur leather",
            "sleep=duration:20s",
            "animate=working duration:20s",
            "produce=fur_garment"
         },
      })

pop_textdomain()
