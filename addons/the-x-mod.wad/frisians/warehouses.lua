----------------------------------------------------------------------------------------------
--                         Frisian warehouses
----------------------------------------------------------------------------------------------

if N then

D:modify_unit("warehouse", "frisians_headquarters", "heal_per_second", 10)
D:modify_unit("warehouse", "frisians_warehouse", "heal_per_second", 10)
D:modify_unit("warehouse", "frisians_port", "heal_per_second", 10)
D:modify_unit("building", "frisians_port", "buildcost", "remove", "gold")
D:modify_unit("building", "frisians_port", "return_on_dismantle", "remove", "gold")

end -- if N
