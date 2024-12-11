push_textdomain("sumatran_world.wad", true)

wl.Descriptions():new_terrain_type{
   name = "mountainmeadow",
   descname = _("Mountain Meadow"),
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 150,
   temperature = 145,
   humidity = 500,
   fertility = 500,
-- just enhancement removed no other changes
}

pop_textdomain()
