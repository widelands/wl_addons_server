addon_dirname = path.dirname(__file__)
push_textdomain("lutas_atlanteans.wad", true)


-----------------------
--MILITARY SITES

wl.Descriptions():modify_unit("building", "atlanteans_castle", "buildcost", "set", "planks", 5)
wl.Descriptions():modify_unit("building", "atlanteans_castle", "buildcost", "set", "diamond", 3)
wl.Descriptions():modify_unit("building", "atlanteans_castle", "buildcost", "set", "quartz", 2)

-----------------------


pop_textdomain()
