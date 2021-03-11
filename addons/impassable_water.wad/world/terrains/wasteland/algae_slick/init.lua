push_textdomain("impassable_water.wad", true)

local pics_dir = path.dirname(__file__)
wl.Descriptions():new_terrain_type{
   name = "algae_slick",
   descname = _ "Algae slick",
   editor_category = "wasteland",
   is = "walkable",
   valid_resources = { "fish" },
   default_resource = "fish",
   default_resource_amount = 4,
   textures = path.list_files(pics_dir .. "algae_slick_??.png"),
   dither_layer = 171,
   fps = 14,
   temperature = 100,
   humidity = 1,
   fertility = 1,
}

pop_textdomain()
