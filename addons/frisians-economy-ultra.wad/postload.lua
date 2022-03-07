addon_dirname = path.dirname(__file__)
push_textdomain("frisians-economy-ultra.wad", true)

--------------------------------------------------------------------------------
--                                Immovables
--------------------------------------------------------------------------------

wl.Descriptions():modify_unit("tribe", "frisians", "add_immovable", "ryefield_harvested", { helptexts = { purpose =
                  _"This rye field has been harvested."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_immovable", "ryefield_ripe", { helptexts = { purpose =
                  _"This rye field is ready for harvesting."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_immovable", "ryefield_medium", { helptexts = { purpose =
                  _"This rye field is flowering. Beekeepers can use it to produce honey."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_immovable", "ryefield_small", { helptexts = { purpose =
                  _"This rye field is growing."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_immovable", "ryefield_tiny", { helptexts = { purpose =
                  _"This rye field has just been planted."
               }})

wl.Descriptions():modify_unit("tribe", "frisians", "add_immovable", "oatfield_harvested", { helptexts = { purpose =
                  _"This oat field has been harvested."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_immovable", "oatfield_ripe", { helptexts = { purpose =
                  _"This oat field is ready for harvesting."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_immovable", "oatfield_medium", { helptexts = { purpose =
                  _"This oat field is flowering. Beekeepers can use it to produce honey."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_immovable", "oatfield_small", { helptexts = { purpose =
                  _"This oat field is growing."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_immovable", "oatfield_tiny", { helptexts = { purpose =
                  _"This oat field has just been planted."
               }})

--------------------------------------------------------------------------------
--                                  Wares
--------------------------------------------------------------------------------

wl.Descriptions():modify_unit("tribe", "frisians", "add_ware", "salt", 1, nil, 1, { helptexts = { purpose =
                  _"Salt is washed from the sea and used to conserve meat and fish."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_ware", "rye", 1, nil, 1, { helptexts = { purpose =
                  _"Rye is used to bake bread. It needs to be ground into flour first."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_ware", "rye_flour", 1, nil, 2, { helptexts = { purpose =
                  _"After being ground to flour, rye can be used to bake bread."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_ware", "barley_flour", 1, 15, 2, { helptexts = { purpose =
                  _"After being ground to flour, barley can be used to bake bread."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_ware", "oat", 1, nil, 1, { helptexts = { purpose =
                  _"Oat is used to bake bread and also fed to the reindeer."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_ware", "leather", 4, 10, 2, { helptexts = { purpose =
                  _"Fur can be tanned into leather, which is needed to produce garments."
               }})

--------------------------------------------------------------------------------
--                                 Workers
--------------------------------------------------------------------------------

wl.Descriptions():modify_unit("worker", "frisians_farmer", "programs", "set", "plant_rye", {
         "findspace=size:any radius:2 space",
         "walk=coords",
         "animate=planting duration:6s",
         "plant=attrib:seed_rye",
         "animate=planting duration:6s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_farmer", "programs", "set", "harvest_rye", {
         "findobject=attrib:ripe_rye radius:2",
         "walk=object",
         "animate=harvesting duration:10s",
         "callobject=harvest",
         "animate=gathering duration:4s",
         "createware=rye",
         "return"
      })

wl.Descriptions():modify_unit("worker", "frisians_farmer", "programs", "set", "plant_oat", {
         "findspace=size:any radius:4 space",
         "walk=coords",
         "animate=planting duration:6s",
         "plant=attrib:seed_oat",
         "animate=planting duration:6s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_farmer", "programs", "set", "harvest_oat", {
         "findobject=attrib:ripe_oat radius:4",
         "walk=object",
         "animate=harvesting duration:10s",
         "callobject=harvest",
         "animate=gathering duration:4s",
         "createware=oat",
         "return"
      })

wl.Descriptions():modify_unit("tribe", "frisians", "add_worker", "frisians_salter", 2, nil, nil, { helptexts = { purpose =
                  _"The salter washes salt from the shores of the sea."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_worker", "frisians_miller", 2, nil, nil, { helptexts = { purpose =
                  _"The miller grinds barley and rye into flour."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_worker", "frisians_tanner", 3, nil, nil, { helptexts = { purpose =
                  _"The tanner tans furs to produce leather."
               }})

--------------------------------------------------------------------------------
--                               New Production Sites
--------------------------------------------------------------------------------

wl.Descriptions():modify_unit("tribe", "frisians", "add_building", "frisians_salt_works", { helptexts = {
                  purpose = _"The salter working at the salt works washes salt from the sea.",
                  note    = _"The salter needs water within its work area.",
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_building", "frisians_tannery", { helptexts = { purpose =
                  _"The tannery tans fur into leather."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_building", "frisians_barley_mill", { helptexts = { purpose =
                  _"The barley mill grinds barley into barley flour."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_building", "frisians_rye_mill", { helptexts = { purpose =
                  _"The rye mill grinds rye into rye flour."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_building", "frisians_rye_farm", { helptexts = { purpose =
                  _"The rye farm sows and harvests rye."
               }})
wl.Descriptions():modify_unit("tribe", "frisians", "add_building", "frisians_oat_farm", { helptexts = { purpose =
                  _"The oat farm sows and harvests oat."
               }})

--------------------------------------------------------------------------------
--                                Production Sites
--------------------------------------------------------------------------------

wl.Descriptions():modify_unit("productionsite", "frisians_smokery", "input", "add_ware", "salt", 6)
wl.Descriptions():modify_unit("productionsite", "frisians_smokery", "programs", "set", "smoke_fish", {
      -- TRANSLATORS: Completed/Skipped/Did not start smoking fish because ...
      descname = _"smoking fish", actions = {
            "return=skipped unless economy needs smoked_fish",
            "consume=fish:2 salt log",
            "sleep=duration:16s",
            "animate=working duration:30s",
            "produce=smoked_fish:2"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_smokery", "programs", "set", "smoke_meat", {
      -- TRANSLATORS: Completed/Skipped/Did not start smoking meat because ...
      descname = _"smoking meat", actions = {
            "return=skipped when site has fish:2 and economy needs smoked_fish",
            "return=skipped unless economy needs smoked_meat",
            "consume=meat:2 salt log",
            "sleep=duration:16s",
            "animate=working duration:30s",
            "produce=smoked_meat:2"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_smokery", "programs", "set", "main", {
      -- TRANSLATORS: Completed/Skipped/Did not start working because ...
      descname = _"working", actions = {
            "call=smoke_fish",
            "call=smoke_meat"
      }})

wl.Descriptions():modify_unit("productionsite", "frisians_reindeer_farm", "input", "add_ware", "oat", 8)
wl.Descriptions():modify_unit("productionsite", "frisians_reindeer_farm", "programs", "set", "recruit_deer", {
         -- TRANSLATORS: Completed/Skipped/Did not start rearing reindeer because ...
         descname = pgettext("frisians_building", "rearing reindeer"),
         actions = {
            "return=skipped unless economy needs frisians_reindeer",
            "consume=barley oat water",
            "sleep=duration:15s",
            "animate=working duration:15s",
            "recruit=frisians_reindeer"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_reindeer_farm", "programs", "set", "make_fur", {
         -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
         descname = pgettext("frisians_building", "producing fur"),
         actions = {
            "return=skipped unless economy needs fur",
            "consume=barley oat water",
            "sleep=duration:15s",
            "animate=working duration:20s",
            "produce=fur"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_reindeer_farm", "programs", "set", "make_fur_meat", {
         -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
         descname = pgettext("frisians_building", "producing fur"),
         actions = {
            "return=skipped unless economy needs fur",
            "consume=barley oat water",
            "sleep=duration:15s",
            "animate=working duration:20s",
            "produce=fur meat"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_reindeer_farm", "programs", "set", "main", {
      -- TRANSLATORS: Completed/Skipped/Did not start working because ...
      descname = _"working", actions = {
            "call=recruit_deer",
            "call=make_fur",
            "call=recruit_deer",
            "call=make_fur",
            "call=recruit_deer",
            "call=make_fur_meat",
      }})

wl.Descriptions():modify_unit("productionsite", "frisians_bakery", "input", "remove_ware", "barley")
wl.Descriptions():modify_unit("productionsite", "frisians_bakery", "input", "modify_ware", "water", 5)
wl.Descriptions():modify_unit("productionsite", "frisians_bakery", "input", "add_ware", "barley_flour", 5)
wl.Descriptions():modify_unit("productionsite", "frisians_bakery", "input", "add_ware", "rye_flour", 5)
wl.Descriptions():modify_unit("productionsite", "frisians_bakery", "input", "add_ware", "oat", 5)
wl.Descriptions():modify_unit("productionsite", "frisians_bakery", "programs", "set", "main", {
      -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
      descname = _"baking bread", actions = {
            "return=skipped unless economy needs bread_frisians or workers need experience",
            "consume=water:2 barley_flour rye_flour oat",
            "sleep=duration:20s",
            "animate=working duration:15s",
            "produce=bread_frisians",
            "animate=working duration:15s",
            "produce=bread_frisians"
      }})

wl.Descriptions():modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "remove_ware", "barley")
wl.Descriptions():modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "modify_ware", "water", 5)
wl.Descriptions():modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "modify_ware", "honey", 4)
wl.Descriptions():modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "add_ware", "barley_flour", 5)
wl.Descriptions():modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "add_ware", "rye_flour", 5)
wl.Descriptions():modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "add_ware", "oat", 5)
wl.Descriptions():modify_unit("productionsite", "frisians_honey_bread_bakery", "programs", "set", "bake_honey", {
      -- TRANSLATORS: Completed/Skipped/Did not start baking honey bread because ...
      descname = _"baking honey bread", actions = {
            "return=skipped unless economy needs honey_bread or workers need experience",
            "consume=water barley_flour rye_flour oat honey",
            "sleep=duration:20s",
            "animate=working duration:25s",
            "produce=honey_bread",
            "animate=working duration:25s",
            "produce=honey_bread"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_honey_bread_bakery", "programs", "set", "bake_normal", {
      -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
      descname = _"baking bread", actions = {
            "return=skipped unless economy needs bread_frisians or workers need experience",
            "consume=water barley_flour rye_flour oat",
            "sleep=duration:20s",
            "animate=working duration:15s",
            "produce=bread_frisians",
            "animate=working duration:15s",
            "produce=bread_frisians"
      }})
wl.Descriptions():modify_unit("productionsite", "frisians_honey_bread_bakery", "programs", "set", "main", {
      -- TRANSLATORS: Completed/Skipped/Did not start working because ...
      descname = _"working", actions = {
            "call=bake_honey",
            "call=bake_normal",
            "return=skipped"
      }})

wl.Descriptions():modify_unit("productionsite", "frisians_sewing_room", "input", "modify_ware", "fur", 5)
wl.Descriptions():modify_unit("productionsite", "frisians_sewing_room", "input", "add_ware", "leather", 5)
wl.Descriptions():modify_unit("productionsite", "frisians_sewing_room", "programs", "set", "main", {
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
