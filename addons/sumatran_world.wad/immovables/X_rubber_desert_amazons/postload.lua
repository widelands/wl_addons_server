addon_dirname = path.dirname(__file__)
push_textdomain("kongo_world.wad", true)

wl.Descriptions():modify_unit("terrain", "hardlava", "enhancement", "ashes1", "amazons")

pop_textdomain()
