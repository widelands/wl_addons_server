addon_dirname = path.dirname(__file__)
tribes = wl.Tribes()
set_addon_textdomain("frisians-economy-ultra.wad")

--------------------------------------------------------------------------------
--                                Immovables
--------------------------------------------------------------------------------

include(addon_dirname .. "ryefield/harvested/init.lua")
include(addon_dirname .. "ryefield/ripe/init.lua")
include(addon_dirname .. "ryefield/medium/init.lua")
include(addon_dirname .. "ryefield/small/init.lua")
include(addon_dirname .. "ryefield/tiny/init.lua")

tribes:modify_unit("tribe", "frisians", "add_immovable", "ryefield_harvested")
tribes:modify_unit("tribe", "frisians", "add_immovable", "ryefield_ripe")
tribes:modify_unit("tribe", "frisians", "add_immovable", "ryefield_medium")
tribes:modify_unit("tribe", "frisians", "add_immovable", "ryefield_small")
tribes:modify_unit("tribe", "frisians", "add_immovable", "ryefield_tiny")

--------------------------------------------------------------------------------
--                                  Wares
--------------------------------------------------------------------------------

include(addon_dirname .. "wares/init.lua")

tribes:modify_unit("tribe", "frisians", "add_ware", "rye", 1)
tribes:modify_unit("tribe", "frisians", "add_ware", "rye_flour", 1)
tribes:modify_unit("tribe", "frisians", "add_ware", "barley_flour", 1)

--------------------------------------------------------------------------------
--                                 Workers
--------------------------------------------------------------------------------

tribes:modify_unit("worker", "frisians_farmer", "programs", "set", "plant_rye", {
         "findspace=size:any radius:3 space",
         "walk=coords",
         "animate=planting 6000",
         "plant=attrib:seed_rye",
         "animate=planting 6000",
         "return"
      })
tribes:modify_unit("worker", "frisians_farmer", "programs", "set", "harvest_rye", {
         "findobject=attrib:ripe_rye radius:3",
         "walk=object",
         "animate=harvesting 10000",
         "callobject=harvest",
         "animate=gathering 4000",
         "createware=rye",
         "return"
      })

include(addon_dirname .. "miller/init.lua")
tribes:add_custom_worker{tribename = "frisians", workername = "frisians_miller"}

--------------------------------------------------------------------------------
--                               New Production Sites
--------------------------------------------------------------------------------

include(addon_dirname .. "rye_farm/init.lua")
include(addon_dirname .. "rye_mill/init.lua")
include(addon_dirname .. "barley_mill/init.lua")

tribes:add_custom_building{tribename = "frisians", buildingname = "frisians_barley_mill"}
tribes:add_custom_building{tribename = "frisians", buildingname = "frisians_rye_mill"}
tribes:add_custom_building{tribename = "frisians", buildingname = "frisians_rye_farm"}

--------------------------------------------------------------------------------
--                                Production Sites
--------------------------------------------------------------------------------

tribes:modify_unit("productionsite", "frisians_bakery", "input", "remove_ware", "barley")
tribes:modify_unit("productionsite", "frisians_bakery", "input", "modify_ware", "water", 5)
tribes:modify_unit("productionsite", "frisians_bakery", "input", "add_ware", "barley_flour", 5)
tribes:modify_unit("productionsite", "frisians_bakery", "input", "add_ware", "rye_flour", 5)
tribes:modify_unit("productionsite", "frisians_bakery", "programs", "set", "work", _"baking bread", {
            "return=skipped unless economy needs bread_frisians or workers need experience",
            "consume=water barley_flour rye_flour",
            "sleep=20000",
            "animate=working 20000",
            "produce=bread_frisians"
      })

tribes:modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "remove_ware", "barley")
tribes:modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "modify_ware", "water", 5)
tribes:modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "modify_ware", "honey", 4)
tribes:modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "add_ware", "barley_flour", 5)
tribes:modify_unit("productionsite", "frisians_honey_bread_bakery", "input", "add_ware", "rye_flour", 5)
tribes:modify_unit("productionsite", "frisians_honey_bread_bakery", "programs", "set", "bake_honey", _"baking honey bread", {
            "return=skipped unless economy needs honey_bread or workers need experience",
            "consume=water barley_flour rye_flour honey",
            "sleep=20000",
            "animate=working 25000",
            "produce=honey_bread"
      })
tribes:modify_unit("productionsite", "frisians_honey_bread_bakery", "programs", "set", "bake_normal", _"baking bread", {
            "return=skipped unless economy needs bread_frisians or workers need experience",
            "consume=water barley_flour rye_flour",
            "sleep=20000",
            "animate=working 20000",
            "produce=bread_frisians"
      })
tribes:modify_unit("productionsite", "frisians_honey_bread_bakery", "programs", "set", "work", _"working", {
            "call=bake_honey",
            "call=bake_normal"
      })
