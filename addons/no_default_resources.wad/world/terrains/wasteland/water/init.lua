push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "wasteland_water_no_fish",
   descname = _ "Water (no fish)",
   is = "water",
   valid_resources = { "resource_fish" },
   default_resource = "",
   default_resource_amount = 0,
   textures = path.list_files(path.dirname(__file__) .. "water_??.png"),
   dither_layer = 172,
   fps = 14,
   temperature = 100,
   humidity = 999,
   fertility = 1,
}

pop_textdomain()
