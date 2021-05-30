push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "desert4_dry",
   descname = _ "Desert (dry)",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 271,
   temperature = 168,
   humidity = 1,
   fertility = 100,

   enhancement = { amazons = "drysoil_dry" }
}

pop_textdomain()
