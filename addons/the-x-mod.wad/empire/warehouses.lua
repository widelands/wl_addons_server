----------------------------------------------------------------------------------------------
--                         Empire warehouses
----------------------------------------------------------------------------------------------

if N then

D:modify_unit("warehouse", "empire_headquarters", "heal_per_second", 10)
D:modify_unit("warehouse", "empire_warehouse", "heal_per_second", 10)
D:modify_unit("warehouse", "empire_port", "heal_per_second", 10)
D:modify_unit("building", "empire_port", "buildcost", "remove", "gold")
D:modify_unit("building", "empire_port", "return_on_dismantle", "remove", "gold")

end -- if N
